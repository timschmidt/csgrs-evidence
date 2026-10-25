from pathlib import Path
import subprocess,os,json,time,signal,hashlib,re
record=Path(__file__).resolve().parent/'clean-counterfactual';record.mkdir(exist_ok=False)
repo=Path('/home/tim/Documents/GitHub/workspace/csgrs');root=Path('/tmp/csgrs-r04-adapter-counterfactual')
subprocess.run(['git','clone','--shared','--no-hardlinks',str(repo),str(root)],check=True)
patch=(record.parent.parent/'r12/baseline-measurement-source.patch').read_bytes();subprocess.run(['git','apply','--whitespace=nowarn','-'],input=patch,cwd=root,check=True)
env=os.environ.copy();env['CARGO_TARGET_DIR']='/tmp/csgrs-r04-counterfactual-only-target';env['CCACHE_DIR']='/tmp/csgrs-r04-counterfactual-ccache';env['CCACHE_TEMPDIR']=env['CCACHE_DIR']+'/tmp';env['PROPTEST_RNG_SEED']='20261025';Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
cmd=['cargo','test','--locked','--release','-p','csgrs','--all-features','--test','downstream_profiles']
for variant in ['original-r04-without-r12','legacy-profile-function']:
 if variant=='legacy-profile-function':
  path=root/'src/curve/native.rs';current=path.read_text();old=subprocess.check_output(['git','show','HEAD:src/curve/native.rs'],cwd=root,text=True)
  marker='fn try_modeling_profiles_with(';end='\n/// Finite polygon-with-holes'
  old_body=old[old.index(marker):old.index(end,old.index(marker))]
  current=current[:current.index(marker)]+old_body+current[current.index(end,current.index(marker)):]
  current='use hypercurve::FinitePolyline2;\n'+current;path.write_text(current)
  subprocess.run(['cargo','fmt','--all'],cwd=root,env=env,check=True)
 source=subprocess.check_output(['git','diff','--binary'],cwd=root);(record/(variant+'-source.patch')).write_bytes(source)
 start=time.time()
 with (record/(variant+'.log')).open('x') as log:
  p=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=1200)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='timeout'
 text=(record/(variant+'.log')).read_text();failures=re.findall(r'^test (\S+) \.\.\. FAILED$',text,re.M)
 (record/(variant+'.json')).write_text(json.dumps({'command':cmd,'target':env['CARGO_TARGET_DIR'],'seed':env['PROPTEST_RNG_SEED'],'code':code,'seconds':time.time()-start,'source_sha256':hashlib.sha256(source).hexdigest(),'failures':failures},indent=2)+'\n')
 print(variant,code,failures,flush=True)
 if variant=='original-r04-without-r12':
  assert code==101 and set(failures)=={'circle_wall_from_opposite_offsets_keeps_one_hole','quadratic_bezier_region_keeps_algebraic_fragments_until_meshing'},text[-5000:]
 else:assert code==0,text[-5000:]
