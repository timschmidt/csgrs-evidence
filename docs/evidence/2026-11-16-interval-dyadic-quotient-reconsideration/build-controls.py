from pathlib import Path
import subprocess,json,time,sys,os,shutil,concurrent.futures
s=Path(__file__).parent;r=Path(json.loads((s/'initial-state.json').read_text())['root']);candidate=json.loads((s/'candidate-source.json').read_text())['head']
def run(script,*args):
 cmd=[sys.executable,str(s/script),*args];p=subprocess.run(cmd);assert p.returncode==0,(cmd,p.returncode)
def switch(head):
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
 subprocess.run(['git','switch','--detach',head],cwd=r,check=True)
def parallel(*jobs):
 with concurrent.futures.ThreadPoolExecutor(max_workers=len(jobs)) as pool:
  futures=[pool.submit(run,*j) for j in jobs]
  for f in futures:f.result()
start=time.time();active={'pid':os.getpid(),'started':start,'proc_starttime':Path(f'/proc/{os.getpid()}/stat').read_text().split()[21],'state':'waiting for final candidate qualification before source switches'}
(s/'controls-active.json').write_text(json.dumps(active,indent=2)+'\n')
required=['candidate-fmt','candidate-wasm','candidate-lattice-clippy','candidate-msrv-clippy','candidate-stable-clippy','candidate-owner-artifacts']
while not all((s/(name+'.json')).exists() for name in required):
 if time.time()-start>2100:raise SystemExit('Qualification dependency did not finish; no source switch or barrier release')
 time.sleep(5)
for name in required:assert json.loads((s/(name+'.json')).read_text())['exit_code']==0,name
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate
try:
 switch('17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f')
 shutil.copyfile(s/'external-Cargo.lock',s/'probe/Cargo.lock')
 parallel(('build-probe.py','baseline','external'),('build-owner-artifacts.py','baseline'))
 run('run-resources.py','baseline','external');run('analyze-resources.py','external');run('measure-artifacts.py','external')
 switch('c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb')
 parallel(('build-probe.py','fixed','external'),('build-owner-artifacts.py','fixed'))
 shutil.copyfile(s/'pinned-Cargo.lock',s/'probe/Cargo.lock');run('build-probe.py','fixed','pinned')
finally:
 switch(candidate)
 shutil.copyfile(s/'pinned-Cargo.lock',s/'probe/Cargo.lock')
(s/'controls-complete.json').write_text(json.dumps({'elapsed':time.time()-start,'head':candidate,'status':subprocess.check_output(['git','status','--porcelain'],cwd=r,text=True),'scope':'Build and resource controls terminal; not a source admission or timing claim.'},indent=2)+'\n')
print('Controls built and candidate restored',flush=True)
