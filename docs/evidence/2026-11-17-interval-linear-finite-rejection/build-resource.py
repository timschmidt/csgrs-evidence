from pathlib import Path
import subprocess,json,hashlib,shutil
s=Path(__file__).parent;h=s/'resource-harness';art=Path('/mnt/development/.interval-refactor-build/linalg-finite-artifacts');art.mkdir(exist_ok=True)
assert not (s.parent/'coordinated-ci/quiet-workflow-executed-plan.json').exists()
rows=[]
def call(label,cmd):
 p=subprocess.run(cmd,cwd=h,capture_output=True,text=True,timeout=120);(s/f'{label}.log').write_text(p.stdout+p.stderr);rows.append({'label':label,'command':cmd,'exit_code':p.returncode});assert p.returncode==0,p.stderr
call('c-stack-build',['cc','-O2','-Wall','-Wextra','-Werror','-pthread','-c','stack.c','-o',str(art/'stack.o')])
for label,source in [('baseline',s/'baseline-linalg.rs'),('candidate',Path('/mnt/development/interval-linalg-finite/csgrs/crates/hypersolve/src/linalg.rs'))]:
 local=h/f'{label}.rs';shutil.copy2(source,local)
 lib=art/f'{label}.rlib';binary=art/f'{label}-resource'
 call(f'{label}-library-build',['rustc','+1.95.0','--edition=2024','--crate-type=rlib','--crate-name=linalg_probe','-Copt-level=3','-Ccodegen-units=16','-Dwarnings',str(local),'-o',str(lib)])
 # rustc requires the conventional lib prefix for extern rlibs.
 renamed=art/f'lib{label}.rlib';lib.rename(renamed)
 call(f'{label}-resource-build',['rustc','+1.95.0','--edition=2024','-Copt-level=3','-Ccodegen-units=16','-Dwarnings','--extern',f'linalg_probe={renamed}','main.rs','-Clink-arg='+str(art/'stack.o'),'-Clink-arg=-lpthread','-o',str(binary)])
 rows[-1]['source_sha256']=hashlib.sha256(source.read_bytes()).hexdigest();rows[-1]['binary_sha256']=hashlib.sha256(binary.read_bytes()).hexdigest()
 for case in range(16):
  for mode in ['observe','stack']:call(f'{label}-functional-{case}-{mode}',[str(binary),str(case),mode,'0','165'])
(s/'resource-build.json').write_text(json.dumps(rows,indent=2)+'\n');print('Both optimized external-module artifacts and64functional runs pass')
