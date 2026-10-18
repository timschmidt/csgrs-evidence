# Reject known undefined scalar graphs on import

Native Node decoding now rejects exact rational arguments outside the real
domain of the stored partial function. Children decode before their parents,
so zero products and outer scales cannot conceal a rejected child. The public
Real wrappers return ParseError, and SVG exact-coordinate import preserves a
typed MalformedInput diagnostic before publishing a path.

The final regression covers 44 invalid native forms in JSON and CBOR, direct
and nested graphs, three outer scales, enclosing collections and SVG import.
Valid representations retain their bytes, values and downstream composition.
Independent bounds and domain facts supplement wrapper agreement. The original
parent reproductions, first rejected logarithm guard and all failures remain.
Two open-phase probe binaries were reconstructed after a filename collision;
both match their original execution hashes exactly. Their sources, outputs
and reconstruction receipts are retained, without a physical-continuity claim.
The existing log1p regression caught an incorrect ln-versus-ln1p assumption;
the correction preserves zero and negative residuals above -1, with additional
success tests. No existing valid-input test or full-scale case was weakened.

Final-source checks passed: 934 default and 1,066 all-feature scalar tests,
817 debug units, 24/29 scalar doctests, 366 predicate tests, 22 SVG tests,
60 circuit interchange tests and the recorded geometry/all-feature circuit
targets. Selected strict Clippy, docs and formatting pass. Rust 1.95 checks
cover all targets of Hyperreal, Hyperlimit and Hypercurve with all features
and no default features; no runtime or Clippy run on Rust 1.95 is claimed.

The matched cost controls below each complete 100,000 valid imports, inspect
sign, consume and destroy the value. They use five alternating pairs with
allocator instrumentation; construction and round-trip byte checks are outside
timing. Ratios are candidate/parent medians, and all samples remain available.
This functional repair makes no general speedup claim. Layout remains 48 bytes
and all timed rows retain zero additional live bytes after completion.

| Import | Time ratio | Allocations parent / candidate | Peak bytes parent / candidate |
| --- | ---: | ---: | ---: |
| named-root-cbor | 1.0035 | 1300000 / 1600000 | 656 / 656 |
| named-root-json | 1.0673 | 1300000 / 1600000 | 776 / 776 |
| opaque-root-cbor | 0.9240 | 900000 / 900000 | 528 / 528 |
| opaque-root-json | 0.9696 | 900000 / 900000 | 576 / 576 |
| rational-cbor | 1.0055 | 400000 / 400000 | 128 / 128 |
| rational-json | 1.0435 | 400000 / 400000 | 176 / 176 |
| small-atanh-cbor | 0.9794 | 1100000 / 1100000 | 576 / 576 |
| small-atanh-json | 0.9810 | 1100000 / 1100000 | 672 / 672 |
| trig-cbor | 0.9578 | 1900000 / 1900000 | 704 / 704 |
| trig-json | 0.9866 | 1900000 / 1900000 | 848 / 848 |

Probe executable bytes: parent 6,671,488,
candidate 6,675,736. Unfavorable rows are retained.

Raw logs and protocols are archived on Disk B, with their exact paths and hashes
in external-evidence-v1.json. Every selected physical path is hashed separately;
compiled outputs remain retained. Original root/Disk B/tmp limits remain
16/72/40 GiB, and cumulative logs remain limited to 96 MiB. No baseline reset,
old artifact deletion or historical recovery is claimed.

This is a known-domain rejection step. Named certificate parameters and payload
consistency, non-leaf domain obligations, series-range and quantile seed checks
remain open. The 32-case diagnostic explicitly retains those unrepaired named
certificate findings. Full strict workloads, bindings and shipped distribution
remain open; affine cancellation stays withheld. Hypervoxel is excluded.
No push or completion of the complete properties plan is claimed.
