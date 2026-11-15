from pathlib import Path
import subprocess,json,shutil,time
s=Path(__file__).parent;exe=Path(json.loads((s/'candidate-legacy.json').read_text())['binary']);rows=[]
try:
 for sample,kind in enumerate(['baseline','candidate','candidate','baseline','baseline','candidate','candidate','baseline']):
  shutil.copyfile(s/(kind+'-legacy'),exe)
  cmd=['taskset','-c','0','setarch','x86_64','-R',str(exe)];start=time.monotonic()
  with (s/f'timing-{sample}-{kind}.log').open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT)
  row={'sample':sample,'kind':kind,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start};rows.append(row);print(json.dumps(row),flush=True)
  (s/'timing.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
finally:shutil.copyfile(s/'candidate-legacy',exe)
exe=Path(json.loads((s/'candidate-native.json').read_text())['binary']);cmd=['taskset','-c','0','setarch','x86_64','-R',str(exe)];start=time.monotonic()
with (s/'native-timing.log').open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT)
row={'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start};(s/'native-timing.json').write_text(json.dumps(row,indent=2)+'\n');print(json.dumps(row));assert r.returncode==0
