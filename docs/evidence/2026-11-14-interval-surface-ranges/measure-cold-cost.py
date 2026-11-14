from pathlib import Path
import os,subprocess,json,re,statistics,math,random,time
s=Path(__file__).parent
r=Path('/mnt/development/csgrs-surface-interval-ranges')
source=json.loads((s/'COST-SOURCE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==source['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
assert json.loads((s/'final-paired-timing.json').read_text())['returncode']==0
binaries=json.loads((s/'final-cost-binaries.json').read_text()); paths={x['name']:x['path'] for x in binaries}
processes=subprocess.check_output(['ps','-eo','comm,pid,etime,args'],text=True)
(s/'cold-processes-before.txt').write_text(processes)
assert not any(line.split()[0] in {'rustc','rustdoc','cargo','cargo-clippy','clippy-driver'} for line in processes.splitlines()[1:])
rows=[];started=time.monotonic()
for case,name in enumerate(['polynomial','rational','degree8x3']):
 for sample in range(30):
  for shared in ([False,True] if sample%2==0 else [True,False]):
   env=os.environ|{'SURFACE_RANGE_COLD_CASE':str(case),'SURFACE_RANGE_COLD_SHARED':str(int(shared))}
   command=['taskset','-c','8',paths['benchmark']]
   p=subprocess.run(command,cwd=r,env=env,capture_output=True,text=True)
   assert p.returncode==0,(p.stdout,p.stderr)
   m=re.fullmatch(r'cold case=(\d+) shared=(true|false) query_ns=(\d+) destruction_ns=(\d+) total_ns=(\d+)\n',p.stdout)
   assert m and int(m[1])==case and (m[2]=='true')==shared,p.stdout
   assert int(m[3])+int(m[4])==int(m[5])
   row={'case':name,'mode':'shared' if shared else 'independent','sample':sample,'query_ns':int(m[3]),'destruction_ns':int(m[4]),'total_ns':int(m[5]),'returncode':p.returncode}
   rows.append(row)
   if sample<5:
    p=subprocess.run(['taskset','-c','8',paths['allocation_probe']],cwd=r,env=env,capture_output=True,text=True)
    assert p.returncode==0,(p.stdout,p.stderr)
    (s/f'cold-allocation-{name}-{row["mode"]}-{sample}.log').write_text(p.stdout+p.stderr)
 (s/'cold-timing-observations.json').write_text(json.dumps(rows,indent=2)+'\n')
allocation=[]
for case,name in enumerate(['polynomial','rational','degree8x3']):
 for mode in ['independent','shared']:
  observations=[]
  for sample in range(5):
   line=(s/f'cold-allocation-{name}-{mode}-{sample}.log').read_text().strip()
   m=re.fullmatch(r'cold case=(\d+) shared=(true|false) graph=(\d+) native=(\d+) output_live=(\d+) after_output_drop=(\d+) after_source_drop=(\d+) stats=AllocationStats \{ (.*) \}',line)
   assert m and int(m[1])==case and (m[2]=='true')==(mode=='shared'),line
   stats={k:int(v) for k,v in re.findall(r'(\w+): (\d+)',m[8])}
   observations.append({'case':name,'mode':mode,'graph_work':int(m[3]),'dyadic_work':int(m[4]),'output_requested_live':int(m[5]),'live_after_output_drop':int(m[6]),'live_after_source_drop':int(m[7]),**stats})
  assert all(x==observations[0] for x in observations),observations
  allocation.append(observations[0]|{'identical_fresh_process_observations':5})
(s/'cold-allocation-summary.json').write_text(json.dumps(allocation,indent=2)+'\n')
summary={};rng=random.Random(20261114)
for name in ['polynomial','rational','degree8x3']:
 modes={mode:[x['total_ns'] for x in rows if x['case']==name and x['mode']==mode] for mode in ['independent','shared']}
 assert all(len(x)==30 for x in modes.values())
 logs=[math.log(a/b) for a,b in zip(modes['independent'],modes['shared'])]
 resamples=sorted(math.exp(statistics.fmean(rng.choices(logs,k=30))) for _ in range(10000))
 def percentile(p):
  i=(len(resamples)-1)*p;lo=int(i);return resamples[lo]+(resamples[min(lo+1,len(resamples)-1)]-resamples[lo])*(i-lo)
 summary[name]={mode:{'samples':30,'mean_ns_per_portfolio':statistics.fmean(values),'median_ns_per_portfolio':statistics.median(values),'min_ns':min(values),'max_ns':max(values)} for mode,values in modes.items()}
 summary[name]['paired_speedup']={'geometric_mean':math.exp(statistics.fmean(logs)),'bootstrap_percentile_95':[percentile(.025),percentile(.975)],'resamples':10000,'seed':20261114}
(s/'cold-timing-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(s/'cold-measurement.json').write_text(json.dumps({'source_commit':source['commit'],'cpu':8,'seconds':time.monotonic()-started,'timing_observations':len(rows),'allocation_observations':30,'scope':'fresh process per observation; source construction and independent oracle excluded; query/materialization and destruction timed as two spans separated by oracle; not a claim of cold OS/machine caches','outcome':'all portfolios and independent analytic checks completed'},indent=2)+'\n')
print(json.dumps({'timing':summary,'allocation':allocation},indent=2))
