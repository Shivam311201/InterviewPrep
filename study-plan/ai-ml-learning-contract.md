# AI/ML daily study and interview preparation

Authorized November 1, 2026. This is a separate track from the existing 16-week
SWE roadmap. Its Day 4 generics prompt, scores, notes, and revision queue remain
unchanged. DSA remains separate. The earlier deferral of AI applies to the SWE
syllabus, not to this newly requested AI/ML plan.

## Start here

1. Read `progress/ai-ml/daily-state.json` and its human-readable current state.
2. Open the active unit in `ai-ml-daily-schedule.md`.
3. Inspect the actual due reviews and linked session evidence.
4. Resume the exact unanswered prompt; do not reveal the answer first.

There are **60 curriculum weeks / 420 daily units**. A week has six study units
and one rest/light-recall unit. Days are curriculum positions, not deadlines.
A missed date does not skip a lesson, create fake assessment results, or force
catch-up. A unit may take more than one session.

Starting effort allowance: about 2 hours per study unit plus optional 30-minute
rest-day recall, approximately 12-12.5 hours/week or 720-750 hours total. This is
a starting allocation, not a guarantee. Foundational gaps, the 20 TinyTorch
modules, substantial capstones, and specialist depth can require more time.
The broader integrated plan estimated 705-1,085 core hours before additional
specialist depth. Re-estimate after observed progress; do not compress necessary
work merely to meet the 60-week label.

## Resource selection

- AI Engineering from Scratch leads Python/math/classical ML, vision/language
  foundations, transformer/LLM concepts, retrieval applications, tools, and agents.
- Machine Learning Systems leads lifecycle/data reasoning, execution constraints,
  optimization, measurement, serving, operations, and distributed ML.
- TinyTorch is the main progressive framework implementation path; do not also
  build an entire duplicate framework from the first repository.
- Relevant lessons from both remain required where they provide different kinds
  of understanding. The daily source index resolves exact lessons and chapters.

The source index records when references were checked, not when their code was
tested. Volume II and TinyTorch are evolving preview material. Volumes III/IV
are not prerequisites. Recheck vendor APIs, versions, costs, and benchmarks
against primary documentation before using them.

The sequence is intentionally not either source's numeric order. Early
evaluation is a conceptual preview before full algorithm comparisons; revisit
its implementation after the prerequisite algorithms. Agent evaluation is a
reference until its broader runtime concepts are covered. Teach missing
prerequisites explicitly rather than claiming all original lesson prerequisites
were already satisfied.

## Daily rhythm and assessments

| Unit | Work | Evidence |
|---|---|---|
| 1 | First principles and one concrete example | Learner explanation and annotated example |
| 2 | Internals/math and failure trace | Shapes/units/assumptions plus a debugging attempt |
| 3 | Independent implementation | Code, relevant tests, and actual execution output |
| 4 | Edge cases and debugging | Failing case, correction, and passing run |
| 5 | Interview drill and design tradeoffs | Actual conceptual/debug/design answers and follow-ups |
| 6 | Closed-book assessment and consolidation | Live code variation, delayed transfer, scores, and corrections |
| 7 | Rest or optional short recall | No new syllabus; only actual review results if attempted |

Typical two-hour session: 15 minutes recall, 30 minutes explanation/math,
45 minutes implementation or tracing, 20 minutes interview questions, and
10 minutes recording results. Adjust for the topic and fatigue; never declare
completion based on the timer.

The interview bank contains **five prompts per week**: conceptual reasoning,
diagnosis, design judgment, a live implementation change, and transfer from
earlier material. Early questions build foundations; later questions demand
quality/latency/cost tradeoffs and failure handling. Questions are assessment
prompts, not a promise that these are actual company interview questions.

Score substantial weekly assessments on five dimensions, each 0-3:
concepts, application, edge cases, tradeoffs, communication. Maximum **15**.
Use the actual relevant denominator for narrow quizzes; partial points are
allowed. Preserve itemized scores and learner answers.

- 0: no workable understanding or implementation.
- 1: partial/memorized answer, important misconception, or substantial help.
- 2: mostly correct, some prompting or missing caveats.
- 3: independent, accurate, tested where applicable, with justified follow-ups.

At least 12/15 with no dimension below 2 and passing executable evidence is
**demonstrated once**, not durable mastery or proof of employment readiness.
Delayed recall and unfamiliar variations provide further retention evidence.
Weak results require explicit gaps and remediation. Completed sessions and
required outputs may coexist with developing mastery; keep that distinction.

Never fabricate an answer, grade, transcript, successful test, or completed day.
Code supplied by the assistant is a worked example, not independent learner
implementation. TinyTorch scaffolds are guided exercises; add an independent
variation. Simulations do not substitute for a real endpoint benchmark.

## Revision and linking past topics

After actual learning evidence, schedule recall at **+1, +2, +4, +8, +15, +31
calendar days**. The first-principles unit, internals unit, and weekly
consolidation each get their own cards dated from their actual session; specific
assessed misconceptions get additional next-day cards. Preserve the original
target and every attempted answer.
The current calendar passing a target never completes a review.

Start each session with at most three due/high-priority prompts in a bounded
10-20-minute block. Ask for explanation and a new example, not recognition.
An incorrect or under-explained review returns the next day; retain its history
and the remaining original review dates.

Every week's `RecallWeeks` explicitly connects older topics to the new material.
Examples: vectors -> embeddings -> retrieval; derivatives -> autograd ->
training; statistics -> evaluation -> online experiments; graph lifetime ->
activation memory -> checkpointing; queues -> serving latency -> fleet recovery.
Use actual SWE evidence for occasional bridges such as generic types versus
array shapes, object lifetime versus graph lifetime, and retry mechanisms versus
agent idempotency. Do not transfer SWE grades into ML mastery.

After each session, record the exact next unanswered prompt/task. If the learner
stops mid-exercise, resume that exercise, not a fresh lecture.

## Durable tracking commands

Run from the repository root in PowerShell 7:

```powershell
.\scripts\ai-study.ps1 -Action Today
.\scripts\ai-study.ps1 -Action Validate
.\scripts\test-ai-study.ps1
```

`Today` is read-only. `Build` regenerates daily materials from the checked-in
weekly CSV and source index without resetting progress. Do not manually edit
generated schedules or progress views; change the syllabus/state via reviewed
updates and regenerate. Network access is needed when creating a new source
index or explicitly running `-Action Build -RefreshSources` after adding source
references. Missing references or invalid JSON are errors, not empty-success
fallbacks.

The script never executes learner code or infers a successful test. `TestsPassed`
is a reviewer assertion that must be accompanied by real saved run output.
The reviewer must inspect/run the implementation before making that assertion.

Example recording shape, **only after an actual attempt**:

```powershell
.\scripts\ai-study.ps1 -Action Record `
  -Prompt '<actual prompt>' -Answer '<actual learner answer>' `
  -Notes '<grade reasoning and correction>' `
  -NextPrompt '<exact next unanswered task>' `
  -Evidence 'sessions\ai-ml\<actual-session-file>.md' `
  -Scores 2 -Dimensions Concepts -Gaps '<specific gap if score is below 2>'
```

For completed executable work, additionally pass `-PracticeComplete`,
`-TestsPassed`, and `-TestEvidence '<actual test-output file>'`. Set
`-TheoryComplete`, `-AssessmentComplete`, and `-SessionClosed` only when their
independent requirements were satisfied. Weekly assessment completion requires
all five named dimensions. `Advance` rejects incomplete study units.

Use `Review` with a pending ID, the actual answer, assessment/correction notes,
scores/dimensions, and an existing evidence file. A reviewed score below 2
reschedules that review for the next day. Evidence paths must identify nonempty
files within the repository.

Save session records under `sessions/ai-ml`, implementation work under
`implementations/ai-ml`, and topic notes under `notes/ai-ml` as they are actually
produced. No empty placeholder implementations or invented learning records are
created during setup.

## Daily check-in and publication

Daily check-in target: **19:00 India Standard Time**. A check-in reports the
active unit, exact unfinished task, and bounded due review queue. If no new
learner evidence exists, it leaves progress unchanged. It can ask for actual
study status, but cannot observe off-chat study or grade unsubmitted work.

The recurring assistant schedule depends on the CLI scheduler/session being
available. It is not an email service or a guarantee of a notification while
the CLI is closed. `Today` provides the same resume information manually.

The user authorized publishing this AI/ML plan and actual current-state updates
on November 1, 2026. Keep the SWE syllabus and unrelated dirty work outside the
publication scope. Use exactly one subagent for commit/push operations, include
required commit trailers, and verify the live remote commit/files after each
push. Do not claim synchronization merely because a local file or commit exists.
This authorization is not permission for deployments or unrelated changes.

## Final readiness evidence

Finish a conventional ML service and an evaluated AI application by extending
the earlier projects. Demonstrate reproducible training/data, split-aware
evaluation, independent implementation, actual API execution/load measurements,
quality monitoring, local releases/recovery, access controls, and a defensible
failure investigation. Use public/non-sensitive data and isolated local tests.

The final mocks must include unfamiliar coding and system-design scenarios.
State limitations honestly: small-scale distributed exercises are not experience
operating a hyperscale fleet, and a course project is not regulatory compliance.
