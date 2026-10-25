# Session — 2026-10-25 — C# Day 1/Day 2 Assessment

## Session outcome
Session paused at the learner's request. **Day 1 and Day 2 are NOT marked complete.** Continue with the unfinished checks below before progressing the schedule.

## Learner preference
- Prefers practical SWE interview assessment over low-value memorization questions. When the learner pushes back on a question, clarify its practical relevance and adapt toward code tracing, debugging, language behavior, and engineering scenarios.
- Wants the complete remaining question set when requested, rather than an indefinitely extended one-at-a-time quiz.
- Distinguish mastery from mere exposure; correct answers need adequate reasoning where relevant.

## Day 1 — C# foundations assessment

### Questions already answered in the prior turn sequence
1. Pass-by-value with `int`: correctly predicted `10`; understands that the parameter receives a copy.
2. Reference aliasing/mutation/reassignment: correctly predicted `Bob`, `Charlie`; understands shared object mutation vs. reassignment.
3. Overload selection with `object value = "hello"`: initially answered `string`; corrected to `object`. Needs reinforcement that overload resolution uses the argument's compile-time type.
4. `Show(null)` overloads `string` vs `object`: initially answered `object`; corrected to `string`, because string is more specific.
5. `Show(null)` overloads `string` vs `StringBuilder`: correctly identified ambiguity / compile-time error.
6. Optional-parameter overload vs. exact one-parameter overload: correctly selected the one-parameter overload.
7. `int` argument to `long` vs `double`: correctly selected `long`.
8. `var x = "hello"`: initially gave the wrong reason; correction established that `var` infers a fixed compile-time `string` type, so assigning `123` fails.
9. `dynamic` reassignment: correctly predicted value `123`; runtime type name is `Int32`, not “Integer.”
10. Boxing `int` into `object`: initially predicted second value incorrectly; correction established both outputs are `10`, because boxing stores a copy.
11. Unboxing boxed `long` as `int`: did not identify runtime exception; needs practice distinguishing unboxing from numeric conversion.
12. Scope/shadowing: correctly suspected a compile issue in a different nested-local example, but was given an incorrect explanation in the prior assistant turn; clarify carefully in future review. The valid class-field/local example correctly prints `5`, then `2`.
13. Return-type-only overload: correctly identified compile-time error.
14. Named arguments: correctly predicted `int-int`.
15. `out`: correctly predicted `42`.
16. `ref`: correctly predicted `15`.

### Consolidated submitted assessment
- Types/expressions: identified types but missed integer division. For `int a=5; double b=a/2; double c=(double)a/2;`, correct values are `a=5`, `b=2.0`, `c=2.5`.
- Method overload return-type-only conflict: correct.
- Scope sample with class field `x=1`, local `x=2`, inner `y=x+3`: correctly predicted `5`, `2`.
- Compile-time vs runtime: basic idea present; needs sharper explanation of static type and overload resolution.
- Value-type assignment: correct `10`, `11`.
- Reference aliasing and reassignment: correct `2`, `3`.
- Passing a reference-type argument by value: correct output `7`; explanation needs ensure distinction between copying a reference and cloning an object.
- `ref`/ `out`/ `in`: knows caller initialization differs for `ref` vs `out`; `in` and full read/write semantics unverified.
- Nullable values: unanswered.
- Boxing/unboxing: identified boxed `long` cannot be directly unboxed as `int`; did not evaluate all cases.
- Integrated challenge: answered `5,5,5`; correct output is `5,3,3`, because `object o=x` boxes the value `3` before `x` is changed.

## Corrective clarification made after grading
- `object` is a reference type. Boxing a value type such as `int` creates a separate boxed object holding a copy of the value.
- Assigning a reference-type variable to `object` copies the reference, not the referenced object.
- A boxed numeric value must be unboxed to its actual underlying type first; a numeric conversion can then be performed separately.

## Current mastery evidence
**Demonstrated at a basic level:** value copying; aliasing; mutation vs. reassignment; basic pass-by-value; basic `ref` and `out`; method overload signature constraints; some overload selection cases.

**Needs reinforcement:** compile-time type vs runtime type; integer vs floating-point division; `var` vs `dynamic`; boxed value copy; unboxing exact type; nullable values; `in` parameters; practical code-trace reasoning across combined concepts.

## Remaining work — must resume first next session
1. Complete targeted checks:
   - Nullable values: `int? x=null; int y=x??5;`, `GetValueOrDefault()`, and `Value` behavior.
   - `in` parameter: assignment restrictions and caller/method semantics.
   - Practical debugging: integer division in a percentage calculation.
2. Verify remaining Day 1 syllabus in a practical format: execution/compiler/runtime concepts at interview-relevant depth; variables/types/expressions; scope; methods/overloading. Do not over-index on memorizing the pipeline; use code, debugging, and follow-up relevance.
3. Finish Day 2 topics: value/reference assignment, aliasing, mutation/reassignment, default pass-by-value, `ref`/`out`/`in`, nullable values, boxing/unboxing. Require annotated traces or small runnable experiments.
4. Produce the Day 2 deliverable: compact comparison table and annotated code traces.
5. Reassess the identified mistakes, then mark each day complete only if its syllabus and practical checkpoint are demonstrated.

## Status
- Day 1: **In progress — not complete**
- Day 2: **In progress — not complete**
- Next starting point: the three targeted checks above, then the remaining Day 1/Day 2 checkpoint gaps.
