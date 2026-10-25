from pathlib import Path
import subprocess, json, os, time, signal, hashlib, concurrent.futures

record=Path(__file__).resolve().parent/('paired-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())

def run_variant(variant):
    root=Path('/tmp/csgrs-r23-consumer')/('alumina-interface' if variant=='candidate' else 'alumina-interface-baseline')
    out=record/variant;out.mkdir()
    env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r23-alumina-'+variant+'-target',CCACHE_DIR='/tmp/csgrs-r23-alumina-'+variant+'-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r23-alumina-'+variant+'-ccache/tmp');Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
    patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(out/'source.patch').write_bytes(patch)
    def inventory():
        names=subprocess.check_output(['git','ls-files'],cwd=root,text=True).splitlines()
        return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock']}
    before=inventory();(out/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
    metadata={'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR']},'csgrs_source_inventory':str(Path('/tmp/csgrs-research-2026-10-25/r23/owner-validation-1792940773067831299/sources-before.json')) if variant=='candidate' else '/tmp/csgrs-research-2026-10-25/r23/baseline-source.json','commands':[]}
    def run(name,cmd,limit):
        start=time.time();print('START',variant,name,flush=True)
        with (out/(name+'.log')).open('w') as log:
            proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
            try:status=proc.wait(timeout=limit)
            except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
        metadata['commands'].append({'name':name,'command':cmd,'cwd':str(root),'status':status,'elapsed_seconds':time.time()-start,'timeout_seconds':limit})
        (out/'runs.json').write_text(json.dumps(metadata,indent=2)+'\n');print('FINISH',variant,name,status,flush=True);return status
    status=run('build',['cargo','test','--locked','--offline','--release','-p','alumina-interface-core','--lib','--no-run','--message-format=json'],1200)
    if status==0:
        artifacts=[]
        for line in (out/'build.log').read_text().splitlines():
            if line.startswith('{'):
                row=json.loads(line)
                if row.get('reason')=='compiler-artifact' and row.get('executable') and row['target']['name']=='alumina_interface_core':artifacts.append(row['executable'])
        assert len(artifacts)==1,artifacts
        binary=Path(artifacts[0]);metadata['binary']={'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size}
        for name in ['r23_rational_travel_envelope_uses_the_exact_active_image','travel_fit_uses_exact_curve_extrema_not_control_hulls','exact_source_envelope_must_fit_conservative_machine_travel','rounded_canonical_points_must_remain_inside_usable_travel']:
            run(name,[str(binary),'machine_profile::tests::'+name,'--exact','--nocapture','--test-threads=1'],300)
    after=inventory();(out/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n');assert before==after
    metadata['sources_unchanged']=True;(out/'runs.json').write_text(json.dumps(metadata,indent=2)+'\n')
    return variant,status

with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
    results=list(pool.map(run_variant,['baseline','candidate']))
print('PAIRED CONSUMER',record,results,flush=True)
