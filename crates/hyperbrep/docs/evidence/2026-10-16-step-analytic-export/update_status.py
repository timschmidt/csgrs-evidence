"""Update BREP-owned planning and only its entry in the shared property ledger."""
import json
from check import ROOT, OUT

def load(path): return json.loads(path.read_text())
def save(path,value): path.write_text(json.dumps(value,indent=2)+'\n')
m=load(OUT/'manifest.json')
assert all(r['exit_code']==0 and not r['source_differences_from_final'] for r in m['qualification'])
validation=('Twenty final scoped commands pass on identical source snapshots: BREP/IO all-feature debug/release 424 tests each, minimal release 416; strict all-target Clippy in both configurations, warning-denied docs, five examples, fuzz-target compilation, formatting and 30 zero-import WASM groups. Counts overlap and include the explicitly failing native scaling frontier. Independent graph/formula assertions cover every encoded entity/map; seven complete exports pass independent OCCT topology and floating-point volume/area checks. Native replay, split/reflection, Boolean/empty continuation, units, near-coincidence and typed failure/recovery pass. Original failed attempts and the independently corrected hole-area expectation remain retained.')
cost=('Two complete 54-process campaigns preserve required receipts and fixture facts for all 115 prior BREP/STEP/arc cases. The first intermediate header design adds allocation costs; a static-prefix repair restores every measured baseline allocation request and requested-byte total. The final largest case-median timing ratio is '+str(max(r['maximum_ratio'] for r in m['benchmark_campaigns'][1]['summary']))+'. Three final new-domain processes separately measure eight checked/materialized export or edit-roundtrip/rejection workflows. All adverse observations, first-version data, executable sizes and process resources remain. These are descriptive shared-host measurements, not a general speedup or complete timing/memory admission.')
limits=('All 28 work packages remain open. Native uniform analytic scaling is a reproduced unfulfilled workflow and misreports InvalidSurfaceFrame; it requires native frame/radius/chart/pcurve/certificate transport. Other analytic/spline/trim/void/assembly exchange, exact general seam success, full provenance/resource/cancellation bounds and published-package/MSRV/binding delivery stay open. Earlier independent timing exceptions remain. No runtime fuzz/ASan/lexicase, coverage, formal proof, whole-workspace/pre-push campaign or push is claimed.')
entry=dict(id='step-analytic-export',work_packages=['WP00','WP01','WP03','WP14a','WP21'],
    properties=['P1','P2','P3','P6','P8','P9','P15','P16','P17','P18','P19','P20','P25','P26','P27','P35','P36','P37','P39'],
    decision=m['decision'],
    change='Add native borrowed circle/cylinder inspection and exact selected advanced STEP output for plane/cylinder supports and line/circle edges. Preserve explicit native vertex/edge/use/wire/face identities, holes, closed circles, seams, face/edge sense and repeated occurrences. Report exact emitted curve intervals and linear native-to-output UV maps. Share scalar-owned exact rational proofs, integer direction encoding, metadata and limits; reject unsupported/unrepresentable inputs with source sites. StepBody replaces FacetedBody without an alias; native persistence and existing faceted output remain unchanged. No surrounding implementation changes.',
    source='../../hyperbrep-io/src/step/write/advanced/mod.rs',
    source_files=['../src/geometry/analytic.rs','../../hyperbrep-io/src/step/write/advanced/geometry.rs','../../hyperbrep-io/src/step/write/advanced/types.rs','../../hyperbrep-io/src/step/write/metadata.rs'],
    evidence='evidence/2026-10-16-step-analytic-export/manifest.json',validation=validation,cost_evidence=cost,limits=limits)
p=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';s=load(p)
s['updated_on']='2026-10-16';s['increments']=[r for r in s['increments'] if r['id']!=entry['id']]+[entry]
assert len(s['work_packages'])==28 and not s['complete']
s['next_actions'][9]=('Continue WP14a from selected exact faceted and analytic import/export, including supplied pcurves and exact output parameter maps. Preserve direct LINE/CIRCLE topology on PLANE/CYLINDRICAL_SURFACE, independent graph/interoperability checks, native replay and composition. Add other families and successful exact periodic seams without inventing tau from decimal data. WP14b retains spline/trim/void/mapped/assembly exchange and explicit healing/approximation. Fix analytic uniform similarity transport at the native BREP owner, including frames, dimensions, charts, pcurves and retained certificates; the preserved unit workflow fails before IO with InvalidSurfaceFrame. Source maps do not establish whole-document or edit-history persistence.')
save(p,s)
p=ROOT/'docs/properties-status.json';s=load(p);entry=s['current_work']['hyperbrep']
entry['latest_evidence']='crates/hyperbrep/docs/evidence/2026-10-16-step-analytic-export/manifest.json'
entry['qualification']=('On upstream 362e157c1 plus BREP development, admit selected exact analytic STEP export and native borrowed geometry views. All authored code changes stay in BREP/IO; surrounding implementation remains concurrent upstream work. A checkpoint fetch found 72cd216cc (Hilbert trim and gear/airfoil failures); merge and requalification follow in a separate record. '+validation+' '+cost+' '+limits)
save(p,s)
p=ROOT/'crates/hyperbrep-io/PERFORMANCE.md'
text=p.read_text();marker='\n## Selected analytic export (2026-10-16)\n'
if marker in text:text=text.split(marker)[0]
text+=marker+'''
The [admission record](../hyperbrep/docs/evidence/2026-10-16-step-analytic-export/README.md)
and [manifest](../hyperbrep/docs/evidence/2026-10-16-step-analytic-export/manifest.json)
retain frozen baselines, two complete matched campaigns, all failed/adverse
observations and three trials of each new workload. All 115 existing case
receipts and fixture facts survive. The intermediate shared-header implementation
added allocations; selecting one static prefix restores every measured prior
allocation request and requested-byte total, including all faceted export cases.
Final case-median timing ratios range by workload; the largest is 1.079721.
This shared-host comparison is not a general speedup or complete timing gate.

New export-only medians are 124.763 µs for a native partitioned cylinder,
58.463 µs for a closed imported cylinder, 95.988 µs for a partially split
imported cylinder, 148.599 µs for its radical frame, 236.126 µs for a planar
hole, and 3.743 ms for 32 native body occurrences. Each fully materializes and
compares output text and topology reports; independent graph/reimport preflight
is untimed. The separately named three-frame edit/roundtrip matrix is 75.098 ms;
the unrepresentable-third rejection is 10.825 µs. Outcomes are not interchangeable.
Raw allocation and process RSS evidence remains available; neither establishes
a total retained-memory, scalar-work or cancellation bound. All broader gates stay open.
'''
p.write_text(text)
print('Updated only BREP-owned planning/performance and its shared property-ledger entry.')
