from pathlib import Path
import subprocess,json,hashlib,shutil,re,tempfile,datetime
repo=Path('/tmp/hyperbrep-nonlinear-evidence')
relative='crates/hyperbrep/docs/evidence/2026-11-04-selected-endpoint-chains'
record=repo/relative;record.mkdir(parents=True,exist_ok=True)
prefix='/tmp/hyperbrep-selected-attachment-final3'
receipts=json.loads(Path(prefix+'-validation.json').read_text())
assert len(receipts)==7,len(receipts)
assert all(r['source_unchanged'] and r['status']==(101 if r['name']=='open-target' else 0) for r in receipts)
fuzz=json.loads(Path(prefix+'-fuzz-retry-validation.json').read_text())
assert fuzz['status']==0 and fuzz['source_unchanged']
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==v for p,v in fuzz['fingerprints'].items())
receipts.append({k:v for k,v in fuzz.items() if k!='fingerprints'})
source=json.loads(Path(prefix+'-source.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in source.items())
curve=json.loads(Path('/tmp/hyperbrep-selected-attachment-curve-scope.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in curve['unchanged_current_fingerprints'].items())
assert all(r['status']==0 for r in curve['raw_receipts'])
count=ignored=0;groups={}
for r in receipts+curve['raw_receipts']:
 if r['name']=='open-target':continue
 rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',Path(r['log']).read_text())
 passed=sum(int(x[0]) for x in rows);skipped=sum(int(x[2]) for x in rows)
 count+=passed;ignored+=skipped
 groups[r['name']]={'passed':passed,'ignored':skipped}
for pattern in ['hyperbrep-selected-attachment-*','hyperbrep-trace-selected-domain.py']:
 for p in Path('/tmp').glob(pattern):
  if p.is_file() and not p.name.endswith('increment-draft.json'):shutil.copy(p,record/p.name)
roots=[str(Path('crates',c,d)) for c in ['hypersolve','hypercurve','hyperbrep','hyperbrep-io'] for d in ['src','tests']]
base=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
changed=subprocess.check_output(['git','diff','--name-only','HEAD','--',*roots],text=True).splitlines()
new=subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*roots],text=True).splitlines()
patch=subprocess.check_output(['git','diff','--binary','HEAD','--',*roots])
for name in new:
 r=subprocess.run(['git','diff','--no-index','--binary','--','/dev/null',name],capture_output=True)
 assert r.returncode==1;patch+=r.stdout
(record/'source.patch').write_bytes(patch)
with tempfile.TemporaryDirectory(prefix='hyperbrep-selected-attachment-source-') as work:
 scratch=Path(work)
 for name in changed:
  p=scratch/name;p.parent.mkdir(parents=True,exist_ok=True)
  p.write_bytes(subprocess.check_output(['git','show',base+':'+name]))
 subprocess.run(['git','apply','--check',str(record/'source.patch')],cwd=scratch,check=True)
 subprocess.run(['git','apply',str(record/'source.patch')],cwd=scratch,check=True)
 assert all((scratch/p).read_bytes()==Path(p).read_bytes() for p in changed+new)
for row in json.loads(Path('/tmp/hyperbrep-selected-attachment-fixture-migration.json').read_text()):
 old=subprocess.check_output(['git','show',base+':'+row['path']])
 current=Path(row['path']).read_bytes()
 assert current==old.replace(b'"version":16',b'"version":17',1)
 assert hashlib.sha256(old).hexdigest()==row['before_sha256'] and hashlib.sha256(current).hexdigest()==row['after_sha256']
info={'source_base':base,'source_patch_sha256':hashlib.sha256(patch).hexdigest(),'reconstructed_files':len(changed+new),'final_source_fingerprints':len(source),'tests_passed':count,'ordinary_ignored':ignored,'groups':groups,'final_commands':receipts,'curve_scope':{'fingerprints':len(curve['unchanged_current_fingerprints']),'commands':curve['raw_receipts'],'qualification':'These lower-layer sources remain byte-identical. During the curve integration command, BRep-only acceptance/scheduler changes superseded the broader first campaign. Its raw source_unchanged=false is retained; only the unchanged Hypercurve/Hypersolve scope is qualified by these curve commands. All final affected BRep/downstream checks run in final3 after the final code edit.'},'fuzz_consumer_fingerprints':len(fuzz['fingerprints']),'rustdoc_flags':'-D warnings','open_target':'The unchanged original full transverse recut explicitly fails graph: Geometry(UnrepresentablePoint). A restored temporary backtrace locates selected_edge_endpoints in stitch_graph_faces, after partition and selection. Not a conformance success.','candidate_regressions':'Grouping an existing boundary junction gave two faces instead of three. Disabling only new open-chain scheduling restores the prior three-region result. Final scheduling groups strictly interior junctions, excludes interior-crossing traces from deferred open chains, and preserves independent material witnesses and replay. A second prior scheduling control preserves four material regions when another trace passes through a chain junction. Final endpoint crossing masks retain that incidence and break the deferred chain at the new boundary. Other failures expose selected chart reversal/materialization, attachment and cold replay before the final fixes. All failed and superseded receipts are retained.','superseded_build_interruption':'Final2 was superseded by the later junction fix. Concurrent rebuilding for final3 removed a pending selected_planar_images executable before final2 could launch it; that test was never executed in final2. Its raw status 101 and source_unchanged=false remain archived. Final3 runs alone on frozen source and must complete the full suite.', 'fuzz_build_control':'The initial native fuzz-consumer check failed when ccache attempted to write outside the sandbox. The same locked offline check retries with CCACHE_DISABLE=1; both command receipts and logs remain retained. No source, feature or validation policy is changed.', 'migration':'Only the version discriminator changes in the three cone fixtures; exact payload hashes and reconstruction checks are retained. Format 17 checks PointOnChord incidence, finite domain, typed backward references and logical dependency depth.','observed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'claims':{'general_closure':False,'performance_improvement':False,'whole_resource_bound':False,'wasm_runtime':False,'pre_push':False,'published':False}}
(record/'qualification.json').write_text(json.dumps(info,indent=2)+'\n')
(record/'README.md').write_text('''# Selected endpoint attachment and open chains\n\nScope: Hypercurve native-line inverse queries and point-order reversal/identity laws; HyperBRep endpoint attachment, atomic open-chain scheduling, retained junctions, pcurve chart transport and checked native replay. P6/P14/P15/P17/P18/P19/P20. No sampling, scalar coordinate projection or support fitting.\n\nThe acceptance uses the unique unit root of a^5+a-1, selected endpoints with no boundary-contact records, shared canonical edge uses, independent material witnesses on both sides, reordered/reversed chain inputs, cold and fresh-process replay, and a subsequent edge split. Wrong target faces, mismatched UV parameter frames, forged off-support/wrong-kind/forward selectors and small dependency-depth budgets retain explicit failure, with larger-budget retry. Native-line inverse tests retain independent selected fields, source/reversed/trimmed charts, excluded intervals and 2^-60 distinct parallels.\n\nAn additional review witness caught an incorrect two-face result at an existing boundary junction. The prior scheduling control preserves three distinct material regions. Final scheduling groups only strictly interior junctions, leaves boundary junctions as separate edits, excludes traces with interior contacts from deferred open chains and retains the original exact fixture plus separate region witnesses and native replay. A second three-trace witness preserves four material descendants when a support cut crosses a junction; its prior scheduling control passes and final endpoint crossing masks retain that incidence.\n\nNative format 17 adds PointOnChord to the existing selected-definition DAG. The explicit 16-to-17 migration changes only the version field in three original cone fixtures. Defining payloads and all original selectors remain unchanged.\n\nThe original nonlinear tensor solid recut advances through face partition and selection to the still-scalar stitching census, where selected_edge_endpoints returns UnrepresentablePoint. It remains an executed failure, not geometric completion; all-operation closure and resource/release work stay open. The restored backtrace identifies the next owner.\n\nqualification.json separates successful commands, unchanged lower-layer curve scope, superseded/failed campaigns and the open full target. The first campaign deliberately stops when BRep-only acceptance/scheduler edits change its broader fingerprint; the curve command is qualified solely against its unchanged Hypercurve/Hypersolve dependency scope. Final3 runs all final affected BRep/downstream checks after the last code edit. Timings are observations, not a speedup or total resource envelope. source.patch reconstructs all changed/new affected Rust sources and JSON fixtures from the recorded base, including untracked new files. No source tree is copied. The three native fuzz consumer bins compile; no fuzz execution, sanitizer or coverage result is claimed. Evidence is local and unpublished.\n''')
with (record/'toolchain.txt').open('w') as f:
 for cmd in [['rustc','--version'],['cargo','--version'],['uname','-a']]:subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
print(json.dumps({'record':relative,'tests':count,'ignored':ignored,'source_files':len(changed+new),'fingerprints':len(source),'groups':groups}))
