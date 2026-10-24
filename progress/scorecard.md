# Progress Scorecard — C# OOP and Memory

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
