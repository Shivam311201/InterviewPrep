# 16-Week SWE Interview Preparation — Daily Schedule

**Companion to:** [16-week SWE interview roadmap](./16-week-swe-interview-roadmap.md)  
**Plan:** 6 study days/week; Day 7 is rest/light review. Target 10–12 hours/week is a planning estimate, not a cutoff. The day's syllabus is complete only when its required learning, practice, and checkpoint are done.  
**Scope:** C#/.NET, OOP, LLD, OS, DBMS, CN, distributed systems, HLD. DSA remains independent; AI/agentic topics are deferred.

## How to use this schedule

- Each day has a **primary syllabus**, a **required output**, and a **completion check**. Do not count a topic as complete merely because it was explained.
- Learner questions are welcome, including off-plan questions. Answer them properly. Then return to the exact unfinished daily checklist. Mark a detour as required prerequisite, useful extra, or deferred follow-up.
- Do not let a detour silently replace the day's planned topics. If it exposes a prerequisite gap, teach the prerequisite, then resume.
- Do not stop just because the estimated time elapsed. Continue until that day's syllabus and checkpoint are complete. If genuine fatigue makes useful learning impossible, record the unfinished items and resume them first next session—never mark them complete.
- Extra depth is encouraged, but the **minimum syllabus and deliverable remain protected**. If the day repeatedly exceeds reasonable limits, flag the scope issue explicitly; do not quietly drop later subjects.
- Ask one focused question at a time when interactive testing is useful. Let the learner answer before revealing the solution.
- Keep the roadmap sequence. Early OS/DBMS/CN sessions are introductions and interleaving, not permission to replace C#/OOP days. Week 5 is the dedicated OS deep dive.
- End every day by updating the session log, topic notes, mistake/revision queue, scorecard as warranted, and the next session's starting point in GitHub.

## Daily session template

1. **Recall (10–15 min):** due spaced-repetition prompts and previous mistakes.
2. **Teach:** first-principles explanation, one new term at a time, worked examples and internals.
3. **Apply:** code, trace, SQL, diagram, debugging, or design artifact.
4. **Interview drill:** ask questions and follow-ups; learner attempts before answers.
5. **Close:** run the completion check, record gaps, and schedule reviews for roughly Day 1, 2, 4, 8, 15, and 31.

Times are flexible. Completion is determined by evidence, not a timer.

---

# Phase I — Programming, OOP, and design foundations

## Week 1 — C# fundamentals, object model, runtime memory

### Day 1 — C# execution and language foundations
- **Syllabus:** source code → compiler → IL → JIT → CLR at interview depth; variables, types, expressions, scope, methods, overloads.
- **Practice:** trace small C# snippets; explain compile-time vs runtime behavior.
- **Required output:** runnable console examples plus notes defining each execution stage.
- **Completion check:** explain how a C# program reaches execution and predict several snippets without running them.

### Day 2 — Value/reference semantics and parameter passing
- **Syllabus:** value types, reference types, assignment, aliasing, mutation vs reassignment, pass-by-value, `ref`, `out`, `in`, nullable values, boxing/unboxing.
- **Practice:** trace parameter-passing and aliasing examples; write minimal experiments.
- **Required output:** annotated code traces and a compact comparison table.
- **Completion check:** predict output and explain why a copied reference is not a copied object.

### Day 3 — Interleaved OS: program, process, address space
- **Primary syllabus:** C# fields, properties, methods, access modifiers, object construction and initialization; reinforce value/reference semantics.
- **OS introduction only:** program vs process, executable vs running instance, what an address space means.
- **Practice:** draw a simple object-reference graph and a process-at-a-glance diagram.
- **Required output:** C# examples and short OS definitions in your own words.
- **Completion check:** distinguish the C# object model from the OS process model. Do not expand into scheduling or virtual-memory internals today.

### Day 4 — Managed memory, reachability, and GC
- **Syllabus:** managed heap, GC roots, object graphs, transitive reachability, cycles, generations 0/1/2, promotion, LOH/background GC at introductory level.
- **Practice:** mark reachable/unreachable objects in diagrams; explain when objects become eligible for collection.
- **Required output:** object-graph worksheet and a small C# allocation experiment.
- **Completion check:** explain why nulling one variable does not guarantee collection and why cycles alone do not prevent collection.

### Day 5 — Disposal, finalization, and interview drill
- **Syllabus:** deterministic cleanup, `IDisposable`, `using`, finalizers, managed vs unmanaged resources, SafeHandle concept; exceptions and `finally`.
- **Practice:** implement and review a disposable wrapper; oral drill on GC, disposal, parameter passing, and object lifetime.
- **Required output:** correct disposal example and mistake log.
- **Completion check:** explain why GC is not a substitute for disposing scarce external resources; answer the day's questions without relying on memorized slogans.

### Day 6 — Week 1 assessment and consolidation
- **Syllabus:** closed-book review of Days 1–5; revisit weak C# topics and the introductory OS concepts.
- **Practice:** code-tracing quiz, one small implementation task, explain GC roots and a disposal scenario aloud.
- **Required output:** quiz results, topic score evidence, and revision dates.
- **Completion check:** demonstrate the Week 1 checkpoint from the roadmap. Record gaps without blocking the next week's planned syllabus.

### Day 7 — Rest
Optional light flash recall only. No new syllabus.

## Week 2 — OOP depth, C# type system, process/thread basics

### Day 8 — OOP fundamentals and polymorphism
- **Syllabus:** encapsulation, abstraction, inheritance, polymorphism; interface vs abstract class; composition vs inheritance.
- **Practice:** model one small domain using an interface and a composed implementation.
- **Required output:** class diagram or code plus a justification of responsibilities.
- **Completion check:** explain what each OOP principle provides and what it does not guarantee.

### Day 9 — Dispatch, construction, equality
- **Syllabus:** virtual dispatch, override vs hide, overload resolution, constructor chaining/initialization, identity vs value equality, `Equals`/`GetHashCode`, records.
- **Practice:** predict dispatch and equality outcomes; fix a broken hash-based collection example.
- **Required output:** annotated snippets and equality contract notes.
- **Completion check:** explain why equal objects must have equal hash codes and distinguish compile-time overload choice from runtime virtual dispatch.

### Day 10 — Interleaved DBMS introduction
- **Primary syllabus:** C# generics, constraints, covariance/contravariance introduction, List/Dictionary/HashSet and their use cases.
- **DBMS introduction:** why databases exist; relational tables, schema, candidate/primary/foreign keys, integrity constraints.
- **Practice:** choose a collection for scenarios; sketch a relational schema.
- **Required output:** C# collection examples and a small schema.
- **Completion check:** justify collection choice and explain how keys protect data integrity.

### Day 11 — Iteration, deferred execution, exceptions
- **Syllabus:** IEnumerable/IEnumerator, deferred LINQ execution, multiple enumeration, mutation during enumeration, exception filters, rethrow semantics, finally/cleanup.
- **Practice:** trace a deferred query; debug exception/cleanup examples.
- **Required output:** examples showing when query execution occurs and how exceptions propagate.
- **Completion check:** predict side effects and explain safe cleanup under exceptions.

### Day 12 — Interleaved OS: process vs thread
- **Primary syllabus:** implement a small polymorphic model; revisit interface/abstract class/composition trade-offs and equality.
- **OS foundation:** process vs thread, user/kernel mode, context-switch motivation, thread stack, address-space isolation, system-call concept.
- **Practice:** draw process/thread diagrams and compare two processes with two threads in one process.
- **Required output:** working domain model plus annotated OS diagram.
- **Completion check:** explain what processes share or isolate and why a thread is not simply another process.

### Day 13 — Week 2 assessment
- **Syllabus:** OOP/type-system oral drill; DBMS keys/constraints; OS process/thread questions.
- **Practice:** design a small type hierarchy, debug an equality contract, answer overload/override questions, sketch a schema.
- **Required output:** assessment, corrections, updated scorecard.
- **Completion check:** explain each correction and identify one remaining gap per subject.

### Day 14 — Rest
Optional spaced repetition only.

## Week 3 — SOLID, testing, concurrency foundations

### Day 15 — SOLID and dependency boundaries
- **Syllabus:** SRP, OCP, LSP, ISP, DIP; cohesion/coupling; dependency injection vs inversion of control; overengineering pitfalls.
- **Practice:** refactor a tightly coupled service to inject a dependency.
- **Required output:** before/after design and tests.
- **Completion check:** justify each design change using requirements rather than naming principles alone.

### Day 16 — Testing and deterministic behavior
- **Syllabus:** unit vs integration tests; mocks, stubs, fakes; test seams; deterministic behavior; what not to mock.
- **Practice:** write tests for business logic and one failure case.
- **Required output:** tested small component and explanation of test boundaries.
- **Completion check:** explain what each test proves and what it does not prove.

### Day 17 — Interleaved CN: request path basics
- **Primary syllabus:** delegates, events, lambdas, closures, LINQ deferred execution and multiple enumeration.
- **CN introduction:** client/server, layers, packets, sockets, ports, DNS purpose.
- **Practice:** trace a closure and sketch a high-level client-to-server request.
- **Required output:** code trace and request-path diagram.
- **Completion check:** explain closure capture and the roles of DNS, ports, and sockets without going deep into TCP yet.

### Day 18 — Concurrency and synchronization
- **Syllabus:** race conditions, critical sections, locks/monitors, atomicity, Interlocked/volatile concepts, deadlock, starvation.
- **Practice:** diagnose a shared-counter race and a lock-order deadlock.
- **Required output:** corrected code or pseudocode plus interleaving trace.
- **Completion check:** identify the unsynchronized shared state and explain why the fix works.

### Day 19 — Interleaved DBMS: SQL foundations
- **Primary syllabus:** review testability, immutable state, DI lifetime and captive-dependency risks.
- **DBMS:** SELECT, WHERE, joins, GROUP BY, aggregates, NULL semantics, constraints.
- **Practice:** write queries against a small schema; explain NULL and duplicate behavior.
- **Required output:** query set with expected results and explanations.
- **Completion check:** produce correct joins/aggregations and explain why NULL comparisons need care.

### Day 20 — Week 3 assessment and integration
- **Syllabus:** SOLID critique, testing, concurrency, SQL, network-layer recall.
- **Practice:** refactor one example, write tests, diagnose one race, write SQL, explain a request path.
- **Required output:** assessment and mistake categories.
- **Completion check:** demonstrate the Week 3 checkpoint and schedule targeted reviews.

### Day 21 — Rest
Optional spaced repetition only.

## Week 4 — Patterns, async/await, first LLD assignment

### Day 22 — Pattern selection and object design
- **Syllabus:** Strategy, Factory, Builder, Adapter, Decorator, Observer, State, Command; intent, costs, and misuse.
- **Practice:** choose a pattern for a concrete changing requirement; compare against a simpler design.
- **Required output:** short design sketch and rationale.
- **Completion check:** explain why the chosen design is better for the requirement and name a downside.

### Day 23 — Async/await foundations
- **Syllabus:** Task, async/await, async I/O vs CPU-bound work, exception propagation, cancellation tokens, timeouts.
- **Practice:** trace async control flow; implement cancellation and timeout behavior.
- **Required output:** small async C# example with tests or trace.
- **Completion check:** explain why async does not automatically mean parallel execution.

### Day 24 — Interleaved OS/DBMS/CN recap
- **Primary syllabus:** thread safety, immutable data, lock granularity, concurrent collections, pattern review.
- **OS preview:** scheduling, synchronization primitives, deadlock handling and virtual memory concepts—introductory recap only; deep dive remains Week 5.
- **DBMS:** normalization motivation and functional dependencies introduction.
- **CN:** TCP vs UDP and basic HTTP request/response.
- **Required output:** comparison notes and one short diagram per interleaved topic.
- **Completion check:** give concise, accurate first-pass explanations; list questions for the later dedicated subject weeks.

### Day 25 — LLD assignment: requirements and model
- **Syllabus:** choose parking lot or library management; clarify requirements, actors, use cases, invariants, domain model, APIs, core flows.
- **Practice:** write requirements and class/sequence diagrams before coding.
- **Required output:** design artifact with assumptions and edge cases.
- **Completion check:** explain responsibilities and show how the model handles the core use cases.

### Day 26 — LLD implementation and testing
- **Syllabus:** implement core flows, error handling, tests, one justified pattern, extensibility boundaries.
- **Practice:** code the design; add negative and boundary tests.
- **Required output:** runnable code or detailed pseudocode plus tests.
- **Completion check:** demonstrate main flow and explain how tests cover important invariants.

### Day 27 — LLD mock and Phase I review
- **Syllabus:** 45–60 minute LLD walkthrough; async/concurrency follow-ups; C#/OOP review; short OS/DBMS/CN recall.
- **Required output:** scored review, open gaps, and next-week priorities.
- **Completion check:** explain the design under a changed requirement and record what must be revisited in Weeks 5–7.

### Day 28 — Rest
Optional spaced repetition only.

---

# Phase II — OS, DBMS, and networking foundations

## Week 5 — Dedicated OS deep dive

### Day 29 — Processes, system calls, and context switches
- **Syllabus:** process lifecycle, address spaces, user/kernel mode, system calls, context-switch causes/costs, process vs thread revisited.
- **Practice:** trace a system call and draw process/thread state transitions.
- **Required output:** annotated process model.
- **Completion check:** explain the difference between mode switch and context switch, and when each may occur.

### Day 30 — Scheduling algorithms and metrics
- **Syllabus:** scheduling goals; FCFS, SJF, SRTF, Round Robin, priority scheduling; response, waiting, turnaround, throughput, fairness.
- **Practice:** solve timeline problems and calculate metrics step by step.
- **Required output:** checked scheduling worksheet.
- **Completion check:** independently calculate every metric and verify averages against the schedule.

### Day 31 — Virtual memory and address translation
- **Syllabus:** virtual vs physical address, paging, page tables, TLB, page faults, locality, working set.
- **Practice:** trace a conceptual address translation and TLB hit/miss path.
- **Required output:** address-translation diagram and quiz.
- **Completion check:** explain each step without treating virtual addresses as physical RAM locations.

### Day 32 — Synchronization and deadlocks
- **Syllabus:** race conditions, atomicity, mutex/monitor, semaphore, condition waiting, deadlock's four conditions, prevention/avoidance/detection, starvation, priority inversion.
- **Practice:** analyze lock interleavings and safe/unsafe states; explain why safe state differs from “nobody is waiting.”
- **Required output:** corrected traces and comparison table.
- **Completion check:** distinguish the major synchronization primitives and reason through a deadlock scenario.

### Day 33 — OS resources, I/O, and C# connections
- **Syllabus:** file descriptors/handles, resource lifetime, I/O, thread pools and Task scheduling conceptually, how excess threads affect performance.
- **Practice:** diagnose a resource leak and explain a concurrent counter implementation.
- **Required output:** failure-analysis note linking OS behavior to C#.
- **Completion check:** connect OS scheduling/memory/resource concepts to application behavior.

### Day 34 — OS oral assessment and weak-area repair
- **Syllabus:** process/thread, scheduling, virtual memory, synchronization, deadlocks, resource lifetime.
- **Practice:** oral drill plus calculations and a concurrency exercise; review early OS exposure from Weeks 1–4.
- **Required output:** OS scorecard, corrected mistakes, spaced-revision queue.
- **Completion check:** demonstrate the Week 5 checkpoint. Do not extend OS indefinitely; carry unresolved gaps forward as scheduled reviews.

### Day 35 — Rest
Optional spaced repetition only.

## Week 6 — DBMS schema, indexes, transactions, recovery

### Day 36 — Relational model, keys, SQL semantics
- **Syllabus:** relations, schemas, keys, constraints, relational algebra intuition, joins, subqueries, CTEs, NULL and duplicates.
- **Practice:** write queries for a business schema and predict results.
- **Required output:** schema and query worksheet.
- **Completion check:** explain query semantics and produce correct results for boundary cases.

### Day 37 — Functional dependencies and normalization
- **Syllabus:** functional dependencies, update/insert/delete anomalies, 1NF/2NF/3NF/BCNF at interview depth, denormalization trade-offs.
- **Practice:** normalize a flawed schema and explain what each decomposition fixes.
- **Required output:** normalized schema with rationale.
- **Completion check:** identify anomalies and defend the chosen schema.

### Day 38 — Interleaved OS: storage and durability
- **Primary syllabus:** indexes, B-tree/B+ tree concepts, composite indexes, selectivity, covering indexes, write overhead.
- **OS connection:** I/O, memory, locks, fsync/durability at a conceptual level.
- **Practice:** choose indexes for sample query patterns.
- **Required output:** index recommendation table with read/write trade-offs.
- **Completion check:** explain why indexes accelerate some reads but add storage and write cost.

### Day 39 — Query execution and plans
- **Syllabus:** scan vs seek, cardinality estimates, nested-loop/hash/sort-merge joins, index use, query-plan basics.
- **Practice:** inspect simplified plans and improve a query/index choice.
- **Required output:** plan annotations and proposed optimization.
- **Completion check:** connect the proposed change to access pattern and expected work.

### Day 40 — Transactions, isolation, and concurrency control
- **Syllabus:** ACID, dirty/nonrepeatable/phantom reads, isolation levels, MVCC/locking, transaction schedules and deadlocks.
- **Practice:** trace two concurrent sessions and identify anomalies.
- **Required output:** transaction schedule worksheet.
- **Completion check:** explain which guarantees an isolation level provides and what it costs.

### Day 41 — Recovery and DBMS assessment
- **Syllabus:** WAL, logs, checkpoints, crash recovery, backups vs replication; OS connection; full DBMS review.
- **Practice:** oral drill, SQL practical, index choice, isolation scenario.
- **Required output:** DBMS scorecard and revision queue.
- **Completion check:** explain how durability survives a crash and pass the planned SQL/oral checkpoint.

### Day 42 — Rest
Optional spaced repetition only.

## Week 7 — Computer networks

### Day 43 — Layering, IP, routing, NAT
- **Syllabus:** encapsulation, Ethernet/L2, IP/L3, TCP/UDP/L4, application layer, IPv4/IPv6, CIDR/subnets, routing, NAT.
- **Practice:** trace packet encapsulation and reason about a simple subnet/routing scenario.
- **Required output:** layered packet diagram.
- **Completion check:** identify which layer owns each responsibility and avoid mixing IP with TCP.

### Day 44 — DNS and TCP lifecycle
- **Syllabus:** recursive vs authoritative DNS, caching/TTL, TCP handshake/teardown, sequence numbers, retransmission, flow and congestion control concepts.
- **Practice:** trace a lookup and a TCP connection including packet loss.
- **Required output:** DNS/TCP sequence diagrams.
- **Completion check:** explain what retransmission, flow control, and congestion control each address.

### Day 45 — Interleaved OS/DBMS: connection resources
- **Primary syllabus:** UDP, sockets/ports, connection pooling, socket buffers, resource exhaustion.
- **DBMS connection:** database connection pools and network round trips.
- **OS connection:** handles, buffers, process resource limits.
- **Practice:** diagnose connection exhaustion and excessive round trips.
- **Required output:** bottleneck analysis.
- **Completion check:** distinguish application, OS, network, and DB connection limits.

### Day 46 — HTTP versions and API behavior
- **Syllabus:** HTTP methods/status codes/headers, keep-alive, HTTP/1.1 vs HTTP/2 vs HTTP/3, proxy/reverse proxy/load balancer, timeout/retry semantics.
- **Practice:** trace request/response and assess idempotency for retry.
- **Required output:** annotated request and response.
- **Completion check:** explain how protocol behavior affects latency and safe retries.

### Day 47 — TLS, certificates, and secure requests
- **Syllabus:** TLS handshake, certificate chain/trust, encryption vs authentication, firewall/proxy roles.
- **Practice:** trace typing a URL through DNS, connection setup, TLS, HTTP, server, and response.
- **Required output:** end-to-end request diagram.
- **Completion check:** explain what each stage establishes and where failure/latency may arise.

### Day 48 — Networking assessment and diagnosis
- **Syllabus:** layered model, DNS, TCP/UDP, HTTP, TLS, proxies, pooling, timeouts.
- **Practice:** diagnose a latency scenario and complete a closed-book oral drill.
- **Required output:** CN scorecard, corrections, revision queue.
- **Completion check:** walk through a request's journey and identify likely bottlenecks from evidence.

### Day 49 — Rest
Optional spaced repetition only.

---

# Phase III — Distributed systems and service engineering

## Week 8 — Distributed systems and reliability

### Day 50 — Partial failure and communication
- **Syllabus:** why distribution is hard; latency, partial failures, clocks; sync request/response vs async queues/event streams.
- **Practice:** draw failure timelines for a caller and dependency.
- **Required output:** communication/failure diagram.
- **Completion check:** explain why timeout does not prove the remote operation failed.

### Day 51 — Retries, timeouts, idempotency
- **Syllabus:** exponential backoff, jitter, retry budgets, idempotency keys, deduplication, at-most-once/at-least-once and qualified exactly-once claims.
- **Practice:** design a retry policy and identify retry-storm risks.
- **Required output:** retry policy and idempotency contract.
- **Completion check:** defend retry limits and explain duplicate-side-effect prevention.

### Day 52 — Interleaved DBMS: outbox and consistency
- **Primary syllabus:** transactional outbox, inbox/deduplication, DB + queue transaction boundary, failure windows.
- **DBMS connection:** transaction atomicity and uniqueness constraints.
- **Practice:** trace crashes before/after database write and message publish.
- **Required output:** sequence diagram of a duplicate-safe operation.
- **Completion check:** explain which failures are covered and which need recovery/reconciliation.

### Day 53 — Reliability patterns and graceful degradation
- **Syllabus:** service discovery, load balancing, health checks, circuit breakers, bulkheads, load shedding, graceful shutdown.
- **Practice:** choose a pattern for a dependency failure scenario.
- **Required output:** resilience design with trade-offs.
- **Completion check:** distinguish detection, containment, and recovery.

### Day 54 — Consistency and observability
- **Syllabus:** CAP with assumptions, consistency models/quorum intuition, logs/metrics/traces, correlation IDs, SLIs/SLOs/error budgets.
- **Practice:** choose telemetry for a queue-processing incident.
- **Required output:** minimal observability plan.
- **Completion check:** explain which evidence distinguishes application failure from dependency failure.

### Day 55 — Reliability assessment
- **Syllabus:** queue consumer design with retries, DLQ, idempotency, poison-message handling; distributed-systems oral drill.
- **Required output:** failure matrix, scorecard, review queue.
- **Completion check:** defend behavior under duplicate delivery, lost response, crash, and partial outage.

### Day 56 — Rest
Optional spaced repetition only.

## Week 9 — Scaling, caching, partitioning, consistency

### Day 57 — Scaling and caching foundations
- **Syllabus:** vertical/horizontal scaling, stateless/stateful services, cache-aside/read-through/write-through/write-back concepts, TTL.
- **Practice:** choose a cache strategy for read/write workloads.
- **Required output:** cache-flow diagram and assumptions.
- **Completion check:** explain cache hit/miss paths and consistency implications.

### Day 58 — Cache invalidation and hot keys
- **Syllabus:** invalidation, stale reads, cache stampede, hot keys, TTL jitter, write amplification.
- **Practice:** analyze invalidation races and propose stampede protection.
- **Required output:** failure-case table.
- **Completion check:** defend freshness and load trade-offs.

### Day 59 — Interleaved DBMS: partitioning and query patterns
- **Primary syllabus:** partitioning/sharding, partition-key selection, skew, rebalancing, hot partitions, fan-out.
- **DBMS connection:** indexes, transactions, access patterns.
- **Practice:** select partition keys and test skew scenarios.
- **Required output:** partition-key analysis.
- **Completion check:** explain how a key that looks balanced in average traffic can still create a hot partition.

### Day 60 — Replication and consistency
- **Syllabus:** leader/follower, read replicas, replication lag, failover; strong/eventual/read-your-writes/monotonic reads.
- **Practice:** decide API guarantees under replica lag.
- **Required output:** consistency contract for a sample service.
- **Completion check:** state what a client can observe and why.

### Day 61 — Data-store choice, pagination, backpressure
- **Syllabus:** relational vs NoSQL based on access patterns; document/key-value/wide-column overview; cursor pagination, large scans, quotas, rate limiting, bounded queues.
- **Practice:** review an API for query amplification and pagination problems.
- **Required output:** storage/API recommendation.
- **Completion check:** defend data-store and pagination choices under scale.

### Day 62 — Scaling assessment
- **Syllabus:** cache, sharding, replication, consistency, backpressure, data-store choice.
- **Practice:** design a scaled data path and handle 10x traffic.
- **Required output:** assessment and prioritized gaps.
- **Completion check:** compare two plausible approaches with explicit trade-offs.

### Day 63 — Rest
Optional spaced repetition only.

## Week 10 — Messaging and workflow orchestration

### Day 64 — Queues, pub/sub, event logs
- **Syllabus:** queues vs pub/sub vs event logs, competing consumers, fan-out, ordering, partition ordering, consumer groups.
- **Practice:** choose a messaging model for three workload patterns.
- **Required output:** messaging comparison and flow diagram.
- **Completion check:** explain delivery, ordering, and fan-out assumptions.

### Day 65 — Locks, leases, retries, and DLQs
- **Syllabus:** visibility/locks, sessions, lock renewal, redelivery, retries, poison messages, DLQ, replay, delayed delivery, TTL.
- **Practice:** trace lock loss during processing and design safe redelivery.
- **Required output:** retry/DLQ policy and failure timeline.
- **Completion check:** explain what the broker guarantees and what the consumer must guarantee.

### Day 66 — Interleaved OS/C# concurrency
- **Primary syllabus:** concurrency limits, batching, backpressure, throughput/latency trade-offs.
- **C#/OS connection:** thread pool, cancellation, locks, resource lifetime, shutdown.
- **Practice:** diagnose unbounded concurrency and thread/resource exhaustion.
- **Required output:** bounded-worker design.
- **Completion check:** explain why increasing concurrency can reduce system throughput.

### Day 67 — Outbox, saga, orchestration/choreography
- **Syllabus:** DB+queue boundary, outbox/inbox, saga/compensation, long-running workflow state, correlation IDs.
- **Practice:** design a workflow with retries and compensation.
- **Required output:** state machine/sequence diagram.
- **Completion check:** identify durable state, retry boundaries, and compensation limits.

### Day 68 — Security and operations for messaging
- **Syllabus:** identity, authorization, private connectivity, tenant boundaries, least privilege; queue depth, oldest-message age, retry/DLQ rate, processing duration.
- **Practice:** create a runbook for dependency outage and poison messages.
- **Required output:** security boundary sketch and operational checklist.
- **Completion check:** distinguish connectivity/auth failures from handler failures.

### Day 69 — Messaging assessment
- **Syllabus:** design an ingress/orchestration/worker/callback/status pipeline with expiry and retries.
- **Practice:** specify deterministic IDs for storage, dispatch, and telemetry; simulate crashes at each boundary.
- **Required output:** end-to-end design, failure matrix, scorecard.
- **Completion check:** defend delivery semantics and recovery behavior.

### Day 70 — Rest
Optional spaced repetition only.

---

# Phase IV — LLD, HLD, integration

## Week 11 — LLD deepening

### Day 71 — Requirements, domain modeling, invariants
- **Syllabus:** requirements/use cases, entities/value objects, invariants, state transitions, API contracts, error modeling.
- **Practice:** model a new LLD problem before choosing classes.
- **Required output:** requirements, domain model, and assumptions.
- **Completion check:** show that the model covers core flows and invalid states.

### Day 72 — Interfaces, persistence, and concurrency boundaries
- **Syllabus:** API design, persistence boundaries, thread safety, resource lifetime, test seams.
- **Practice:** design interfaces and a sequence diagram for a critical flow.
- **Required output:** interface/sequence design.
- **Completion check:** justify boundaries and explain concurrency assumptions.

### Day 73 — Interleaved DBMS/OS: LLD correctness
- **Primary syllabus:** SOLID/pattern review; composition, extensibility, avoiding premature abstraction.
- **DBMS connection:** transaction and uniqueness needs in the design.
- **OS/C# connection:** thread safety and resource cleanup.
- **Practice:** change requirements and refactor the design.
- **Required output:** before/after diagram and tests.
- **Completion check:** explain what changed and why the design did not need unnecessary abstractions.

### Day 74 — LLD implementation
- **Syllabus:** implement core flows in C# or provide detailed pseudocode if implementation is not appropriate; tests and error cases.
- **Practice:** deliver working code for the chosen problem.
- **Required output:** code, tests, and brief design notes.
- **Completion check:** demonstrate happy path, invalid input, and at least one failure/concurrency case.

### Day 75 — Patterns and design trade-offs drill
- **Syllabus:** compare alternative designs, pattern intent/cost, extensibility, testability, complexity.
- **Practice:** respond to requirement changes and senior-level follow-ups.
- **Required output:** trade-off matrix.
- **Completion check:** defend the simplest design that meets requirements.

### Day 76 — Timed LLD mock
- **Syllabus:** 60-minute design walkthrough, then review requirements, modeling, code quality, edge cases, tests, and communication.
- **Required output:** scored retrospective and next LLD gaps.
- **Completion check:** prioritize improvements with evidence rather than vague self-assessment.

### Day 77 — Rest
Optional spaced repetition only.

## Week 12 — HLD method, APIs, estimates, architecture

### Day 78 — Requirements and non-functional goals
- **Syllabus:** functional/non-functional requirements, scope, constraints, SLAs/SLOs, assumptions, clarifying questions.
- **Practice:** turn an ambiguous prompt into requirements and exclusions.
- **Required output:** requirements brief.
- **Completion check:** identify the actual problem before proposing components.

### Day 79 — Capacity estimation
- **Syllabus:** QPS, peak traffic, storage, bandwidth, growth, fan-out, latency budgets.
- **Practice:** estimate workload for a URL shortener or paste service.
- **Required output:** estimates with units and assumptions.
- **Completion check:** recompute and sanity-check order of magnitude.

### Day 80 — Interleaved DBMS/CN: API and data model
- **Primary syllabus:** API contracts, pagination, idempotency, versioning, authentication/authorization.
- **DBMS:** schema and access patterns.
- **CN:** gateway, reverse proxy, load balancer, connection behavior.
- **Practice:** define APIs and schema for the HLD assignment.
- **Required output:** API table, schema, request sequence.
- **Completion check:** trace a request and justify the data model.

### Day 81 — Core architecture and data flow
- **Syllabus:** clients, gateways, stateless services, data stores, caches, queues, workers, blob storage, load balancing, autoscaling, health probes, graceful shutdown.
- **Practice:** draw architecture and critical sequence/data-flow diagrams.
- **Required output:** complete first-pass architecture.
- **Completion check:** explain every component's responsibility and why it exists.

### Day 82 — URL shortener/paste service assignment
- **Syllabus:** redirect/write path, schema, cache, collision strategy, abuse/rate limits, failures, observability.
- **Practice:** defend design choices and discuss alternatives.
- **Required output:** HLD design document with estimates.
- **Completion check:** trace read and write flows and explain key bottlenecks.

### Day 83 — HLD presentation and critique
- **Syllabus:** 45–60 minute structured walkthrough; requirements, estimates, API, data model, architecture, failures, trade-offs.
- **Required output:** scored mock and prioritized gaps.
- **Completion check:** avoid jumping to components before clarifying requirements.

### Day 84 — Rest
Optional spaced repetition only.

## Week 13 — Reliability, multi-region, operations

### Day 85 — Availability, durability, recovery
- **Syllabus:** availability vs durability, RPO/RTO, backup/restore vs replication, multi-zone/multi-region.
- **Practice:** choose recovery objectives and map architecture consequences.
- **Required output:** recovery plan.
- **Completion check:** explain which failures each mechanism protects against.

### Day 86 — Multi-region designs
- **Syllabus:** active-active vs active-passive, failover, split brain, leader election, fencing, replication lag, conflict handling.
- **Practice:** trace regional failure and recovery.
- **Required output:** failover sequence diagram.
- **Completion check:** state data-loss and consistency assumptions explicitly.

### Day 87 — Interleaved CN/DBMS: cascading failure
- **Primary syllabus:** retry storms, timeouts, load shedding, circuit breakers, bulkheads.
- **CN connection:** latency, connection pooling, timeout placement.
- **DBMS connection:** saturated connection pool, slow queries, transaction contention.
- **Practice:** diagnose cascading latency and choose containment actions.
- **Required output:** incident timeline and mitigation plan.
- **Completion check:** distinguish symptom, bottleneck, and mitigation.

### Day 88 — Deployment safety and security
- **Syllabus:** canaries, rings, feature flags, rollback, schema compatibility, authn/authz, secrets, least privilege, data protection.
- **Practice:** design a safe rollout and rollback for a schema/API change.
- **Required output:** deployment and security checklist.
- **Completion check:** explain how to roll back without corrupting incompatible state.

### Day 89 — Observability and operational readiness
- **Syllabus:** SLOs, alert quality, dashboards, incident response, runbooks, capacity planning, recovery drills.
- **Practice:** define metrics and alerts for the HLD system.
- **Required output:** operational-readiness review.
- **Completion check:** connect each alert to a user impact or actionable failure mode.

### Day 90 — Reliability mock
- **Syllabus:** evolve Week 12 design for regional failure, 10x traffic, degraded dependency, and bad deployment.
- **Required output:** failure-mode review and scorecard.
- **Completion check:** defend recovery behavior and identify remaining risks.

### Day 91 — Rest
Optional spaced repetition only.

## Week 14 — Data-intensive systems and HLD patterns

### Day 92 — Search and asynchronous indexing
- **Syllabus:** search/indexing, source of truth vs search index, async indexing, freshness and reindexing.
- **Practice:** trace updates through indexing and handle stale results.
- **Required output:** data-flow diagram.
- **Completion check:** explain indexing lag and recovery.

### Day 93 — Feeds, notifications, fan-out
- **Syllabus:** push vs pull, fan-out-on-write/read, celebrity/hot-key problem, freshness and cost.
- **Practice:** compare designs under different traffic distributions.
- **Required output:** trade-off table and flow diagram.
- **Completion check:** explain why workload distribution changes the best design.

### Day 94 — Interleaved DBMS/CN: high-volume ingestion
- **Primary syllabus:** logs/metrics ingestion, high-volume append, retention, aggregation, query patterns.
- **DBMS connection:** indexes, partitions, retention, query cost.
- **CN connection:** batching, throughput, payload and bandwidth.
- **Practice:** estimate ingestion and query load.
- **Required output:** storage/ingestion design.
- **Completion check:** explain the bottleneck and the cost of indexing everything.

### Day 95 — Files and asynchronous processing
- **Syllabus:** metadata vs blob storage, uploads, processing pipelines, retries, deduplication, state machines.
- **Practice:** design upload-to-processing flow and failure recovery.
- **Required output:** sequence diagram and failure matrix.
- **Completion check:** distinguish metadata consistency from blob durability.

### Day 96 — Two short HLD drills
- **Syllabus:** two distinct prompts chosen to test different bottlenecks; requirements, APIs, data model, estimates, diagram, failure cases.
- **Practice:** time-box each drill and compare two plausible architectures.
- **Required output:** two short design artifacts.
- **Completion check:** defend choices under a changed requirement.

### Day 97 — Data-intensive design assessment
- **Syllabus:** search, feed/notification, ingestion, file/workflow patterns; review weak areas.
- **Required output:** assessment and revision queue.
- **Completion check:** explain freshness, write amplification, scale, and operational complexity trade-offs.

### Day 98 — Rest
Optional spaced repetition only.

## Week 15 — Cross-subject integration

### Day 99 — End-to-end request tracing
- **Syllabus:** client → DNS/TLS/HTTP → load balancer → service → cache/DB/queue → worker → status/callback.
- **Practice:** annotate latency and failure points at each boundary.
- **Required output:** sequence diagram and failure map.
- **Completion check:** explain each boundary and what telemetry would diagnose it.

### Day 100 — Performance diagnosis
- **Syllabus:** latency, throughput collapse, memory growth, connection exhaustion, queue backlog, slow queries, stale data.
- **Practice:** diagnose a multi-symptom incident and prioritize evidence collection.
- **Required output:** hypothesis/evidence/mitigation table.
- **Completion check:** distinguish correlation from cause and choose the next measurement.

### Day 101 — Interleaved OS/C#/DBMS: resource bottlenecks
- **Primary syllabus:** async/concurrency, CPU vs I/O, memory/GC, thread pool, locks, database transactions/indexes.
- **Practice:** analyze a service that has rising latency and memory with saturated connections.
- **Required output:** cross-layer diagnosis.
- **Completion check:** connect symptoms to plausible mechanisms and propose measurements before fixes.

### Day 102 — Reliability and data correctness
- **Syllabus:** retries, idempotency, transaction boundaries, duplicates, stale reads, outbox, ordering, consistency promises.
- **Practice:** trace a failure through write, publish, worker, and callback.
- **Required output:** correctness invariants and failure matrix.
- **Completion check:** show how the system prevents or repairs duplicate and lost effects.

### Day 103 — Integrated HLD with LLD component
- **Syllabus:** case selected from observed weak areas; include APIs, storage, async flow, one LLD component, security, telemetry, failure handling.
- **Practice:** design end-to-end and defend alternatives.
- **Required output:** integrated design artifact.
- **Completion check:** justify decisions across C#, OS, DBMS, CN, and distributed systems.

### Day 104 — Full mock and retrospective
- **Syllabus:** 60-minute mock, follow-up questions, structured retrospective.
- **Required output:** scorecard and prioritized gap list.
- **Completion check:** identify three highest-impact gaps with concrete next actions.

### Day 105 — Rest
Optional spaced repetition only.

## Week 16 — Final revision and mocks

### Day 106 — C#/.NET and OOP revision
- **Syllabus:** value/reference semantics, GC/lifetime, equality, generics, collections, exceptions, async/concurrency, SOLID and patterns.
- **Practice:** closed-book code traces and oral drill; revisit mistakes.
- **Required output:** C#/OOP scorecard and weak-topic list.
- **Completion check:** explain and apply core language/runtime behavior without notes.

### Day 107 — OS revision
- **Syllabus:** processes/threads, context switches, scheduling calculations, virtual memory, TLB/page faults, synchronization, deadlocks.
- **Practice:** redo missed scheduling and concurrency questions.
- **Required output:** corrected worksheet and oral assessment.
- **Completion check:** independently solve metrics and explain safe state, deadlock, and address translation.

### Day 108 — Interleaved DBMS/CN revision
- **Primary syllabus:** SQL, indexes, normalization, transactions/isolation, recovery.
- **CN:** DNS, TCP/UDP, HTTP/TLS, timeouts/retries, connection pooling.
- **Practice:** mixed diagnosis questions and SQL practical.
- **Required output:** DBMS/CN scorecard and revision queue.
- **Completion check:** answer using precise mechanics, examples, and trade-offs.

### Day 109 — Distributed systems revision
- **Syllabus:** partial failures, retries, idempotency, outbox/inbox, consistency, caching, partitioning, messaging, DLQ, workflow recovery.
- **Practice:** design a duplicate-safe consumer and explain failure windows.
- **Required output:** failure matrix and oral drill.
- **Completion check:** defend behavior at every crash point.

### Day 110 — Timed LLD mock
- **Syllabus:** one full LLD problem; requirements, modeling, interfaces, core flow, edge cases, tests, extensions.
- **Required output:** scored mock and review.
- **Completion check:** complete a structured design under the allotted time and communicate trade-offs.

### Day 111 — Timed HLD mock and plan closeout
- **Syllabus:** one full HLD mock; requirements, estimates, APIs, data model, architecture, failures, observability, trade-offs.
- **Required output:** final subject scorecards, open gaps, question history, and next 30-day revision plan.
- **Completion check:** demonstrate final success criteria from the roadmap. Decide whether to begin the separate AI/agentic phase only after reviewing evidence.

### Day 112 — Rest
Celebrate completion; no new syllabus.

---

## Daily completion checklist

Use this checklist for every study day:

- [ ] Due spaced-repetition prompts attempted before seeing answers.
- [ ] Every listed syllabus item taught and clarified.
- [ ] Learner questions answered; prerequisite gaps addressed.
- [ ] Required exercise/implementation/diagram/query completed.
- [ ] Interview questions attempted and evaluated.
- [ ] Mistakes and unresolved gaps recorded with revisit dates.
- [ ] Notes/session log/scorecard updated as appropriate.
- [ ] Next session's exact starting point recorded.
- [ ] Any unfinished item explicitly carried forward; nothing silently marked complete.

## Deviation policy

If a learner question causes a long detour:
1. Resolve it to the depth needed for accurate understanding.
2. Record whether it was a prerequisite, useful extra, or deferred follow-up.
3. Return to the remaining daily checklist.
4. If today's syllabus cannot reasonably be completed even after focused teaching, record the exact unfinished items and begin the next session with them before advancing. Preserve the overall topic sequence; do not let one subject consume the remaining weeks.

The schedule is a day-by-day execution plan; the companion weekly roadmap remains the authoritative source for overall goals, topic depth, references, and mastery criteria.
