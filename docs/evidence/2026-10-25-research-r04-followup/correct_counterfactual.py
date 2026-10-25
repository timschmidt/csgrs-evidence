from pathlib import Path
import subprocess,os,json,time,signal,hashlib,re
record=Path(__file__).resolve().parent/'clean-counterfactual';root=Path('/tmp/csgrs-r04-adapter-counterfactual');path=root/'src/curve/native.rs';legacy=path.read_text()
(record/'SOURCE-SCOPE-CORRECTION.txt').write_text('The initial script mislabeled HEAD native.rs plus a Hypercurve-only R12 baseline patch as the original R04 adapter. That scope contains the legacy all-profile quantization function, so all six tests correctly passed. The failing expectation and raw snapshot are preserved. This follow-up installs only the R04 modeling-profile function (plus its import adjustment) from the frozen primary snapshot, then restores the exact legacy file. All other source, lock, checkout and dedicated target remain the same. This forms a clean legacy -> mixed -> legacy comparison without R12 or the later sampler/predicate/triangulation repairs.\n')
assert 'sample_to_linear_contours' not in legacy
new=(Path('/tmp/csgrs-r04-priority-baseline/src/curve/native.rs')).read_text();marker='fn try_modeling_profiles_with(';end='\n/// Finite polygon-with-holes';body=new[new.index(marker):new.index(end,new.index(marker))];mixed=legacy[:legacy.index(marker)]+body+legacy[legacy.index(end,legacy.index(marker)):];mixed=mixed.replace('CurveString2, FinitePolyline2,','CurveString2,')
env=os.environ.copy();env['CARGO_TARGET_DIR']='/tmp/csgrs-r04-counterfactual-only-target';env['CCACHE_DIR']='/tmp/csgrs-r04-counterfactual-ccache';env['CCACHE_TEMPDIR']=env['CCACHE_DIR']+'/tmp';env['PROPTEST_RNG_SEED']='20261025';cmd=['cargo','test','--locked','--release','-p','csgrs','--all-features','--test','downstream_profiles']
for variant,source in [('mixed-profile-function',mixed),('legacy-profile-function-corrected',legacy)]:
 path.write_text(source);subprocess.run(['cargo','fmt','--all'],cwd=root,env=env,check=True)
 patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(record/(variant+'-source.patch')).write_bytes(patch);start=time.time()
 with (record/(variant+'.log')).open('x') as log:
  p=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=600)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='timeout'
 text=(record/(variant+'.log')).read_text();failures=re.findall(r'^test (\S+) \.\.\. FAILED$',text,re.M)
 (record/(variant+'.json')).write_text(json.dumps({'command':cmd,'target':env['CARGO_TARGET_DIR'],'seed':env['PROPTEST_RNG_SEED'],'code':code,'seconds':time.time()-start,'source_sha256':hashlib.sha256(patch).hexdigest(),'failures':failures},indent=2)+'\n');print(variant,code,failures,flush=True)
 if variant=='mixed-profile-function':assert code==101 and set(failures)=={'circle_wall_from_opposite_offsets_keeps_one_hole','quadratic_bezier_region_keeps_algebraic_fragments_until_meshing'},text[-5000:]
 else:assert code==0,text[-5000:]
