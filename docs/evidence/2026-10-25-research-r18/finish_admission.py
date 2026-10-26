from pathlib import Path
import hashlib
import json
import re
import subprocess
import time

raw=Path(__file__).resolve().parent
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
primary=json.loads((raw/'latest-primary-validation.json').read_text())
downstream=json.loads((raw/'latest-downstream-validation.json').read_text())
for check in [primary,downstream]:
    assert check['failed'] is None and check['sources_unchanged']
sources=json.loads((Path(primary['record'])/'sources-after.json').read_text())
assert sources==json.loads((Path(downstream['record'])/'sources-after.json').read_text())
assert all(hashlib.sha256((root/n).read_bytes()).hexdigest()==h for n,h in sources.items())
counts={}
for check in [primary,downstream]:
    counts.update(json.loads((Path(check['record'])/'summary.json').read_text()))
planter=Path(primary['record'])/'full-planter.log'
assert 'test result: ok. 1 passed; 0 failed; 0 ignored;' in planter.read_text()
counts['full-planter.log']={'groups':1,'passed':1,'failed':0,'ignored':0}
events=[json.loads(line) for line in (Path(primary['record'])/'commands.jsonl').read_text().splitlines()]
assert len([e for e in events if e['event']=='finish' and e['status']==0])==16
events2=[json.loads(line) for line in (Path(downstream['record'])/'commands.jsonl').read_text().splitlines()]
assert len([e for e in events2 if e['event']=='finish' and e['status']==0])==4
owner=root/'crates/hyperreal/PERFORMANCE.md'
old='continuation. Final combined-primary validation is pending in this checkpoint.'
brep=counts['hyperbrep.log'];pcb=counts['hypercircuit.log']
new=f'''continuation.

All 20 final primary/downstream checks pass on unchanged source: formatting;
owner default and six-crate all-feature/all-target Clippy with warnings denied;
all-feature documentation; full release suites for Hyperreal (1,381),
Hyperlimit (376), Hypertri (213), Hypermesh (295, seven existing ignores),
Hypercurve (2,633, 35 existing ignores), CSGRS (679, seven existing ignores),
Hyperbrep ({brep['passed']}) and Hypercircuit ({pcb['passed']}); downstream Clippy and docs;
the explicitly requested ignored cylinder matrix, three long successive tests
and full planter; four-owner WASM release builds; repository budget and diff
checks. The source inventory contains 2,352 unchanged inputs. This is affected
change validation, not the complete pre-push matrix or a release claim.'''
text=owner.read_text();assert text.count(old)==1;owner.write_text(text.replace(old,new))
ledger=root/'docs/research-program.md'
lines=ledger.read_text().splitlines()
matches=[i for i,line in enumerate(lines) if line.startswith('| R18 |')];assert len(matches)==1
lines[matches[0]]='| R18 | Prove hard compound rotation relations without a global limit increase | kept for scoped exact completion after all 20 final primary/downstream checks pass on 2,352 unchanged source inputs. Late common-factor recovery completes the original binary64 and decimal workflows plus 18 axis/family/policy cells without raising expanded degree or work limits. Thirty native pairs preserve 227,028,480 predicate results; eight workflow pairs preserve 32 exact artifact pairs. Every protected simultaneous latency upper bound exceeds 1; two scalar controls are marginally adverse, and the deliberate degree-14 decline requests 2,096 more bytes per query. General performance admission fails; no speedup is claimed. See the [owner record](../crates/hyperreal/PERFORMANCE.md#factored-compound-rotation-completion-r18-2026-10-25) and evidence record `2026-10-25-research-r18`. |'
ledger.write_text('\n'.join(lines)+'\n')
decision={
 'created_ns':time.time_ns(),
 'retained_for_exact_completion':True,
 'general_performance_gate_pass':False,
 'owners':['Hyperreal bounded exact relation recognition','Hyperlimit strict predicate consumers','CSGRS/Hypermesh compound-rotation composition'],
 'properties':['P1','P3','P5','P6','P8','P9','P11','P17','P18','P19','P20','P24','P25','P35','P36','P37','P39'],
 'retained_runtime':['crates/hyperreal/src/computable/node/'+n for n in ['ring_product_sum.rs','ring_quotient_reduction.rs','ring_relations.rs']],
 'source_attribution':json.loads((raw/'primary-final-source-attribution.json').read_text()),
 'primary_validation':primary,'downstream_validation':downstream,'validation_counts':counts,
 'source_inputs':len(sources),'all_final_sources_unchanged':True,'final_checks_passed':20,
 'exact_completion':'Original independently imported binary64 angles and distinct exact decimal control, plus 18 axis/family/policy cases; Certified cube union with independent boundary/volume/topology oracle, canonical empty difference and strict empty-union continuation. Two captured predicate zeros independently proved in rational polynomial arithmetic.',
 'retention_scope':'Higher-priority exact completion, with preserved supported corpus and explicitly disclosed costs. No general speedup or latency nonregression claim.',
 'scalar_cost':json.loads((raw/'scalar-cost-decision.json').read_text()),
 'workflow_cost_record':json.loads((raw/'latest-workflow-final.json').read_text()),
 'workflow_artifacts':'64 completed workflows, 32 exact canonical artifact pairs. All four simultaneous latency upper bounds exceed one; no marginal or simultaneous adverse interval. This does not prove universal latency nonregression.',
 'allocation_costs':'Only deliberate degree-14 decline changes requested traffic: +2096 bytes and +68 calls/query in both policy/phase pairs. Every matched live/peak growth row agrees. Probe file +8888 bytes, text +7264 bytes.',
 'limits':'Existing expanded degree/term/coefficient/node/atom/work limits are unchanged and shared; at most 12 admitted factors per product. These are recognizer guards, not operation-wide time/heap bounds.',
 'rejected_variant':'Broader factor reduction without a common-factor requirement violated the existing degree-14 decline test and was removed. The test and failed attempt are retained.',
 'open':['general compound rotations','cold large-graph archives','operation-wide resource/cancellation contracts','the full pre-push workflow matrix','clean external release/package validation','remaining research and API subjects'],
 'publication':'No main-repository commit or push; evidence archive is local until explicitly published.'
}
assert not (raw/'final-disposition.json').exists()
(raw/'final-disposition.json').write_text(json.dumps(decision,indent=2)+'\n')
(raw/'final-primary-sources.json').write_text(json.dumps(sources,indent=2)+'\n')
(raw/'final-primary-source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
final=raw/'final-retained-source';final.mkdir()
for name in [*decision['retained_runtime'],'crates/hyperreal/src/computable/node/ring_product_sum_tests.rs','crates/hyperreal/src/real/arithmetic/facts.rs','tests/compound_rotations.rs']:
    dest=final/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes((root/name).read_bytes())
(raw/'README.md').write_text('''# R18: scoped compound-rotation completion

Retain the late common-factor exact-zero proof for the declared rotation
workflows. General performance admission fails. No speedup is claimed.

`final-disposition.json` links the owner/property contract, all 20 passing
primary/downstream checks, the unchanged source inventory, preserved artifacts,
costs and open work. `primary-final-source-attribution.json` proves the three
retained runtime files match the native measured candidate. The original
binary64 failure and distinct already-successful decimal input remain in
`original-runs-*`; captured predicate graphs have independent rational proofs.

The scalar final campaign checks 227,028,480 results and 6,720 paired rows.
Every protected simultaneous latency upper bound exceeds one; two degree-14
controls are marginally adverse. Separate allocation pairs disclose 2,096 more
requested bytes and 68 more calls per deliberate degree-14 decline. The full
workflow campaign completes 64 workflows and verifies 32 exact artifact pairs;
its four simultaneous upper bounds also exceed one.

Failed intermediate variants, diagnostic captures, oracle setup corrections,
frozen source, commands, native and allocation samples remain in this record.
Compiled binaries are rebuildable and archived by digest, not redistributed.
Recognition limits do not establish operation-wide time or heap bounds.
This record does not complete the wider research program or release gates.
''')
print('R18 FINAL ADMISSION RECORDED',counts,flush=True)
