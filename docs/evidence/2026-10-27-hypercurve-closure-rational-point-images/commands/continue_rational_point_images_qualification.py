from pathlib import Path
import importlib.util,json,os,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-rational-point-images')
started=time.time()
while time.time()-started<21600:
 f=root/'rational-point-images-prototype6-results.json';m=root/'rational-point-images-msrv-probe1.json'
 rows=json.loads(f.read_text()) if f.exists() else []
 if any(r['exit_code']!=0 or not r['source_stable'] for r in rows):raise SystemExit('Focused positive acceptance failed; no continuation.')
 if m.exists():
  msrv=json.loads(m.read_text())
  if msrv['exit_code']!=0 or not msrv['source_stable']:raise SystemExit('MSRV did not pass; no continuation.')
 if len(rows)==11 and m.exists():break
 time.sleep(15)
else:raise SystemExit('External wait expired; no successful completion inferred.')
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
assert e.source_snapshot()[0]==json.loads((root/'rational-point-images-prototype6-source-before.json').read_text())
subprocess.run([sys.executable,str(root/'run_rational_point_images_focused.py')],cwd=checkout,check=True)
source,files,_=e.source_snapshot()
subprocess.run([sys.executable,str(root/'prepare_rational_point_images_documentation.py')],cwd=checkout,check=True)
after,afterfiles,_=e.source_snapshot()
allowed={'crates/hypercurve/README.md','crates/hypercurve/qualification/README.md','crates/hypercurve/qualification/capabilities.json','docs/MIGRATIONS.md'}
assert {n for n,_,_ in files}=={n for n,_,_ in afterfiles}
old={n:(mode,digest) for n,mode,digest in files};new={n:(mode,digest) for n,mode,digest in afterfiles}
assert {n for n in old if old[n]!=new[n]}<=allowed
checks=[]
for name,command in [
 ('fmt',['cargo','+1.99.1','fmt','--all','--','--check']),
 ('matrix-guards',['python3','crates/hypercurve/scripts/test_capability_matrix.py']),
 ('typos',['typos']),('budget',['scripts/check-repository-budget.sh']),('diff',['git','diff','--check']),
]:
 start=time.time()
 with (root/('rational-point-images-preflight-'+name+'.log')).open('w') as out:
  result=subprocess.run(command,cwd=checkout,stdout=out,stderr=subprocess.STDOUT)
 checks.append({'name':name,'command':command,'exit_code':result.returncode,'elapsed_seconds':time.time()-start})
 e.save_json(root/'rational-point-images-preflight-results.json',checks)
 if result.returncode:raise SystemExit('Preflight failed: '+name)
assert e.source_snapshot()[0]==after
e.save_json(root/'rational-point-images-admission-ready.json',{'source':after,'focused_passed':True,'msrv_passed':True,'documentation_only_transition':True,'changed_documentation':sorted(n for n in old if old[n]!=new[n]),'recorded_epoch':time.time()})
with (root/'rational-point-images-closeout-controller.log').open('w') as out:
 watcher=subprocess.Popen([sys.executable,str(root/'close_rational_point_images_when_qualified.py')],cwd=checkout,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
e.save_json(root/'rational-point-images-closeout-launch.json',{'pid':watcher.pid,'recorded_epoch':time.time()})
subprocess.run([sys.executable,str(root/'run_rational_point_images_qualification.py')],cwd=checkout,check=True)
print('All final point-image qualification groups completed. Closeout awaits the qualified differential parent.',flush=True)
