from pathlib import Path
import hashlib,json,subprocess,time
from runtime_manifest import assert_runtime,runtime_sources
raw=Path(__file__).resolve().parent;root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
primary=json.loads((raw/'latest-primary-validation.json').read_text())
downstream=json.loads((raw/'latest-primary-downstream-validation.json').read_text())
for check in [primary,downstream]:assert check['failed'] is None and check['sources_unchanged']
sources=json.loads((Path(primary['record'])/'sources-after.json').read_text())
assert sources==json.loads((Path(downstream['record'])/'sources-after.json').read_text())
assert len(sources)==2354 and all(hashlib.sha256((root/n).read_bytes()).hexdigest()==h for n,h in sources.items())
assert_runtime(sources,'candidate')
counts={}
for check,total in [(primary,16),(downstream,4)]:
    events=[json.loads(line) for line in (Path(check['record'])/'commands.jsonl').read_text().splitlines()]
    assert len([e for e in events if e['event']=='finish' and e['status']==0])==total
    counts.update(json.loads((Path(check['record'])/'summary.json').read_text()))
assert 'test result: ok. 1 passed; 0 failed; 0 ignored;' in (Path(primary['record'])/'full-planter.log').read_text()
counts['full-planter.log']={'groups':1,'passed':1,'failed':0,'ignored':0}
expected={'hyperreal':(1396,0),'hyperlimit':(376,0),'hypertri':(214,0),'hypermesh':(295,7),'hypercurve':(2633,35),'csgrs':(679,7),'hyperbrep':(669,0),'hypercircuit':(354,0)}
for name,(passed,ignored) in expected.items():
    assert counts[name+'.log']['passed']==passed and counts[name+'.log']['ignored']==ignored,(name,counts[name+'.log'])
attribution=[]
for scope in ['cost','construction','workflow']:
    modes=['native'] if scope=='workflow' else ['native','allocations']
    for mode in modes:
        name=f'latest-{scope}-build-candidate'+('' if scope=='workflow' else '-'+mode)+'.json'
        build=json.loads((raw/name).read_text());measured=json.loads(Path(build['sources']).read_text())
        assert {n:measured[n] for n in sources}==sources
        attribution.append({'scope':scope,'mode':mode,'record':build['record'],'sha256':build['sha256'],'all_repository_inputs_match':True})
edits={}
def replace(path,old,new):
    path=root/path;text=edits.get(path,path.read_text());assert text.count(old)==1,(path,old);edits[path]=text.replace(old,new)
replace('crates/hyperreal/PERFORMANCE.md',
'''The candidate is applied for final primary/downstream validation, which remains
pending. Its retention basis is scoped exact completion under P1–P6, P8–P11,
P18–P20 and P26–P27. Performance-only admission fails. Independent evidence
archival also remains pending; no release or complete pre-push claim is made.''',
'''Retained for scoped exact completion under P1–P6, P8–P11, P18–P20 and
P26–P27 after all 20 final primary/downstream checks pass on 2,354 unchanged
source/manifests. Performance-only admission fails. Evidence record
`2026-10-25-research-r19` retains the failed prototypes and adverse costs;
see the [archive ledger](../../docs/evidence-archive.md#local-follow-on-records).
No release or complete pre-push claim is made.''')
replace('crates/hyperreal/PERFORMANCE.md',
'''The Hypertri addition tests source-buffer identity and policy admission;
caller collinearity assertions remain trusted mathematical preconditions.''',
'''The Hypertri addition tests source-buffer identity and policy admission;
caller collinearity assertions remain trusted mathematical preconditions.

Final main validation repeats those full suites and adds Hypercurve (2,633,
35 existing ignores), CSGRS (679, seven existing ignores), Hypercircuit (354),
the original full cylinder matrix, three long successive-operation tests and
full planter. All pass, together with default/all-feature owner and downstream
Clippy, all-feature docs, four-owner WASM release builds, formatting, repository
budget and diff checks. There are 49 default ignores; five hard controls are
explicitly executed. All measured candidate repository inputs match the final
source. Packaged-consumer and complete pre-push matrices remain separate.''')
replace('crates/hyperreal/FUTURE_WORK.md','The R19 candidate is in final repository validation. Bounded domain replay,','The scoped R19 change passes final repository validation. Bounded domain replay,')
replace('crates/hyperreal/CHANGELOG.md','''  may now retain an exact-one expression. R19 is in final validation and
  records adverse construction costs; no general speedup is claimed.''','''  may now retain an exact-one expression. The R19 admission records adverse
  construction costs; no general speedup is claimed.''')
replace('docs/MIGRATIONS.md','''The R19 candidate, currently in final validation, may construct an exact `One`
computable expression''','''The R19 exact-completion change may construct an exact `One` computable
expression''')
replace('docs/MIGRATIONS.md','fixtures that pin those newly constructed expression bytes after admission.','fixtures that pin those newly constructed expression bytes.')
ledger=root/'docs/research-program.md';lines=ledger.read_text().splitlines();indexes=[i for i,line in enumerate(lines) if line.startswith('| R19 |')];assert len(indexes)==1
lines[indexes[0]]='| R19 | Audit cold proof continuation and real resource bounds at import boundaries | kept for scoped exact completion after all 20 final primary/downstream checks pass on 2,354 unchanged source inputs: 303 new exact import/consumer cells and cold exact BRep archive replay. Thirty scalar pairs and eight workflow pairs preserve all declared results/artifacts, but fail general performance admission: 101 of 118 simultaneous upper bounds exceed one, with three adverse native-construction metrics. Costs, intentional expression changes and still-missing cumulative resource contracts are recorded in the [owner record](../crates/hyperreal/PERFORMANCE.md#cold-domain-continuation-and-resource-audit-r19-2026-10-25) and evidence record `2026-10-25-research-r19`. |'
edits[ledger]='\n'.join(lines)+'\n'
decision={'created_ns':time.time_ns(),'retained_for_exact_completion':True,'general_performance_gate_pass':False,
          'admission':json.loads((raw/'admission-decision.json').read_text()),'primary_validation':primary,'downstream_validation':downstream,
          'validation_counts':counts,'final_checks_passed':20,'source_inputs':len(sources),'all_final_sources_unchanged':True,
          'measured_source_attribution':attribution,'runtime_sources':runtime_sources('candidate'),
          'cost_summary':json.loads((raw/'latest-expanded-cost-summary.json').read_text()),
          'completed_scope':'303 new Exact public consumer cells, no observed old exact-success regression, same-byte cold BRep archive with exact corner/volume/certainty oracle; checked imported wires preserved. Newly constructed shared reciprocal One expressions intentionally change representation.',
          'open':['General cumulative arithmetic/work/heap/stack/cancellation contracts','Unhandled huge-shift Laurent and approximation fallbacks','Recursive teardown','Complete pre-push matrix','Published package/release boundary','Remaining research and API subjects'],
          'publication':'The user has requested closeout and publication after full required pre-push validation. This experiment record does not claim those subsequent release checks or pushes have completed; planning requirements are committed separately.'}
assert not (raw/'final-disposition.json').exists()
for path,text in edits.items():path.write_text(text)
(raw/'final-disposition.json').write_text(json.dumps(decision,indent=2)+'\n')
(raw/'final-primary-sources.json').write_text(json.dumps(sources,indent=2)+'\n')
(raw/'final-primary-source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
final=raw/'final-retained-source';final.mkdir()
for name in json.loads((raw/'latest-primary-application.json').read_text())['changed_files']:
    dest=final/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes((root/name).read_bytes())
(raw/'README.md').write_text('''# R19: cold exact domain continuation and resource audit

Retain the scoped exact-completion change after all 20 final primary/downstream
checks pass. The general performance-only gate fails. No general speedup is
claimed, and cumulative arithmetic/heap/cancellation contracts remain open.

`final-disposition.json` links the checked contract, source attribution,
validation counts, costs and unresolved work. The frozen four-file runtime
manifest and ten retained runtime/test files match the measured candidate.
The two public matrices execute 1,106 fresh processes and establish 303 newly
Exact sign/division/orientation cells. A baseline-native 82,012-byte BRep archive
now reloads with exact corners, volume and certainty, preserving every byte.

Thirty final scalar pairs validate 15,656,040 imports and 13,763,040 native
constructions; eight workflow pairs validate 64 full workflows and 32 exact
artifact pairs. Of 118 protected simultaneous latency upper bounds, 101 exceed
one. Nine metrics are marginally adverse and three simultaneously adverse.
The large-graph reciprocal decline grows from 70.22 to 200.59 ns in warm
medians. All raw samples, including pilots and unfavorable controls, remain.
Five counting-System pairs show no measured allocation increases. Native
executable growth is about 5 KB; these are not deployed package/WASM sizes.

Imported wires are unchanged. Newly constructed shared reciprocal products
can intentionally retain an exact One graph, with compatible cancellation
handles. Failed Laurent, import-only and sign-only prototypes, process panics,
allocation aborts, oracle/test-extension records and corrected harness setup
are preserved. No failure or hard original fixture is removed to pass a gate.

Source/domain/resource inventories distinguish audited entry points and actual
executed coverage from open general bounds. External process containment is
not an internal exhaustion API. Compiled binaries are rebuildable and excluded
from the archive with digests; large text artifacts may be losslessly compressed.
This record does not complete the broader research program or release gates.
''')
print('R19 FINAL ADMISSION RECORDED',counts,flush=True)
