from pathlib import Path
import subprocess,json,hashlib,shutil,re,tempfile,datetime,gzip
repo=Path('/tmp/hyperbrep-nonlinear-evidence')
relative='crates/hyperbrep/docs/evidence/2026-11-04-retained-boundary-bridges'
record=repo/relative;record.mkdir(parents=True,exist_ok=True)
prefix='/tmp/hyperbrep-retained-bridges-final2'
receipts=json.loads(Path(prefix+'-validation.json').read_text())
assert len(receipts)==11, len(receipts)
assert all(r['source_unchanged'] and r['status']==(101 if r['name']=='open-target' else 0) for r in receipts)
source=json.loads(Path(prefix+'-source.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in source.items())
count=ignored=0
for r in receipts:
 if r['name']=='open-target':continue
 rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',Path(r['log']).read_text())
 count+=sum(int(x[0]) for x in rows);ignored+=sum(int(x[2]) for x in rows)
assert ignored==1,ignored
for pattern in ['hyperbrep-retained-bridges-*','hyperbrep-retained-topology-*','hyperbrep-bridge-line-*','hyperbrep-bridge-selected-*','hyperbrep-line-replay-recursion.log','hyperbrep-line-before-helper.rs','hyperbrep-trace-bridge-selected.py','hyperbrep-trace-line-recursion.py']:
 for p in Path('/tmp').glob(pattern):
  if p.is_file() and p!=Path(__file__) and not p.name.endswith('increment-draft.json'):shutil.copy(p,record/p.name)
# The temporary full Debug trace expands caches; retain it compressed separately.
p=Path('/tmp/hyperbrep-bridge-rational-trace.log')
if p.exists():
 raw=p.read_bytes();(record/(p.name+'.gz')).write_bytes(gzip.compress(raw,compresslevel=6,mtime=0))
 debug_trace={'raw_bytes':len(raw),'raw_sha256':hashlib.sha256(raw).hexdigest(),'compression':'gzip; diagnostic output only, not a cost measurement'}
else:debug_trace=None
roots=[str(Path('crates',c,d)) for c in ['hypersolve','hypercurve','hyperbrep','hyperbrep-io'] for d in ['src','tests']]
base=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
changed=subprocess.check_output(['git','diff','--name-only','HEAD','--',*roots],text=True).splitlines()
new=subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*roots],text=True).splitlines()
patch=subprocess.check_output(['git','diff','--binary','HEAD','--',*roots])
for name in new:
 r=subprocess.run(['git','diff','--no-index','--binary','--','/dev/null',name],capture_output=True)
 assert r.returncode==1;patch+=r.stdout
(record/'source.patch').write_bytes(patch)
with tempfile.TemporaryDirectory(prefix='hyperbrep-retained-bridge-source-') as work:
 scratch=Path(work)
 for name in changed:
  p=scratch/name;p.parent.mkdir(parents=True,exist_ok=True)
  p.write_bytes(subprocess.check_output(['git','show',base+':'+name]))
 subprocess.run(['git','apply','--check',str(record/'source.patch')],cwd=scratch,check=True)
 subprocess.run(['git','apply',str(record/'source.patch')],cwd=scratch,check=True)
 assert all((scratch/p).read_bytes()==Path(p).read_bytes() for p in changed+new)
info={'source_base':base,'source_patch_sha256':hashlib.sha256(patch).hexdigest(),'reconstructed_files':len(changed+new),'fixed_fingerprints':len(source),'tests_passed':count,'ordinary_ignored':ignored,'final_commands':receipts,'rustdoc_flags':'-D warnings','open_target':'Explicit final-source execution still fails Topology(Geometry(UnsupportedSelectedEvaluation)); boundary contacts are empty for a selected endpoint in locate_surface_curve_split_endpoint. Not conformance success.','candidate_regressions':'Expanded dispatch changed a legacy common-component tangent receipt and the first line evaluation delegation introduced a native/rational evaluator fallback cycle. Both prior-code controls pass. Keep native unmapped rational incidence; extract the existing line affine-form proof as Option, returning missing proofs to the original evaluator. Full final fixed-source polynomial rational corpus passes unchanged.','debug_trace':debug_trace,'observed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'claims':{'general_closure':False,'performance_improvement':False,'whole_resource_bound':False,'wasm_runtime':False,'pre_push':False,'published':False}}
(record/'qualification.json').write_text(json.dumps(info,indent=2)+'\n')
(record/'README.md').write_text('''# Retained boundary bridges\n\nScope: HyperBRep topology retains original selected contacts across material/hole wire attachment; Hypercurve reuses certified parameter-preserving rational line views for mapped polynomial sections; exact graph and tensor-normal proofs establish shell orientation without a mandatory volume integral. P14/P15/P18/P19; no scalar projection, tolerance, new support family or archive schema.\n\nThe ordinary cap-line fixture independently checks its quartic selected ends, both surface lifts, further incidence and subdivision, then the actual two-face partition, material winding, excluded hole, opposite shared-edge ownership, and fresh-process validated replay. The smaller mapped quintic/line test preserves original parameters through reversal, both orders, splitting and later contacts. Nonlinear collinear spans retain their original inverse.\n\nThe full original transverse solid recut remains an executed failure, not geometric completion. The fresh source trace identifies no-contact selected endpoint attachment. General all-operation closure and resource/release work remain open.\n\nqualification.json and raw final2 logs record commands, statuses, counts, timings and source fingerprints. Timings are observations for these runs, not a speedup or total resource envelope. Candidate failures, prior-code controls and the fallback-cycle trace are retained. A full temporary Debug trace is gzip-compressed; it is diagnostic evidence, not a runtime measurement. source.patch reconstructs every changed/new affected Rust source from the recorded base, including untracked new files. No source tree is copied.\n''')
with (record/'toolchain.txt').open('w') as f:
 for cmd in [['rustc','--version'],['cargo','--version'],['uname','-a']]:subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
print(json.dumps({'record':relative,'tests':count,'ignored':ignored,'source_files':len(changed+new),'fingerprints':len(source)}))
