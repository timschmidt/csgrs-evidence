from pathlib import Path
import subprocess,os,time,json,hashlib,re,statistics
s=Path(__file__).parent;p=Path('/mnt/development/.interval-refactor-build/qr-evolution-artifacts/cold-warm');digest=hashlib.sha256(p.read_bytes()).hexdigest();rows=[]
(s/'cold-warm-artifact.json').write_text(json.dumps(dict(path=str(p),sha256=digest,bytes=p.stat().st_size,source_sha256=hashlib.sha256((s/'cold-warm/src/main.rs').read_bytes()).hexdigest()),indent=2)+'\n')
for trial in range(3):
 for name in ['constant','rotation_uncertainty','tilted_equilibrium']:
  for mode in (['fixed','qr'] if trial%2==0 else ['qr','fixed']):
   for warm,count in [(0,1),(4,100)]:
    assert hashlib.sha256(p.read_bytes()).hexdigest()==digest
    cmd=['taskset','-c','0','setarch','x86_64','-R',str(p),name,mode,str(warm),str(count)]
    start=time.monotonic();proc=subprocess.run(cmd,capture_output=True,text=True);log=f'cold-warm-{trial}-{name}-{mode}-{warm}.log';(s/log).write_text(proc.stdout+proc.stderr);assert proc.returncode==0
    ns=int(re.search(r'ns_per_operation=(\d+)',proc.stdout).group(1));rows.append(dict(trial=trial,name=name,mode=mode,warmup=warm,iterations=count,ns_per_operation=ns,returncode=proc.returncode,command=cmd,log=log,seconds=time.monotonic()-start));(s/'cold-warm-runs.json').write_text(json.dumps(rows,indent=2)+'\n')
 print(trial,flush=True)
summary={}
for name in ['constant','rotation_uncertainty','tilted_equilibrium']:
 summary[name]={}
 for warm in [0,4]:
  ns={mode:[r['ns_per_operation'] for r in rows if (r['name'],r['mode'],r['warmup'])==(name,mode,warm)] for mode in ['fixed','qr']}
  summary[name]['cold' if warm==0 else 'warm']=dict(samples_ns=ns,medians_ns={k:statistics.median(v) for k,v in ns.items()})
(s/'cold-warm-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
