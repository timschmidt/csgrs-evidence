"""Reproduce the two affected complete harnesses before any runtime edit."""
import hashlib,importlib.util,json,os,platform,subprocess,time
from pathlib import Path
OUT=Path(__file__).resolve().parent;ROOT=OUT.parents[4]
prior=OUT.parent/'2026-10-17-axial-shells'
spec=importlib.util.spec_from_file_location('prior_check',prior/'check.py');check=importlib.util.module_from_spec(spec);spec.loader.exec_module(check)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
source=check.hashes();b=json.loads((OUT/'baseline.json').read_text());dest=OUT/'reproduction';dest.mkdir(exist_ok=False)
inputs={str(p):sha(p) for p in [Path(__file__),OUT/'measure.py',OUT/'contract.md',OUT/'baseline.json']}
env=check.ENV|dict(HYPERREAL_SKIP_BENCHMARK_REPORTS='1',HYPERLIMIT_SKIP_BENCHMARK_REPORTS='1')
cpu=min(os.sched_getaffinity(0));commands=[]
for corpus in ['kernel','region_exchange']:
 for trial in range(3):
  for side in (['pre_extension','current'] if trial%2==0 else ['current','pre_extension']):
   executable=b[side][corpus];assert sha(Path(executable['path']))==executable['sha256']
   label=f'{corpus}-{side}-{trial}';resource=dest/(label+'-resources.json')
   command=['python3',str(OUT/'measure.py'),str(resource),'taskset','-c',str(cpu),executable['path']]
   print('running',label,flush=True)
   with (dest/(label+'.log')).open('w') as log:
    result=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','300s',*command],cwd=ROOT,env=env,stdout=log,stderr=subprocess.STDOUT)
   row=dict(label=label,command=command,exit_code=result.returncode,resource=json.loads(resource.read_text()))
   commands.append(row);(dest/'commands.json').write_text(json.dumps(commands,indent=2)+'\n')
   assert result.returncode==row['resource']['exit_code']==0,label
   assert check.hashes()==source and all(sha(Path(p))==h for p,h in inputs.items())
(OUT/'reproduction.json').write_text(json.dumps(dict(source=source,baseline=b['baseline'],inputs=inputs,commands=commands,platform=platform.platform(),cpu=subprocess.check_output(['lscpu'],text=True),measured_cpu=cpu,rustc=subprocess.check_output(['rustc','-Vv'],env=env,text=True),scope='Historical pre-extension/current reproduction, original full kernel and region-exchange corpora and iterations, three alternating paired fresh processes, no task builds/tests overlap. Frozen runtime source identities remain bound to the preceding campaign and documented packaging-only source bridge. No optimization has yet been applied.'),indent=2)+'\n')
print('Completed pre-edit full-harness reproduction.',flush=True)
