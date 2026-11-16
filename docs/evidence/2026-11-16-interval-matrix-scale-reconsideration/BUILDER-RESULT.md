The single-pass builder preserves the new lifecycle tests and 99 owner tests/doctests,
but does not resolve the measured cost. A focused four-block ABBA run (16 runs,
1,600 samples / 1,638,400 completed operations) is 6.5--53.4% slower than the
explicit control, with identical output/allocation records. Its file saves only
192 bytes versus the initial candidate. Restore the production helper exactly;
retain the independent callback/drop-order witnesses for its established contract.

Whole-process Callgrind for the initial matrix client records 419,393,181
baseline versus 453,847,404 candidate instructions. This includes warmup, output
and teardown, not just operation bodies. Symbols show the client calls a separate
scale wrapper and fallible-array routines. The next single targeted experiment
marks the new public scale wrapper inline to expose its fixed dimensions and
result construction at the cross-crate caller, without modifying the shared
builder or any existing operation. This addresses the measured wrapper boundary;
no layout manipulation, inline(always), global helper annotation or predicate
reordering is proposed. Compare current artifacts and all gates; if ineffective,
do not iterate attribute placements.
