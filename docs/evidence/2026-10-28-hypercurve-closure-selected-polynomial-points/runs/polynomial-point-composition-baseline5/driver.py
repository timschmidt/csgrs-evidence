from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-polynomial-points';record=c/'polynomial-point-composition-baseline5';record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();assert before['revision']=='c57653e9963a199e88fdfddac3d60f5ff9b07351'
import os
target=r.parent/'hypercurve-selected-circle-points-admission'
env={**os.environ,'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'2','RUSTUP_TOOLCHAIN':'1.98.1'}
command=['cargo','build','--locked','--release','--all-features','-p','hypercurve','--message-format=json']
start=time.time()
with (record/'build.jsonl').open('w') as out,(record/'build.log').open('w') as log:
 built=subprocess.run(command,cwd=w,env=env,stdout=out,stderr=log,timeout=3600)
e.save_json(record/'build-result.json',{'command':command,'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','RUSTUP_TOOLCHAIN']},'exit_code':built.returncode,'elapsed_seconds':time.time()-start})
assert built.returncode==0
assert e.source_snapshot()[0]==before
artifacts=[json.loads(row) for row in (record/'build.jsonl').read_text().splitlines()]
def library(name):return Path(next(f for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']==name for f in row['filenames'] if f.endswith('.rlib')))
(record/'original.rs').write_bytes((c/'polynomial-point-composition-tests.rs').read_bytes());e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
libs={'hypercurve':library('hypercurve'),'hypersolve':library('hypersolve')};deps=libs['hypersolve'].parent
def hashes():return {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in libs.values()}
hashes_before=hashes();binary=record/'original';command=['rustc','+1.98.1','--edition=2024','--test','-C','opt-level=3',str(record/'original.rs'),'--crate-name','polynomial_point_composition_baseline','-L','dependency='+str(deps)]
for name,path in libs.items():command += ['--extern',name+'='+str(path)]
command += ['-o',str(binary)]
commands=[('compile',command)]+[(name,[str(binary),name,'--exact','--nocapture']) for name in ['independent_polynomial_point_sources_satisfy_original_equations','independent_polynomial_point_queries_compose_and_replay','independent_polynomial_point_zero_divisor_stays_invalid']]
rows=[]
for name,command in commands:
 start=time.time()
 with (record/(name+'.log')).open('w') as out:p=subprocess.run(command,cwd=w,stdout=out,stderr=subprocess.STDOUT,timeout=120)
 after,af,_=e.source_snapshot();rows.append({'name':name,'command':command,'exit_code':p.returncode,'elapsed_seconds':time.time()-start,'source_stable':before==after});e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af)
 print(rows[-1],flush=True);assert after==before
 if name=='compile':assert p.returncode==0
assert hashes_before==hashes()
e.save_json(record/'attribution.json',{'source':before,'libraries_sha256':hashes_before,'compiled_under':'polynomial-point-composition-baseline5/build.jsonl','read_only_library_reuse':True,'cargo_builds_started':1,'note':'Fresh build and reproduction on the actual geometric implementation checkout, before code edits. The full pre-push campaign uses different checkouts and build caches.'})
assert [row['exit_code'] for row in rows]==[0,0,101,0]
failed=(record/'independent_polynomial_point_queries_compose_and_replay.log').read_text();assert 'Blocked(ExactCurveBlocker' in failed and 'reason: Unsupported' in failed
e.save_json(record/'complete.json',{'source':before,'controls_passed':2,'composition':'Unsupported','all_expected_outcomes_reproduced':True,'epoch':time.time()})
