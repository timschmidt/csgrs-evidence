# Compatible retained library selection

All scope, semantic tests, resource baselines and gates in contract-v1 remain.
The first standalone link failed before runtime. Compiler lookup diagnostics
identify a CSGRS metadata hash mismatch: the default HyperDRC library requests
86bede360d81db86ccfd38b6b6508037, while the retained unversioned libcsgrs.rlib
contains f14f3da60d9b0e96615fb26b4d6d11dc. Later feature-matrix builds reuse that
output filename. The independently frozen test executables remain unchanged;
this does not invalidate their executed results.

Select the coherent libraries from the final actual-main Hypercircuit all-feature
build instead. Hyperreal additionally enables dispatch-trace; the public geometry
test bodies and policies are unchanged. Verify and record the feature lists,
source identities, library hashes and compiler outcome. This is a linking
configuration correction, not a workload reduction or a production change.
Retain the failed compile and the metadata diagnostic. A successful compilation
and execution are still required; compatibility is not assumed from filenames.
