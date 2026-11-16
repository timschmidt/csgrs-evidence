from pathlib import Path
import os, subprocess, json, time, shutil, hashlib, sys
s=Path(__file__).parent
art=Path('/mnt/development/.interval-refactor-build/regrid-identity-artifacts')
runtime=art/'runtime';runtime.mkdir(exist_ok=True)
output=s/'timings';output.mkdir(exist_ok=True)
mode=sys.argv[1]
names=['external'] if mode=='external' else ['log_cost'] if mode=='logconfirm' else ['order_cost','division_cost','fractional_power_cost','exp_cost','log_cost','atan_cost','trig_cost','tangent_cost','sqrt_cost','host_cost','rational_power_cost','primitive_root_cost','float_cost','proposal_cost']
rows=[]
for sweep,side in enumerate(['baseline','candidate','candidate','baseline']):
 for name in names:
  original=art/(side+'-'+name);live=runtime/'measured'
  shutil.copyfile(original,live);live.chmod(0o755)
  command=['taskset','-c','0','setarch','x86_64','-R',str(live)]
  if name=='external':command+=['100','10']
  stem=f'{mode}-{sweep}-{side}-{name}'
  start=time.monotonic()
  with (output/(stem+'.stdout')).open('w') as out,(output/(stem+'.stderr')).open('w') as err:
   p=subprocess.run(command,stdout=out,stderr=err,timeout=1200)
  row={'sweep':sweep,'side':side,'name':name,'command':command,'exit_code':p.returncode,'seconds':time.monotonic()-start,'sha256':hashlib.sha256(original.read_bytes()).hexdigest()}
  rows.append(row);(output/(mode+'-runs.json')).write_text(json.dumps(rows,indent=2)+'\n')
  print(stem, p.returncode, round(row['seconds'],2),flush=True)
  assert p.returncode==0,row
