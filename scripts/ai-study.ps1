#requires -Version 7.0
[CmdletBinding()]
param(
    [ValidateSet('Build', 'Today', 'Record', 'Review', 'Advance', 'Validate')]
    [string]$Action = 'Today',
    [string]$Root = (Split-Path $PSScriptRoot -Parent),
    [string]$Date = (Get-Date -Format 'yyyy-MM-dd'),
    [string]$Prompt,
    [string]$Answer,
    [string]$Notes,
    [string]$NextPrompt,
    [string[]]$Evidence = @(),
    [double[]]$Scores = @(),
    [string[]]$Dimensions = @(),
    [string[]]$Gaps = @(),
    [switch]$TheoryComplete,
    [switch]$PracticeComplete,
    [switch]$TestsPassed,
    [string]$TestEvidence,
    [switch]$AssessmentComplete,
    [switch]$SessionClosed,
    [switch]$RefreshSources,
    [string]$ReviewId
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$Root = [IO.Path]::GetFullPath($Root)
$actualDate = [datetime]::ParseExact($Date, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture)
if ($actualDate.Date -gt (Get-Date).Date) { throw 'Learning and review dates cannot be in the future.' }
$planDirectory = Join-Path $Root 'study-plan'
$stateDirectory = Join-Path $Root 'progress\ai-ml'
$syllabusPath = Join-Path $planDirectory 'ai-ml-weekly-syllabus.csv'
$indexPath = Join-Path $planDirectory 'ai-ml-source-index.json'
$catalogPath = Join-Path $planDirectory 'ai-ml-daily-catalog.json'
$statePath = Join-Path $stateDirectory 'daily-state.json'
$reviewOffsets = @(1, 2, 4, 8, 15, 31)
$rubric = @('Concepts', 'Application', 'Edge cases', 'Tradeoffs', 'Communication')

function Read-JsonFile([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { throw "Required file missing: $Path" }
    Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json -AsHashtable
}

function Write-AtomicFile([string]$Path, [string]$Text) {
    $directory = Split-Path $Path -Parent
    [IO.Directory]::CreateDirectory($directory) | Out-Null
    $temporary = "$Path.$([guid]::NewGuid().ToString('N')).tmp"
    try {
        [IO.File]::WriteAllText($temporary, $Text, [Text.UTF8Encoding]::new($false))
        Move-Item -LiteralPath $temporary -Destination $Path -Force
    }
    finally {
        if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary }
    }
}

function Write-JsonFile([string]$Path, $Value) {
    Write-AtomicFile $Path (($Value | ConvertTo-Json -Depth 30) + "`n")
}

function Assert-Evidence([string[]]$Paths) {
    if ($Paths.Count -eq 0) { throw 'A real repository evidence file is required.' }
    foreach ($relative in $Paths) {
        if ([string]::IsNullOrWhiteSpace($relative) -or [IO.Path]::IsPathRooted($relative)) {
            throw 'Evidence must be a nonempty repository-relative file path.'
        }
        $resolved = [IO.Path]::GetFullPath((Join-Path $Root $relative))
        $prefix = $Root.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
        if (-not $resolved.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
            throw "Evidence is outside this repository: $relative"
        }
        if (-not (Test-Path -LiteralPath $resolved -PathType Leaf)) { throw "Evidence does not exist: $relative" }
        if ((Get-Item -LiteralPath $resolved).Length -eq 0) { throw "Evidence is empty: $relative" }
    }
}

function Assert-Scores([double[]]$Values, [string[]]$Labels) {
    if ($Values.Count -lt 1 -or $Values.Count -gt 5 -or $Values.Count -ne $Labels.Count) {
        throw 'Supply 1-5 scores and exactly one named dimension for each score.'
    }
    if (@($Labels | Sort-Object -Unique).Count -ne $Labels.Count) { throw 'Score dimensions must be unique.' }
    foreach ($label in $Labels) {
        if ($label -notin $rubric) { throw "Unknown rubric dimension: $label" }
    }
    foreach ($value in $Values) {
        if ([double]::IsNaN($value) -or [double]::IsInfinity($value) -or $value -lt 0 -or $value -gt 3) {
            throw 'Each rubric score must be a finite number between 0 and 3.'
        }
    }
}

function Get-Syllabus {
    $rows = @(Import-Csv -LiteralPath $syllabusPath)
    if ($rows.Count -ne 60) { throw 'The syllabus must contain exactly 60 ordered weeks.' }
    $required = @('Week', 'Stage', 'Topic', 'Concept', 'Internals', 'Implementation', 'Checks',
        'ConceptQuestion', 'DebugQuestion', 'DesignQuestion', 'RecallWeeks', 'Resources')
    for ($position = 0; $position -lt $rows.Count; $position++) {
        $row = $rows[$position]
        if ([int]$row.Week -ne $position + 1) { throw "Week sequence error at row $position" }
        foreach ($field in $required) {
            if ($field -notin $row.PSObject.Properties.Name) { throw "Missing syllabus column: $field" }
            if ($field -ne 'RecallWeeks' -and [string]::IsNullOrWhiteSpace($row.$field)) {
                throw "Empty $field in week $($row.Week)"
            }
        }
        if ($row.RecallWeeks) {
            foreach ($prior in $row.RecallWeeks.Split(';')) {
                if ($prior -notmatch '^\d+$' -or [int]$prior -lt 1 -or [int]$prior -ge [int]$row.Week) {
                    throw "Invalid prior-week link '$prior' in week $($row.Week)"
                }
            }
        }
    }
    $rows
}

function Get-SourceIndex($Rows) {
    if ((Test-Path -LiteralPath $indexPath) -and -not $RefreshSources) { return Read-JsonFile $indexPath }
    $readme = (Invoke-WebRequest 'https://raw.githubusercontent.com/rohitg00/ai-engineering-from-scratch/main/README.md').Content
    $manifests = @{
        I = (Invoke-WebRequest 'https://raw.githubusercontent.com/Shivam311201/cs249r_book/dev/books/config/_quarto-html-vol1.yml').Content
        II = (Invoke-WebRequest 'https://raw.githubusercontent.com/Shivam311201/cs249r_book/dev/books/config/_quarto-html-vol2.yml').Content
    }
    $moduleItems = Invoke-RestMethod 'https://api.github.com/repos/Shivam311201/cs249r_book/contents/tinytorch/src?ref=dev'
    $moduleNames = @($moduleItems | ForEach-Object { $_.name })
    $links = @{}
    $tokens = @($Rows | ForEach-Object { $_.Resources.Split(';') } | Sort-Object -Unique)
    foreach ($token in $tokens) {
        if ($token -match '^A:(\d{2})\.(\d{2})$') {
            $pattern = 'phases/' + $Matches[1] + '-[^/\s)]+/' + $Matches[2] + '-[^/\s)]+'
            $match = [regex]::Match($readme, $pattern)
            if (-not $match.Success) { throw "A reference not found in live curriculum: $token" }
            $links[$token] = 'https://github.com/rohitg00/ai-engineering-from-scratch/tree/main/' + $match.Value
        }
        elseif ($token -match '^B:(I|II)\.(\d{2})$') {
            $volume = $Matches[1]
            $chapter = $Matches[2]
            $volumeNumber = if ($volume -eq 'I') { 1 } else { 2 }
            $match = [regex]::Match($manifests[$volume], "vol${volumeNumber}/(${chapter}_[a-z_]+)/\1\.qmd")
            if (-not $match.Success) { throw "B reference not found in chapter manifest: $token" }
            $directory = $match.Groups[1].Value
            $links[$token] = "https://mlsysbook.ai/vol${volumeNumber}/${directory}/${directory}.html"
        }
        elseif ($token -match '^T:(\d{2})$') {
            $moduleNumber = $Matches[1]
            $names = @($moduleNames | Where-Object { $_ -match "^${moduleNumber}_" })
            if ($names.Count -ne 1) { throw "TinyTorch module reference is not unique: $token" }
            $links[$token] = "https://mlsysbook.ai/tinytorch/modules/$($names[0]).html"
        }
        elseif ($token -match '^Project:(retrieval-evaluation-lab|agent-trace-debugger)$') {
            $links[$token] = "https://aiengineeringfromscratch.com/project.html?id=$($Matches[1])"
        }
        else { throw "Unsupported source token: $token" }
    }
    @{ checkedOn = $Date; links = $links }
}

function Assert-State($State, $Catalog) {
    if ($State.schemaVersion -ne 1 -or $State.track -ne 'ai-ml') { throw 'Unsupported state schema or track.' }
    if (($State.activeDay -isnot [int] -and $State.activeDay -isnot [long]) -or
        $State.activeDay -lt 1 -or $State.activeDay -gt 421) {
        throw 'Active day must be an integer from 1 through 421 (finished).'
    }
    if ($Catalog.days.Count -ne 420) { throw 'Daily catalog must contain 420 units.' }
    $seen = @{}
    foreach ($day in $State.days) {
        if ($day.day -lt 1 -or $day.day -gt 420 -or $seen.ContainsKey([string]$day.day)) {
            throw 'Invalid or duplicate recorded day.'
        }
        $seen[[string]$day.day] = $true
        foreach ($field in @('session', 'theory', 'practice', 'assessment')) {
            if ($day[$field] -notin @('not_started', 'in_progress', 'complete')) { throw "Invalid $field status." }
        }
        if ($day.mastery -notin @('not_assessed', 'developing', 'demonstrated_once')) { throw 'Invalid mastery status.' }
        if ($day.complete) {
            if ($day.session -ne 'complete' -or $day.theory -ne 'complete' -or
                $day.practice -ne 'complete' -or $day.assessment -ne 'complete') {
                throw 'A completed day must preserve independent completion evidence.'
            }
            if ($Catalog.days[$day.day - 1].requiresExecutable -and -not $day.testsPassed) {
                throw 'Executable practice cannot be complete without passing test evidence.'
            }
            Assert-Evidence @($day.evidence)
            Assert-Scores @($day.scores) @($day.dimensions)
            if ($Catalog.days[$day.day - 1].slot -eq 6 -and $day.scores.Count -ne 5) {
                throw 'A completed weekly assessment requires five scored dimensions.'
            }
        }
    }
    foreach ($session in $State.sessions) {
        if ([string]::IsNullOrWhiteSpace($session.prompt) -or [string]::IsNullOrWhiteSpace($session.answer) -or
            [string]::IsNullOrWhiteSpace($session.notes) -or [string]::IsNullOrWhiteSpace($session.nextPrompt)) {
            throw 'A session must preserve its prompt, actual answer, notes and exact next task.'
        }
        $recordedDate = [datetime]::ParseExact($session.date, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture)
        if ($recordedDate.Date -gt (Get-Date).Date) { throw 'Session evidence cannot be future-dated.' }
        if ($session.scores.Count) { Assert-Scores @($session.scores) @($session.dimensions) }
        if ($session.denominator -ne 3 * $session.scores.Count) { throw 'Session score denominator is inconsistent.' }
        Assert-Evidence @($session.evidence)
    }
    foreach ($review in $State.reviews) {
        if ($review.status -notin @('pending', 'complete')) { throw 'Invalid review status.' }
        [datetime]::ParseExact($review.due, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture) | Out-Null
    }
    for ($number = 1; $number -lt $State.activeDay; $number++) {
        $unit = $Catalog.days[$number - 1]
        if (-not $unit.rest -and -not @($State.days | Where-Object { $_.day -eq $number -and $_.complete }).Count) {
            throw "Active day skipped an incomplete study unit: $number"
        }
    }
}

function Render-State($State, $Catalog) {
    $heading = "# AI/ML current state`n`n"
    if ($State.activeDay -eq 421) { $heading += "All 420 curriculum units have been traversed; consult retained gaps and evidence.`n" }
    else {
        $active = $Catalog.days[$State.activeDay - 1]
        $heading += "**Active unit:** Day $($active.day), Week $($active.week), $($active.topic).`n`n"
    }
    $heading += "**Exact next prompt/task:** $($State.nextPrompt)`n`n"
    $heading += "No elapsed date completes a unit. A closed session is separate from practice, assessment, and mastery. No AI/ML learning was completed during plan setup.`n`n"
    $heading += "The existing SWE track remains separate at its recorded resume point. Read ../current-state.md before SWE teaching; do not migrate its scores into this track.`n`n"
    $heading += "Publication: AI/ML plan and genuine progress updates are authorized. A local save is not proof of a successful push.`n"
    Write-AtomicFile (Join-Path $stateDirectory 'current-state.md') $heading
    $table = "# AI/ML daily progress`n`n| Day | Week | Topic | Session | Theory | Practice | Assessment | Mastery |`n|---|---|---|---|---|---|---|---|`n"
    foreach ($unit in $Catalog.days) {
        $record = @($State.days | Where-Object { $_.day -eq $unit.day })
        if ($record.Count) {
            $entry = $record[0]
            $table += "| $($unit.day) | $($unit.week) | $($unit.topic) | $($entry.session) | $($entry.theory) | $($entry.practice) | $($entry.assessment) | $($entry.mastery) |`n"
        }
        elseif ($unit.rest -and $unit.day -lt $State.activeDay) {
            $table += "| $($unit.day) | $($unit.week) | $($unit.topic) | rest unit passed | not_required | not_required | not_required | not_assessed |`n"
        }
        else { $table += "| $($unit.day) | $($unit.week) | $($unit.topic) | not_started | not_started | not_started | not_started | not_assessed |`n" }
    }
    Write-AtomicFile (Join-Path $stateDirectory 'daily-progress.md') $table
    $queue = "# AI/ML revision queue`n`nReviews are scheduled from actual dated learning evidence, not planned day numbers. Past dates remain pending until an answer is assessed. Failed reviews retain their attempts and return the next day.`n`n"
    if (-not $State.reviews.Count) { $queue += "No review dates yet: learning has not started.`n" }
    foreach ($review in @($State.reviews | Sort-Object due, id)) {
        $queue += "- **$($review.id)** | due $($review.due) | $($review.status) | $($review.prompt) | attempts $($review.attempts.Count)`n"
    }
    Write-AtomicFile (Join-Path $stateDirectory 'revision-queue.md') $queue
    $scorecard = "# AI/ML assessment scorecard`n`nScores require actual learner answers and linked evidence. Demonstrated once is not durable mastery. Narrow assessments retain their actual denominator; weekly assessments use five dimensions, maximum 15.`n`n"
    if (-not @($State.sessions | Where-Object { $_.scores.Count }).Count) {
        $scorecard += "No learner assessments yet. Plan setup and tracker tests are not learner scores.`n"
    }
    else {
        $scorecard += "| Date | Day | Dimensions | Score | Evidence |`n|---|---|---|---|---|`n"
        foreach ($session in $State.sessions) {
            if ($session.scores.Count) {
                $sum = ($session.scores | Measure-Object -Sum).Sum
                $scorecard += "| $($session.date) | $($session.day) | $($session.dimensions -join '; ') | $sum/$($session.denominator) | $($session.evidence -join '; ') |`n"
            }
        }
    }
    Write-AtomicFile (Join-Path $stateDirectory 'scorecard.md') $scorecard
}

$rows = @(Get-Syllabus)
if ($Action -eq 'Build') {
    $existing = if (Test-Path -LiteralPath $statePath) { Read-JsonFile $statePath } else { $null }
    if ($existing) {
        Assert-State $existing (Read-JsonFile $catalogPath)
        if ($existing.ContainsKey('learnedWeeks')) {
            if ($existing.learnedWeeks.Count) { throw 'Existing week-based reviews require an explicit evidence-preserving migration.' }
            $existing.Remove('learnedWeeks')
            $existing.learnedDays = @()
        }
    }
    $index = Get-SourceIndex $rows
    $days = @()
    $schedule = "# AI/ML day-by-day schedule`n`nGenerated from ai-ml-weekly-syllabus.csv by scripts/ai-study.ps1 -Action Build. Read ai-ml-learning-contract.md first. Day numbers are study units, not calendar deadlines. Six study units plus one rest unit per week.`n`n"
    $assessmentBank = "# AI/ML interview assessments`n`nAttempt questions before looking at references or assistant solutions. Record actual answers. Weekly assessments use five dimensions scored 0-3 each, maximum 15. Narrow checks use only relevant named dimensions and their actual denominator.`n`n"
    foreach ($row in $rows) {
        $week = [int]$row.Week
        $priorWeeks = if ($row.RecallWeeks) { @($row.RecallWeeks.Split(';') | ForEach-Object { [int]$_ }) } else { @() }
        $connections = @($priorWeeks | ForEach-Object { "Week $_ ($($rows[$_ - 1].Topic))" })
        $resources = @()
        foreach ($token in $row.Resources.Split(';')) {
            if (-not $index.links.ContainsKey($token)) { throw "Source index missing: $token" }
            $resources += "[$token]($($index.links[$token]))"
        }
        $assessmentBank += "## Week $week - $($row.Topic)`n`n"
        $assessmentBank += "1. $($row.ConceptQuestion)`n2. $($row.DebugQuestion)`n3. $($row.DesignQuestion)`n"
        $assessmentBank += "4. Live implementation change: modify the week's implementation for one unseen input or constraint, add a failing test first, then fix it and explain the result.`n"
        $transfer = if ($week -eq 1) { 'Use a new concrete example; no earlier ML knowledge is assumed.' } else { "Connect this topic to $($connections -join '; ')." }
        $assessmentBank += "5. Delayed transfer: $transfer`n`n"
        $assessmentBank += "**Expected artifacts:** $($row.Implementation). **Behavioral checks:** $($row.Checks). **Assess:** concepts, application, edge cases, tradeoffs, communication. Missing runnable evidence is not executable practice. Record misconceptions and corrections, not just a total.`n`n"
        for ($slot = 1; $slot -le 7; $slot++) {
            $number = ($week - 1) * 7 + $slot
            $lesson = switch ($slot) {
                1 { @{ title = 'First principles'; syllabus = $row.Concept; task = 'Work one concrete example by hand and write an explanation in your own words.'; prompt = $row.ConceptQuestion } }
                2 { @{ title = 'Internals and mathematical trace'; syllabus = $row.Internals; task = 'Trace the mechanism; state shapes, units, assumptions, and one failure condition.'; prompt = $row.DebugQuestion } }
                3 { @{ title = 'Independent implementation'; syllabus = $row.Implementation; task = $row.Implementation; prompt = 'Implement the stated behavior without copying a reference solution; explain each design choice.' } }
                4 { @{ title = 'Tests and debugging'; syllabus = $row.Checks; task = $row.Checks; prompt = $row.DebugQuestion } }
                5 { @{ title = 'Interview and production tradeoffs'; syllabus = $row.DesignQuestion; task = 'Attempt the conceptual, debugging, and design questions; add an interviewer-requested change to the artifact.'; prompt = $row.DesignQuestion } }
                6 { @{ title = 'Assessment and consolidation'; syllabus = 'Closed-book explanation, live implementation, edge cases, design tradeoffs, and delayed transfer.'; task = "Complete Week $week assessment questions 1-5 and verify its implementation/tests."; prompt = "Week $week assessment: start with $($row.ConceptQuestion)" } }
                7 { @{ title = 'Rest or optional light recall'; syllabus = 'No new syllabus. Optional short recall only; rest is valid.'; task = 'Rest; if you review, record only the actual review outcome.'; prompt = 'Rest; resume the next study unit when ready.' } }
            }
            $unit = @{
                day = $number; week = $week; slot = $slot; stage = $row.Stage; topic = $row.Topic
                title = $lesson.title; syllabus = $lesson.syllabus; task = $lesson.task; prompt = $lesson.prompt
                rest = ($slot -eq 7); requiresExecutable = ($slot -in @(3, 4, 6))
                priorWeeks = $priorWeeks; sources = $resources; checks = $row.Checks
            }
            $days += $unit
            $schedule += "## Day $number - Week $week - $($row.Topic): $($lesson.title)`n`n"
            $schedule += "- **Study:** $($lesson.syllabus)`n- **Required output:** $($lesson.task)`n- **Prompt:** $($lesson.prompt)`n"
            $schedule += "- **Past-to-present link:** $($connections -join '; '). Explain one connection before introducing new material; do not assume prior mastery.`n"
            $schedule += "- **Recall:** use actual due reviews, oldest/high-priority first, usually at most three in 10-20 minutes. Keep unanswered reviews pending.`n"
            $schedule += "- **Checkpoint:** record the learner's answer, evidence, tests where executable work is required, relevant rubric scores, corrections, gaps, and exact next task. Rest days have no new-output requirement.`n"
            $schedule += "- **Sources:** $($resources -join '; ')`n`n"
        }
    }
    $catalog = @{ schemaVersion = 1; track = 'ai-ml'; days = $days }
    $state = if ($existing) { $existing } else {
        @{
            schemaVersion = 1; track = 'ai-ml'; activeDay = 1; nextPrompt = $days[0].prompt
            days = @(); reviews = @(); sessions = @(); learnedDays = @()
            publication = @{ authorized = $true; scope = 'AI/ML plan, assessments, actual session records and progress only'; verifiedBy = 'Read live remote after every push; do not infer synchronization from local save.' }
        }
    }
    Assert-State $state $catalog
    Write-JsonFile $indexPath $index
    Write-JsonFile $catalogPath $catalog
    Write-AtomicFile (Join-Path $planDirectory 'ai-ml-daily-schedule.md') $schedule
    Write-AtomicFile (Join-Path $Root 'assessments\ai-ml\interview-bank.md') $assessmentBank
    Write-JsonFile $statePath $state
    Render-State $state $catalog
    Write-Output "Built $($days.Count) daily units, 60 weekly assessments, and $($index.links.Count) indexed source references. Existing progress was preserved."
    return
}

$catalog = Read-JsonFile $catalogPath
$state = Read-JsonFile $statePath
Assert-State $state $catalog
if ($Action -eq 'Validate') {
    $index = Read-JsonFile $indexPath
    foreach ($row in $rows) {
        foreach ($token in $row.Resources.Split(';')) {
            if (-not $index.links.ContainsKey($token)) { throw "Missing indexed reference: $token" }
        }
    }
    for ($number = 1; $number -le 420; $number++) {
        $unit = $catalog.days[$number - 1]
        if ($unit.day -ne $number -or $unit.week -ne [math]::Ceiling($number / 7) -or
            $unit.rest -ne ($number % 7 -eq 0)) { throw "Invalid daily unit: $number" }
    }
    $mirror = Get-Content -LiteralPath (Join-Path $stateDirectory 'current-state.md') -Raw
    if (-not $mirror.Contains($state.nextPrompt) -or
        ($state.activeDay -le 420 -and -not $mirror.Contains("Day $($state.activeDay),"))) {
        throw 'Current-state Markdown disagrees with the structured resume point. Run Build to regenerate derived views.'
    }
    $progress = Get-Content -LiteralPath (Join-Path $stateDirectory 'daily-progress.md') -Raw
    foreach ($entry in $state.days) {
        $unit = $catalog.days[$entry.day - 1]
        $line = "| $($entry.day) | $($unit.week) | $($unit.topic) | $($entry.session) | $($entry.theory) | $($entry.practice) | $($entry.assessment) | $($entry.mastery) |"
        if (-not $progress.Contains($line)) { throw "Daily progress view disagrees with state for day $($entry.day)." }
    }
    Write-Output 'Valid: 420 ordered daily units, 60 weeks, source index, prior-topic links, state and completion boundaries.'
    return
}
if ($Action -eq 'Today') {
    Write-Output "Active AI/ML day: $($state.activeDay)"
    Write-Output "Exact next prompt: $($state.nextPrompt)"
    if ($state.activeDay -le 420) {
        $unit = $catalog.days[$state.activeDay - 1]
        Write-Output "Topic: $($unit.topic); task: $($unit.task)"
        Write-Output "Link to earlier weeks: $($unit.priorWeeks -join ', ')"
    }
    $due = @($state.reviews | Where-Object { $_.status -eq 'pending' -and $_.due -le $Date } | Sort-Object due, id)
    Write-Output "Pending due reviews: $($due.Count); show at most 3, retain the rest."
    $due | Select-Object -First 3 id, due, prompt | Format-List
    return
}
if ($Action -eq 'Review') {
    $matches = @($state.reviews | Where-Object { $_.id -eq $ReviewId -and $_.status -eq 'pending' })
    if ($matches.Count -ne 1) { throw 'Select exactly one pending review by its ID.' }
    if ([string]::IsNullOrWhiteSpace($Answer) -or [string]::IsNullOrWhiteSpace($Notes)) {
        throw 'Review requires the actual answer and assessment/correction notes.'
    }
    Assert-Scores $Scores $Dimensions
    Assert-Evidence $Evidence
    $review = $matches[0]
    if ($Date -lt $review.due) { throw 'A spaced review cannot be completed before its current due date.' }
    $passed = @($Scores | Where-Object { $_ -lt 2 }).Count -eq 0
    $review.attempts += @{ date = $Date; answer = $Answer; notes = $Notes; scores = $Scores; dimensions = $Dimensions; evidence = $Evidence; passed = $passed }
    if ($passed) { $review.status = 'complete' }
    else { $review.due = $actualDate.AddDays(1).ToString('yyyy-MM-dd') }
}
elseif ($Action -eq 'Record') {
    if ($state.activeDay -gt 420) { throw 'All daily units have been traversed.' }
    $unit = $catalog.days[$state.activeDay - 1]
    if ($unit.rest) { throw 'Use Review for actual rest-day recall; Advance explicitly to the next unit.' }
    foreach ($value in @($Prompt, $Answer, $Notes, $NextPrompt)) {
        if ([string]::IsNullOrWhiteSpace($value)) { throw 'Record requires prompt, actual answer, notes, and exact next prompt/task.' }
    }
    Assert-Evidence $Evidence
    if ($Scores.Count) { Assert-Scores $Scores $Dimensions }
    elseif ($Dimensions.Count) { throw 'Named dimensions require actual scores.' }
    if ($AssessmentComplete -and -not $Scores.Count) { throw 'An assessment requires actual named rubric scores.' }
    if (($TestsPassed -or $TestEvidence) -and -not $PracticeComplete) {
        throw 'Passing-test metadata must accompany completed practice, not an unrelated record.'
    }
    if ($AssessmentComplete -and $unit.slot -eq 6 -and
        ($Scores.Count -ne 5 -or @($Dimensions | Where-Object { $_ -notin $rubric }).Count)) {
        throw 'Weekly assessments require all five rubric dimensions, maximum 15.'
    }
    if ($PracticeComplete -and $unit.requiresExecutable) {
        if (-not $TestsPassed -or [string]::IsNullOrWhiteSpace($TestEvidence)) {
            throw 'Executable practice requires a passing run and its test-output evidence file.'
        }
        Assert-Evidence @($TestEvidence)
    }
    $records = @($state.days | Where-Object { $_.day -eq $state.activeDay })
    if ($records.Count) { $entry = $records[0] }
    else {
        $entry = @{
            day = $state.activeDay; session = 'in_progress'; theory = 'not_started'; practice = 'not_started'
            assessment = 'not_started'; mastery = 'not_assessed'; complete = $false
            testsPassed = $false; evidence = @(); gaps = @(); scores = @(); dimensions = @()
        }
        $state.days += $entry
    }
    if ($SessionClosed) { $entry.session = 'complete' }
    if ($TheoryComplete) { $entry.theory = 'complete' }
    if ($PracticeComplete) { $entry.practice = 'complete' }
    if ($AssessmentComplete) { $entry.assessment = 'complete' }
    if ($PracticeComplete -and $unit.requiresExecutable) { $entry.testsPassed = $true }
    $entry.evidence = @(@($entry.evidence) + $Evidence + @($TestEvidence | Where-Object { $_ }) | Sort-Object -Unique)
    $entry.gaps = @(@($entry.gaps) + $Gaps | Sort-Object -Unique)
    if ($Scores.Count) {
        $entry.scores = $Scores
        $entry.dimensions = $Dimensions
        $entry.mastery = 'developing'
        if ($unit.slot -eq 6 -and $Scores.Count -eq 5 -and
            ($Scores | Measure-Object -Sum).Sum -ge 12 -and
            @($Scores | Where-Object { $_ -lt 2 }).Count -eq 0 -and $entry.testsPassed) {
            $entry.mastery = 'demonstrated_once'
        }
    }
    $entry.complete = $entry.session -eq 'complete' -and $entry.theory -eq 'complete' -and
        $entry.practice -eq 'complete' -and $entry.assessment -eq 'complete'
    $state.sessions += @{
        date = $Date; day = $state.activeDay; prompt = $Prompt; answer = $Answer; notes = $Notes
        scores = $Scores; dimensions = $Dimensions; denominator = 3 * $Scores.Count
        evidence = $Evidence; gaps = $Gaps; nextPrompt = $NextPrompt
    }
    if ($TheoryComplete -and $unit.slot -in @(1, 2, 6) -and $unit.day -notin $state.learnedDays) {
        $state.learnedDays += $unit.day
        foreach ($offset in $reviewOffsets) {
            $state.reviews += @{
                id = "D$($unit.day)-R$offset"; week = $unit.week; learnedOn = $Date
                originalDue = $actualDate.AddDays($offset).ToString('yyyy-MM-dd')
                due = $actualDate.AddDays($offset).ToString('yyyy-MM-dd'); status = 'pending'; attempts = @()
                prompt = "$Prompt Explain the reasoning and solve a new variation; connect it to earlier weeks $($unit.priorWeeks -join ', ')."
            }
        }
    }
    if ($Scores.Count -and @($Scores | Where-Object { $_ -lt 2 }).Count) {
        if (-not $Gaps.Count) { throw 'A weak assessed result requires an explicit misconception/remediation gap.' }
        $state.reviews += @{
            id = "W$($unit.week)-gap-$($state.sessions.Count)"; week = $unit.week; learnedOn = $Date
            originalDue = $actualDate.AddDays(1).ToString('yyyy-MM-dd')
            due = $actualDate.AddDays(1).ToString('yyyy-MM-dd'); status = 'pending'; attempts = @()
            prompt = "Revisit recorded gaps: $($Gaps -join '; '). Explain the correction and solve a new variation."
        }
    }
    $state.nextPrompt = $NextPrompt
}
elseif ($Action -eq 'Advance') {
    if ($state.activeDay -gt 420) { throw 'Already at the end of the plan.' }
    $unit = $catalog.days[$state.activeDay - 1]
    $entry = @($state.days | Where-Object { $_.day -eq $state.activeDay -and $_.complete })
    if (-not $unit.rest -and -not $entry.Count) { throw 'Cannot advance an incomplete study unit.' }
    $state.activeDay++
    $state.nextPrompt = if ($state.activeDay -le 420) { $catalog.days[$state.activeDay - 1].prompt } else { 'Review retained weaknesses and final readiness evidence; no new planned units.' }
}
Assert-State $state $catalog
Write-JsonFile $statePath $state
Render-State $state $catalog
Write-Output "Saved actual $Action evidence; active day $($state.activeDay). This is a local save, not a push."
