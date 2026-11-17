from pathlib import Path
import hashlib,json,shutil,subprocess,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs');work=Path('/dev/shm/interval-five-repair-packaged');rev='4a04dd9744bfecb578963b42fa3bffef5b7062b5'
assert not work.exists();assert shutil.disk_usage(r).free>=20*1024**3;work.mkdir()
state={}
for name,path in [('primary',r),('evidence',Path('/mnt/development/csgrs-evidence'))]:
 state[name]={cmd:subprocess.check_output(['git',*args],cwd=path,text=True).strip() for cmd,args in [('head',['rev-parse','HEAD']),('branch',['branch','--show-current']),('status',['status','--porcelain=v1']),('ahead_behind',['status','--short','--branch'])]}
assert not state['primary']['status'] and not state['evidence']['status']
(s/'before.json').write_text(json.dumps(dict(time=time.time(),repositories=state,revision=rev),indent=2)+'\n')
p=subprocess.run(['git','worktree','add','--detach',str(work/'source'),rev],cwd=r,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=120)
(s/'worktree-create.log').write_text(p.stdout);assert p.returncode==0
source=Path('/tmp/interval-refactor/solver-five-repair-portable/consumer');h=work/'consumer';h.mkdir()
for name in ['fixture.rs','operation.rs','lib.rs','main.rs','invoke.cjs']:shutil.copy2(source/name,h/name)
(s/'source-equivalence.json').write_text(json.dumps({name:dict(source=str(source/name),copy=str(h/name),sha256=hashlib.sha256((h/name).read_bytes()).hexdigest()) for name in ['fixture.rs','operation.rs','lib.rs','main.rs','invoke.cjs']},indent=2)+'\n')
print(work)
