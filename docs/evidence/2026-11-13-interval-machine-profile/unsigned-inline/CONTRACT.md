# Inlining only the new typed scalar constructor

The first typed prototype fails binary-size retention in borrowed_ops (+144B)
and successive_operations (+136B), despite smaller profile native/WASM artifacts.
Its full evidence and source remain in ../unsigned. No source is retained.

This experiment changes only the newly introduced unsigned_fraction wrapper by
adding #[inline]. The existing reducer, signed constructor, predicate order,
input domain and typed outcomes remain unchanged. This is a cross-crate scalar
forwarding boundary with input facts established by u64/NonZeroU64. First test
whether an unused new wrapper can avoid changing the owning scalar benchmark's
exception tables and artifact size. Do not waive any gate or modify existing
methods' attributes. If size still grows, reject before broader qualification.
If it passes, repeat affected exact/trace and full native/WASM/cost gates before
retention. Main pending extraction patches remain untouched.
