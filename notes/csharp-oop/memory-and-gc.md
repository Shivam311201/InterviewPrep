# C# Object References, Managed Memory, and Garbage Collection

> Interview-prep notes compiled from our lesson. These are conceptual models; exact memory placement and GC behavior can vary with runtime/JIT optimizations and GC mode.

## 1. Classes, objects, variables, and references

A **class** defines a type and its members. An **object** is an instance of a class. A variable whose type is a class usually stores a **reference** to an object, rather than containing the entire object inline.

```csharp
class BankAccount
{
    public decimal Balance;
}

BankAccount a = new BankAccount();
a.Balance = 100m;

BankAccount b = a;
b.Balance = 500m;

// Both a.Balance and b.Balance are 500m.
```

The assignment `b = a` copies the reference value. It does not clone the object. Both variables refer to the same object, so mutation through either reference is visible through the other.

### Mutation versus reassignment

```csharp
static void Process(BankAccount account)
{
    account.Balance = 900m;      // Mutates the shared object.
    account = new BankAccount(); // Reassigns only this local parameter.
    account.Balance = 200m;
}

BankAccount result = new BankAccount();
result.Balance = 100m;
Process(result);
Console.WriteLine(result.Balance); // 900
```

C# passes parameters by value by default. For a class parameter, the copied value is the reference. Therefore, the method can mutate the referenced object, but assigning a different reference to the local parameter does not reassign the caller's variable.

With `ref`, the method can reassign the caller's variable:

```csharp
static void Replace(ref BankAccount account)
{
    account = new BankAccount();
    account.Balance = 200m;
}
```

### Aliasing and reassignment

```csharp
BankAccount a = new BankAccount();
BankAccount b = new BankAccount();
a.Balance = 100m;
b.Balance = 500m;

b = a;
b.Balance = 700m;

Console.WriteLine(a.Balance); // 700
Console.WriteLine(b.Balance); // 700
```

Two objects were initially allocated. After `b = a`, both variables reference the first object; the second object may become eligible for collection if no other references reach it.

## 2. Stack, heap, and references

A useful conceptual model:

- **Stack/thread execution state:** method-call frames, parameters, and local state. The JIT may keep values in registers or optimize locals away, so not every local necessarily occupies a physical stack slot.
- **Managed heap:** memory where managed objects are generally allocated and tracked by the .NET GC.
- **Reference:** a value that identifies/references an object. A local reference may be stored in a stack frame or a register; the object it refers to is typically on the managed heap.

```csharp
static void Main()
{
    int x = 10;
    BankAccount account = new BankAccount();
    account.Balance = 500m;
}
```

Conceptually, the local value `x` and the local reference `account` are part of Main's execution state; the `BankAccount` object is on the managed heap.

**Do not memorize “value types are always on the stack and reference types are always on the heap.”** Value-type fields can be embedded inside heap-allocated objects, and actual placement depends on context and optimizations. For example, an `int Age` field in a heap-allocated `Employee` object is stored as part of that object.

When a method returns, its execution frame ends. An object it created can remain alive if a reference was returned or another live root/object still reaches it. Otherwise it may become eligible for GC. Eligibility does not mean immediate collection.

## 3. Reachability, GC roots, and object graphs

The .NET GC determines liveness by tracing references from **GC roots**. Root categories include active execution state (live references in stacks/registers), static references, and runtime/interop handles. Exact root details depend on runtime implementation.

Reachability is **transitive**:

```text
GC root (savedParent)
        |
        v
      Parent ------> Child
```

If the root reaches Parent and Parent references Child, both objects are reachable. Child does not need a direct reference from a root.

If `savedParent = null` and there are no other paths from any root to either object, both Parent and Child become eligible for collection—even if they reference each other. Cycles are collectible when the cycle is disconnected from all roots.

### Static references and managed memory leaks

```csharp
static List<Request> Cache = new();

Cache.Add(request);
```

If a static list retains a request indefinitely, the request remains reachable and cannot be reclaimed by GC, even if the application no longer logically needs it. This is a common form of managed memory leak: memory is retained by unintended live references, not necessarily by a failure of the GC.

Removing a reference (for example, setting a field to null or removing an item from a list) can make an object eligible for collection, but does not force a collection.

## 4. Garbage collection: what it does

At a high level, a collection:
1. Identifies live objects by tracing from roots and accounting for relevant references.
2. Determines which objects in the collection scope are unreachable.
3. Reclaims memory occupied by unreachable objects.
4. May compact memory by moving surviving objects and updating references.
5. May promote surviving objects to an older generation.

The GC is nondeterministic from application code's point of view: becoming unreachable does not mean the object is collected immediately.

### Managed heap versus process memory

After a collection, .NET may keep committed/reserved heap memory for reuse rather than immediately returning it to the operating system. Consequently, process working set or memory metrics may not fall immediately after objects are reclaimed.

Calling `GC.Collect()` is not a general memory-leak fix and does not guarantee that process memory decreases. For suspected memory problems, first examine allocation rate, GC/managed heap metrics, heap dumps, and object retention/reachability. Also consider native/unmanaged allocations and process memory limits.

## 5. Dispose versus garbage collection

`Dispose()` is for deterministic cleanup of resources such as file handles, sockets, and other disposable resources. It is not the same as collecting the managed object.

```csharp
using var stream = File.OpenRead("data.txt");
// Use stream here.
```

Disposing a FileStream releases its underlying resources according to its contract, but the FileStream object itself may remain in managed memory until it becomes unreachable and a GC later reclaims it. Setting a reference to null does not call `Dispose()`. The GC does not promise to call `Dispose()` at the moment an object becomes unreachable; use `using`/try-finally or explicit disposal for deterministic cleanup.

## 6. Generational GC: Gen 0, Gen 1, Gen 2

The generational hypothesis is that many objects die young. The GC takes advantage of this by collecting young generations frequently and collecting a broader portion of the heap less frequently.

| Generation | Role | Typical relative frequency/cost |
|---|---|---|
| Gen 0 | New, short-lived objects | Most frequent; usually cheapest |
| Gen 1 | Buffer/intermediate generation for survivors | Less frequent than Gen 0 |
| Gen 2 | Longer-lived objects | Less frequent; typically broader and more expensive |

New small objects are generally allocated in Gen 0. Objects that survive collections may be promoted to older generations. Survival does **not** guarantee that an object will eventually reach Gen 2; it can become unreachable and be collected later.

Typical collection scopes:
- **Gen 0 collection:** primarily collects Gen 0.
- **Gen 1 collection:** collects Gen 0 and Gen 1.
- **Gen 2 collection:** collects Gen 0, Gen 1, and Gen 2; commonly described as a full-generation collection.

These are the normal generational scopes, not a fixed schedule or a promise about every runtime event. GC timing depends on allocation budgets, allocation patterns, memory pressure, and runtime configuration. There is no fixed timer such as “Gen 0 every five seconds.”

### Why this is efficient

For a service creating many temporary request objects, most may become unreachable quickly. Frequent Gen 0 collections can reclaim many of them without repeatedly examining the entire heap. Longer-lived objects can be retained in older generations and need not be revisited as often.

### Older objects referencing younger objects

Example: a reachable Gen 2 Parent references a Gen 0 Child. Child is reachable transitively and must survive a Gen 0 collection, even though it has no direct reference from a GC root.

The GC generally avoids fully scanning every older object during each young-generation collection. .NET uses a **write barrier** and tracking structures such as a **card table** to remember relevant older-to-younger references. During a young collection, it accounts for these references so it does not mistakenly reclaim a live young object.

A Gen 0 collection does not mean older generations can be ignored in every respect; references from older objects into the collection scope must be accounted for.

### Large Object Heap (LOH) and background collection

Large objects are generally allocated on the Large Object Heap (LOH), which is normally collected as part of Gen 2 collections. Large allocations can therefore affect GC behavior even when an application does not allocate many small objects.

Depending on GC mode and circumstances, .NET can perform background Gen 2 collections, allowing managed threads to run during much of the collection. Some phases still require pauses. Do not assume every Gen 2 collection is one continuous stop-the-world pause.

### Generational collection does not mean a different fundamental algorithm

The core ideas—tracing reachability and reclaiming unreachable objects—are broadly similar. The main difference is the scope being collected and the bookkeeping needed for references crossing generation boundaries.

## 7. Interview-ready explanations

**Why are generational GCs effective?**  
Most objects are short-lived. Collecting Gen 0 frequently reclaims many dead objects cheaply, while longer-lived survivors are promoted and the runtime can collect older generations less often.

**Why must a Gen 0 collection account for references from Gen 2?**  
A reachable Gen 2 object may reference a Gen 0 object. Reachability is transitive, so that young object must survive. The runtime tracks relevant older-to-younger references, avoiding a full scan of all older objects on every young collection.

**Does setting a reference to null immediately free memory?**  
No. It removes that reference. If no other roots or reachable objects can reach the target, the object becomes eligible for GC, but collection is nondeterministic.

**Why might process memory not decrease after GC?**  
The runtime may retain heap memory for reuse, and process memory includes more than live managed objects. Reclaimed objects and OS-visible working set are different metrics.

**Does Dispose destroy the object?**  
No. Dispose deterministically releases resources as defined by the type. GC separately reclaims managed memory when the object is no longer reachable.

## 8. Common mistakes to avoid

- “Every class object is immediately destroyed when its last variable goes out of scope.” — Incorrect; it becomes eligible for GC when unreachable, and collection timing is nondeterministic.
- “GC only checks whether an object is directly referenced by a root.” — Incorrect; it traces transitively through object graphs.
- “Cycles can never be collected.” — Incorrect; unreachable cycles can be collected.
- “Gen 0 collection can ignore older generations entirely.” — Incorrect; relevant older-to-younger references must be accounted for.
- “Every object that survives Gen 0 must eventually reach Gen 2.” — Incorrect.
- “Value types are always on the stack.” — Incorrect.
- “Dispose and GC are the same thing.” — Incorrect.
- “Calling GC.Collect guarantees process memory immediately drops.” — Incorrect.
