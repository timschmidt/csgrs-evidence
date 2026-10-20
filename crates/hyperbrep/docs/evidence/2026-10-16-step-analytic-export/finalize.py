"""Bind this increment's claims, failures and measurements to its final source."""
import json
import re
import statistics
from check import OUT, ROOT, hashes

def read(name): return json.loads((OUT/name).read_text())
def write(name,value): (OUT/name).write_text(json.dumps(value,indent=2)+'\n')

source=hashes()
write('final-source.json',source)
attempts=[]
for row in read('attempts.json'):
    before=read(row['source'])
    row=row|{'source_differences_from_final':[p for p in sorted(source.keys()|before.keys()) if source.get(p)!=before.get(p)]}
    counts=re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (OUT/row['log']).read_text())
    if counts: row['test_totals']={key:sum(int(x[i]) for x in counts) for i,key in enumerate(['passed','failed','ignored'])}
    attempts.append(row)
labels=['native-debug','native-release','native-minimal','native-clippy','native-minimal-clippy','rustdoc',
        'analytic-example','faceted-example','advanced-example','supplied-example','circular-example','occt-reader',
        'fuzz-check','wasm-build','wasm-runtime','fmt','diff-check','benchmark-build','benchmarks','new-export-benchmarks']
qualification=[next(r for r in reversed(attempts) if r['label']==label) for label in labels]
assert all(r['exit_code']==0 and r['source_unchanged'] and not r['source_differences_from_final'] for r in qualification)
expected=dict(advanced=6,faceted=7,kernel=64,arc=12,closed_edges=5,circles=6,export=6,pcurves=6,edge_images=3)
campaigns=[]
for directory in ['benchmark-v1','benchmark-v2']:
    commands=read(directory+'/commands.json'); binaries=read(directory+'/executables.json')
    assert len(commands)==54 and all(r['exit_code']==0 for r in commands)
    summary=[]
    for kind,count in expected.items():
        rows=read(f'{directory}/{kind}-costs.json');assert len(rows)==count
        old,new=(binaries[side][kind] for side in ['baseline','candidate'])
        assert old['features']==new['features']
        summary.append(dict(kind=kind,cases=count,median_ratio=statistics.median(r['ratio'] for r in rows),
            maximum_ratio=max(r['ratio'] for r in rows),over_ten_percent=[r for r in rows if r['ratio']>1.1],
            allocation_changes=[r for r in rows if r.get('baseline_allocation_per_iteration')!=r.get('candidate_allocation_per_iteration')],
            executable_bytes=dict(baseline=old['bytes'],candidate=new['bytes'],ratio=new['bytes']/old['bytes']),costs=f'{directory}/{kind}-costs.json'))
    campaigns.append(dict(directory=directory,cases=expected,completed_processes=len(commands),summary=summary,
        source_matches_final=read(directory+'/source.json')==source))
assert campaigns[1]['source_matches_final']
assert all(not r['allocation_changes'] for r in campaigns[1]['summary'])
new=read('new-export-costs-v2/summary.json')
assert read('new-export-costs-v2/source.json')==source
receipts=[]
for directory in ['new-export-costs','new-export-costs-v2']:
    for trial in range(1,4):
        rows=[json.loads(line) for line in (OUT/directory/f'trial-{trial}.log').read_text().splitlines()]
        assert len(rows)==8
        receipts.append({r['case']:(r['iterations'],r['outcome'],r['receipt']) for r in rows})
assert all(r==receipts[0] for r in receipts)
checks={r['label']:r for r in qualification}
manifest=dict(
    baseline='0ab4bb9af075ff08d8daf0f46941e73fba3b2835',qualified_upstream='362e157c1dfb39701749ed2c154b0edff717fec0',
    pending_upstream='72cd216cc758d364c9e40b8969fef2df155bec8b',
    integration='A checkpoint fetch found two newer CSGRS grammar corrections. Commit this qualified BREP increment first, then merge and requalify separately; this evidence does not claim that later revision.',
    source='final-source.json',contract='contract.md',qualification=qualification,all_attempts=attempts,
    decision='Keep selected exact analytic STEP export and borrowed native inspection. Restore the existing fixed-prefix allocation path after measuring the intermediate regression. Preserve every failed attempt, both campaigns and all broader gates.',
    ideas=[
        dict(idea='Read exact analytic carrier data through borrowed native views',decision='kept',evidence='Native reversed/subcurve/frame tests and independent emitted-graph formulas; no archive inspection or fitted carrier.'),
        dict(idea='Emit direct LINE/CIRCLE topology instead of approximating periodic UV values',decision='kept',evidence='Primary advanced-face schema, exact graph/roundtrip tests and independent OCCT reads.'),
        dict(idea='Use scalar-owned rational certificates and positive homogeneous direction ratios',decision='kept',evidence='Oblique/radical, sense, unit, map and nonrepresentability controls; no new scalar implementation.'),
        dict(idea='Share metadata through several prefix/string writes',decision='rejected',evidence='benchmark-v1 preserves outputs but increases faceted allocation requests/bytes. header-v1.rs.txt retains that version.'),
        dict(idea='Select one static prefix per output encoding',decision='kept',evidence='benchmark-v2 restores every measured prior allocation receipt and all output receipts; new export checksums match the first version.'),
        dict(idea='Repair native cylinder scaling in the IO layer',decision='rejected',evidence='The full failed native workflow remains open in scaling-frontier.md; charts and retained certificates belong to BREP.'),
        dict(idea='Claim general STEP or native archive completeness',decision='rejected',evidence='Other families, voids, source history, total work/memory/cancellation and release gates remain open.'),
    ],
    cache_contract='Per-selected-body lookup tables use immutable model-bound vertex/edge/surface identity. Unit/policy are fixed for one call. First-use order controls emission, never hash iteration. Tables drop on completion/failure; there is no new global cache. Output cardinalities do not establish a heap-byte bound.',
    migration='StepBody replaces FacetedBody with no alias. write_faceted remains a distinct supported encoding. Native persistence is unchanged; advanced exchange reports new curve and surface parameterizations and does not serialize native pcurves/history.',
    failed_attempts=dict(missing_api=['baseline-advanced-export-1.log','baseline-advanced-export-2.log','baseline-test-v1.rs','baseline-test-v2.rs'],
        development=['focused-export-1.log','implementation-v1.patch','graph-matrix-1.log','graph-matrix-2.log','graph-test-v1.rs.txt','graph-test-v2.rs.txt','focused-clippy-1.log','analytic-bench-v1.rs.txt'],
        environment='environment-notes.md',native_scaling='scaling-frontier.md',oracle_expectation='oracle-correction.md',header_allocation='benchmark-v1/export-costs.json'),
    count_scope='Configurations overlap. 424 all-feature debug/release and 416 minimal tests include inherited tests, two view tests, nine export/frontier tests and docs. The scaling-frontier test records failure, not a newly certified workflow.',
    wasm=read(checks['wasm-runtime']['log']),independent_reader=read(checks['occt-reader']['log']),
    benchmark_campaigns=campaigns,new_export_costs=new,first_new_export_costs=read('new-export-costs/summary.json'),
    benchmark_scope='Three alternating CPU-0 pairs per corpus on a shared host. 115 existing cases preserve required rows, output sizes/checksums and fixture facts. Eight separately named new workflows have three absolute trials. Requested allocation bytes and process RSS are observations, not total-work/retained-memory bounds; no broad speedup or complete performance gate is claimed.',
    limits=['All 28 work packages stay open.','Native uniform analytic scaling fails before export with InvalidSurfaceFrame; complete similarity transport and correct diagnostics remain open.',
        'Other analytic/spline/trim/void/assembly exchange and exact general seam success remain open.',
        'No new total scalar-work/heap/cancellation bounds, composed operation provenance or published-package/MSRV qualification.',
        'No runtime fuzz/ASan/lexicase campaign, coverage or formal proof; fuzz targets compile only. WASM is a source consumer, not a released JS binding.',
        'No full workspace/pre-push campaign and no push. Earlier independent timing exceptions remain unchanged.'])
write('manifest.json',manifest)
rows='\n'.join(f"| {r['kind']} | {r['cases']} | {r['median_ratio']:.6f} | {r['maximum_ratio']:.6f} |" for r in campaigns[1]['summary'])
new_rows='\n'.join(f"| {r['case']} | {r['outcome']} | {r['median_ns']/1000:.3f} | {r['allocation_calls_per_iteration']:.3f} | {r['requested_bytes_per_iteration']:.3f} |" for r in new['costs'])
(OUT/'README.md').write_text(f'''# Exact selected analytic STEP export

Qualified on `0ab4bb9af` plus this increment, containing upstream `362e157c1`.
The final checkpoint fetched `72cd216cc`; merging/requalifying it is a separate
step. This evidence must not be attributed to that later source revision.

The [contract](contract.md), [manifest](manifest.json) and
[source hashes](final-source.json) bind the API, domain, every attempt and cost
observations. All 20 final scoped qualification/measurement commands passed on
identical source snapshots: BREP/IO debug and release **424 tests each**, minimal
release **416**, strict all-target Clippy in both feature configurations,
warning-denied docs, five examples, fuzz-target compilation, formatting and
**30 zero-import WASM groups**. These configurations overlap; no release or
complete workspace qualification is inferred.

Native borrowed circle/cylinder views feed `write_advanced`. The output keeps
explicit vertex/edge/use/wire/face identities, face sense, holes, closed circles,
shared seams and repeated occurrences. Reports retain exact curve intervals and
linear surface chart maps. Independent graph/formula checks cover native and
imported models, partial/reversed arcs, supplied pcurves, oblique/radical frames,
split/reflection, units, 1e-12 separation, archive replay and Boolean/empty
continuation. OCCT independently reads seven exported examples with expected
topology and floating-point volume/area; that is interoperability, not exactness.

`StepBody` replaces `FacetedBody` without an alias. Faceted output remains a
distinct encoding. Native pcurves/history and unused geometry require the native
archive; other carriers, voids and unavailable decimal encodings fail typed.
Output limits and solver scopes do not bound all scalar work, memory or cancellation.

## Preserved and new costs

Both complete campaigns remain: [first](benchmark-v1/commands.json) and
[final](benchmark-v2/commands.json), **54 processes each**, covering **115 cases**.
Required output receipts and fixture facts agree throughout. The first shared
header design increased faceted allocations; [its source](header-v1.rs.txt) and
adverse costs remain. Selecting one static prefix restores all measured prior
allocation requests and requested-byte totals. Final case-median timing ratios
are descriptive shared-host observations, not a general speedup or statistical
release-performance admission.

| Corpus | Cases | Median ratio | Maximum ratio |
| --- | ---: | ---: | ---: |
{rows}

Three [final new-domain trials](new-export-costs-v2/summary.json) retain eight
separate costs. Six export-only workloads check/materialize every output against
an untimed independent graph/reimport preflight. `edit_roundtrip` includes the
three-frame edit/export/graph/replay matrix. Rejection is a distinct outcome.
All new-workflow receipts match the [first version](new-export-costs/summary.json).

| Workflow | Outcome | Median µs | Allocation requests | Requested bytes |
| --- | --- | ---: | ---: | ---: |
{new_rows}

## Preserved failures and open gates

Missing API/compiler findings, the corrected test expressions and duplicate
module finding remain in the [attempt ledger](attempts.json). The
[temporary-disk linker failure](environment-notes.md) and
[incorrect independent area expectation](oracle-correction.md) retain their
original logs and inputs. No geometry, fixture or tolerance was weakened.

The [native scaling frontier](scaling-frontier.md) preserves the complete failed
uniform-scale/export workflow. Unit tests construct exact physical dimensions
directly; that does not establish scaling closure. Pcurves/history are not an
archive in this encoding. General seams, other analytic/spline/void/assembly
exchange, complete provenance/resource bounds, runtime fuzz/ASan/lexicase,
coverage, formal proof and published-package/binding/MSRV gates remain open.
All **28 work packages remain open**. No push was performed.
''')
print('Final source-bound qualification and both cost campaigns recorded.')
