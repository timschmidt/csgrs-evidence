from pathlib import Path
import subprocess,json,hashlib,shutil,re,tempfile,datetime
repo=Path('/tmp/hyperbrep-nonlinear-evidence');relative='crates/hyperbrep/docs/evidence/2026-11-04-selected-trim-carriers';record=repo/relative
record.mkdir(parents=True,exist_ok=True)
receipts=json.loads(Path('/tmp/hyperbrep-selected-trims-final-validation.json').read_text())
assert len(receipts)==7 and all(r['status']==0 and r['source_unchanged'] for r in receipts)
assert 'Finished' in Path('/tmp/hyperbrep-selected-trims-clippy-point-carriers.log').read_text()
source=json.loads(Path('/tmp/hyperbrep-selected-trims-final-source.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in source.items())
count=0;ignored=0
for r in receipts:
    rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',Path(r['log']).read_text())
    count+=sum(int(x[0]) for x in rows);ignored+=sum(int(x[2]) for x in rows)
assert (count,ignored)==(668,1),(count,ignored)
assert 'Topology(Geometry(UnrepresentableParameter))' in Path('/tmp/hyperbrep-selected-trims-final-open-target.log').read_text()
for pattern in ['hyperbrep-selected-trims-*','hyperbrep-selected-contact-payload-*','hyperbrep-selected-cap-line-replay-*','hyperbrep-folding-projection-dual-chart-*','hyperbrep-foreign-selected-inverse-*']:
    for p in Path('/tmp').glob(pattern):
        if p.is_file() and p!=Path(__file__):shutil.copy(p,record/p.name)
for name in ['hyperbrep-recut-instrumentation.patch','hyperbrep-recut-caller-instrumentation.patch','hyperbrep-recut-instrumented.log','hyperbrep-recut-caller.log','hyperbrep-trace-recut.py','hyperbrep-generalize-trims.py','hyperbrep-nonlinear-curve-checks.log','hyperbrep-selected-incidence-validation.json','hyperbrep-selected-incidence-final-validation.json','hyperbrep-selected-incidence-final-clippy.log','hyperbrep-selected-incidence-wasm-optional-dependency.txt']:
    p=Path('/tmp')/name
    if p.exists():shutil.copy(p,record/p.name)
roots=[str(Path('crates',c,d)) for c in ['hypersolve','hypercurve','hyperbrep','hyperbrep-io'] for d in ['src','tests']]
base=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
changed=subprocess.check_output(['git','diff','--name-only','HEAD','--',*roots],text=True).splitlines()
new=subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*roots],text=True).splitlines()
patch=subprocess.check_output(['git','diff','--binary','HEAD','--',*roots])
for name in new:
    result=subprocess.run(['git','diff','--no-index','--binary','--','/dev/null',name],capture_output=True)
    assert result.returncode==1
    patch+=result.stdout
(record/'source.patch').write_bytes(patch)
with tempfile.TemporaryDirectory(prefix='hyperbrep-selected-trim-source-') as work:
    scratch=Path(work)
    for name in changed:
        p=scratch/name;p.parent.mkdir(parents=True,exist_ok=True)
        p.write_bytes(subprocess.check_output(['git','show',base+':'+name]))
    subprocess.run(['git','apply','--check',str(record/'source.patch')],cwd=scratch,check=True)
    subprocess.run(['git','apply',str(record/'source.patch')],cwd=scratch,check=True)
    assert all((scratch/p).read_bytes()==Path(p).read_bytes() for p in changed+new)
info={'source_base':base,'source_patch_sha256':hashlib.sha256(patch).hexdigest(),'reconstructed_files':len(changed+new),'fixed_fingerprints':len(source),'tests_passed':count,'ordinary_ignored':ignored,'final_commands':receipts,'strict_clippy':{'command':'cargo clippy --offline --locked -p hypercurve -p hyperbrep -p hyperbrep-io --all-targets --all-features -- -D warnings','status':0,'log':'hyperbrep-selected-trims-clippy-point-carriers.log'},'full_recut':'explicitly executed on final fixed source; fails Topology(Geometry(UnrepresentableParameter)); not conformance success','legacy_processes':{'81222':{'status':0,'coverage':'older/mixed-source library and polynomial campaign; not current qualification'},'77504':{'status':101,'cause':'optional comparative-feature WASM getrandom dependency; mixed source'},'20423':{'status':101,'cause':'Clippy compiled a transitional parameter/point type migration; not stable final source'}},'observed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'claims':{'general_closure':False,'performance_improvement':False,'whole_resource_bound':False,'wasm_runtime':False,'pre_push':False,'published':False}}
(record/'qualification.json').write_text(json.dumps(info,indent=2)+'\n')
with (record/'toolchain.txt').open('w') as f:
    for cmd in [['rustc','--version'],['cargo','--version'],['uname','-a']]:subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
print('prepared evidence',relative,'tests',count,'changed/new source files',len(changed+new))
