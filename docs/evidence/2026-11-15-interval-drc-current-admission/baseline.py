from pathlib import Path
import json,subprocess,os,hashlib,time,shutil
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs');target=Path('/mnt/development/.interval-refactor-build/drc-current-admission');target.mkdir(exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true','CARGO_TERM_COLOR':'never'}
cmd=['cargo','+stable','test','--locked','-p','hyperdrc','--release','--lib','--no-run','--message-format=json'];start=time.monotonic()
with (s/'baseline-build.jsonl').open('w') as out,(s/'baseline-build.log').open('w') as err:p=subprocess.run(cmd,cwd=root,env=env,stdout=out,stderr=err)
record={'command':cmd,'cwd':str(root),'env_overrides':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','CARGO_TERM_COLOR']},'exit_code':p.returncode,'seconds':time.monotonic()-start};(s/'baseline-build.json').write_text(json.dumps(record,indent=2)+'\n');assert not p.returncode
artifacts=[]
for line in (s/'baseline-build.jsonl').read_text().splitlines():
 try:r=json.loads(line)
 except ValueError:continue
 if r.get('reason')=='compiler-artifact' and r.get('executable') and r['target']['name']=='hyperdrc' and r['profile']['test']:artifacts.append(r['executable'])
assert len(artifacts)==1,artifacts
artifact=target/'baseline-hyperdrc-tests';shutil.copy2(artifacts[0],artifact)
(s/'baseline-binary.json').write_text(json.dumps({'path':str(artifact),'bytes':artifact.stat().st_size,'sha256':hashlib.sha256(artifact.read_bytes()).hexdigest(),'source_commit':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'compiler':subprocess.check_output(['rustc','+stable','-Vv'],text=True)},indent=2)+'\n')
print('baseline build complete',flush=True)
cmd=[str(artifact),'--exact','zz_complex_project_performance_tests::kicad_board_completes_smoke_check_suite','--nocapture','--test-threads=1'];start=time.monotonic()
with (s/'baseline-smoke.log').open('w') as out:p=subprocess.run(cmd,cwd=root/'crates/hyperdrc',env=env,stdout=out,stderr=subprocess.STDOUT,timeout=600)
record={'command':cmd,'cwd':str(root/'crates/hyperdrc'),'exit_code':p.returncode,'wall_seconds':time.monotonic()-start,'external_limit_seconds':600,'claim':'original smoke gate result; wall time is not the worker CPU measurement'};(s/'baseline-smoke.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
