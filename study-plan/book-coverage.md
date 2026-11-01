# Book-backed coverage contract

**Inventory checked:** 1 November 2026. [book-coverage.csv](book-coverage.csv)
is the row-level coverage ledger. It inventories **50 OSTEP chapters**, **50
semaphore topic/appendix groups**, **32 DBMS chapter entries**, and **14 OOP
reference/supplement groups**. All rows begin planned; prior scores remain in
their original records and are not silently mapped to complete book coverage.

## Sources actually inspected

| Source | Inventory basis | Use |
|---|---|---|
| `Operating Systems - Three Easy Pieces.pdf` | Supplied local PDF: version 0.90; contents has chapters 1–50 | Primary OS spine: virtualization, concurrency, persistence, distribution |
| `LittleBookOfSemaphores.pdf` | Supplied local PDF: version 2.2.2; chapters 1–9 and appendices A/B | Primary synchronization patterns, classical and less-classical puzzles, native API exercises |
| Database System Concepts, Silberschatz/Korth/Sudarshan | Select seventh edition; verified [author chapter index](https://www.db-book.com/slides-dir/index.html) | Relational model/SQL/design, storage/query internals, transactions/recovery, distributed and advanced breadth |
| The Complete Reference: Java 2, Schildt/Naughton | Existing named OOP reference; exact edition/local copy unavailable | Thematic programming/OOP background; no invented chapter numbers or claim to have inspected its full contents |
| Microsoft C#/.NET documentation | [Object/type model](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/object-oriented/) and version-appropriate language/runtime docs | C#-specific semantics and features that the older Java reference cannot establish |
| Modern Operating Systems, Tanenbaum | Existing supplementary OS reference; no supplied edition inventory inspected here | Cross-check mechanisms/history when relevant; OSTEP and semaphore PDFs define the explicit OS book checklist |

The local PDFs were read locally. Do not upload them or commit extracted book
pages/full solutions. Save original study explanations, answers, and code instead.
Only short topic identifiers and original coverage mappings are in the ledger.

The supplied OSTEP is an older edition. Its VAX, IDE, NFSv2, and historical
scheduler case studies teach mechanisms, not current platform specifications.
Use matching chapter numbers for that PDF and current official docs for modern
runtime/OS behavior; do not substitute a newer online chapter numbering silently.
Semaphore synchronization models and native OS APIs are distinct from C# GC semantics.

## What covering a book topic means

Each ledger row requires: source section read/taught, explanation in the learner's
own words, a trace/puzzle or applied question, a relevant independent implementation
or experiment, edge-case/trade-off follow-up, and a dated delayed recall attempt.
For dialogues/history, use a synthesis/contrast question rather than artificial code.
For advanced specialty topics, use a focused original exercise rather than building
an entire DBMS, file system, JVM, or operating-system kernel.

Update `status` from `planned` to `introduced`, `practised`, `assessed`, and
`retained` only with actual evidence. Add dated evidence links to the row's
`evidence` field; do not overwrite earlier wrong answers. A chapter group cannot
be retained while one of its substantive subtopics is still unassessed.

For every section, retain its important mechanisms, named variants, limitations,
and end-of-section questions in the session checklist. Hints/non-solutions are
counterexample material, not separate completion credits. Before leaving a chapter,
compare its actual subsection list with the lesson record and add missing items.
This catches details a thematic row might otherwise conceal.

## Core versus full-book breadth

`core` rows are anchored to existing study-day numbers. `extension` rows have
explicit continuation units below. Both are required for the full-book goal;
extension rows are not discarded or credited at overview depth.

Keep the 16-week interview core and its phase gates. If full-book depth exceeds
10–12 hours/week, extend the calendar or allocate additional book sessions rather
than dropping chapters, stopping all design preparation, or announcing false completion.
The separate AI/ML track cannot be used as substitute evidence for DBMS chapters.

### Mandatory continuation units

| Unit | Required content | Practical assessment |
|---|---|---|
| BX-OS-1 | Proportional-share/multiprocessor scheduling and the VAX memory case study | Scheduling-policy comparison and locality/replacement scenario |
| BX-OS-2 | File-system locality and log-structured design | Small allocation/cleaning trace, write amplification, recovery reasoning |
| BX-OS-3 | NFS/AFS case studies | Compare client caching, invalidation, failure/retry semantics, and server state |
| BX-SYNC-1 | Remaining basic semaphore patterns and no-starve/classical variants | Compose signal/rendezvous/multiplex/barrier/queue patterns; independently explain progress assumptions |
| BX-SYNC-2 | Savages and all barbershop variants | Bounded waiting/service model with invalid interleaving and corrected tests |
| BX-SYNC-3 | Santa, H2O, river crossing, single/multi-car coaster | Batch composition and reusable-phase coordination; independently solve each distinct constraint set |
| BX-SYNC-4 | Search/insert/delete, bathroom variants, baboons, Modus Hall | Resource exclusion, category fairness, and starvation counterexamples |
| BX-SYNC-5 | Sushi bar, child care/extended child care, room party, Senate Bus | Baton/ownership transfer and changing-capacity constraints |
| BX-SYNC-6 | Faneuil Hall/extended and dining hall/extended | Ordering/phase constraints; construct and repair bad interleavings |
| BX-SYNC-7 | Python/C implementations and cleanup appendices | Execute native/simulator variants where supported; implement a semaphore abstraction and record API differences |
| BX-DB-1 | Advanced SQL/type/application breadth | Procedures/triggers or equivalent, authorization/parameterization, complex values, and application transaction boundaries |
| BX-DB-2 | Big-data and data-analysis chapters | Small aggregation/window/analytical pipeline; compare processing/data layouts without borrowing AI-track scores |
| BX-DB-3 | Parallel/distributed query and transaction chapters | Join/data-movement plan, partition/replication, coordination and failure analysis |
| BX-DB-4 | Advanced indexes, relational design, formal query languages | Index/storage choice, formal query/decomposition exercises, correctness and cost |
| BX-DB-5 | Object databases, XML, information retrieval, blockchain breadth | Original data-model/query and trust/failure comparison per chapter; not a token or production-network deployment |
| BX-OOP-1 | Remaining reflection/attributes, operators/indexers/nesting, library breadth | Small C# reflection/metadata and API-contract kata with tests; record Java/C# semantic differences |

These are ordered continuation units, not invented completion dates. Add each
unit's session date and remaining subsections as work occurs. Continue spaced
recall from the interview core throughout them.

## OOP reference boundaries

Cover all substantive programming/OOP themes from the named Java reference:
types/control flow, arrays/strings, methods/constructors, access/encapsulation,
inheritance/dispatch, abstraction/interfaces, packages/nesting, exceptions,
threading/synchronization, collections, and I/O. Add explicit C# coverage for
structs/records/equality, properties/indexers, delegates/events, generics/variance,
LINQ, nullable types, disposal/GC, async/cancellation, and reflection/attributes.

Do not claim the old Java edition teaches modern C# generics, CLR dispatch,
events, or async. Exact Java chapter-number completeness remains unverified until
that edition's contents are available; the ledger states that limit rather than
fabricating references. Java-only applets/AWT/Swing/network-library surveys are
not silently counted as C# OOP mastery; identify any requested Java-specific
extension explicitly. This contract covers the OOP subject, not every API in an
unspecified Java reference edition.

## Assessment and closeout

Use the [readiness contract](swe-interview-readiness-contract.md) and
[unanswered bank](../assessments/swe-interview-bank.md). Each book row must produce
variants beyond the finite bank. Before full-book closeout, reconcile every
chapter/subsection with its evidence and delayed recall. Report planned,
introduced, practised, assessed, retained, and remaining extension counts separately.
Do not equate “all topics listed” with “all topics covered.”
