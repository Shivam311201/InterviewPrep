# Revision queue

**Reconciled:** 1 November 2026. Dates below are recall targets, not proof that a
review happened. Past targets without a linked result are pending verification.
A correct short answer needs a follow-up explanation before closing a gap.

Do short recall blocks alongside the active day; do not restart entire earlier days.
Preserve old scorecard evidence and add a dated outcome after each actual attempt.

| ID | Gap / prompt | Priority | Evidence anchor | Recall targets (+1, +2, +4, +8, +15, +31 days) | State |
|---|---|---|---|---|---|
| R1 | Trace `new` versus `override` through base and derived references; explain virtual slots | High | Day 3 Q3, 31 Oct, 1/3 | 1 Nov, 2 Nov, 4 Nov, 8 Nov, 15 Nov, 1 Dec 2026 | Due 1 Nov; result pending |
| R2 | Choose interface, abstract class, or composition when a contract and shared validation/logging are required | High | Day 3 Q6, 31 Oct, 1.5/3 | 1 Nov, 2 Nov, 4 Nov, 8 Nov, 15 Nov, 1 Dec 2026 | Due 1 Nov; result pending |
| R3 | Separate RetryPolicy configuration from RetryHandler execution; explain transient failures and cancellation | Medium | Day 3 Q5, 31 Oct, 2/3 | 1 Nov, 2 Nov, 4 Nov, 8 Nov, 15 Nov, 1 Dec 2026 | Due 1 Nov; result pending |
| R4 | Explain explicit-interface access and why a snippet containing an invalid concrete call does not compile as a whole | Medium | Day 3 Q4, 31 Oct, 2/3; historical explanation corrected | 1 Nov, 2 Nov, 4 Nov, 8 Nov, 15 Nov, 1 Dec 2026 | Due 1 Nov; result pending |
| R5 | Enforce all BankAccount invariants; explain same-class private access and focused interfaces | Medium | Day 3 Q1/Q8, 31 Oct, 2/3 each; implementation skipped | 1 Nov, 2 Nov, 4 Nov, 8 Nov, 15 Nov, 1 Dec 2026 | Due 1 Nov; code/tests still unverified |
| R6 | Predict nullable `??`, `.Value`, `GetValueOrDefault()`, and `in` mutation/reassignment behavior | High | Day 2 assessment, 25 Oct, unanswered/unverified | 26 Oct, 27 Oct, 29 Oct, 2 Nov, 9 Nov, 25 Nov 2026 | Earlier targets pending verification; next target 2 Nov |
| R7 | Debug integer division; explain compile-time overload choice, `var` versus `dynamic`, and practical execution stages | Medium | Day 1 assessment, 25 Oct, corrections recorded | 26 Oct, 27 Oct, 29 Oct, 2 Nov, 9 Nov, 25 Nov 2026 | Earlier targets pending verification; next target 2 Nov |
| R8 | Trace boxing copies and exact-type unboxing before numeric conversion; produce annotated examples | High | Day 2 assessment, 25 Oct, integrated trace corrected to `5,3,3` | 26 Oct, 27 Oct, 29 Oct, 2 Nov, 9 Nov, 25 Nov 2026 | Earlier targets pending verification; next target 2 Nov |
| R9 | Older-to-younger references, write barriers/card tables; disposal versus GC; managed heap versus process memory | Medium | Existing memory/GC notes and provisional scorecard | Set new targets after an actual Day 5 recall attempt; original per-topic learning dates not reconstructed here | Retained; not newly reassessed |

## Review result format

Record date, prompt, actual learner answer, score and denominator, correction,
follow-up result, evidence link, and next target. Do not advance dates merely
because the calendar passed. Preserve previous wrong answers.

## Implementation follow-through

- Day 4: complete the notification/event component with runnable tests, covering
  valid/invalid inputs, dependency interactions, and failure paths actually introduced.
- Day 5/6: finish BankAccount and resource-lifetime examples; record build/test results.
- Day 6: close Day 1/2 annotated traces/comparison table and Day 3 object/process
  artifacts, then assess the first week's syllabus. Record residual gaps separately.
