from pathlib import Path
import subprocess, json, time, resource, signal, os
p=Path(__file__).resolve().parent
mode=os.environ.get('R15_PROBE_MODE','native')
d=p/('pilot-'+mode+'-'+str(time.time_ns()));d.mkdir()
(d/'driver.py').write_bytes(Path(__file__).read_bytes())
builds=json.loads((p/('latest-'+mode+'-builds.json')).read_text())
runs=[]
def bounded():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
for kind in range(7):
    for direction in ['forward','reverse']:
        for policy in ['strict','approximate']:
            for variant in ['baseline','candidate']:
                name=f'{kind}-{direction}-{policy}-{variant}'
                cmd=[str(p/(variant+'-'+mode+'-probe')),str(kind),direction,policy,'2',str(d/(name+'.artifact.json'))]
                with (d/(name+'.jsonl')).open('w') as out,(d/(name+'.stderr')).open('w') as err:
                    proc=subprocess.Popen(cmd,stdout=out,stderr=err,start_new_session=True,preexec_fn=bounded)
                    try:status=proc.wait(timeout=120)
                    except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
                runs.append({'name':name,'command':cmd,'status':status})
                if status!=0:print('FAIL',name,status,(d/(name+'.stderr')).read_text()[-1500:],flush=True)
    print('KIND',kind,'done',flush=True)
(d/'metadata.json').write_text(json.dumps({'builds':builds,'runs':runs,'measurement_role':'functional pilot under concurrent validation; timing excluded'},indent=2)+'\n')
print('PILOT',d,'failures',sum(r['status']!=0 for r in runs),flush=True)
