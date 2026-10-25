from pathlib import Path
import os,time,json,subprocess,signal,hashlib,concurrent.futures,resource
record=Path(__file__).resolve().parent/'phase-and-workflow';record.mkdir(exist_ok=True)
def build(variant):
 root=Path('/tmp/csgrs-r14-'+variant);out=record/variant;out.mkdir(exist_ok=True)
 env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r14-'+variant+'-target',CCACHE_DIR='/tmp/csgrs-r14-'+variant+'-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r14-'+variant+'-ccache/tmp',R14_LEAF_DIRECTORY='/tmp/csgrs-research-2026-10-25/r25-recovered/historical/leaves',PROPTEST_RNG_SEED='20261025')
 patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(out/'source.patch').write_bytes(patch)
 metadata={'patch_sha256':hashlib.sha256(patch).hexdigest(),'source_untracked_module_sha256':hashlib.sha256((root/'crates/hypercurve/src/bezier_parameter/r14_phase_diagnostic.rs').read_bytes()).hexdigest(),'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'lock_sha256':hashlib.sha256((root/'Cargo.lock').read_bytes()).hexdigest(),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','R14_LEAF_DIRECTORY','PROPTEST_RNG_SEED']},'artifacts':{}}
 for kind,selection in [('unit',['--lib']),('workflow',['--test','hypercurve_open_path_compositions'])]:
  cmd=['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features',*selection,'--no-run','--message-format=json'];start=time.time();print('BUILD',variant,kind,flush=True)
  with (out/(kind+'-build.jsonl')).open('w') as stdout,(out/(kind+'-build.stderr')).open('w') as stderr:
   proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=stdout,stderr=stderr,start_new_session=True)
   try:status=proc.wait(timeout=900)
   except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
  if status!=0:raise RuntimeError((variant,kind,status))
  artifacts=[json.loads(line) for line in (out/(kind+'-build.jsonl')).read_text().splitlines() if line.startswith('{')]
  names=[item['executable'] for item in artifacts if item.get('reason')=='compiler-artifact' and item.get('executable') and item['target']['name']==('hypercurve' if kind=='unit' else 'hypercurve_open_path_compositions')]
  assert len(names)==1,names
  binary=Path(names[0]);metadata['artifacts'][kind]={'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size,'command':cmd,'build_elapsed_seconds':time.time()-start}
 assert subprocess.check_output(['git','diff','--binary'],cwd=root)==patch
 (out/'build.json').write_text(json.dumps(metadata,indent=2)+'\n')
 print('BUILT',variant,flush=True);return variant,(root,env,metadata,patch)
with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:built=dict(pool.map(build,['baseline','candidate']))

def bounded_memory():resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
with (record/'runs.jsonl').open('a',buffering=1) as journal:
 for pair in range(5):
  for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
   root,env,meta,patch=built[variant];binary=meta['artifacts']['unit']['path'];name=f'phase-{pair:02}-{variant}'
   cmd=[binary,'bezier_parameter::r14_preparation_acceptance::captured_leaf_outcomes','--exact','--nocapture','--test-threads=1'];limit=120;start=time.time();print('START',name,flush=True)
   journal.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'timeout_seconds':limit,'epoch':start})+'\n')
   with (record/(name+'.log')).open('w') as log:
    proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=bounded_memory)
    try:status=proc.wait(timeout=limit)
    except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
   journal.write(json.dumps({'event':'finish','name':name,'status':status,'elapsed_seconds':time.time()-start})+'\n');print('FINISH',name,status,flush=True)
   if status!=0:raise RuntimeError((name,status))
 for variant in ['candidate','baseline']:
  root,env,meta,patch=built[variant];name='refillet-'+variant
  cmd=['/usr/bin/time','-v',meta['artifacts']['workflow']['path'],'refilleting_a_filleted_vertex_completes','--exact','--ignored','--nocapture','--test-threads=1'];limit=900;start=time.time();print('START',name,flush=True)
  journal.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'timeout_seconds':limit,'address_space_bytes':8*1024**3,'epoch':start,'scope':'one correctness completion, not paired timing admission'})+'\n')
  with (record/(name+'.log')).open('w') as log:
   proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=bounded_memory)
   try:status=proc.wait(timeout=limit)
   except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
  journal.write(json.dumps({'event':'finish','name':name,'status':status,'elapsed_seconds':time.time()-start})+'\n');print('FINISH',name,status,flush=True)
  if status!=0:raise RuntimeError((name,status))
for variant,(root,env,meta,patch) in built.items():assert subprocess.check_output(['git','diff','--binary'],cwd=root)==patch
print('Frozen private sources unchanged throughout diagnostic and workflow runs',flush=True)
