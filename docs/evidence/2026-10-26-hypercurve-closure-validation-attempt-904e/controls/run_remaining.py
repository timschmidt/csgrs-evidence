from pathlib import Path
import json,re,subprocess,sys,time
root=Path(__file__).resolve().parent
subprocess.run([sys.executable,str(root/'audit_validation.py')],check=True)
status=json.loads((root/'validation-status.json').read_text())
missing=[x for x in status['missing'] if not x.startswith('hyperspatial-directed-')]
pattern='^(?:'+'|'.join(re.escape(x) for x in missing)+')$'
plan={'source_revision':status['source_revision'],'reason':'The sandbox denies Symbolica local single-instance socket access. Current sandbox/host bind probes distinguish EPERM from a live competing instance. No license settings or workflow commands changed.','missing':missing,'selection':pattern,'started_epoch':time.time()}
(root/'resume-workflow-plan.json').write_text(json.dumps(plan,indent=2)+'\n')
for phase in ['workflow','release']:
 print('START remaining',phase,flush=True)
 with (root/('remaining-'+phase+'-unsandboxed.log')).open('w') as log:
  result=subprocess.run([sys.executable,str(root/'driver.py'),'--checkout',str(root/'normal'),'--phase',phase,'--only',pattern],stdout=log,stderr=subprocess.STDOUT)
 print('FINISH remaining',phase,result.returncode,flush=True)
 if result.returncode:sys.exit(result.returncode)
