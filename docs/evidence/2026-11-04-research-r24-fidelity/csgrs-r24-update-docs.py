from pathlib import Path
p=Path('crates/hypercurve/PERFORMANCE.md');s=p.read_text();marker='## R07 polynomial pairs in distinct charts (2026-11-04)'
section='''## R24 per-output parallel fidelity (2026-11-04)

At baseline `628ede94d28404cd9e81b85442c81102de6c35d4`, extracted curves
have no per-output fidelity query. The corrected missing-API witness fails to
compile there; an initial metadata-only prototype then demonstrably loses the
receipt at native SVG reload. Hypercurve's immutable parameter lineage owns
this repair (P15/P19/P20/P27/P36). The published domain is the existing
`approximate_parallel_blend2d_certified` primitive path constructor, with
exact restrictions, reversal, copying, native spans, similarities and the
existing native SVG affine image backend. Its smooth-path and moving-corner
preconditions are unchanged. This is a provenance and interchange extension,
not a performance-only refactor or a general closure claim.

`Curve2::parallel_fidelity` borrows one shared construction: the original path,
source index, original signed distance, construction source span, consumed
qualification, metric and verifier leaf count. Exact-image receipts carry zero
error without asserting same-parameter correspondence. Fitted quadratic/cubic
spans retain the verifier's continuous same-parameter Euclidean bound. The
range accessor intentionally reports the original certified span; later exact
restrictions retain a conservative bound, and `source_parameter_at` uses the
existing selected-parameter/lineage authority without scalar projection.
Earlier construction errors remain visible through the immediate source;
this receipt does not silently add them into an end-to-end error budget.
`Curve2::new(curve.geometry().unwrap().clone())` explicitly creates an
unverified source model. Allocation identity is only a sharing accelerator.

Similarities transport the bound by their positive scale. An affine SVG image
retains its actual map and uses the certified operator upper bound
`|a|+|b|+|c|+|d|`; the reference is the transformed original parallel, never an
offset commuting through a shear. Its realized image has fresh incidence
identity. Consecutive affine native restrictions and image maps compose;
reversal pairs and identity maps cancel. Circular restrictions retain their
actual charts, rather than applying a false affine parameter identity. Shared
source paths, shallow debug views and edit normalization avoid copying the
construction DAG into a tree; arbitrary composition still has no uniform cost
bound.

Native SVG tags 33–39 retain source constructions, checked root receipts and
exact edits in the existing graph grammar. A decoder revalidates source paths,
indices, spans, candidate geometry and bounds under STRICT. Serialized flags
never establish a proof; a weaker historical qualification remains weaker.
The caller's `SvgOptions.max_parallel_verification_depth` (default 64) controls
actual verifier subdivision, independently of a serialized generation request.
An actually reached cap returns a named size limit; cancellation/exhaustion is
typed before publication, and a larger-budget retry is not poisoned. Existing
byte/collection/dependency-depth guards remain. These are not bounds on total
work, coefficient growth, allocation, latency or all nested solvers. Export
keeps annotated lines/arcs as paths to avoid dropping the receipt in a string
conversion; see [migration](../../docs/MIGRATIONS.md#per-output-parallel-fidelity-2026-11-04).

The maintained pilot covers mixed exact/fitted output, both policies, scalar
and selected algebraic cuts, reversal/reflection/scaling, shear, circle chart
edits and native spans, explicit unverified reconstruction, the independent
`t³` versus chord error of 3/8, 128 repeated edit pairs, original quadratic
normal formulas, native replay in a fresh child process and subsequent edits.
Separate graph adversaries reject invalid references/ranges/bounds and test
actual depth exhaustion, cancellation and successful retry. A HyperBRep
planar-image consumer restricts/reverses these outputs, saves/reloads them and
queries the retained planar source before another edit. None of this proves
that arbitrary filled arrangements, all other consumers, machine commands or
lossy exports preserve this new receipt. Those R24 obligations remain open;
no region/quantization or moving-join policy is replaced.

Validation and measured cost are recorded below after the final source checks.

'''
assert marker in s;s=s.replace(marker,section+marker,1);p.write_text(s)
p=Path('docs/MIGRATIONS.md');s=p.read_text();section='''## Per-output parallel fidelity (2026-11-04)

Certified primitive path parallels now retain per-output source/fidelity
receipts on `Curve2`, including after extraction and supported exact edits.
`parallel_fidelity()` distinguishes exact images from continuously verified
same-parameter approximations; `None` means unrecorded fidelity. Rebuilding
from raw geometry starts an unverified model. Similarity and affine-image
bounds refer to explicitly transported reference images.

Native SVG graph tags 33–39 add checked construction/edit definitions. Old
plain native payloads retain their grammar; older readers can reject the new
tags as unsupported. Annotated lines/arcs remain `SvgGeometry2` paths after
reimport, instead of becoming strings that would discard their receipts.
Native bytes and container counts can therefore change intentionally; ordinary
SVG rendering still projects the represented geometry. Native import performs
fresh strict verification and can fail typed at its configured resource limit.

`SvgOptions` gains `max_parallel_verification_depth`, default 64 and required
positive. Update exhaustive struct literals, or use `..Default::default()`.
The serialized construction depth request grants no replay budget. A verifier
that actually needs a deeper subdivision returns the named parallel
verification depth limit, allowing an explicit larger-budget retry. This is
not a total-work or memory guarantee. See the [owner qualification](../crates/hypercurve/PERFORMANCE.md#r24-per-output-parallel-fidelity-2026-11-04)
for demonstrated compositions and remaining consumer gaps.

'''
s=s.replace('# Migrations\n\n','# Migrations\n\n'+section,1);p.write_text(s)
p=Path('crates/hypercurve/CHANGELOG.md');s=p.read_text().replace('## [0.4.0] - Unreleased\n\n','''## [0.4.0] - Unreleased

- Retain per-output parallel fidelity through extraction, exact edits and checked
  native SVG replay. Distinguish exact images and same-parameter error bounds;
  preserve source selections and qualification. Native graph tags and annotated
  path/string handling change intentionally; `SvgOptions` gains an independent
  replay verification-depth limit. See the [R24 qualification](PERFORMANCE.md#r24-per-output-parallel-fidelity-2026-11-04)
  for supported compositions, measured costs and remaining consumer gaps.

''',1);p.write_text(s)
p=Path('crates/hypercurve/FUTURE_WORK.md');s=p.read_text();old='''- *Fidelity across split and copy.* `Curve2` lineage keeps source parameter
  identity through split, reversal and transform, but there is no fidelity
  classification on curves. `CertifiedCurvePathParallel2` keeps only aggregate
  exact and approximated counts: after `path()` or `into_path()` a split or
  copied path cannot tell exact parallel curves from verified approximations.
  A per-output-curve source index and fidelity record would preserve it.
  Alumina's moving-join policy uses its own span classification, so this is
  recorded, not changed.
''';new='''- *Fidelity across split and copy.* The R24 curve/path milestone now retains
  per-output source, metric, bound and consumed qualification through extraction,
  supported edits and checked native replay. Selected source parameters are not
  projected to scalars. See the [single owner qualification](PERFORMANCE.md#r24-per-output-parallel-fidelity-2026-11-04)
  for the demonstrated domain and costs. Filled arrangements, other consumers
  and command quantization remain open; Alumina's moving-join policy retains
  its own conservative span classification.
''';assert old in s;s=s.replace(old,new);p.write_text(s)
p=Path('docs/research-program.md');s=p.read_text().replace('| R24 | Retain per-curve fidelity and source correspondence after extraction | pending |','| R24 | Retain per-curve fidelity and source correspondence after extraction | curve/path milestone retained: shared source receipts, exact-image versus pointwise bounds, selected trims, supported image transport and independently checked native replay. See the [owner qualification](../crates/hypercurve/PERFORMANCE.md#r24-per-output-parallel-fidelity-2026-11-04). Filled arrangements, other consumers, command quantization and total resource closure remain open. |');p.write_text(s)
p=Path('crates/hyperbrep/PERFORMANCE.md');s=p.read_text().replace('# HyperBREP Performance Contract\n\n','''# HyperBREP Performance Contract

R24's planar-image receipt consumer is qualified in the [Hypercurve owner record](../hypercurve/PERFORMANCE.md#r24-per-output-parallel-fidelity-2026-11-04).
It exercises restriction, reversal and native persistence of the retained
planar source; it makes no new spatial error-bound or solid-fidelity claim.

''',1);p.write_text(s)
