# OS Session — CPU Scheduling, Concurrency, and Deadlocks
Date: 2026-10-25

## Topics covered
- CPU scheduling: FCFS, non-preemptive SJF, SRTF, Round Robin, priority scheduling, MLQ and MLFQ.
- Metrics: response time = first CPU start − arrival; turnaround time = completion − arrival; waiting time = total time Ready but not Running (exclude I/O-blocked time).
- Multicore scheduling: runnable threads, CPU affinity/cache locality, and race conditions.
- Concurrency: non-atomic read-modify-write operations, critical sections, lock discipline, and why a lock only protects code that uses the same lock.
- Deadlocks: Coffman conditions, lock ordering, prevention vs avoidance vs detection vs recovery, safe states/sequences, starvation vs deadlock.
- Priority inversion: a high-priority thread can be blocked by a low-priority lock holder; medium-priority work can delay the lock holder. Priority inheritance temporarily boosts the holder. Priority ceiling uses predefined lock ceiling priorities.

## Assessment and review notes
- Correctly reasoned through concurrent bank withdrawals: without protecting the whole check-and-deduct sequence, both threads may observe the same balance and produce an invalid negative balance.
- Correctly identified global lock ordering as a way to prevent circular wait in the two-lock example.
- Correctly calculated response time and turnaround time for arrival=2 ms, first CPU=7 ms, completion=15 ms: 5 ms and 13 ms.
- Safe state question was missed: safe does not mean no waiting. It means there exists an order in which every process can finish, assuming expected resource releases.
- SJF assessment item had flawed choices: bursts P1=6, P2=2, P3=4, all arriving at t=0. Order P2→P3→P1; waits 0, 2, 6; average = 8/3 ≈ 2.67 ms. None of the original choices was exact; do not count this against the learner.
- Mixed assessment: 3/4 valid questions correct. This is practice evidence, not proof of durable mastery.

## Spaced-repetition priorities
1. Safe state vs deadlock avoidance vs deadlock detection.
2. Response vs turnaround vs ready-queue waiting time, especially timelines with I/O.
3. SJF/SRTF/RR calculations; check all arithmetic and answer choices.
4. Revisit race-condition interleavings and the difference between atomic operations and locking a compound operation.
5. Revisit lock ordering, priority inheritance, and priority ceiling.

## Suggested next session
Start with a short retrieval review of safe sequences, scheduling metrics, and a fresh SJF/SRTF calculation. Then continue the OS roadmap; do not treat today's correct answers as automatic long-term mastery.
