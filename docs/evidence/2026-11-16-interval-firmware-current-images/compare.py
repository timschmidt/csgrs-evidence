from pathlib import Path
import json,os,subprocess,time,traceback
s=Path(__file__).parent;r=Path('/mnt/development/interval-firmware-current/alumina-firmware')
current=json.loads((s/'sources.json').read_text())['alumina-firmware']['revision']
while not ((s/'barrier/result.json').exists()):time.sleep(2)
link=Path('/tmp/interval-refactor/coordinated-ci/runs/firmware.current.images.barrier')
if link.is_symlink():link.unlink()
try:
 assert (s/'completed.json').exists(), 'Current build campaign failed'
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==current
 base=s/'baseline';base.mkdir(exist_ok=False)
 old=subprocess.check_output(['git','show','2d68e82b^:crates/alumina-clock/src/lib.rs'],cwd=r)
 (r/'crates/alumina-clock/src/lib.rs').write_bytes(old)
 (base/'source-restoration.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=r))
 subprocess.run(['git','add','crates/alumina-clock/src/lib.rs'],cwd=r,check=True)
 subprocess.run(['git','commit','-m','qualification(clock): restore pre-publication implementation for matched images'],cwd=r,check=True)
 sources=json.loads((s/'sources.json').read_text());sources['alumina-firmware']['revision']=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()
 (base/'sources.json').write_text(json.dumps(sources,indent=2)+'\n')
 code=(s/'run.py').read_text().split('\nfinally:\n')[0]+'\n'
 code=code.replace("'current-'","'baseline-'")
 (base/'run.py').write_text(code)
 subprocess.run(['python3',str(base/'run.py')],check=True)
 (s/'comparison-builds-completed.json').write_text(json.dumps({'baseline':sources,'current':current,'status':'ten builds and ten packaging attempts completed; failures require review'},indent=2)+'\n')
except BaseException:
 (s/'comparison-failure.txt').write_text(traceback.format_exc());raise
finally:
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
 subprocess.run(['git','checkout','--detach',current],cwd=r,check=True)
 b=s/'admission-barrier';b.mkdir(exist_ok=True);(b/'result.json').write_text(json.dumps({'scope':'Timing exclusion barrier only; inspect actual build results','terminal':True,'time':time.time()},indent=2)+'\n')
