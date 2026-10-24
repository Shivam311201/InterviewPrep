# OS Fundamentals — Virtual Memory and Pages

Date: 24 October 2026

## Teaching preference
Teach beginner-first: start with intuition and concrete examples, define every term before relying on it, introduce one new term at a time, and ask one focused question at a time. The learner asked for this explicitly after unfamiliar terminology such as physical memory pages was introduced too quickly.

## Core concepts covered

### Read-only code vs. writable data
Two processes running the same program normally have separate writable global data. If Process A changes its `counter` from 0 to 10, Process B's own counter does not automatically change. Read-only executable machine code, by contrast, can commonly be shared in physical RAM because both processes can read and execute the same instructions without modifying them.

Learner's answer: “function code is read only whule counter is writeable” — correct core distinction.

### Memory addresses and virtual address spaces
A memory address is a number used to identify a location in memory. A process uses virtual addresses. Each process has its own virtual address space, so the same virtual address (for example, 1000) can refer to different physical RAM locations in different processes, or may not be mapped at all.

Learner's answer: “each process has its own virtual adress space pointing to differenc physicall address space so it wll differe location” — correct core idea.

Benefits of separate virtual address spaces:
- Protection/isolation: one process normally cannot read or overwrite another process's private memory just by using the same address.
- Simplicity: each process need not know where its data physically sits in RAM; OS and hardware manage the mapping.

### Invalid access vs. data not currently in RAM
If a process accesses an address it is not allowed to access, the CPU raises an exception and the OS may terminate the process. If the address is valid but the needed data is not currently in RAM, the OS may be able to make the data available and resume execution. A page fault does not automatically mean the program has a bug or must be terminated.

Learner initially answered “terminate” when asked what should happen if valid data is not in RAM. Correction: valid-but-not-resident data can often be handled, and the instruction can be retried. The whole program does not restart.

The OS must know which process made the access because the same virtual address can map to different data for different processes. This is about process-specific memory mappings, not garbage collection.

### Physical memory pages
Memory is managed in fixed-size blocks called pages. A common illustrative page size is 4 KiB, though other sizes exist. A process's virtual pages do not need to be stored in consecutive physical RAM locations.

Example: Virtual Page 0 may map to Physical Page 8, while Virtual Page 1 maps to Physical Page 3. This flexibility lets the OS use scattered free spaces in RAM rather than requiring one large contiguous free block.

Learner initially was unsure why non-contiguous placement helps. The explanation used scattered empty RAM spaces: if a program needs four pages, it is more flexible to place them in four separate free spaces than require all four spaces to be adjacent. Learner correctly selected the separate-space option.

### Page table
A page table is a mapping record used to remember where a process's virtual pages map in physical memory, along with access-related information. If Virtual Page 1 moves from Physical Page 3 to Physical Page 12, the mapping must be updated so the process can still find the data.

Learner answer: “it needs to update page table” — correct.

## Exact learner responses and evaluation
- “no it will not be” — Process A changing its counter does not change Process B's separate counter. Correct.
- “no speerate copy” — learner thought each process needs a separate machine-code copy; corrected that read-only code can commonly share physical RAM.
- “function code is read only whule counter is writeable” — correct.
- “each process has its own virtual adress space pointing to differenc physicall address space so it wll differe location” — correct.
- “better readibilty by process?” — redirected to protection/isolation and simplicity as the main benefits.
- “B. Reject the access and notify the operating system.” — correct for an inaccessible/unmapped address.
- “terminate” — corrected: valid data not resident in RAM may be brought in; invalid/forbidden access differs.
- “it continue from the instruction that needed the data?” — correct; instruction can be retried after fault handling.
- “for garabage collection of RAM?” — clarified that GC is a managed-runtime feature; OS needs the process context to use the right mapping.
- “it's virtual memory address not physical, mapping of cirtual address 1000 for process B to physical address doesn't exist” — correct in the given scenario; mappings are process-specific.
- “7” — correct: if A's virtual address 1000 maps to physical location 5000 and B's maps to separate location 9000, A writing 42 doesn't change B's existing 7.
- “not sure” — after an example, understood that separate page placement is more flexible.
- “b” — correct: scattered page placement is more flexible than requiring a single contiguous block.
- “it needs to update page table” — correct.

## Next lesson steps
1. Revisit the distinction between a memory address, virtual address, and physical address with a simple example.
2. Explain what a page table stores and how the OS/hardware use it, defining terms before introducing them.
3. Clarify that a page fault can be recoverable and does not always mean an SSD read.
4. Explain memory permissions and process isolation before discussing advanced paging implementation.
5. Do not introduce TLB or further implementation jargon until the foundational model is secure.
