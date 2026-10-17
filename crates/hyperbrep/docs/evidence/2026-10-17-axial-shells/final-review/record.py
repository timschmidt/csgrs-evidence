"""Record admitted BREP progress while preserving the shared ledger's other bytes."""
import hashlib,importlib.util,json,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,hashes
read=lambda p:json.loads(p.read_text())
write=lambda p,x:p.write_text(json.dumps(x,indent=2)+'\n')
sha=lambda data:hashlib.sha256(data).hexdigest()
q=read(OUT/'qualification-summary.json');r=read(OUT/'resource-summary.json');c=read(OUT/'cost-summary.json')
assert q['source']==r['source']==c['source']==hashes() and read(OUT/'finish-checks.json')['passed']
assert not q['upstream_debug_blocked']
evidence=str(OUT.relative_to(ROOT));relative='evidence/'+OUT.name;identity='axial-shell-continuation-2026-10-17'
a=q['preceding_artifact_counts']
validation=f"Native/IO release suites pass 600 all-feature and 592 minimal-feature tests. All 33 focused debug tests, full/minimal all-target warning-denied Clippy, external consumer lint, warning-denied rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. Actual source-path WASM executes 138 groups with zero imports, retaining all 127 preceding groups. Eight rotated/reflected partial-depth native/STEP workflows complete independently derived volume/area, incidence, exact near-boundary classification, cold replay, repeated cuts, plug reconstruction, transverse cuts, complete removal and recovery; scale and two distant periodic seams add three native groups. All 24 original full-size prism cases return native results, including the four previously unsupported partial shells. All 81 preceding native diagnostic outcomes remain; diagnostic counts alone are not semantic admission. The preceding artifact inventory contains {a.get('unchanged',0)} byte-identical and {a.get('migrated',0)} deliberately migrated native/STEP outputs. Native line/circle extrusion walls now use plane/cylinder carriers with exact charts/orientation; complete affine prism promotion preserves the original shear domain. Original general-path round-cap measurement blockers remain. Initial compile/continuation, shear, periodic, representation assertion and lint failures remain reconstructible. Supporting runtime is unchanged; inherited scalar zero-factor failures remain upstream-owned."
cost=f"All 184 preceding cases across 21 full benchmark corpora retain original inputs, iterations, assertions and materialization; {len(c['migrations'])} changed receipts are explicit representation migrations, with deterministic per-revision output and separate semantic acceptance. Eight new complete workflows have absolute cost only. Three alternating pairs per old corpus and three new-corpus processes total 129 fresh processes. Median case ratio {r['timing_ratio_median']:.6f}, range {r['timing_ratio_range'][0]:.6f}–{r['timing_ratio_range'][1]:.6f}; {len(r['adverse_timing_rows'])} rows exceed the 10% review marker and {len(r['increased_allocation_rows'])} have increased allocation requests. All raw/adverse observations, CPU/wall/RSS, requested allocation bytes and executable sizes remain. Exact capability and continued consumption justify retention as a feature, not an optimization or all-cohort performance admission. Shared-host timings do not establish significance; allocation requests do not bound live heap and harness sizes are not distribution sizes."
validation+=' The supplemental benchmark STEP capture reproduces both changed exchange receipts: two identity outputs are identical and two reflected outputs change only six cylinder axis signs and one exactly coplanar plane origin. Every other STEP byte is identical, and all eight old/new files pass the independent reader. Its initial missing-fixture project-assembly failure is retained separately.'
cost+=' The NURBS-boundary path-extrusion probe regresses from 0.690851 to 1.211483 ms (1.753610x), with all three candidate samples slower than all three baselines; butt-region exchange regresses by 13.3% and 15.3%. These adverse results require follow-up isolation, not dismissal as timer noise. New complete workflows take about 2.1-3.1 seconds and request about 0.75-1.13 GB cumulatively; eight-row process peak RSS is 23,572-24,036 KiB.'
limits=[
 'Admission covers complete axial plane/cylinder shells with orthogonal native side charts and proved cap/contact/link structure. General curved embedding, non-prismatic affine analytic images, arbitrary trimmed surfaces and separate void-shell arrangements remain open.',
 'One preceding diagonal prism result still has an unencodable STEP vertex. General Boolean closure and complete STEP/EXPRESS/AP support require separate exact evidence; optional floating-point readers do not establish exact source fidelity.',
 'The optional OCCT reader flags one original unrotated lower thin-layer STEP shape: three exact vertices at height 1e-9 mm are absent after import with reported tolerance 1e-7 mm. All eight rotated/reflected outputs are valid and all independent measures agree. Preserve this interoperability limitation without changing exact geometry.',
 'No total-work, retained-heap, expression/coefficient-growth or end-to-end cancellation bound is added. Finite chart enumeration, solver counters and external test timeouts are distinct from those contracts.',
 'Source qualification, shipped package/MSRV, actual C/Python/JavaScript distribution, full coverage, formal proofs, runtime fuzz/ASan/lexicase, release and complete pre-push gates remain open. No push; all 28 work packages stay open/in progress.',
 'Inherited scalar zero-factor failures, historical adverse costs and unrelated upstream work remain separate obligations. Supporting-crate runtime is unchanged; necessary future supporting changes remain authorized in their owning crates.'
]
write(OUT/'retention-decision.json',dict(decision='kept',reason='Complete exact partial-depth shell admission, native/STEP replay and continued modeling for the original four blocked cases and their transformed variants. Intentional greenfield carrier/API migration is explicit; no unsupported failure is presented as completed geometry.',validation=validation,cost=cost,limits=limits))
write(OUT/'idea-ledger.json',[
 dict(idea='Whole-band native section proof, per-loop oriented multiplicity, exact cap transitions and contact/vertex-link ownership',decision='kept',evidence='Original full-size cases, independent formulas/points/incidence, invalid controls, cold replay and complete consumers; review.md'),
 dict(idea='Admit a shell from positive volume, a carrier whitelist or midpoint samples without whole-band proof',decision='rejected',evidence='contract.md and axial_shell.rs require complete edge/chart restrictions, contact ownership and oriented cap coverage before using a section'),
 dict(idea='Retain cylinder UV witnesses through exact coincident chart transition and authored periodic lifts',decision='kept',evidence='Strict chart reversal/origin/phase and near-distinct controls; repeated cuts, reflected reconstruction, 1e-12 layers and +/-100-turn seams'),
 dict(idea='Coalesce only complete collinear intervals and deduplicate circular images by complete anchored map equality',decision='kept',evidence='Original reflected recut diagnostics; tiny-gap and complementary-arc rejection controls; all original consumers retained'),
 dict(idea='Deduplicate curved split traces by matching endpoints or replace overlapping curved intervals without source evidence',decision='rejected',evidence='The retained continuation failures distinguish duplicate parameterizations from complementary or overlapping images; both pcurves and original graph incidences persist'),
 dict(idea='Native plane/cylinder carriers for native extrusion profiles, with exact affine promotion for sheared prisms',decision='kept',evidence='Migration inventory, all old supported workflows, original shear regression plus cold reflection, independent measures and STEP readers'),
 dict(idea='Publish native cylinders then reject previously supported shears',decision='rejected',evidence='Reproduced full unit-suite regression; complete actual-chart cylinder-to-extrusion promotion restores the prior domain'),
 dict(idea='Finite meridian support subdivision of closed periodic cylinder faces',decision='kept',evidence='Retained failed +/-100-turn single-face notch workflow; exact clipping, native/STEP continuation and full-corpus qualification'),
 dict(idea='Existing Hypercurve region authority, strict validation and typed uncertainty',decision='already-satisfied',evidence='Reused unchanged; no second region kernel, tolerance, approximate terminal or serialized proof flag'),
 dict(idea='External tolerance sewing or display triangulation as production shell authority',decision='architecture-inapplicable',evidence='Exact pure-Rust native/WASM contract; optional OCCT remains an interoperability reader'),
 dict(idea='Avoid the temporary generic carrier allocation before native specialization',decision='rejected',evidence='Deferred from this feature: no isolated completed-contract measurement justifies an additional runtime optimization; all current costs remain visible')
])
status_path=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';status=read(status_path)
assert not any(x['id']==identity for x in status['increments'])
properties=['P1','P3','P5','P6','P8','P9','P11','P12','P13','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39']
status['increments'].append(dict(id=identity,work_packages=['WP00','WP03','WP04','WP06','WP07','WP08','WP14a','WP21'],properties=properties,change='Admit complete piecewise prismatic plane/cylinder shells with retained exact band witnesses, shared contacts and manifold vertex links. Preserve coincident cylinder chart/UV evidence, normalize complete split traces, publish native extrusion carriers and preserve the prior affine prism domain. Qualify partial-depth native/STEP/WASM continuation with an explicit representation migration.',source='../src/topology/validation/axial_shell.rs',evidence=relative+'/manifest.json',validation=validation,cost_evidence=cost,limits=' '.join(limits)))
assert status['next_actions'][0].startswith('Complete genuine partial-depth')
status['next_actions'][:2]=[
 'Use '+relative+'/manifest.json as the current exact axial-shell baseline. Preserve all 24 original full-size native successes, 81 preceding diagnostics, eight complete transformed STEP workflows, scale and distant seam controls, 138 WASM groups and all original 1e-12 layers. Extend the next reproduced unsupported curved-shell/Boolean/STEP domain with independent geometry, topology, source-fidelity and downstream composition evidence.',
 'Retain the explicit native plane/cylinder carrier migration, complete affine prism transport, all preceding artifact comparisons, 184 original benchmark cases and eight new complete-work rows. Isolate the 1.75x NURBS-boundary extrusion and 13-15% butt-region exchange regressions in BREP construction/admission/certificate storage before claiming a cost improvement. Keep every failed candidate and adverse measurement. The remaining unencodable diagonal STEP vertex, general rational-path measurement, source qualification and resource/delivery gates are separate problems; do not silently approximate them.'
]
write(status_path,status)
ledger_path=ROOT/'docs/properties-status.json';before=ledger_path.read_text();ledger=json.loads(before);brep=ledger['current_work']['hyperbrep']
brep.update(latest_evidence=evidence+'/manifest.json',latest_feature_evidence=evidence+'/manifest.json',latest_implementation=identity,qualification=validation+' '+cost+' '+' '.join(limits))
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('spans',helper);spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
after=spans.replace_brep(before,brep);ledger_path.write_text(after)
write(OUT/'ledger-update.json',dict(before_sha256=sha(before.encode()),after_sha256=sha(after.encode()),scope='Only current_work.hyperbrep changed; all surrounding bytes preserved.',helper_sha256=sha(helper.read_bytes())))
plan_path=ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md';plan=plan_path.read_text()
a=plan.index('The [axial intersection prerequisite]');b=plan.index('Upstream mesh containment now',a)
plan=plan[:a]+f'''The [axial-shell continuation]({relative}/README.md) completes the four
original partial-depth result cases through exact native admission, cold replay,
STEP and further modeling. Whole-band wall structure, per-loop oriented winding,
exact cap differences, shared geometric contacts and connected vertex links
precede publication. The retained region/height certificate owns volume and
point classification. Cylinder coincidence retains complete chart maps and UV
witnesses; finite meridian support cuts preserve closed periodic-face workflows.
Native line/circle extrusion walls now use plane/cylinder carriers with explicit
chart/orientation maps. This is an intentional native/STEP representation and
error-variant migration; exact promotion preserves the original prism shear
support. Keep all original inputs and independent expectations, the eight new
rotated/reflected exchanges, scale and distant-seam controls, 138 WASM groups,
every old artifact comparison and all cost observations. General curved-shell,
Boolean/STEP, source-qualification, resource and delivery gates remain open.

'''+plan[b:];plan_path.write_text(plan)
matrix_path=ROOT/'crates/hyperbrep/docs/SUPPORT_MATRIX.md';matrix=matrix_path.read_text()
a=matrix.index('The [axial continuation evidence]');b=matrix.index('Public `union`',a)
matrix=matrix[:a]+f'''The [axial-shell evidence]({relative}/README.md) completes the three original
partial-depth cylinder cuts and covering reversed difference. Eight rationally
rotated/reflected workflows verify independent measures, incidence, thin-layer
and event classification, cold replay, repeated cuts, reconstruction, transverse
cuts, empty recovery and STEP reimport. Scale and +/-100-turn closed periodic
seams have additional continuation controls. All 24 original prism cases now
return native results; one diagonal result still rejects an unencodable STEP
vertex. These counts do not certify arbitrary combinations.

Admission requires whole-band lateral coverage, unit section winding, exact cap
transitions, shared contact topology and one connected cycle per vertex link.
A retained frame/height/region certificate owns volume and point classification.
Separate void shells and general non-axial curved embedding remain outside this
proof. Native line/circle extrusion sides publish planes/cylinders, deliberately
changing native/STEP bytes; exact finite extrusion promotion preserves supported
prism shears. Generic rational profiles retain their extrusion carrier.
Coincident-cylinder ownership retains the source UV and exact chart transition;
conflicting material sides return `CoincidentOwnershipAmbiguous`.

'''+matrix[b:]
matrix=matrix.replace('Native line/arc caps and extrusion sides','Native line/arc caps and plane/cylinder sides')
matrix=matrix.replace('Native `CurvePath2` caps and one exact extrusion side per persistent path curve; through-holes share one genus shell','Native `CurvePath2` caps and one exact side per persistent path curve (native lines/circles specialize to planes/cylinders); through-holes share one genus shell')
matrix=matrix.replace('Other curved\ncoincidence remains a typed unsupported boundary;', 'Coincident cylinders additionally retain complete angular/axial chart transitions\nand authored-periodic trim ownership. Other curved coincidence remains a typed\nunsupported boundary;')
matrix_path.write_text(matrix)
architecture_path=ROOT/'crates/hyperbrep/docs/ARCHITECTURE.md'
architecture=architecture_path.read_text()
assert '## Axial-shell certificates and native carrier transport' not in architecture
architecture+=f'''
## Axial-shell certificates and native carrier transport

Topology's [axial-shell admission](../src/topology/validation/axial_shell.rs)
proves complete plane/cylinder boundary structure before publishing a partial-depth
solid. All native lateral edge/chart images are constant through each open
height band. Shared axial edge identities assemble simple section loops whose
individual winding transitions prove multiplicity one; Hypercurve owns the
resulting material regions. Exact cap differences, event contacts and connected
vertex links establish the transitions and embedding. Separate void shells and
general curved embedding remain outside this certificate.

`CertifiedAxialShell` is private immutable model data: a frame, exact event
heights and region/area bands. It is indexed by the owning solid, scoped to that
model's geometry and strict proof. Builder admission and validated transfer
retain it; edits clear it and cold archives reconstruct it. There is no public
proof flag, separate mutable cache or global identity key. Stored regions and
vectors have no independent retained-byte budget; this is not a heap or total-work
bound. Native volume and point classification consume the same certificate,
including exact event-side ownership and transformed frames.

[Cylinder chart transitions](../src/geometry/periodic_charts.rs) prove complete
angular sign/phase and axial sign/displacement maps. Boolean selection retains
the source UV witness and checks the opposite authored trim directly. Native
iso traces keep complete spatial/pcurve images; meridian support subdivisions
only partition the existing face and preserve original intersection incidences.

Native line/circle extrusion walls now publish planes/cylinders with explicit
chart and orientation maps. This is a greenfield representation/API migration,
with the measured artifact differences recorded in the [feature evidence]({relative}/README.md).
Before a supported non-similarity transform of a certified prism, exact
[carrier promotion](../src/topology/transform/affine_prisms.rs) restores a finite
extrusion representation over the actual angular trims. Its equation and pcurves
are unchanged, preserving the original axial-shear domain. Other unsupported
analytic affine images still fail explicitly; no fitting or tolerance is used.
'''
architecture_path.write_text(architecture)
for name,link in [('crates/hyperbrep/PERFORMANCE.md','docs/'+relative),('crates/hyperbrep-io/PERFORMANCE.md','../hyperbrep/docs/'+relative)]:
 path=ROOT/name;text=path.read_text();first,rest=text.split('\n',1)
 section=f'''\n\n## 2026-10-17: partial-depth axial shells and continued modeling

Kept for exact capability and downstream consumption. [Admission evidence]({link}/README.md)
retains the four original blocked result cases, their complete continuations,
and the original shear and periodic failures. Native extrusion carriers and
some native/STEP artifacts intentionally migrate; this is not performance-only
work.

{cost}

[All adverse rows and new absolute costs]({link}/costs.md) retain the full
workloads and all raw samples. [Artifact and receipt review]({link}/migration-review.md)
separates deterministic representation changes from semantic preservation.
Source qualification, resource, package and historical performance obligations
remain open. All 28 work packages remain open/in progress.
'''
 path.write_text(first+section+rest)
assert hashes()==q['source']
print('Recorded admitted axial-shell feature and BREP-only ledger update.',flush=True)
