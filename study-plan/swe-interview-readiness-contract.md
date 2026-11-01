# SWE interview readiness: implementation, assessment, and recall

**Reviewed:** 1 November 2026. This strengthens the existing 16-week plan; it does
not reset Day 4, erase earlier scores, or change the independent AI/ML or DSA tracks.
Use with the [daily schedule](16-week-daily-schedule.md),
[book coverage](book-coverage.md), and [assessment bank](../assessments/swe-interview-bank.md).

## Audit outcome

The original subject coverage and prerequisite order are broadly appropriate.
The execution contract needed these changes:

| Gap | Required improvement |
|---|---|
| OS mostly worksheets/oral answers | Implement scheduling, address translation/replacement, and synchronization; use book simulators only after predicting results |
| DBMS mostly simplified plans and hypothetical sessions | Execute SQL on fixtures, inspect real query plans, and reproduce two-session anomalies on a named/versioned engine |
| LLD can finish with pseudocode | Independent assignment requires runnable C# and tests; pseudocode is acceptable during a timed interview, not proof of implementation |
| Broad quizzes without a repeatable gate | Weekly mixed assessment, practical checks, explicit rubric, unseen variants, and delayed retests |
| Spaced dates without a bounded review method | Daily due recall, weekly old-topic sampling, failed-review remediation, and maintenance beyond Day 31 |
| Book names without chapter accountability | Inventory the supplied OS books and the selected DBMS edition; distinguish interview-core completion from full-book completion |
| HLD starts late and risks memorized diagrams | Add short early design drills, then distinct full mocks and a locally tested critical component |
| Oversized units / stale next-step paragraphs | Split units across sessions, retain unfinished evidence, and use the current-state file as the sole resume point |

## Scope and time

Six study days and 10–12 hours/week remain the default. At that pace, 16 weeks
provides 160–192 study hours: a planning budget, not a promise of mastery or an offer.
The separately authorized AI/ML track has a separate budget; do not double-count
the same hours. DSA remains independent.

Use approximately 10 core hours: 3 teaching/trace hours, 3 implementation hours,
1 interview-drill hour, 1 distributed recall hour, and 2 assessment/retrospective
hours. Up to 2 additional hours absorb gaps or deeper book work. Reuse one project
across related labs instead of creating a new application every day.

The large current Day 4 unit can span several sessions. Do not drop delegates,
events, collections, or LINQ to make a calendar deadline. Conversely, do not stop
all progress for an old microtopic: carry its failed checkpoint into bounded recall.
At each phase checkpoint, record actual progress, unresolved work, and a revised
calendar estimate. Extend the calendar for full-book depth if necessary.

**All-topic rule:** every substantive topic in the book ledger has an owner unit
and assessment. Core and extension rows are both required for the full-book goal.
An extension is a scheduled continuation, not an unnoticed exclusion. Completing
the 16-week interview core does not mean completing every book or every possible
interview topic. No chapter is credited from a filename, slide title, or lecture alone.

## Required implementation catalog

Start with a small runnable exercise, then add the listed adversarial case.
These are assignments, not finished implementations or new mastery evidence.

| Lab | Scheduled units | Learner-owned implementation | Required evidence / adversarial check |
|---|---|---|---|
| C1 | 4–6 | BankAccount with explicit invariants and controlled mutation | Build/tests: zero/negative inputs, overdraft, constructor validation, unchanged state after rejected operation |
| C2 | 4, 10–11, 16–17 | Generic notification/event component with injected dependencies | Generic constraints, subscription lifetime, invalid inputs, failure propagation, deferred query trace; tests without real providers |
| C3 | 9, 13 | Dispatch/equality/value-object kata | Explain compile errors separately from runtime outputs; equal objects in Dictionary/HashSet; mutation/equality hazard |
| C4 | 18, 23–24, 66 | Bounded async worker with cancellation and cleanup | Concurrency bound, cancellation, exception propagation, no leaked permits/resources; coordinate tests rather than relying on sleeps |
| O1 | 29–30, 34 | Scheduler simulator: FCFS, SJF/SRTF, Round Robin | Gantt trace and response/wait/turnaround; arrival/tie/idle cases; independent calculation before simulator comparison |
| O2 | 31, 34, 107 | Address-translation and FIFO/LRU page-replacement simulator | Page/offset, permissions/present bits, hit/miss/fault distinction, invalid access, repeated working sets |
| O3 | 18, 32, 66, 107 | Bounded producer/consumer plus reusable barrier and reader/writer variants | Safety invariant, wait predicate, lock order, termination, starvation assumptions; controlled interleavings and bounded stress |
| O4 | 33, 38, 41 | Small file/journal recovery experiment and resource-lifetime check | Partial record/replay, flush versus durability reasoning, handle cleanup; simulated crash in a disposable fixture, not production infrastructure |
| D1 | 19, 36–37 | Business schema, seed data, SQL and normalization exercises | Executed results for NULLs, duplicates, joins, grouping, CTE/window queries, constraints, invalid inserts, decomposition rationale |
| D2 | 38–39, 61 | Index/query-plan experiment on skewed fixtures | Actual EXPLAIN/ANALYZE output, estimated versus actual rows, before/after work, composite/covering trade-offs, pagination |
| D3 | 40–41, 52, 108 | Two-session isolation and retry harness | Reproduce nonrepeatable read and serialization/write-skew case; atomic update/locking alternatives; deadlock or serialization retry |
| D4 | 41, 67, 102 | Durable business write plus outbox/inbox deduplication | Atomicity/unique constraint tests, rollback, publish-before/after-crash windows, repeated delivery; distinguish toy recovery from real engine guarantees |
| L1 | 25–27 | Parking lot or library management | Requirements, invariants, core C# flows/tests, changed requirement, failure paths, minimal justified pattern |
| L2 | 71–76, 110 | A different LLD: rate limiter, cache, scheduler, or elevator | Runnable core and tests, state/concurrency boundaries, extensibility change, timed unseen variant |
| H0 | 24, 38, 51 | 15–20 minute mini-design using an existing exercise | Requirements first, one capacity estimate with units, critical sequence, data ownership, one failure and two plausible choices |
| H1 | 78–83 | Full URL-shortener/paste-service HLD | APIs/schema, estimates, cache/read/write flow, collision/abuse handling, latency budget, bottleneck/failure review |
| H2 | 85–90 | Evolve H1 under regional failure and 10x traffic | RPO/RTO, failover/fencing assumptions, consistency promises, recovery drill, rollback compatibility, SLO/telemetry |
| H3 | 92–97 | Two different HLD cases: feed/search/ingestion/upload | Distinct bottlenecks, hot key or fan-out, freshness, storage/query cost, failure matrix; avoid one memorized template |
| H4 | 99–104 | Integrated HLD plus one locally executed critical component | C#/OS/DBMS/network diagnosis, component tests/load measurement, source-of-truth boundaries; local throughput is not proof of production scale |

### Lab rules

The learner attempts implementation before a complete assistant solution is shown.
Record hints separately from independent work. A code review, generated solution,
or “looks correct” does not satisfy an executable deliverable.

For C#, record SDK/target framework, build/test commands, actual results, and
relevant warnings. For DBMS, use PostgreSQL as the reference lab engine and record
its version, schema, fixture, session order, isolation settings, SQL, results, and
plan output. Another engine is acceptable with an explicit semantics comparison;
SQLite is not interchangeable evidence for PostgreSQL concurrency behavior.

For OS/POSIX APIs, use C/POSIX in a suitable local Linux/WSL environment where
available; C# simulations are portable alternatives for algorithm practice, not
evidence of executing `fork`, pthreads, or kernel behavior. Record the distinction.
Install tools only when the relevant lab needs them; do not deploy services for prep.

Predict before executing. For an absence/failure test, include a valid positive
control. Test the contract/invariants and important failure cases, not constants or
mock call counts alone. Stress runs can expose concurrency bugs but do not prove
fairness or correctness; explain the invariant and allowed interleavings too.

## Assessment cadence

| When | Format | Evidence required |
|---|---|---|
| Each substantial topic | Mental model, trace/SQL, bug fix, implementation, edge case, trade-off, debugging, changed requirement | Actual answer, reasoning, hints, correction, topic score and relevant denominator |
| Each session | 2–4 short due recall prompts, usually one weak item and one previously strong item | Answer before solution; adapt question format to the day's implementation |
| Every study week's sixth day | 60–90 minute mixed round within the 2-hour assessment/retrospective budget | One independent practical task, 4–6 trace/SQL/oral prompts, one failure/design follow-up |
| Weeks 4, 7, 10, 13 | Phase gate and backlog review | Consolidated subject evidence, missing book rows/labs, revised calendar estimate |
| Weeks 4, 11, 16 | Timed LLD rounds | Requirements/model/code reasoning; independent runnable assignment outside mock |
| Weeks 12–16 | HLD rounds with distinct cases and changed constraints | Requirements/estimates/data/failure reasoning, not diagram aesthetics |
| Final closeout | Unseen retests plus next 30-day maintenance plan | Subject-by-subject ready/developing/not-assessed report with remaining gaps |

For ordinary weekly rounds, target roughly 70% current material and 30% earlier
topics; phase/final rounds can be closer to 50/50. These are coaching allocations,
not claims about a particular company's interview.

Use the existing five 0–3 dimensions (concepts, implementation, edge cases,
trade-offs, communication) for substantial rounds. **Provisional gate: at least
12/15, every dimension at least 2, and no unresolved correctness-critical flaw.**
These thresholds are our coaching policy, not an employer standard. Narrow checks
keep their own denominator; never convert the historical Day 3 22.5/30 into 15 points.

A weak gate does not erase progress. Record the cause, assign one bounded repair,
and use an unseen variant after a delay. Mark a core topic interview-ready only
with independent application and a successful delayed retest. Final readiness
needs two independent representative rounds per target subject/design area,
plus that subject's required practical evidence. Do not average away a missing lab.

Keep learner-facing prompts separate from solutions. The bank is a starting set:
generate further variants for every syllabus/book row, record each attempt, and
never claim that this finite bank exhausts all possible interview questions.

## Recall that survives the schedule

Use the existing +1, +2, +4, +8, +15, +31-day targets from actual learning dates.
After stable delayed recall, add +60 and +90-day maintenance checks, then adapt to
performance. These intervals are a practical schedule, not a universally optimal
scientific prescription.

At session start, select 2–4 due items without answer-key exposure. An earlier
unanswered active prompt may be resumed first, then recall follows immediately.
Prefer a different example or code/SQL variant rather than recognition of the same
multiple-choice letter. Include strong older topics as well as mistakes.

After an incorrect or hint-dependent answer, record the original attempt, repair
the misconception, ask a fresh short check, and set a new +1/+4-day retest from that
attempt. Do not overwrite earlier history or move dates merely because time passed.
After an absence, prioritize oldest important gaps in a bounded block; show the
remaining backlog rather than conducting a multi-hour recall marathon.

The weekly round samples old C#/OOP, OS, DBMS, networks, and design once taught.
Book-extension sessions continue recall from the core, and core maintenance
continues while other tracks run. “Explained once” and “recognized the answer”
are not retained mastery. Do not promise off-session reminders unless a working
notification mechanism has actually been configured.

## Sources and source limits

- [OSTEP author homework guidance](https://pages.cs.wisc.edu/~remzi/OSTEP/Homework/homework.html): predict simulator results before revealing them; read the exact simulator README.
- [The Little Book of Semaphores author resources](https://greenteapress.com/wp/semaphores/): independently compose synchronization patterns before hints/solutions.
- [Database System Concepts, seventh-edition author resources](https://www.db-book.com/slides-dir/index.html): chapter-aligned theory; no full book copied into this repo.
- [PostgreSQL isolation](https://www.postgresql.org/docs/current/transaction-iso.html): distinguish standard guarantees from engine-specific behavior.
- [PostgreSQL EXPLAIN](https://www.postgresql.org/docs/current/using-explain.html): use real plans and measured evidence, not guaranteed speedups.
- [Microsoft .NET testing guidance](https://learn.microsoft.com/en-us/dotnet/core/testing/unit-testing-best-practices): tests should demonstrate behavior and important boundaries.
- [Microsoft C# type/object model](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/object-oriented/): modern language behavior, not translated Java assumptions.
- [AWS retry guidance](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/rel_mitigate_interaction_failure_limit_retries.html): bounded retries, backoff/jitter, failure classification, and tested side effects.

The exercises, thresholds, time allocations, and mappings here are our study-plan
design, not quotations or a guarantee of hiring outcomes.
