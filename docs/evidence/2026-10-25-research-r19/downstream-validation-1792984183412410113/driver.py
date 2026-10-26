from pathlib import Path
import hashlib,json,os,re,signal,subprocess,time
from runtime_manifest import assert_runtime
raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r19-trace')
record=raw/f'downstream-validation-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes());(record/'runtime_manifest.py').write_bytes((raw/'runtime_manifest.py').read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target',CARGO_BUILD_JOBS='1',CARGO_PROFILE_RELEASE_DEBUG='0',RUSTFLAGS='',PROPTEST_RNG_SEED='20261025')
def inventory():
    names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
    return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])}
before=inventory();assert_runtime(before,'candidate');(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
owner=json.loads((raw/'latest-private-validation.json').read_text());assert owner['failed'] is None
owner_sources=json.loads((Path(owner['record'])/'sources-after.json').read_text());assert owner_sources.keys()==before.keys()
changed=[n for n in before if before[n]!=owner_sources[n]];assert changed==['crates/hypertri/src/collinear.rs'],changed
(record/'owner-source-diff.json').write_text(json.dumps({'owner_validation':owner['record'],'changed_since_owner_validation':changed,'reason':'Only a new cfg(test) Hypertri source-buffer/policy acceptance test; all Hyperreal/Hyperlimit compiled source/manifests unchanged.'},indent=2)+'\n')
(record/'collinear.rs').write_bytes((root/'crates/hypertri/src/collinear.rs').read_bytes())
checks=[('fmt',['cargo','fmt','--all','--','--check'],300)]
for package in ['hypertri','hypermesh','hyperbrep']:
    checks.append((package,['cargo','test','--locked','--offline','--release','-p',package,'--all-features','--no-fail-fast','--','--test-threads=2'],2400))
checks.extend([
 ('clippy',['cargo','clippy','--locked','--offline','--release','-p','hypertri','-p','hypermesh','-p','hyperbrep','--all-features','--all-targets','--','-D','warnings'],1800),
 ('docs',['cargo','doc','--locked','--offline','--release','-p','hypertri','-p','hypermesh','-p','hyperbrep','--all-features','--no-deps'],1200),
 ('diff',['git','diff','--check'],120),
])
rows=[];failed=None
for name,cmd,limit in checks:
    print('R19 DOWNSTREAM START',name,flush=True);start=time.monotonic();check_env=env.copy()
    if name=='docs':check_env['RUSTDOCFLAGS']='-D warnings'
    with (record/(name+'.log')).open('x') as out:
        p=subprocess.Popen(cmd,cwd=root,env=check_env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
        try:status=p.wait(timeout=limit)
        except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
    rows.append({'name':name,'command':cmd,'status':status,'seconds':time.monotonic()-start,'timeout_seconds':limit});(record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n');print('R19 DOWNSTREAM FINISH',name,status,flush=True)
    if status!=0:failed=name;break
after=inventory();assert before==after;(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
counts={}
for row in rows:
    matches=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (record/(row['name']+'.log')).read_text())
    if matches:counts[row['name']]={'passed':sum(int(r[0]) for r in matches),'failed':sum(int(r[1]) for r in matches),'ignored':sum(int(r[2]) for r in matches),'groups':len(matches)}
result={'record':str(record),'failed':failed,'sources_unchanged':True,'counts':counts,'owner_validation':owner['record'],'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_PROFILE_RELEASE_DEBUG','RUSTFLAGS','PROPTEST_RNG_SEED']}}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n');(raw/'latest-downstream-validation.json').write_text(json.dumps(result,indent=2)+'\n');print('R19 DOWNSTREAM COMPLETE',record,failed,flush=True)
raise SystemExit(0 if failed is None else 1)
