from pathlib import Path
import json,sys,subprocess,hashlib,shutil
s=Path(__file__).parent;variant=sys.argv[1];out=s/('artifacts-'+variant);out.mkdir(exist_ok=False)
report={'variant':variant,'artifacts':{}}
for target,command in [('certification',variant+'-certification-build'),('allocation_profile',variant+'-allocation-profile')]:
 run=s/'runs'/command;result=json.loads((run/'result.json').read_text());assert result['exit_code']==0
 rows=[]
 for line in (run/'output.log').read_text().splitlines():
  if not line.startswith('{'):continue
  try:d=json.loads(line)
  except json.JSONDecodeError:continue
  if d.get('reason')=='compiler-artifact' and d.get('target',{}).get('name')==target and d.get('executable'):rows.append(d)
 assert len(rows)==1,rows
 p=Path(rows[0]['executable']);dst=out/target;shutil.copy2(p,dst)
 (out/(target+'.size')).write_bytes(subprocess.check_output(['size','-A',str(dst)]))
 (out/(target+'.nm')).write_bytes(subprocess.check_output(['nm','-S','--size-sort','--radix=d',str(dst)]))
 report['artifacts'][target]={'source':str(p),'bytes':dst.stat().st_size,'sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'build':result,'instrumented':target=='allocation_profile'}
shutil.copy2(s/'runs'/f'{variant}-allocation-profile/output.log',out/'allocation-profile-output.log')
report['source_patch_sha256']=hashlib.sha256(subprocess.check_output(['git','-C','/mnt/development/interval-horner-current/csgrs','diff','--binary','HEAD'])).hexdigest()
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print({k:{x:v[x] for x in ['bytes','sha256']} for k,v in report['artifacts'].items()})
