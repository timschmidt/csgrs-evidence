# Separate no-default unit-file proposal — not adopted

This is a separate proposal after the completed original owner campaign, not
an amendment to its protocol, analyzer, results or failure. Candidate aad7409a
repairs the reproduced false exact certification of approximate residual balls.
Eight public mathematical witnesses and four maintained regression tests
establish the benefit; unchanged exact reports, receipts and dispatch counts
remain required. The proposal does not justify growth for abstraction alone.

Only the x86_64 no-default Hypersolve unit-test executable's incremental **file**
cap would change: 4 KiB to 16 KiB, retaining the 1% incremental cap. The existing
16 KiB AND 2% cumulative cap remains unchanged. Current and fixed file sizes
are both 12,974,744 bytes; the candidate is 12,990,200 bytes. The 15,456-byte
positive charge is about 0.1192%, leaving 928 bytes of cumulative allowance.
No historical charge is erased and no other target supplies spare capacity.

This permits one correctness change to consume the already declared cumulative
file budget in one increment, without increasing that total budget. Every
other metric/configuration retains its original cap. In particular, executable
sections shrink by 288 bytes, unique-address named text shrinks by 695 bytes,
and allocated sections have zero net growth. File growth includes 10,780 bytes
of symbol strings, 2,688 bytes of symbol entries, 1,984 bytes of net file-backed
allocated sections, and four other file-layout bytes. The additional file-backed
allocated bytes are balanced by 1,984 fewer NOBITS RELRO padding bytes; unchanged
total loaded sections do not establish unchanged runtime behavior.

The 16 MiB fixture image capacity and 2 MiB reserve remain unchanged: the
candidate leaves 3,787,016 bytes. This is a unit-test artifact capacity, not a
firmware partition or complete application memory bound. Both new regression
images and all other original owner image accounts pass their original caps;
the sole failed original file account remains explicitly failed.

No ledger entry or source adoption follows from this proposal. Native memory
failures, whole-consumer capacity, cancellation/retry, quiet runtime, successive
operations, full applicable validation and composition with earlier repairs
remain gates. The unrelated combined-candidate size proposals supply no budget
to this candidate. Original accepted accounts remain unchanged.
