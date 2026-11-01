# InterviewPrep — SWE Interview Preparation

Structured preparation notes, quizzes, assessments, revision queue, and scorecard. Study records should preserve questions from both user and assistant, answers, corrections, important details, and follow-up items.

## Start here: complete plan

- **[Current state and exact resume point](progress/current-state.md)** — start here before teaching.
- **[Day-by-day progress](progress/daily-progress.md)** — all 112 plan days, including rest days; session completion is separate from mastery.
- **[Daily schedule](study-plan/16-week-daily-schedule.md)** — syllabus, required output, and completion checks.
- **[Revision queue](progress/revision-queue.md)** — retained mistakes and dated recall checks.
- `progress/daily-state.json` — structured state for continuing assistants; update alongside the human-readable progress files.

- **[Complete 16-week SWE interview roadmap](study-plan/16-week-swe-interview-roadmap.md)** — goals, weekly hours and six-day rhythm, detailed week-by-week syllabus, textbook and official-doc reference strategy, assignments, checkpoints, assessment rubric, spaced repetition, repo-maintenance contract, and instructions for a continuing agent.
- **[Interview-readiness contract](study-plan/swe-interview-readiness-contract.md)** — runnable OS/OOP/DBMS/LLD labs, HLD drills, weekly mixed assessments, readiness gates, and ongoing recall.
- **[Book coverage](study-plan/book-coverage.md)** and `study-plan/book-coverage.csv` — supplied OS books, selected DBMS edition, OOP reference boundaries, and explicit full-book extensions.
- **[SWE assessment prompts](assessments/swe-interview-bank.md)** — learner-facing questions; actual answers and scores remain in dated records.

## Current learning record
- `notes/csharp-oop/memory-and-gc.md` — detailed notes on C# references, stack/heap, reachability, GC roots, disposal, and generational GC.
- `assessments/quizzes/memory-gc-quiz.md` — quiz prompts, user's answers, correct answers, and explanations.
- `session-log.md` — lesson question log, user questions, assistant questions, corrections, and topic checklist.
- `progress/scorecard.md` — provisional topic mastery scores and revision queue.

## Working agreement
At the end of each study session, update the relevant topic notes, complete question/answer history, scorecard, mistakes, assignments, and spaced-revision queue. Preserve mistakes and corrections; do not mark unanswered questions as mastered. Verify GitHub writes before reporting success.

Study-day numbers are curriculum positions, not calendar dates. Multiple sessions can belong to one day; missed calendar days do not complete or skip syllabus. Continue Day 4 from its unanswered generics exercise, with short targeted recall rather than restarting Days 1–3.

Follow [AGENTS.md](AGENTS.md) for the continuation and end-of-session update contract. **Standing permission granted on 1 November 2026:** validate, commit, and push study records after each session in this repository, then verify the remote result. Local saves, commits, and remote publication remain distinct; never report local work as synchronized to GitHub.

## AI/ML engineering and interview preparation - separate track

Authorized November 1, 2026. The existing 16-week SWE plan and Day 4 resume point
remain intact; AI/ML has its own day numbering, evidence, assessments, and reviews.

- [Learning contract and assessment rubric](study-plan/ai-ml-learning-contract.md)
- [420-unit day-by-day schedule](study-plan/ai-ml-daily-schedule.md)
- [Progressive research-paper studio](study-plan/ai-ml-research-paper-plan.md)
- [Current AI/ML state](progress/ai-ml/current-state.md)
- [Daily progress](progress/ai-ml/daily-progress.md)
- [Revision queue](progress/ai-ml/revision-queue.md)
- [Assessment scorecard](progress/ai-ml/scorecard.md)
- [Weekly interview assessment bank](assessments/ai-ml/interview-bank.md)
- `progress/ai-ml/daily-state.json` - structured resume point and actual evidence.

Run `.\scripts\ai-study.ps1 -Action Today` in PowerShell 7 for the active task and
due reviews. `-Action Validate` checks plan/state consistency; run
`.\scripts\test-ai-study.ps1` after tracker changes. The weekly syllabus CSV and
checked source index regenerate the schedule without resetting progress.

The learner authorized publishing AI/ML plan and genuine progress updates.
Verify each push; do not include unrelated local changes or infer synchronization
from a local save. Daily check-ins depend on the CLI scheduler being available.
