# Session Log — 2026-10-24: OS Virtual Memory, Paging, and Threads

## Resume instructions
At the next session, start with a beginner-friendly revision quiz on today's material before introducing new concepts. Ask one question at a time, wait for the learner's answer, evaluate it, and explain any correction before continuing. Do not reveal answers in advance. Reintroduce terms with intuition and concrete examples before using jargon.

After revision, review weak spots and continue the OS roadmap with CPU scheduling (runnable threads, scheduling decisions, time slices, context switches, and scheduling goals). Do not assume mastery merely because the learner answered multiple-choice questions correctly.

## Topics taught

### 1. Processes, virtual addresses, and physical addresses
- A program is passive code; a process is a running instance with execution state and resources.
- Separate processes have separate virtual address spaces. The same virtual address in two processes can map to different physical memory.
- Example: Process A's virtual address 1000 maps to physical address 5000 and contains 42; Process B's virtual address 1000 maps to physical address 9000 and contains 7. A's write does not automatically change B's value.
- The OS can deliberately map the same physical memory into multiple processes (shared memory), subject to permissions and coordination.
- Threads in the same process share the process's virtual address space and shared objects, but each thread has its own stack and execution state (instruction pointer/register context).

### 2. Pages, page numbers, offsets, and page tables
- Memory is managed in fixed-size chunks called pages. Real page sizes vary; 4 KiB is common. For arithmetic practice, we used imaginary pages of 4 bytes.
- A virtual address can be described as a virtual page number plus an offset within that page.
- With 4-byte pages and zero-based addresses:
  - Page 0: addresses 0–3
  - Page 1: addresses 4–7
  - Page 2: addresses 8–11
  - Page 3: addresses 12–15
- Address 11 = Page 2, Offset 3. Address 14 = Page 3, Offset 2.
- A page table records mappings from virtual pages to physical pages (and access-related information).
- Example mapping: Virtual Page 3 -> Physical Page 5. With 4-byte pages, virtual address 14 (page 3, offset 2) translates to physical address 5*4+2 = 22.
- If the OS moves that page's contents to Physical Page 9 and updates the mapping, virtual address 14 maps to physical address 9*4+2 = 38. Virtual address 13 maps to 9*4+1 = 37; address 12 maps to 9*4+0 = 36.
- The page number changes during translation; the offset stays the same.
- Virtual pages need not map to consecutive physical pages; scattered free physical pages can be used. A page table update is needed if a page's physical mapping changes.

### 3. Page faults and backing storage
- A page fault means the CPU raises an exception that requires OS handling for a memory access. It is not automatically a program bug and does not always mean an SSD read.
- Possible cases:
  - A valid page is not currently in RAM but its existing contents are saved on storage: the OS can bring the contents into RAM, update mapping information, and retry the instruction.
  - Newly allocated memory is accessed for the first time: the OS may allocate a physical page and initialize it (for zero-initialized memory, the contents must appear as zero); no SSD read is inherently required.
  - Invalid or forbidden access: the OS may reject the access and terminate the process.
- The OS resumes execution after handling a recoverable fault; the whole program does not restart.

### 4. Dirty pages and eviction
- A dirty page has been modified in RAM since its relevant backing copy was last synchronized.
- Hardware typically tracks writes using a dirty bit in memory-management metadata; exact details vary by architecture.
- When freeing RAM, an unchanged page can often be discarded if its contents can be recovered from an existing backing copy.
- A modified page must be preserved if its changes are not already saved elsewhere; this may require writing it to a backing store.
- Eviction means removing a page from RAM so its physical space can be reused.
- Not every page that leaves RAM must be written to the SSD.

### 5. Page replacement and thrashing
- LRU (Least Recently Used) is a page-replacement strategy that selects the page not accessed for the longest time. Real operating systems often approximate LRU.
- Example: if A was accessed 2 seconds ago, B 30 seconds ago, and C 5 seconds ago, an LRU-like policy would choose B.
- Thrashing occurs when the system spends excessive time moving pages between RAM and storage instead of doing useful work.
- More RAM, fewer competing processes, or better memory allocation can reduce pressure, depending on the cause.
- Virtual address space does not replace physical RAM; storage is much slower than RAM.

### 6. Threads, races, and synchronization
- Two threads in the same process can access the same shared variable if they have a reference to it.
- `counter++` is a read-modify-write operation, not necessarily atomic as a whole. Concurrent increments can lose updates: both threads may read 0 and each write 1, leaving a final value of 1 rather than 2.
- In C#, use appropriate synchronization such as `lock` (with all relevant accesses participating in the same lock) or `Interlocked.Increment` for an atomic increment.
- A writer's lock alone does not guarantee visibility to a reader that doesn't participate in appropriate synchronization.
- When Thread A releases a lock and Thread B subsequently acquires the same lock, the synchronization establishes visibility of earlier writes, assuming no intervening write changes the value.

## Learner answers / checkpoints
The learner correctly reasoned that:
- Two processes using the same virtual address may map it to different physical addresses.
- Address 14 with 4-byte pages is Page 3, Offset 2.
- Virtual address 14 mapping through Virtual Page 3 -> Physical Page 5 gives physical address 22.
- If the page mapping changes to Physical Page 9, address 12 maps to physical address 36.
- An unmodified page can be discarded when its original contents are recoverable; a modified page's changes must be preserved if not saved elsewhere.
- A page fault is not automatically a bug; first access to valid memory can require OS handling.
- Threads in the same process share an address space.
- Concurrent `counter++` operations can overlap because increment involves reading, changing, and writing.
- A lock on the writer alone does not guarantee an unsynchronized reader sees the write.

Corrections / areas to revisit:
- Address 11 with imaginary 4-byte pages is Page 2, Offset 3 (not Page 3).
- Virtual memory is not simply nonexistent memory. It is an address-space and memory-management abstraction; virtual pages may be in RAM, backed by storage, mapped to files, or not yet physically allocated.
- A page fault does not always mean loading from SSD; it can involve first-use allocation/initialization, restoring a page, or rejecting an invalid access.
- For virtual address 13 with Virtual Page 3 -> Physical Page 9 and 4-byte pages, physical address is 37 (offset 1), not 38 (offset 2).

## Next session plan
1. Start with a revision quiz on today's concepts, one question at a time, with no answers revealed in advance.
2. Cover virtual-to-physical address translation with a few fresh numerical examples.
3. Check page-fault scenarios (first-use allocation vs. restored page vs. invalid access).
4. Revisit dirty pages, eviction, LRU, and thrashing.
5. Revisit process isolation vs. thread sharing, race conditions, and lock-based visibility.
6. After revision and correction, begin CPU scheduling from beginner level.

## Teaching preference reminder
The learner explicitly prefers beginner-first explanations: introduce intuition and examples before terminology; define each new term before relying on it; explain why before how; avoid chains of unexplained jargon; ask one focused question at a time and wait for the answer.
