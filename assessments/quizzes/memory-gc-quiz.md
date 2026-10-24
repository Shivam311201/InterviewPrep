# C# Memory and GC — Quiz Log

This file records questions asked during the lesson, the user's responses where available, and the correct answer with explanation. Where the user's reasoning was blank or not provided, that is noted rather than inferred.

## Q1. Returning a newly created object

**Prompt:** If `CreateAccount()` creates and returns a `BankAccount`, what happens when the method returns?

**User answer:** Chose B; reasoning suggested the reference would be put on the stack after the method returns.

**Evaluation:** Correct option, but refine the explanation. The returned reference is received by the caller and can be stored in a caller variable. It is not moved to the stack by a special GC rule. The object remains alive as long as it is reachable.

## Q2. Passing a class reference by value

```csharp
static void ChangeBalance(BankAccount account)
{
    account.Balance = 900m;
    account = new BankAccount();
    account.Balance = 200m;
}

BankAccount result = new BankAccount();
result.Balance = 100m;
ChangeBalance(result);
Console.WriteLine(result.Balance);
```

**User answer:** 900.

**Correct:** `900`. The parameter receives a copy of the reference. Mutating the shared object is visible to the caller; reassigning the local parameter does not change `result`.

## Q3. Passing by `ref`

**Prompt:** What changes if the method parameter is `ref BankAccount account` and the method assigns it a new object with Balance 200?

**User answer:** Correctly predicted output 200.

**Correct:** With `ref`, the method aliases the caller's variable and can replace the reference stored in that variable.

## Q4. Aliasing and reassignment

```csharp
BankAccount a = new BankAccount();
BankAccount b = new BankAccount();
a.Balance = 100m;
b.Balance = 500m;
b = a;
b.Balance = 700m;

Console.WriteLine(a.Balance);
Console.WriteLine(b.Balance);
```

**User answer:** Both outputs 700; two objects were created initially.

**Correct:** Both outputs are 700. `b = a` copies the reference, so both variables refer to the first object. The second object may become eligible for collection if no other reference reaches it.

## Q5. Both references removed

```csharp
BankAccount a = new BankAccount();
BankAccount b = a;
a = null;
b = null;
```

**User answer:** B — eligible for GC, not immediately collected. Reasoning was not supplied.

**Correct:** The object becomes eligible for collection if no other root or reachable object references it. GC timing is nondeterministic.

## Q6. Static field retains an object

**Prompt:** A static field `savedAccount` points to an account with Balance 100. What does the static field retain?

**User answer:** Correctly described that the saved reference still reaches the object.

**Precision note:** Say “the field holds a reference to the object,” rather than saying it necessarily stores a raw memory address.

## Q7. Clearing a static field

**Prompt:** What happens after `savedAccount = null` if no other references exist?

**User's initial misconception:** Suggested `Dispose` is called when the reference is set to null.

**Correction:** Setting a reference to null does not call `Dispose()`. The object becomes eligible for GC; collection is not immediate. Explicit disposal is a separate resource-lifecycle operation.

## Q8. FileStream and Dispose

**Prompt:** What happens when a FileStream is disposed?

**User initially:** Said it depends on implementation of Dispose.

**Clarification:** For `FileStream`, its documented disposal behavior releases the underlying file resources. The object itself can remain in managed memory until GC later reclaims it.

**User follow-up:** Correctly selected that the disposed object can still exist while the file handle is released.

## Q9. Static list and memory leaks

**Prompt:** A static list retains request objects long after they are logically needed. Can GC reclaim those request objects?

**User answer:** Correctly explained that the static list keeps them reachable.

**Correct:** Not while the list continues to reference them (assuming that static list is itself reachable). This can cause a managed memory leak through unintended retention.

## Q10. Does GC immediately return memory to the OS?

**Prompt:** After objects become unreachable, does GC immediately remove them and return memory to the operating system?

**User answer:** Correctly said collection is not immediate, and later understood that the runtime may retain heap memory for reuse.

**Correct:** Object reclamation and process working-set reduction are different. The runtime may keep heap memory for future allocations.

## Q11. Does `GC.Collect()` guarantee lower process memory?

**User answer:** Correctly said no, and chose to investigate reachable objects and managed heap/allocation metrics first.

**Correct:** Explicit collection does not guarantee process memory will drop. Diagnose object retention, allocation rate, managed heap, and native memory as appropriate.

## Q12. Why generations?

**Prompt:** Why does .NET use generations?

**User first answer:** Did not know Gen 0/1/2 yet.

**Lesson:** Gen 0 contains young objects and is collected most often; survivors may be promoted to Gen 1 and Gen 2. The generational hypothesis is that most objects die young.

## Q13. Can an unreachable Gen 2 object be reclaimed?

**Prompt:** An object in Gen 2 becomes unreachable. Can it be collected?

**User answer:** B — yes, it can be reclaimed.

**Correct:** Yes. Generation indicates collection history/age, not permanent survival.

## Q14. What does a Gen 0 collection consider?

**Prompt:** A service allocates many short-lived objects. Gen 0 fills up, so .NET performs a Gen 0 collection. Which statement is most accurate?

A. The GC collects only unreachable Gen 0 objects, and every object in Gen 1 and Gen 2 is ignored completely.  
B. The GC primarily collects Gen 0, but it must account for references from older generations into Gen 0.  
C. The GC always collects Gen 0, Gen 1, and Gen 2 together.  
D. Gen 0 objects cannot reference Gen 2 objects.

**User answer:** A.

**Correct answer:** B.

**Explanation:** Gen 0 is the primary collection target, but a reachable older object can reference a young object. The young object is reachable transitively and must survive. .NET uses a write barrier and tracking structures such as a card table to track relevant older-to-younger references. It does not need to fully scan every old object on every Gen 0 collection.

## Q15. Why are generational GCs efficient?

**Prompt:** A service allocates many short-lived objects and retains a small cache for hours. Why is a generational GC a good fit?

**User answer:** “bcz short lived can easilty be cleared in gen0 and those who survied can be promoted to 1 and 2 accordignly”

**Evaluation:** Correct. Interview-ready version: Most objects are short-lived, so frequent Gen 0 collections reclaim many dead objects cheaply. Survivors may be promoted to older generations, which can be collected less frequently. Survival does not guarantee an object eventually reaches Gen 2; it can become unreachable and be reclaimed later.

## Q16. Transitive reachability across generations

**Prompt:** A reachable Gen 2 `Parent` references a Gen 0 `Child`. Why can't the GC reclaim `Child` just because it has no direct reference from a GC root?

**User answer:** “because of transitive reference”

**Evaluation:** Correct core concept. Refined answer: `Parent` is reachable from a root, and `Parent` references `Child`, so `Child` is transitively reachable and must survive. The runtime tracks relevant older-to-younger references so it can account for this without fully scanning the old heap every young collection.

## Q17. Removing the root of an object graph

```text
GC root (savedParent)
        |
        v
      Parent ------> Child
```

**Prompt:** Set `savedParent = null`, with no other references to either object. What happens?

**User answer:** B — both become eligible for collection.

**Correct:** Both are unreachable from all roots and become eligible for collection, even though Parent references Child. Cycles are collectible when disconnected from roots. They are not necessarily collected immediately.

## Follow-up still to answer

**Question:** Suppose `Parent` is a Gen 2 object and `Child` is a Gen 0 object. `Parent` remains reachable from a GC root and references `Child`. During a Gen 0 collection, why can't the GC reclaim `Child` just because `Child` has no direct reference from a GC root?

**Expected core answer:** Because reachability is transitive: the root reaches Parent, and Parent reaches Child. The GC must preserve Child. The implementation detail is that .NET tracks relevant older-to-younger references using a write barrier and structures such as a card table.

## More practice questions (not yet answered)

1. Does setting a variable to `null` immediately run the GC? Why or why not?
2. Can two objects reference each other and still be collected? Explain using roots.
3. Why is “value types live on the stack and reference types live on the heap” an unsafe rule?
4. Why can process working-set memory remain high after a collection?
5. What is the difference between disposing a FileStream and collecting its managed object?
6. Why does Gen 0 collection generally happen more frequently than Gen 2 collection?
7. What problem would arise if a young-generation collection ignored all references from older generations?
8. What is the purpose of the write barrier/card table in generational GC?
9. Does every object that survives a Gen 0 collection eventually reach Gen 2?
10. A service's managed heap keeps growing. Name the first evidence you would gather before manually forcing GC.
