# SWE interview assessment bank — prompts only

**Added:** 1 November 2026. These are original practice prompts, not completed
attempts or copied textbook solutions. Use the [readiness contract](../study-plan/swe-interview-readiness-contract.md).
Every syllabus/book topic also needs generated variants; this bank is not exhaustive.
Save actual answers, hints, scores, corrections, lab results, and delayed retests
in dated session/assessment records. Do not reveal solutions before an attempt.

## OOP / C# — family OOP

- **OO-Q1 (C1):** Implement BankAccount with constructor/deposit/withdrawal
  invariants. Test negative/zero amounts and an overdraft. After a rejected call,
  what must remain unchanged? Why is private access not per-instance isolation?
- **OO-Q2 (C3):** Construct a base/derived example using `virtual`, `override`,
  and `new`. Predict each base/derived/interface call. Separate compilation
  failure of the whole snippet from valid individual statements.
- **OO-Q3 (C3):** Implement a value object used as a dictionary key. Define
  equality/hash semantics and demonstrate what happens if key state is mutable.
- **OO-Q4 (C2):** Write a generic component with one meaningful constraint.
  Explain type identity, `object` storage/boxing, variance, and invalid assignments.
- **OO-Q5 (C2):** An event subscriber is retained after its owner should stop.
  Identify ownership and unsubscribe behavior. Test multiple subscribers and a
  failing handler without hiding failures.
- **OO-Q6 (C2):** Trace a LINQ query with a side effect and repeated enumeration.
  Change the source before enumeration. Explain when execution occurs and how
  to avoid accidental repeated work without claiming materialization is always best.
- **OO-Q7 (C4):** Implement cancellable async work with a bounded concurrency
  limit. Show permit/resource release when a call throws or is cancelled.
- **OO-Q8 (C1/C4):** Explain `ref`/`out`/`in`, nullable values, boxing, disposal
  and GC using a small combined trace. Identify compile-time versus runtime errors.
- **OO-Q9 (L1/L2):** Refactor a tightly coupled service with a shared behavior
  requirement. Compare interface plus base class with composition and DI; add
  tests without an unnecessary inheritance/pattern hierarchy.
- **OO-Q10 (BX-OOP-1):** Implement a small metadata-driven serializer or
  validator. Explain reflection/attributes, API/version boundaries and limitations;
  do not silently invoke arbitrary members or suppress invalid-input errors.

## Operating systems / synchronization — family OS

- **OS-Q1 (O1):** Given arrivals, burst times, a quantum, and a tie policy,
  implement FCFS/SJF/SRTF/RR. Compute response/wait/turnaround and an idle interval
  independently before comparing simulator output.
- **OS-Q2 (O1):** Extend a workload with I/O and priority aging. Explain MLFQ
  accounting and starvation. Which assumptions differ from a real scheduler?
- **OS-Q3 (O2):** Translate a virtual address using page/offset and permissions.
  Distinguish TLB miss, nonresident-page fault, and invalid access. Compare page sizes.
- **OS-Q4 (O2):** Implement FIFO/LRU replacement; compare with an optimal oracle
  trace and clock approximation. Explain locality, dirty pages, fragmentation and thrashing.
- **OS-Q5 (O3):** Implement a finite-buffer producer/consumer with multiple
  producers and consumers. State safety/wait predicates, shutdown behavior, and
  an interleaving that defeats an incorrect `if`-based wait.
- **OS-Q6 (O3):** Build a reusable barrier or rendezvous from the book's
  primitives. Explain why it survives repeated rounds and how a naïve version deadlocks.
- **OS-Q7 (O3):** Solve readers-writers and dining philosophers independently.
  Distinguish deadlock freedom from starvation freedom; state scheduling/fairness
  assumptions rather than treating a stress test as proof.
- **OS-Q8 (O4):** A process successfully writes a file but crashes before the
  intended durable update completes. Explain handles, buffering, flush/durability,
  metadata/data ordering, journaling and checksums. Demonstrate a toy recovery trace.
- **OS-Q9 (O4):** Compare disk-seek scheduling, RAID striping/mirroring/parity,
  file layout/locality, and a log-structured layout under random reads and append writes.
- **OS-Q10 (BX-SYNC-1 through 7):** For each named book puzzle, first identify
  resources, ordering, exclusion and progress invariants. Solve before hints, give
  a violating interleaving for a plausible bad solution, and test a changed constraint.
- **OS-Q11 (BX-OS-3):** Compare the supplied NFS/AFS case studies for caching,
  invalidation, server crash and ambiguous retries. Which historical assumptions
  would you verify before discussing a current implementation?

## DBMS — family DBMS

- **DB-Q1 (D1):** Model customers/orders/items with keys and constraints. Seed
  unmatched rows, NULLs and duplicate values. Execute inner/outer joins and aggregates
  and explain how filtering placement changes the result.
- **DB-Q2 (D1):** Find each customer's latest order and top-k items with a
  CTE/window or equivalent query. Define deterministic tie handling and NULL semantics.
- **DB-Q3 (D1):** Derive candidate keys from functional dependencies; normalize
  a flawed schema through 3NF/BCNF. Discuss lossless/dependency-preserving decomposition
  and a justified denormalization.
- **DB-Q4 (D2):** Choose composite/covering indexes for two query patterns.
  Execute EXPLAIN/ANALYZE before/after on a fixture with skew. Distinguish estimated
  cost, actual work, storage/write overhead and an engine's index rules.
- **DB-Q5 (D2):** Compare nested-loop/hash/merge joins and identify a cardinality
  estimation mistake. What evidence would you collect before adding an index?
- **DB-Q6 (D3):** Execute a two-session schedule under named isolation settings.
  Reproduce nonrepeatable read and a write-skew/serialization case. Explain the
  SQL-standard model separately from PostgreSQL behavior.
- **DB-Q7 (D3):** Compare atomic UPDATE, pessimistic locking and optimistic
  version checks for a contested resource. Reproduce or trace a deadlock and
  implement bounded retry for an appropriate transaction error.
- **DB-Q8 (D4):** Explain WAL, undo/redo/checkpoint concepts and rollback using
  an explicit crash timeline. Distinguish backup/restore, replication and durability.
- **DB-Q9 (D2/D4):** Implement stable keyset pagination and duplicate-safe
  business insertion. Test equal sort values, concurrent inserts and unique constraints.
- **DB-Q10 (D4):** Commit a business change plus outbox entry atomically; simulate
  failure before/after publish and redelivery. What remains outside the local transaction?
- **DB-Q11 (BX-DB-3):** Compare distributed join plans, partition placement and
  transaction coordination. Distinguish two-phase locking from two-phase commit
  and discuss coordinator failure.
- **DB-Q12 (BX-DB-1/2/4/5):** For every remaining chapter, write an original
  query/model/index/processing exercise and a limitation/failure comparison. Do not
  count a chapter complete from a slide heading or generic NoSQL answer.

## Low-level design — family LLD

- **LL-Q1 (L1):** Clarify parking-lot/library requirements, state assumptions,
  model invariants and implement the core flows in C#. Include negative/boundary tests.
- **LL-Q2 (L1):** Add a new payment/notification policy without modifying unrelated
  clients. Explain which abstractions help and which would be premature.
- **LL-Q3 (L2):** Design and implement an in-memory cache or rate limiter with
  explicit eviction/time/concurrency semantics. Use a fake clock where relevant.
- **LL-Q4 (L2):** Extend an elevator/task scheduler for a changed requirement.
  Identify state transitions, failure/cancellation and resource ownership.
- **LL-Q5 (L1/L2):** Run an unseen 60-minute LLD mock. Requirements first, then
  domain/API/core flow, tests and extension. Implement and verify the core separately
  if the mock itself uses pseudocode.

## High-level / distributed design — family HLD

- **HL-Q1 (H0/H1):** Before drawing a system, clarify requirements and estimate
  QPS/peak/storage/bandwidth with units. Explain one assumption whose change
  would invalidate your architecture.
- **HL-Q2 (H1):** Design a URL shortener. Defend identifier/collision strategy,
  read/write APIs, cache consistency, data model, abuse limits and an outage path.
- **HL-Q3 (H2):** Evolve it for a regional failure and 10x skewed traffic.
  State RPO/RTO, data ownership, failover/fencing, replica lag and recovery.
- **HL-Q4 (H3):** Design a feed/search/notification system. Compare push/pull,
  hot-key handling, freshness, ranking/index state, invalidation and rebuild.
- **HL-Q5 (H3):** Design ingestion or upload/processing. Estimate fan-out and
  retained data; define backpressure, batching, retries, deduplication and expiry.
- **HL-Q6 (D4/H4):** A worker times out after a possible side effect. Explain
  acknowledgement ambiguity, idempotency scope, outbox/inbox, compensation limits,
  and why a shared ID alone does not guarantee cross-provider exactly-once delivery.
- **HL-Q7 (H2/H4):** Diagnose rising p99 latency with saturated DB connections,
  GC pressure and retry growth. Choose discriminating measurements before fixes;
  propose containment, recovery and user-impact telemetry.
- **HL-Q8 (H4):** Give two plausible architectures for an unseen integrated case.
  Implement/test one local critical component; explain why that experiment is
  narrower than proving full-system scale and availability.

## Networking supporting questions — family CN

- **CN-Q1:** Trace DNS, routing, TCP/TLS/HTTP and service/DB connection pooling.
  Separate protocol layers and identify where latency or resource exhaustion occurs.
- **CN-Q2:** A response is lost after a write. Compare safe retry for idempotent
  versus non-idempotent APIs; define timeouts and bounded retries.
- **CN-Q3:** Explain flow versus congestion control, loss/retransmission, UDP,
  HTTP version trade-offs and pooling under a concrete workload.
- **CN-Q4:** Diagnose certificate, DNS-cache or exhausted-port symptoms using
  evidence, not a list of protocol definitions.

## Weekly round selection

At Days 6/13/20/27/34/41/48/55/62/69/76/83/90/97/104/111, choose a
practical task tied to the current lab, 4–6 short prompts, and a changing-requirement
or failure follow-up. Include old-topic variants after those topics are taught.
Keep written solutions and grading notes in a separate learner-attempt record.
Use the readiness contract's rubric, critical-correctness gate and delayed retest;
the presence of a prompt in this file is not evidence of assessment completion.
