"""One fresh paired full-harness probe; qualification is a separate gate."""
from dataclasses import asdict
import hashlib,json,os,statistics,subprocess,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes
sys.path.insert(0,str(OUT.parent/'2026-10-15-closed-edges'))
import receipts
phase=sys.argv[1];assert phase.isalnum()
source=hashes();read=lambda n:json.loads((OUT/n).read_text());sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
old=read('baseline.json')['current'];new=read(phase+'-benchmark-binaries.json');assert new['source']==source;new=new['executables']
dest=OUT/(phase+'-pilot');dest.mkdir(exist_ok=False);commands=[];costs=[]
inputs={str(p):sha(p) for p in [Path(__file__),OUT/'measure.py',Path(receipts.__file__),ROOT/'crates/hyperbrep/tools/benchmark_receipt.py']}
env=ENV|dict(HYPERREAL_SKIP_BENCHMARK_REPORTS='1',HYPERLIMIT_SKIP_BENCHMARK_REPORTS='1');cpu=min(os.sched_getaffinity(0))
for corpus in ['kernel','region_exchange']:
 data={}
 for side,binaries in [('baseline',old),('candidate',new)]:
  binary=binaries[corpus];assert sha(binary['path'])==binary['sha256'];assert old[corpus]['features']==new[corpus]['features']
  label=corpus+'-'+side;resource=dest/(label+'-resources.json');command=['python3',str(OUT/'measure.py'),str(resource),'taskset','-c',str(cpu),binary['path']]
  print('running',label,flush=True)
  with (dest/(label+'.log')).open('w') as log:result=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','300s',*command],cwd=ROOT,env=env,stdout=log,stderr=subprocess.STDOUT)
  row=dict(label=label,command=command,exit_code=result.returncode,resource=json.loads(resource.read_text()));commands.append(row)
  (dest/'commands.json').write_text(json.dumps(commands,indent=2)+'\n');assert result.returncode==row['resource']['exit_code']==0
  text=(dest/(label+'.log')).read_text();data[side]=receipts.read('kernel',text) if corpus=='kernel' else [json.loads(line) for line in text.splitlines() if line.startswith('{')]
  assert hashes()==source and all(sha(p)==h for p,h in inputs.items())
 assert len(data['baseline'])==len(data['candidate'])==(64 if corpus=='kernel' else 4)
 for a,b in zip(data['baseline'],data['candidate']):
  ignored={'elapsed_ns','per_iteration_ns','allocation_calls','requested_bytes'}
  assert {k:v for k,v in a.items() if k not in ignored}=={k:v for k,v in b.items() if k not in ignored},(a,b)
  n=a['iterations'];row=dict(corpus=corpus,case=a.get('name',a.get('case')),iterations=n,baseline_ns=a['elapsed_ns']/n,candidate_ns=b['elapsed_ns']/n,ratio=b['elapsed_ns']/a['elapsed_ns'])
  if 'allocation_calls' in a:row['allocation_delta']={k:(b[k]-a[k])/n for k in ['allocation_calls','requested_bytes']}
  costs.append(row)
  if 'nurbs_path_extrusion' in row['case'] or corpus=='region_exchange':print(json.dumps(row),flush=True)
(OUT/(phase+'-pilot.json')).write_text(json.dumps(dict(source=source,inputs=inputs,commands=commands,costs=costs,measured_cpu=cpu,scope='One paired fresh process per complete original harness; diagnostic pilot only. All 68 receipts preserved. Not a retention, full-corpus or significant speedup claim.'),indent=2)+'\n')
