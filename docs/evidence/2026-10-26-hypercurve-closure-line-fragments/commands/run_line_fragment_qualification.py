from pathlib import Path
import os,subprocess,sys,json,time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-fillet-contacts')
target=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-contact-admission')
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2'}
patch=subprocess.check_output(['git','diff','--binary','--','crates/hypercurve/src'],cwd=checkout)
(root/'line-fragment-provenance-candidate.patch').write_bytes(patch)
commands=[
 ('fmt',['cargo','+1.99.1','fmt','--all','--','--check'],{}),
 ('msrv-clippy',['cargo','clippy','--locked','-p','hypercurve','--all-targets','--all-features','--','-D','warnings'],{'RUSTUP_TOOLCHAIN':'1.95.0','CARGO_TARGET_DIR':str(target)+'-msrv'}),
 ('full-suite',['cargo','test','--locked','-p','hypercurve','--release','--all-features','--no-fail-fast'],{}),
 ('downstream',['cargo','test','--locked','-p','csgrs','--release','--all-features','--test','adapter_curve_failures','--test','downstream_profiles','--test','exact_profile_sweeps','--test','mixed_modeling_profiles'],{}),
]
records=[]
for name,command,extra in commands:
 assert subprocess.check_output(['git','diff','--binary','--','crates/hypercurve/src'],cwd=checkout)==patch
 print('START',name,flush=True);start=time.time()
 with (root/('line-fragment-final-'+name+'.log')).open('w') as log:
  result=subprocess.run(['/usr/bin/time','-v',*command],cwd=checkout,env={**env,**extra},stdout=log,stderr=subprocess.STDOUT)
 records.append({'name':name,'command':command,'elapsed_seconds':time.time()-start,'exit_code':result.returncode})
 (root/'line-fragment-final-results.json').write_text(json.dumps(records,indent=2)+'\n')
 print('FINISH',name,result.returncode,round(time.time()-start,2),flush=True)
 if result.returncode: sys.exit(result.returncode)
bins=[p for p in (target/'release/deps').glob('hypercurve_open_path_compositions-*') if p.is_file() and p.stat().st_mode&0o111]
assert len(bins)==1,bins
command=['timeout','--signal=TERM','--kill-after=10s','300s',str(bins[0]),'round_stroke_boundary_of_a_filleted_arc_corner_refillets_and_erodes','--ignored','--exact','--nocapture','--test-threads=1']
with (root/'line-fragment-final-original-workflow.log').open('w') as log:
 result=subprocess.run(['/usr/bin/time','-v',*command],cwd=checkout,env=env,stdout=log,stderr=subprocess.STDOUT)
records.append({'name':'original-workflow','command':command,'exit_code':result.returncode})
(root/'line-fragment-final-results.json').write_text(json.dumps(records,indent=2)+'\n')
assert subprocess.check_output(['git','diff','--binary','--','crates/hypercurve/src'],cwd=checkout)==patch
print('ORIGINAL',result.returncode,flush=True)
