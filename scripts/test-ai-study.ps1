#requires -Version 7.0
[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$repo = Split-Path $PSScriptRoot -Parent
$tracker = Join-Path $PSScriptRoot 'ai-study.ps1'
$fixture = Join-Path ([IO.Path]::GetTempPath()) ("interviewprep-ai-tests-" + [guid]::NewGuid().ToString('N'))
[IO.Directory]::CreateDirectory((Join-Path $fixture 'study-plan')) | Out-Null
Copy-Item -LiteralPath (Join-Path $repo 'study-plan\ai-ml-weekly-syllabus.csv') -Destination (Join-Path $fixture 'study-plan')
Copy-Item -LiteralPath (Join-Path $repo 'study-plan\ai-ml-source-index.json') -Destination (Join-Path $fixture 'study-plan')
[IO.Directory]::CreateDirectory((Join-Path $fixture 'sessions')) | Out-Null
[IO.File]::WriteAllText((Join-Path $fixture 'sessions\evidence.txt'), 'Synthetic test-fixture attempt and assessment; not learner evidence.')
[IO.File]::WriteAllText((Join-Path $fixture 'sessions\tests.txt'), 'Synthetic fixture test run passed; not learner evidence.')
$stateFile = Join-Path $fixture 'progress\ai-ml\daily-state.json'
$pastDate = (Get-Date).AddDays(-40).ToString('yyyy-MM-dd')
$today = Get-Date -Format 'yyyy-MM-dd'
$checks = 0

function Assert-Condition([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw "FAILED: $Message" }
    $script:checks++
    Write-Output "PASS: $Message"
}

function Read-FixtureState {
    Get-Content -LiteralPath $stateFile -Raw | ConvertFrom-Json -AsHashtable
}

function Assert-Rejected([scriptblock]$Operation, [string]$Pattern, [string]$Message) {
    $before = (Get-FileHash -LiteralPath $stateFile).Hash
    $failure = $null
    try { & $Operation | Out-Null } catch { $failure = $_.Exception.Message }
    Assert-Condition ($null -ne $failure -and $failure -match $Pattern) $Message
    Assert-Condition ((Get-FileHash -LiteralPath $stateFile).Hash -eq $before) "$Message leaves state unchanged"
}

function Complete-FixtureDay {
    $arguments = @{
        Action = 'Record'; Root = $fixture; Date = $pastDate
        Prompt = 'Synthetic fixture prompt'; Answer = 'Synthetic fixture answer'
        Notes = 'Synthetic fixture assessment'; NextPrompt = 'Synthetic next task'
        Evidence = @('sessions\evidence.txt'); Scores = @(2); Dimensions = @('Concepts')
        TheoryComplete = $true; PracticeComplete = $true; AssessmentComplete = $true; SessionClosed = $true
        TestsPassed = $true; TestEvidence = 'sessions\tests.txt'
    }
    & $tracker @arguments | Out-Null
}

try {
    & $tracker -Action Build -Root $fixture | Out-Null
    & $tracker -Action Validate -Root $fixture | Out-Null
    $catalog = Get-Content -LiteralPath (Join-Path $fixture 'study-plan\ai-ml-daily-catalog.json') -Raw | ConvertFrom-Json -AsHashtable
    $initial = Read-FixtureState
    Assert-Condition ($catalog.days.Count -eq 420 -and @($catalog.days | Where-Object rest).Count -eq 60) '420 daily units with exactly 60 rest units'
    foreach ($relative in @('study-plan\ai-ml-daily-schedule.md', 'assessments\ai-ml\interview-bank.md')) {
        $generated = Get-Content -LiteralPath (Join-Path $fixture $relative) -Raw
        Assert-Condition ($generated.EndsWith("`n") -and -not $generated.EndsWith("`n`n")) "$relative has one final newline"
    }
    Assert-Condition ($initial.activeDay -eq 1 -and $initial.days.Count -eq 0 -and $initial.sessions.Count -eq 0 -and $initial.reviews.Count -eq 0) 'setup invents no learner evidence or review dates'
    Assert-Rejected { & $tracker -Action Advance -Root $fixture } 'incomplete' 'cannot skip an unanswered day'
    Assert-Rejected {
        & $tracker -Action Record -Root $fixture -Date $pastDate -Prompt P -Answer A -Notes N -NextPrompt Q -Evidence '..\outside.txt'
    } 'outside' 'rejects evidence outside the repository'
    Assert-Rejected {
        & $tracker -Action Record -Root $fixture -Date $pastDate -Prompt P -Answer A -Notes N -NextPrompt Q -Evidence 'missing.txt'
    } 'does not exist' 'rejects nonexistent evidence'
    Assert-Rejected {
        & $tracker -Action Record -Root $fixture -Date ((Get-Date).AddDays(1).ToString('yyyy-MM-dd')) -Prompt P -Answer A -Notes N -NextPrompt Q -Evidence 'sessions\evidence.txt'
    } 'future' 'rejects future learning dates'
    Assert-Rejected {
        & $tracker -Action Record -Root $fixture -Date $pastDate -Prompt P -Answer A -Notes N -NextPrompt Q -Evidence 'sessions\evidence.txt' -Scores 4 -Dimensions Concepts
    } 'between 0 and 3' 'rejects invalid scores'
    & $tracker -Action Record -Root $fixture -Date $pastDate -Prompt 'Explain a learned concept' -Answer 'Fixture explanation' -Notes 'Fixture reasoning' -NextPrompt 'Unanswered fixture exercise' -Evidence 'sessions\evidence.txt' -TheoryComplete | Out-Null
    $partial = Read-FixtureState
    Assert-Condition (-not $partial.days[0].complete -and $partial.nextPrompt -eq 'Unanswered fixture exercise') 'partial session preserves the exact unanswered task'
    $targets = @($partial.reviews | ForEach-Object { ([datetime]$_.due - [datetime]$pastDate).Days })
    Assert-Condition (($targets -join ',') -eq '1,2,4,8,15,31') 'recall targets derive from the actual learning date'
    $beforeRebuild = (Get-FileHash -LiteralPath $stateFile).Hash
    & $tracker -Action Build -Root $fixture | Out-Null
    Assert-Condition ((Get-FileHash -LiteralPath $stateFile).Hash -eq $beforeRebuild) 'regeneration preserves actual progress byte-for-byte'
    Assert-Rejected { & $tracker -Action Advance -Root $fixture } 'incomplete' 'partial theory does not complete the day'
    Assert-Rejected {
        & $tracker -Action Record -Root $fixture -Date $pastDate -Prompt P -Answer A -Notes N -NextPrompt Q -Evidence 'sessions\evidence.txt' -Scores 1 -Dimensions Concepts
    } 'gap' 'weak assessed answers require explicit remediation'
    Complete-FixtureDay
    & $tracker -Action Advance -Root $fixture | Out-Null
    Assert-Condition ((Read-FixtureState).activeDay -eq 2) 'advances only after independently recorded completion'
    Complete-FixtureDay
    & $tracker -Action Advance -Root $fixture | Out-Null
    Assert-Rejected {
        & $tracker -Action Record -Root $fixture -Date $pastDate -Prompt P -Answer A -Notes N -NextPrompt Q -Evidence 'sessions\evidence.txt' -PracticeComplete
    } 'passing run' 'executable practice requires saved passing-test evidence'
    foreach ($day in 3..5) {
        Complete-FixtureDay
        & $tracker -Action Advance -Root $fixture | Out-Null
    }
    Assert-Rejected { Complete-FixtureDay } 'five rubric' 'weekly assessment cannot use a one-dimensional score'
    & $tracker -Action Record -Root $fixture -Date $pastDate -Prompt 'Fixture weekly assessment' -Answer 'Fixture answers' -Notes 'Five-dimension fixture rubric' -NextPrompt 'Rest unit' -Evidence 'sessions\evidence.txt' -Scores 3,3,2,2,2 -Dimensions Concepts,Application,'Edge cases',Tradeoffs,Communication -TheoryComplete -PracticeComplete -TestsPassed -TestEvidence 'sessions\tests.txt' -AssessmentComplete -SessionClosed | Out-Null
    $assessed = Read-FixtureState
    $weekly = @($assessed.days | Where-Object { $_.day -eq 6 })[0]
    Assert-Condition ($weekly.mastery -eq 'demonstrated_once' -and $assessed.sessions[-1].denominator -eq 15) 'weekly scores retain their denominator and do not claim durable mastery'
    Assert-Condition (@($assessed.reviews | Where-Object { $_.id -like 'D2-*' }).Count -eq 6) 'new internals have their own actual-date recall cards'
    Assert-Rejected {
        & $tracker -Action Review -Root $fixture -Date $pastDate -ReviewId D1-R1 -Answer A -Notes N -Evidence 'sessions\evidence.txt' -Scores 3 -Dimensions Concepts
    } 'before.*due' 'cannot pre-complete delayed recall'
    & $tracker -Action Review -Root $fixture -Date $today -ReviewId D1-R1 -Answer 'Fixture misconception' -Notes 'Fixture correction' -Evidence 'sessions\evidence.txt' -Scores 1 -Dimensions Concepts | Out-Null
    $failedReview = @((Read-FixtureState).reviews | Where-Object { $_.id -eq 'D1-R1' })[0]
    Assert-Condition ($failedReview.status -eq 'pending' -and $failedReview.due -eq (Get-Date).AddDays(1).ToString('yyyy-MM-dd') -and $failedReview.attempts.Count -eq 1 -and $failedReview.originalDue -ne $failedReview.due) 'failed review preserves history and returns the next day'
    & $tracker -Action Review -Root $fixture -Date $today -ReviewId D1-R2 -Answer 'Fixture correct explanation' -Notes 'Fixture explanation checked' -Evidence 'sessions\evidence.txt' -Scores 3 -Dimensions Concepts | Out-Null
    $passedReview = @((Read-FixtureState).reviews | Where-Object { $_.id -eq 'D1-R2' })[0]
    Assert-Condition ($passedReview.status -eq 'complete' -and $passedReview.attempts.Count -eq 1) 'only an assessed due review closes its card'
    & $tracker -Action Advance -Root $fixture | Out-Null
    & $tracker -Action Advance -Root $fixture | Out-Null
    Assert-Condition ((Read-FixtureState).activeDay -eq 8) 'rest units require no invented assessment'
    & $tracker -Action Validate -Root $fixture | Out-Null
    $mirrorPath = Join-Path $fixture 'progress\ai-ml\current-state.md'
    $mirror = Get-Content -LiteralPath $mirrorPath -Raw
    [IO.File]::WriteAllText($mirrorPath, 'Inconsistent generated state')
    Assert-Rejected { & $tracker -Action Validate -Root $fixture } 'disagrees' 'detects a stale human-readable resume point'
    [IO.File]::WriteAllText($mirrorPath, $mirror)
    $validJson = Get-Content -LiteralPath $stateFile -Raw
    [IO.File]::WriteAllText($stateFile, '{broken json')
    $parseFailed = $false
    try { & $tracker -Action Today -Root $fixture | Out-Null } catch { $parseFailed = $true }
    Assert-Condition $parseFailed 'malformed progress is an explicit error, not empty success'
    [IO.File]::WriteAllText($stateFile, $validJson)
    & $tracker -Action Validate -Root $fixture | Out-Null
    Write-Output "All $checks behavioral checks passed. Synthetic evidence existed only in the temporary fixture."
}
finally {
    if (Test-Path -LiteralPath $fixture) { Remove-Item -LiteralPath $fixture -Recurse }
}
