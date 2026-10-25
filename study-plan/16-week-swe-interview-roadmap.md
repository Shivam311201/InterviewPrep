# Complete SWE Interview Preparation Plan
**Plan version:** 1.0  
**Agreed:** 24 October 2026  
**Duration:** 16 weeks  
**Weekly effort:** 10–12 hours  
**Cadence:** 6 study days per week  
**Primary outcome:** Deep, interview-ready understanding of C#/.NET and OOP, LLD, HLD, operating systems, DBMS, computer networks, and distributed systems—not a high-level-only refresher.

This file is the source of truth for the study roadmap. Another agent should read this file, the README, `session-log.md`, `progress/scorecard.md`, the topic notes, and quiz logs before continuing the plan.

---

**Day-by-day execution schedule:** See [16-week daily schedule](./16-week-daily-schedule.md) for the concrete syllabus, practice, deliverable, and completion check for each study day. Use this alongside the weekly roadmap; the daily checklist is not optional merely because a session runs long.

## 1. Goals, constraints, and learning contract

### Goals
By the end of 16 weeks, the learner should be able to:
1. Explain core concepts from first principles, including implementation details and important edge cases.
2. Write and review idiomatic C# code and explain OOP, object lifetime, exceptions, generics, collections, async/concurrency, and .NET behavior.
3. Design and implement maintainable LLD solutions using SOLID, composition, appropriate patterns, and testable boundaries.
4. Reason about OS fundamentals, DBMS internals, transactions/isolation/indexes, networking protocols, and performance.
5. Design scalable and reliable HLD systems; discuss APIs, storage, caching, queues, consistency, partitioning, failures, observability, and trade-offs.
6. Handle follow-up questions that probe assumptions, edge cases, bottlenecks, failure modes, and operational behavior.
7. Demonstrate knowledge in timed assessments and mock interviews, with a tracked record of strengths, gaps, and revisions.

### Constraints and preferences
- Start from fundamentals because previously learned concepts are rusty; do not assume recall just because a topic has been studied before.
- Teach material directly in sessions. The learner is not expected to purchase books.
- Use established textbooks as foundational references, official documentation for language/runtime details, and interview-oriented resources as supplements. Distinguish source-derived material from supplemental heuristics where relevant.
- Teach chapter-by-chapter/topic-by-topic with explanations, examples, exercises, implementation details, edge cases, and difficult follow-ups.
- The learner handles DSA practice independently. Use DSA only when useful to connect concepts or interpret a design problem; do not spend the core plan teaching DSA.
- Defer AI/agentic interview topics until after this plan.
- Mix subjects during each week to maintain interest, while preserving a coherent dependency order and revisiting prior topics.
- The assistant manages sequencing, resources, quizzes, spaced revision, assignments, and progress tracking. Ask many questions and grade candidly.
- Keep the repository updated. Never mark unanswered questions as mastered or silently erase misconceptions.

### Definition of interview-ready
A topic is not mastered merely because the learner recognizes a definition. The learner should be able to:
- Explain the concept without notes.
- Work through a concrete example or trace.
- Apply it to code, a scenario, or a design.
- Explain limitations, trade-offs, and common failure modes.
- Answer at least one non-obvious follow-up.
- Revisit it successfully after a delay.

---

## 2. Time budget and weekly rhythm

Target 10–12 hours across six days. The following is a weekly allocation template, not a requirement to study the same number of minutes every day.

| Session type | Approx. weekly time | Purpose |
|---|---:|---|
| First-principles concepts | 2 h | Build the mental model; definitions only as a starting point |
| Worked examples / code traces | 2 h | Step through execution, memory, data flow, or system behavior |
| Active recall and oral grilling | 1.5 h | Answer questions before seeing explanations; include tricky follow-ups |
| Practical work | 2 h | Small implementations, experiments, queries, or debugging |
| Assignment / design exercise | 2 h | LLD, HLD, or deeper subject-specific work |
| Assessment and revision | 1.5–2 h | Timed quiz, mistake log, spaced repetition, checkpoint |

If a week has an assessment or a large design assignment, adjust the allocation while keeping the weekly total near 10–12 hours.

### Six-day pattern
- **Day 1 — Primary concept:** new material, first-principles explanation, worked example.
- **Day 2 — Primary continuation:** deeper internals, edge cases, code or diagram walkthrough.
- **Day 3 — Interleaved subject:** a different core subject to keep variety; connect it to the primary subject where natural.
- **Day 4 — Practical:** implementation, debugging, query exercise, protocol trace, or design artifact.
- **Day 5 — Interview drill:** short questions, why/how questions, counterexamples, and staff-level follow-ups.
- **Day 6 — Assessment and consolidation:** closed-book recall, quiz, assignment review, update notes/scorecard, schedule revisions.
- **Day 7 — Rest / optional light review.**

The exact day allocation can move when prerequisites or learner performance demand it. Do not change the overall sequencing without a reason recorded in the session log.

---

## 3. Topic mastery rubric and tracking

### Rubric
For substantial assessments, score five dimensions from 0–3 (maximum 15):
1. **Conceptual understanding:** correct mental model and explanation.
2. **Practical application:** can implement, trace, query, or use the concept.
3. **Edge cases / internals:** handles exceptions, concurrency, failure modes, and details.
4. **Trade-offs / engineering judgment:** knows when a technique is appropriate and what it costs.
5. **Communication:** gives a structured, concise, defensible answer and states assumptions.

Suggested interpretation:
- **0:** unable to explain or apply.
- **1:** partial or memorized answer; important gaps remain.
- **2:** generally correct; needs prompts or misses edge cases.
- **3:** independent, accurate, practical, and handles follow-ups.

A 15/15 is not required for every microtopic. Use a relevant denominator for narrow quizzes and never misrepresent the current topic scorecard as a formal 15-point assessment.

### Advancement criteria
Move forward when the learner can explain the essentials and solve the planned exercise. If a core concept remains weak, continue the roadmap but add a targeted remediation block and keep the gap visible. Avoid getting trapped in endless perfection on one subject.

### Spaced repetition
Use reviews approximately on **Day 1, Day 2, Day 4, Day 8, Day 15, and Day 31** after learning, adapting to results. Incorrect answers, lucky guesses, and correct answers with poor reasoning all trigger follow-ups. Track:
- Question/prompt
- Learner's actual answer (preserve wording when available)
- Correct answer and reasoning
- Error type (knowledge gap, misconception, application, edge case, communication)
- Revisit date/status

### Required repository updates
At the end of every session, update as relevant:
- Topic notes, including examples and important details
- Complete assistant-question and user-question log
- Quiz prompt, learner answer, evaluation, correction, and explanation
- Scorecard and mistake categories
- Open questions and revision queue
- Assignment status and links/artifacts
- Session date and next session's plan

Do not invent a transcript for unavailable historical messages. Clearly label summaries versus verbatim records. Verify each GitHub write and report failures honestly.

---

## 4. Reference strategy

Books provide conceptual foundations; official docs establish language/runtime/API specifics; interview resources provide practice framing. The learner should not need to buy the books—the assistant teaches the content directly.

### Core references
- **Operating systems:** Andrew S. Tanenbaum, *Modern Operating Systems*, 4th edition (the learner referred to it as Tannenbaum, PHI). Use **OSTEP — Operating Systems: Three Easy Pieces** as a complementary explanation and exercise source where it covers the same topic; flag any coverage differences rather than assuming the two are identical.
- **Database systems:** Abraham Silberschatz, Henry F. Korth, S. Sudarshan, *Database System Concepts*. Use it for relational model, SQL, transactions, recovery, indexing, and system internals.
- **Programming/OOP background:** Herbert Schildt / Patrick Naughton, *The Complete Reference: Java 2* (TMH) was named as a reference. It is a Java-era book, so use it for general programming/OOP ideas only where applicable; it is not an authority for modern C# or current .NET behavior.
- **C# and .NET:** Microsoft Learn and official .NET documentation for language semantics, CLR/GC, collections, exceptions, tasks/async, threading, disposal, and diagnostics. Prefer version-appropriate official docs for runtime-specific behavior.
- **Networking:** use established networking textbook material for layered models, IP, routing, TCP/UDP, DNS, TLS, HTTP, and congestion/reliability; supplement with official protocol specifications and vendor docs when a precise behavior matters.
- **LLD/HLD:** use interview-oriented design material such as Hello Interview as supplemental practice, alongside fundamental design principles, official service documentation, and explicit trade-off analysis.

### Source discipline
When teaching a claim about C#/.NET implementation, prefer official Microsoft documentation. When teaching OS/DBMS fundamentals, anchor explanations in the named textbook concepts. Clearly label practical interview heuristics as heuristics rather than textbook facts. If a source's edition does not cover a modern feature, say so and use an official current source.

---

## 5. The 16-week roadmap

The plan intentionally interleaves topics every week. The listed bullets are minimum coverage and deliverables; lessons should go deeper when the learner's gaps or interview follow-ups require it.

## Phase I — Programming, OOP, and design foundations (Weeks 1–4)

### Week 1 — C# fundamentals, object model, and runtime memory
**Primary:** C# syntax refresh from first principles, types, references, methods, parameters, classes/objects, value vs. reference semantics, memory model.

**Coverage**
- Compilation and execution at a useful interview level: source, compiler, IL, JIT, CLR.
- Variables, scope, expressions, methods, overloads, properties, fields, access modifiers.
- Value types vs. reference types; nullable values; boxing/unboxing at a conceptual and practical level.
- Reference assignment, aliasing, mutation vs. reassignment; pass-by-value, `ref`, `out`, `in`.
- Stack/thread execution state vs. managed heap; avoid simplistic stack/heap rules.
- Object lifetime, reachability, GC roots, transitive references, cycles.
- Generational GC: Gen 0/1/2, promotion, older-to-younger references, write barrier/card table, LOH, background GC at an introductory level.
- `IDisposable`, `using`, finalization, managed vs. unmanaged resources at an introductory level.
- Exceptions, control flow, basic debugging and small console exercises.

**Interleaved subject:** OS introduction—program vs. process, executable vs. running instance, process address-space idea.

**Practice/deliverables**
- Trace reference/aliasing examples without running them.
- Write small C# examples for parameter passing and disposal.
- Explain GC roots/object graphs on paper.
- Quiz: value/reference types, pass-by-value, roots, disposal, Gen0.
- Deliverable: notes and a short code kata collection.

**Checkpoint:** explain a code snippet's output and object lifetime; answer why setting a reference to null does not force GC or call Dispose.

### Week 2 — OOP depth, C# type system, exceptions, and OS process/thread basics
**Primary:** OOP and language design.

**Coverage**
- Encapsulation, abstraction, inheritance, polymorphism; what each does and does not guarantee.
- Interfaces vs. abstract classes; composition vs. inheritance; dependency inversion.
- Virtual dispatch, overriding vs. hiding, overload resolution, constructor chaining and initialization order.
- Equality and identity: reference equality, value equality, `Equals`, `GetHashCode`, records; hash collection contract.
- Generics, constraints, covariance/contravariance at a useful interview level.
- Collections and iteration: List, Dictionary, HashSet, IEnumerable/IEnumerator, deferred execution, mutation during enumeration.
- Exception taxonomy, exception filters, rethrow semantics, cleanup with `finally`.
- OS: process vs. thread, user/kernel mode, context-switching motivation, thread stacks, address-space isolation, system calls.

**Interleaved subject:** DBMS intro—why databases, relational model, schema, keys, integrity constraints.

**Practice/deliverables**
- Implement a small polymorphic domain model.
- Compare interface, abstract class, and composition for a concrete requirement.
- Design equality/hash behavior for a domain object.
- Process/thread diagrams and questions.
- Quiz with counterexamples: overload vs. override, hiding vs. virtual dispatch, equality contract.

**Checkpoint:** design a small type hierarchy and justify it; explain process vs. thread and why separate processes are isolated.

### Week 3 — SOLID, clean boundaries, testing, concurrency foundations
**Primary:** practical OOP and engineering quality.

**Coverage**
- SOLID: SRP, OCP, LSP, ISP, DIP; examples of violations and over-application.
- Dependency injection and inversion of control; lifetime scopes and captive dependency pitfalls.
- Cohesion, coupling, immutability, encapsulation, API boundaries.
- Unit tests, integration tests, mocks/stubs/fakes, testability and deterministic behavior.
- C# delegates, events, lambdas, closures, LINQ deferred execution and multiple enumeration.
- Threading fundamentals: races, critical sections, locks/monitors, deadlocks, starvation, volatile/interlocked concepts.
- OS scheduling and synchronization: mutex vs. semaphore, condition/wait concepts, race conditions and deadlock conditions.
- DBMS: SQL SELECT, filtering, joins, grouping, aggregates, NULL semantics, constraints.

**Interleaved subject:** CN intro—layering, packets, client/server, sockets, ports, DNS purpose.

**Practice/deliverables**
- Refactor a tightly coupled service to dependency injection.
- Write unit tests for business logic and discuss what not to mock.
- Diagnose a deadlock/race from a small snippet.
- Write SQL for a small schema and explain NULL behavior.
- Explain request path from a client to a server at a high level.

**Checkpoint:** critique an overengineered design, identify SOLID issues without turning principles into dogma, and reason about a simple race.

### Week 4 — Design patterns, async/await, and first LLD assignment
**Primary:** LLD readiness and modern C# asynchronous programming.

**Coverage**
- Pattern selection: Strategy, Factory, Builder, Adapter, Decorator, Observer, State, Command, Repository (with cautions), Dependency Injection.
- Recognize pattern intent; avoid applying patterns by name without a requirement.
- `Task`, `async`/`await`, synchronization context at a useful level, exception propagation, cancellation tokens, timeouts.
- Async I/O vs. CPU-bound work; why async is not the same as parallelism.
- Thread-safe design, immutable data, lock granularity, concurrent collections.
- OS: scheduling, synchronization primitives, deadlock prevention/avoidance/detection, memory and virtual memory concepts.
- DBMS: relational algebra intuition, normalization motivation, functional dependencies introduction.
- CN: TCP vs. UDP, connection lifecycle, basic HTTP request/response.

**Assignment:** design and implement a parking lot or library-management LLD. Include requirements, class diagram, APIs, object responsibilities, error cases, tests, and one justified pattern.

**Checkpoint:** 45–60 minute LLD walkthrough plus code review. Explain cancellation, concurrency, and how the design changes when requirements change.

---

## Phase II — OS, DBMS, and networking foundations (Weeks 5–7)

### Week 5 — OS processes, memory, virtual memory, and concurrency
**Coverage**
- Process address space, code/data/heap/stack at conceptual level; virtual vs. physical memory.
- Address translation, paging, page tables, TLB, page faults, locality, working sets.
- User/kernel mode, system calls, context switches, scheduling goals and algorithms.
- Threads, synchronization, atomicity, race conditions, deadlocks, starvation, priority inversion.
- File descriptors/handles and OS resource lifetime; processes and I/O.
- C# connection: threads, locks, ThreadPool, Task scheduling at a conceptual level.
- DBMS connection: why transactions need concurrency control; locks and deadlocks.
- CN connection: socket and connection resource lifetime.

**Practice/deliverables**
- Draw a process address space and trace a page-table/TLB lookup conceptually.
- Diagnose race and deadlock snippets.
- Explain context-switch cost and why more threads can hurt throughput.
- Quiz on process/thread, virtual memory, paging, scheduling, synchronization.

**Checkpoint:** answer a set of OS oral questions and reason through a concurrent counter.

### Week 6 — DBMS schema design, indexes, transactions, and recovery
**Coverage**
- Relational model, keys, constraints, relational algebra intuition.
- SQL joins, aggregation, subqueries, CTEs, NULL, duplicates, query semantics.
- Functional dependencies, normalization (1NF/2NF/3NF/BCNF at interview-relevant depth), anomalies and denormalization trade-offs.
- Indexes: B-tree/B+ tree concepts, clustered/nonclustered concepts where relevant, composite indexes, selectivity, leftmost-prefix intuition, covering indexes, write overhead.
- Query execution plan basics: scan vs. seek, cardinality estimates, join algorithms (nested-loop, hash, sort-merge) at a conceptual level.
- Transactions, ACID, isolation levels, dirty/nonrepeatable/phantom reads, MVCC/locking intuition.
- Logging, WAL, crash recovery, checkpoints, backups vs. replication.
- OS connection: locks, I/O, memory, fsync/durability; HLD connection: schema and access patterns.

**Practice/deliverables**
- Design schema for a small business scenario.
- Predict index usefulness for query patterns.
- Explain a transaction anomaly with a two-session schedule.
- Read a simplified query plan and propose an improvement.

**Checkpoint:** SQL practical plus oral drill on isolation, index trade-offs, and recovery.

### Week 7 — Computer networks: from packet to secure HTTP request
**Coverage**
- Layering and encapsulation; Ethernet/L2 vs. IP/L3 vs. TCP/UDP/L4 vs. HTTP/application.
- IPv4/IPv6 basics, subnets and CIDR intuition, routing and NAT.
- DNS resolution, caching and TTL, recursive vs. authoritative servers.
- TCP handshake/teardown, sequence numbers, retransmission, flow control, congestion control at a conceptual level.
- UDP and when it is appropriate; sockets, ports, connection pooling.
- HTTP methods, status codes, headers, keep-alive, HTTP/1.1 vs. HTTP/2 vs. HTTP/3 at interview level.
- TLS handshake, certificates, trust chains, encryption vs. authentication.
- Proxies, reverse proxies, load balancers, firewalls; timeouts and retries.
- OS connection: socket buffers and resource exhaustion; DBMS connection: connection pools and network round trips.

**Practice/deliverables**
- Trace typing a URL through DNS, TCP/TLS, HTTP, server, response.
- Explain what happens after packet loss and after a client timeout.
- Compare retry behavior for idempotent and non-idempotent requests.
- Quiz on TCP/UDP, DNS, TLS, HTTP, proxy/load balancer.

**Checkpoint:** explain a request's journey and diagnose a hypothetical latency issue across client, network, and server.

---

## Phase III — Distributed systems and service engineering (Weeks 8–10)

### Week 8 — Distributed systems foundations and reliability
**Coverage**
- Why distribution is hard: partial failure, latency, independent clocks, independent processes.
- Synchronous vs. asynchronous communication; request/response, queues, event streams.
- Timeouts, retries, exponential backoff, jitter, retry budgets, idempotency, deduplication.
- At-most-once/at-least-once delivery; why “exactly once” needs careful qualification.
- Idempotency keys, transactional outbox, inbox/deduplication patterns.
- Service discovery, load balancing, health checks, graceful degradation, circuit breakers and bulkheads.
- CAP theorem with careful assumptions; consistency models and quorum intuition.
- Observability: logs, metrics, traces, correlation IDs, SLIs/SLOs/error budgets.
- Connection to prior work examples: queue-triggered consumers, duplicate delivery, deterministic identities, Cosmos writes and event emission.

**Practice/deliverables**
- Design a robust queue consumer with retry, DLQ, idempotency, and poison-message handling.
- Diagram failure cases: process crashes before/after write, lost response, duplicate message.
- Explain what monitoring would distinguish dependency failure from application failure.

**Checkpoint:** defend a failure-handling design under retries, duplicate delivery, and partial outage.

### Week 9 — Data scaling, caching, partitioning, and consistency
**Coverage**
- Vertical vs. horizontal scaling, stateful vs. stateless services.
- Cache-aside, read-through/write-through/write-back concepts, TTL, invalidation, stampede, hot keys, stale reads.
- Partitioning/sharding: partition-key choice, skew, rebalancing, hot partitions, fan-out queries.
- Replication, leader/follower, read replicas, replication lag, failover.
- Consistency: strong, eventual, read-your-writes, monotonic reads at a useful level.
- Relational vs. NoSQL trade-offs driven by access patterns; document/key-value/wide-column overview.
- Storage indexes, pagination, cursor-based pagination, large scans.
- Rate limiting, quotas, backpressure, bounded queues, load shedding.
- DBMS connection: indexes and transaction guarantees; OS connection: memory/cache locality; CN connection: latency and bandwidth.

**Practice/deliverables**
- Choose a partition key for a realistic workload and test skew scenarios.
- Design a cache strategy and enumerate invalidation failures.
- Explain replication lag and what the API should promise.
- Review a data access API for pagination and query amplification.

**Checkpoint:** defend data-store and cache choices under changing traffic and consistency needs.

### Week 10 — Messaging, workflow orchestration, and resilient processing
**Coverage**
- Queues vs. pub/sub vs. event logs; competing consumers and fan-out.
- Ordering, partition ordering, sessions, consumer groups, visibility/locks, leases, lock renewal.
- Retry policies, poison messages, dead-letter queues, replay, delayed delivery, expiry/TTL.
- Transaction boundaries across DB + queue; outbox, inbox, saga/compensation.
- Idempotent handlers, deterministic IDs, duplicate-safe side effects.
- Long-running workflows, orchestration vs. choreography, durable state, correlation IDs.
- Backpressure, concurrency limits, batching, throughput/latency trade-offs.
- Security/network boundaries at design level: identity, authorization, private connectivity, tenant boundaries, least privilege.
- Reliability review: queue depth, age of oldest message, retry counts, DLQ rate, processing duration.

**Practice/deliverables**
- Design an assessment/processing pipeline with ingress, orchestration, workers, callback/status, retries, and expiry.
- Define idempotency keys for storage, dispatch, and telemetry.
- Simulate lock loss and redelivery.
- Write a runbook for poison-message and dependency outage cases.

**Checkpoint:** explain end-to-end delivery semantics and defend recovery behavior after each crash point.

---

## Phase IV — LLD, HLD, and system design integration (Weeks 11–16)

### Week 11 — LLD deepening and object-oriented design assessment
**Coverage**
- Requirement discovery, use cases, domain modeling, invariants, entities/value objects.
- API contracts, error modeling, state transitions, concurrency and persistence boundaries.
- Composition, SOLID, patterns, extensibility, test seams.
- Class diagrams and sequence diagrams; avoid premature abstraction.
- LLD design process: clarify → model → interfaces → core flows → edge cases → tests → extensions.
- Thread safety and resource lifetime in designs.
- Refactor a design when new requirements arrive; discuss trade-offs and overengineering.

**Assignment:** a second LLD problem, selected by the assistant based on learner performance (examples: rate limiter, elevator, notification system, in-memory cache, task scheduler). Require working code or detailed pseudocode, tests, diagrams, and trade-off explanation.

**Checkpoint:** timed 60-minute LLD mock; score on requirements, modeling, code quality, edge cases, and communication.

### Week 12 — HLD method, APIs, capacity estimation, and core architecture
**Coverage**
- Requirement clarification: functional vs. non-functional, scope, constraints, SLAs/SLOs.
- Back-of-envelope estimation: QPS, peak traffic, storage, bandwidth, growth, fan-out.
- API design, pagination, idempotency, versioning, authentication/authorization.
- Core components: clients, gateways, stateless services, data stores, caches, queues, workers, object/blob storage.
- Data flow and ownership; synchronous vs. asynchronous boundaries.
- Load balancing, autoscaling, health probes, graceful shutdown.
- Capacity, bottlenecks, latency budgets, dependency budgets.
- Diagramming: architecture diagram plus one or two critical sequence/data-flow diagrams.

**Assignment:** design a URL shortener or paste service. Include estimates, API, schema, redirect path, cache, collision strategy, abuse/rate limits, failure handling, and observability.

**Checkpoint:** present a structured HLD in 45–60 minutes without jumping straight to components before requirements.

### Week 13 — HLD reliability, multi-region, and operational design
**Coverage**
- Availability vs. durability; RPO/RTO; backup/restore vs. replication.
- Multi-zone and multi-region deployment, active-active vs. active-passive trade-offs.
- Failover, split brain, leader election concepts, fencing, recovery drills.
- Consistency across regions, replication lag, conflict handling.
- Retry storms, cascading failure, load shedding, circuit breakers, bulkheads.
- Deployment safety: canaries, rings, feature flags, rollback, schema compatibility.
- Security boundaries: authentication, authorization, secret handling, data protection, least privilege.
- Observability and operations: SLOs, alert quality, dashboards, incident response, runbooks, capacity planning.

**Assignment:** evolve the Week 12 design to handle regional failure, 10x traffic, a degraded dependency, and a bad deployment.

**Checkpoint:** failure-mode review and operational readiness review.

### Week 14 — HLD data-intensive systems and design patterns
**Coverage**
- Search/indexing and asynchronous indexing consistency.
- Feed/timeline or notification fan-out; push vs. pull and celebrity/hot-key problem.
- File/object upload and processing; metadata vs. blob storage.
- Logging/metrics ingestion; high-volume append, retention, aggregation, query patterns.
- Workflow/task processing; delayed jobs, retries, deduplication, state machines.
- Event-driven architectures, CDC and materialized views at a conceptual level.
- Trade-offs between precomputation and on-demand work.
- Choose designs based on access patterns, latency, freshness, write amplification, and operational complexity.

**Practice/deliverables**
- Two shorter HLD drills selected to cover different bottlenecks.
- For each: requirements, API, data model, estimates, core diagram, failure cases, trade-offs.
- Compare at least two plausible architectures rather than presenting one as universally correct.

**Checkpoint:** handle changing requirements and defend the design without relying on memorized templates.

### Week 15 — Full-stack system design and cross-subject integration
**Coverage**
- Connect C# service behavior, async/concurrency, OS resources, DB transactions/indexes, network timeouts, queues, caches, and distributed failure.
- Trace an end-to-end request: client → DNS/TLS/HTTP → load balancer → service → cache/DB/queue → downstream worker → status/callback.
- Debug latency, throughput collapse, memory growth, duplicate processing, stale data, connection exhaustion, and retry storms.
- Design APIs and persistence with failure semantics explicit.
- Security, authorization, tenant boundaries, and observability as first-class concerns.
- Review design choices for consistency, cost, complexity, and operability.

**Assignment:** one integrated HLD case with a critical LLD component and a failure/debugging scenario. The assistant should select the case based on weak areas found so far.

**Checkpoint:** 60-minute mock, followed by a structured retrospective and a prioritized gap list.

### Week 16 — Final revision, mocks, and next-phase decision
**Coverage**
- Closed-book recall across C#/OOP, LLD, OS, DBMS, CN, distributed systems, HLD.
- Re-run missed quizzes and prior wrong answers; no answer-key peeking until the learner commits.
- One timed LLD mock and one timed HLD mock.
- OS/DBMS/CN rapid-fire oral rounds with deeper follow-ups on weak topics.
- Review scorecard, common mistake patterns, communication, and pacing.
- Create a durable next 30-day maintenance plan and identify remaining gaps.

**Final deliverables**
- Consolidated topic index and notes.
- Complete question/answer history and quiz log.
- Final scorecards by subject, with evidence rather than unsupported claims.
- LLD/HLD assignment artifacts and mock-interview feedback.
- Next 30-day spaced-revision queue.
- Decision on whether to begin AI/agentic interview preparation as a separate later phase; it remains outside this 16-week plan unless explicitly re-scoped.

**Final success criteria**
- Can explain fundamentals without notes and solve representative exercises.
- Can reason about edge cases, failures, and trade-offs rather than repeating definitions.
- Can complete a structured LLD and HLD mock within the allotted time.
- Can diagnose the recurring mistakes and show improvement on delayed retests.
- Has a clear record of both strengths and unresolved gaps.

---

## 6. How each topic will be taught

Use this cycle for each substantial topic:

1. **Why it exists:** what problem the concept solves.
2. **Mental model:** explain the concept in plain language and then precise terminology.
3. **Mechanics:** execution steps, data structures, runtime behavior, or protocol flow.
4. **Worked example:** walk through concrete values, state transitions, or code.
5. **Counterexample:** show a tempting but incorrect mental model.
6. **Edge cases:** concurrency, failure, null/empty input, resource exhaustion, ordering, scale, or version-specific behavior as applicable.
7. **Interview framing:** concise answer, then likely follow-ups.
8. **Active recall:** ask the learner before revealing the answer.
9. **Practice:** code, SQL, trace, diagram, or design task.
10. **Review:** record score, errors, and future retest date.

Do not deliver the entire roadmap as a one-time lecture. Teach incrementally, verify understanding, and adjust based on evidence.

---

### Beginner-first explanation contract (important)

- Assume rusty or beginner-level recall unless the learner has demonstrated understanding. Do not infer mastery from prior exposure or from using a term once.
- Start with a familiar example or problem, then explain the intuition in plain language, then introduce the formal term.
- Introduce **one new technical term at a time**. Define it immediately, explain why it matters, and connect it to concepts already established.
- Before using a concept as a building block, briefly check that its prerequisites are understood. Avoid unexplained terminology chains (for example, introducing physical memory pages, paging, address translation, and page tables in one answer).
- Separate the essential beginner model from implementation details and advanced interview nuance. Mark advanced details as such and return to them after the foundation is clear.
- Use small diagrams and concrete traces when helpful. Explain what happens step by step before presenting a polished interview answer.
- When the learner asks a question mid-lesson, answer that question directly and clarify any prerequisites it exposes; don't treat it as a reason to rush into more new concepts.
- Ask one focused question at a time, wait for the learner's attempt, then evaluate what is correct and what needs refinement. Avoid piling on follow-up questions before the current concept is stable.
- If a term was introduced too early, acknowledge it, define it simply, and rebuild the explanation rather than repeating the jargon.
- Aim for understanding, not vocabulary memorization. After the mental model is solid, teach accurate terminology, edge cases, implementation details, and interview framing.

## 7. Assessment bank and question-generation policy

Every topic should generate multiple question types:
- Definition and mental model
- Trace this code / query / protocol / diagram
- Explain why, not just what
- Find the bug or incorrect assumption
- Compare two approaches and state trade-offs
- Edge-case and failure scenario
- Performance/scaling scenario
- Debugging/production incident
- Design extension when requirements change
- Senior-level follow-up probing internals, limits, and operational consequences

Ask questions one at a time or in small batches when interactive reasoning matters. Do not expose answers before the learner has attempted the question. For written assessments, keep answer keys separate or clearly below the prompts.

Record the learner's actual answer, including uncertainty or mistakes when available. Grade candidly and explain what was correct, incomplete, or wrong. A lucky multiple-choice selection is not proof of mastery; ask for reasoning.

---

## 8. Guardrails for the continuing agent

An agent continuing this plan should:
1. Read this roadmap and the repository's current README/session log/scorecard before planning a new session.
2. Check the last unanswered question and the revision queue first, then start the next planned topic.
3. Preserve the user's stated preferences: 10–12 hours/week, six days, mixed subjects weekly, DSA independently, AI/agentic later, detailed first-principles instruction.
4. Keep the topic order broadly intact: Weeks 1–4 programming/OOP/LLD foundations; Weeks 5–7 OS/DBMS/CN; Weeks 8–10 distributed systems; Weeks 11–16 LLD/HLD integration and mocks.
5. If deviating, state why in the session log and update the plan only if the change is deliberate.
6. Use official current docs for version-specific C#/.NET details and clearly label supplemental interview heuristics.
7. Avoid asserting the learner knows a topic because it appeared in notes. Require active recall and delayed review.
8. Commit updates to the repository after each session when GitHub access is available; verify the resulting file and commit.
9. Never claim a commit/push occurred without tool confirmation.
10. Keep questions, quizzes, mistakes, and revision history persistent; do not silently delete prior errors or replace them with a polished but incomplete summary.

## 9. Current starting point

As of 24 October 2026, the learner has begun C# object references, managed memory, GC roots, Dispose vs. GC, and Gen 0/1/2. Current notes and question logs live under:
- `notes/csharp-oop/memory-and-gc.md`
- `assessments/quizzes/memory-gc-quiz.md`
- `session-log.md`
- `progress/scorecard.md`

**Immediate next steps**
1. Ask the still-unanswered GC question: why must a Gen 0 collection account for a reachable Gen 2 Parent's reference to a Gen 0 Child? Require both transitive reachability and older-to-younger reference tracking.
2. Review write barrier/card table with a new scenario.
3. Cover Dispose/finalization/SafeHandle and stack/JIT-liveness nuances.
4. Resume the OS question already asked: **“What is the difference between a program and a process?”**
5. Keep interleaving DBMS and CN topics during the week, rather than studying only one subject for an entire week.
