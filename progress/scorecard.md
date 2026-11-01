# Progress Scorecard — C# OOP and Memory

> **Continuation reconciled 1 November 2026:** Active study unit is Day 4, with
> its first generics exercise unanswered. Day 1/2 study sessions are closed by
> later chat agreement, but their mastery/artifact gaps remain. Historical
> “resume first” instructions below do not block the new syllabus. See
> [current state](current-state.md), [daily progress](daily-progress.md), and
> [revision queue](revision-queue.md). No new learner answers were graded during
> migration; all scores below retain their original evidence.

Scores are provisional topic-mastery scores from practice, not a single formal interview score. We preserve the topic history and next steps rather than treating every quiz as a full 15-point assessment.

## Current mastery

| Topic | Current score | Evidence / notes |
|---|---:|---|
| Class/object/reference basics | 3/3 | Understands separate instances, reference copying, and aliasing. |
| Mutation vs. parameter reassignment | 3/3 | Correctly predicted 900 for pass-by-value reference example. |
| `ref` parameter semantics | 3/3 | Correctly predicted caller's variable is replaced. |
| Object graph reachability / GC roots | 3/3 | Correctly reasoned that both Parent and Child become eligible when root is removed and no other paths exist. |
| Transitive references | 3/3 | Correctly stated that an older Parent's reference makes Child transitively reachable. |
| GC timing / eligibility vs. collection | 3/3 | Understands that nulling references does not force immediate collection. |
| `Dispose()` vs. GC | 2/3 | Initial misconception corrected; continue revisiting deterministic resource cleanup vs. managed object reclamation. |
| Managed heap vs. process memory | 2/3 | Understands GC may reclaim objects without immediately reducing process working set; continue practicing diagnosis. |
| Generational GC fundamentals | 3/3 | Correctly explained why short-lived objects make Gen 0 efficient and why survivors may be promoted. |
| Older-to-younger reference tracking | 2/3 | Initially chose A instead of B for Gen 0 collection. Needs more practice with write barriers/card tables and remembered references. |
| Stack vs. heap nuances | 2/3 | Understands the conceptual model; revisit JIT optimizations and why value/reference types are not a strict stack/heap rule. |

## Recurring mistake categories

- **Knowledge gap:** initially did not know the Gen 0/1/2 model.
- **Knowledge gap:** initially conflated setting a reference to null with calling `Dispose()`.
- **Implementation detail gap:** initially assumed older generations could be completely ignored during Gen 0 collection.
- **Communication:** answers are often concise and directionally correct; practice giving a 2–4 sentence explanation with the underlying reason and one caveat.

## Revision queue

1. **Next session:** revisit write barrier, card table, and older-to-younger references.
2. Review `Dispose`, `using`, finalizers, SafeHandle/resource lifetime.
3. Review stack frames, thread stacks, registers/JIT liveness, and managed heap.
4. Practice memory-leak diagnosis: root paths, heap dumps, allocation rate, and process memory versus managed heap.
5. Then continue OS fundamentals: program vs. process, process address space, threads, and context switching.

## Spaced recall plan

Revisit weak topics approximately after 1, 2, 4, 8, 15, and 31 days, adapting to performance. Correct answers with incomplete reasoning should trigger a follow-up rather than automatic full mastery.

## Scoring rubric for future complex assessments

For full LLD/HLD or multi-part technical assessments, use five dimensions (0–3 each, max 15):
- Conceptual understanding
- Practical application/coding
- Edge cases/internal details
- Trade-offs/engineering judgment
- Communication/clarity

For a narrow fundamentals quiz, score only relevant dimensions and state the denominator. Do not represent the topic scores above as a 15-point assessment.


## 16-week interview preparation — C# Day 1/Day 2 status (25 Oct 2026)

This section tracks the new 16-week schedule separately from the older GC-focused scores above.

| Topic | Status | Evidence / next step |
|---|---|---|
| Value-type assignment | Demonstrated | Correctly answered `10, 11`. |
| Reference aliasing; mutation vs reassignment | Demonstrated at basic level | Correctly answered outputs `Bob/Charlie` and `2/3`. |
| Default pass-by-value with reference types | Demonstrated at basic level | Correctly predicted mutation persists (`7`); retain the reference-copy explanation. |
| `ref` and `out` basics | Demonstrated at basic level | Correctly answered simple output checks; full contrast still needs a concise explanation. |
| `in` parameter | Not verified | Targeted question remains. |
| Types/expressions and numeric conversions | Needs reinforcement | Missed integer division in `double b = a / 2`; correctly identified the floating-point cast case. |
| Compile-time vs runtime overload resolution | Needs reinforcement | Initially chose runtime string overload for an `object`-typed argument; later corrected. |
| Null overload resolution | Partial | Correctly identified ambiguity for unrelated `string` and `StringBuilder`; initially missed `string` being more specific than `object`. |
| `var` vs `dynamic` | Partial | Understands dynamic reassignment; needed correction that `var` infers a fixed compile-time type. |
| Boxing/unboxing | Needs reinforcement | Understands boxing makes a copy after explanation; missed exact-type unboxing behavior and integrated trace. |
| Nullable values | Not assessed | Must assess `??`, `Value`, and `GetValueOrDefault()`. |
| Execution pipeline | Not assessed | User objected to memorization-style question; revisit through practical runtime/debugging scenarios. |

**Day 1: In progress — not complete.** Verify all scheduled foundations and the practical code-tracing checkpoint.

**Day 2: In progress — not complete.** Finish nullable values, `in`, boxing/unboxing, and produce annotated traces/comparison table.

**Next session starts with:** nullable-values check, `in` parameter check, and integer-division debugging question. Do not mark days complete based on discussion alone.

## Day 3 — OOP theory and mixed assessment (31 Oct 2026)

### Status (track dimensions separately)
- **Theory complete:** Yes — planned Day 3 topics covered: inheritance/polymorphism edge cases, abstract/virtual/sealed, constructors and initialization order, explicit/default interface implementations, ISP, composition, DI, and retry policy design.
- **Assessment complete:** Yes — 10 questions completed.
- **Practice complete:** Partial — Notification Delivery System assignment accepted as conceptually complete; executable code and tests were not run or verified.
- **Mastery demonstrated:** Developing — targeted revision needed; do not mark every topic mastered based on exposure.

### Mixed assessment — 22.5/30 (75%)
Correction: the previous chat response mistakenly stated 24.5/30. The itemized scores sum to 22.5/30.

| Topic | Score | Evidence / next action |
|---|---:|---|
| Encapsulation and invariants | 2/3 | Identified missing insufficient-funds check and public setter; revisit non-positive amounts and private setter. |
| Constructor initialization order | 3/3 | Correctly traced derived field initializer before base constructor virtual call. |
| `new` vs `override` | 1/3 | Predicted Child for a Base reference; correct result Parent. Highest-priority revision. |
| Explicit interface implementation | 2/3 | Identified concrete-reference call failure; refine reason: explicit members are callable through interface references. |
| Retry policy design | 2/3 | Separate policy config from retry mechanism; handler executes with supplied policy. |
| Abstract class vs interface | 1.5/3 | Interface alone missed shared implementation; consider interface contract plus abstract base or composition. |
| `readonly` reference types | 3/3 | Correctly distinguished mutation of referenced object from field reassignment. |
| Interface Segregation Principle | 2/3 | Correctly proposed separation; strengthen explanation of focused capabilities. |
| Constructor chaining | 3/3 | Correctly identified missing parameterless base constructor and need for `base(args)`. |
| Dependency Inversion Principle | 3/3 | Correctly identified concrete construction, tight coupling, and testability problem. |

### Strengths
- Constructor ordering and virtual dispatch during construction.
- `readonly` reference semantics.
- Constructor chaining.
- DIP and testability reasoning.
- Core explicit-interface usage.

### Revision queue
1. **High priority:** method hiding vs overriding, virtual slots, compile-time reference type vs runtime dispatch.
2. Abstract class vs interface vs composition when shared behavior and a common contract coexist.
3. RetryPolicy (configuration) vs RetryHandler (execution mechanism).
4. Quick recall: explicit interface implementation and ISP.

### Next session
Short targeted revision on items 1–3, then continue to Day 4. Avoid repeating the full Day 3 syllabus.

## Day 4 — started 1 November 2026

- Generic classes, type safety versus `object`, boxing motivation, generic methods,
  and type inference were introduced.
- First `Box<int>` versus `Box<string>` exercise is unanswered; **no Day 4 mastery
  score is assigned**.
- Constraints, CLR internals, delegates, events, exceptions, collections, LINQ,
  executable component/tests, and mixed assessment remain pending.
- Resume the exact prompt in [current state](current-state.md), then rotate Day 3
  and Day 1/2 weaknesses through bounded recall.
- Historical explicit-interface feedback needs care: interface calls are individually
  valid, but a complete snippet containing invalid `n.Send()` does not compile or
  execute as a whole. Preserve the original learner answer and 2/3 score; record
  this assistant correction separately rather than changing learner evidence.