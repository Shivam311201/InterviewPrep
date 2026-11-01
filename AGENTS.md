# Interview preparation continuation contract

Read `progress/current-state.md`, `progress/daily-state.json`,
`progress/revision-queue.md`, `progress/scorecard.md`, the active day's section in
`study-plan/16-week-daily-schedule.md`, and its linked session records before teaching.
Use `study-plan/16-week-swe-interview-roadmap.md` for the complete curriculum.

## Teaching

- Resume the exact unanswered prompt. Do not reveal its answer before the learner attempts it.
- Teach directly from first principles, then use code traces, debugging, implementation,
  interview follow-ups, and delayed recall. Verify current language/runtime details
  against official documentation when needed.
- Usually ask one focused question at a time; provide a complete assessment set when requested.
- Preserve the learner's answers and misconceptions, with explicit corrections.
  Historical assistant explanations are evidence of what was taught, not unquestionable authority.
- Keep DSA separate and defer AI/agentic topics. Preserve the full 16-week scope.
- Treat a study day as a curriculum unit, not a calendar deadline. Resume after missed
  sessions without guilt or artificial catch-up. Day 7 of each week is rest/light recall.
- Keep weak prerequisites in bounded recall blocks while progressing the syllabus.
  Do not turn Day 1/2 remediation or interesting OS detours into an indefinite blocker.

## State and evidence

- Track session, theory, practice, assessment, and mastery independently.
  Exposure is not mastery; conceptual review is not executable practice.
- `progress/daily-state.json` is the structured source for the active day, next prompt,
  day statuses, evidence links, pending work, and publication boundary.
  Keep `current-state.md` and `daily-progress.md` consistent with it.
- The daily schedule defines required coverage; the weekly roadmap defines overall scope.
  Record intentional sequencing changes rather than silently renumbering old lessons.
- Do not mark a day fully complete until its required output and checkpoint have
  evidence. A completed study session can still have partial practice or developing mastery.
- Use dates of actual learning/assessment for spaced recall at +1, +2, +4, +8, +15,
  and +31 days. Record actual review results before rescheduling or closing a gap.
- Do not copy credentials, unrelated personal details, connector payloads, or raw
  account metadata into the repository. Save only relevant preparation records.

## Close every session

1. Save the dated lesson record, user questions, assistant questions, actual answers,
   grades, corrections, and important examples. Label summaries versus verbatim history.
2. Update topic notes and scorecard only where new evidence warrants a change.
3. Update the revision queue and assignment status, including code/test evidence.
4. Update the active day in JSON and the progress table; preserve untouched future days.
5. Set the exact next unanswered question or unfinished task in both state files.
6. Validate JSON, links, score arithmetic, and agreement between schedule and state.

## Standing publication permission — 1 November 2026

The learner authorized ongoing check-ins for **this InterviewPrep repository**.
After each study session, validate the relevant records, commit the study changes,
push to the existing tracked branch, and verify the live remote commit and files.
Do not require fresh permission for these routine study-state updates.

This permission does not apply to other repositories, unrelated changes,
deployments, force pushes, history rewrites, or changing PR state. Do not launch
subagents unless explicitly requested. Surface authentication or publication
failures; never claim synchronization based only on a local save.
