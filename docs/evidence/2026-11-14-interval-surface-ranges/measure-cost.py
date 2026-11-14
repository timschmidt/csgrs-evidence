from pathlib import Path
import os,subprocess,json,re,time,hashlib,statistics,math,random
s=Path(__file__).parent
r=Path('/mnt/development/csgrs-surface-interval-ranges')
target=Path('/mnt/development/.interval-refactor-build/surface-interval-ranges')
source=json.loads((s/'COST-SOURCE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==source['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
for label in ['cost-release-build','allocation-release-build']:
 assert json.loads((s/(label+'.json')).read_text())['returncode']==0
processes=subprocess.check_output(['ps','-eo','comm,pid,etime,args'],text=True)
(s/'cost-processes-before.txt').write_text(processes)
assert not any(line.split()[0] in {'rustc','rustdoc','cargo','cargo-clippy','clippy-driver'} for line in processes.splitlines()[1:]),'compiler/test driver still active'
bench=Path(re.search(r'Executable benches/surface_ranges.rs \(([^)]+)\)',(s/'cost-release-build.log').read_text()).group(1))
probe=target/'release/surface-interval-range-cost-probe'
cpu=8
assert cpu in os.sched_getaffinity(0)
artifacts=[]
for name,path in [('benchmark',bench),('allocation_probe',probe)]:
 artifacts.append({'name':name,'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'size':subprocess.check_output(['size',str(path)],text=True)})
(s/'cost-binaries.json').write_text(json.dumps(artifacts,indent=2)+'\n')
features=[]
for name in ['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve','hypercurve','hyperbrep']:
 rows=[]
 for directory in sorted((target/'release/.fingerprint').glob(name+'-*')):
  for path in directory.glob('lib-'+name.replace('-','_')+'.json'):
   data=json.loads(path.read_text())
   rows.append({'artifact':directory.name,'features':data['features'],'profile':data['profile'],'rustflags':data['rustflags'],'path_identity':data['path']})
 assert len(rows)==2,(name,rows)
 assert len({(x['features'],x['profile'],tuple(x['rustflags'])) for x in rows})==1,(name,rows)
 features.append({'package':name,'matched_features_profile_flags':True,'artifacts':rows})
(s/'cost-build-equivalence.json').write_text(json.dumps(features,indent=2)+'\n')
def run(name,command,env=None):
 assert not (s/(name+'.log')).exists()
 start=time.monotonic()
 with (s/(name+'.log')).open('wb') as out:
  p=subprocess.run(command,cwd=r,env=os.environ|(env or {}),stdout=out,stderr=subprocess.STDOUT)
 record={'command':command,'returncode':p.returncode,'seconds':time.monotonic()-start,'source_commit':source['commit'],'cpu':cpu}
 (s/(name+'.json')).write_text(json.dumps(record,indent=2)+'\n')
 assert p.returncode==0,name
run('allocation-observations',['taskset','-c',str(cpu),str(probe)])
run('paired-timing',['taskset','-c',str(cpu),str(bench)],{'SURFACE_RANGE_ITERATIONS':'16','SURFACE_RANGE_SAMPLES':'30'})
allocation=[]
for line in (s/'allocation-observations.log').read_text().splitlines():
 m=re.fullmatch(r'(\w+)/(shared|independent) graph=(\d+) native=(\d+) output_requested_live=(\d+) stats=AllocationStats \{ (.*) \}',line)
 assert m,line
 stats={k:int(v) for k,v in re.findall(r'(\w+): (\d+)',m[6])}
 assert stats['live_bytes']==0
 allocation.append({'case':m[1],'mode':m[2],'graph_work':int(m[3]),'dyadic_work':int(m[4]),'retained_requested_bytes':int(m[5]),'allocation_calls_including_realloc':stats['allocation_count']+stats['reallocation_count'],'total_requested_bytes':stats['allocated_bytes']+stats['reallocated_bytes'],'identical_observations':5,**stats})
assert len(allocation)==6
(s/'allocation-summary.json').write_text(json.dumps(allocation,indent=2)+'\n')
rows={}
for line in (s/'paired-timing.log').read_text().splitlines():
 m=re.fullmatch(r'(\w+)/(shared|independent) sample=(\d+) iterations=(\d+) total_ns=(\d+)',line)
 assert m,line
 case,mode,sample,iterations,elapsed=m.groups()
 assert int(iterations)==16 and int(elapsed)>0
 values=rows.setdefault(case,{}).setdefault(mode,{})
 assert int(sample) not in values
 values[int(sample)]=int(elapsed)/int(iterations)
summary={};rng=random.Random(20261114)
def percentile(values,p):
 index=(len(values)-1)*p;lo=int(index);hi=min(lo+1,len(values)-1)
 return values[lo]+(values[hi]-values[lo])*(index-lo)
for case,modes in rows.items():
 assert set(modes)=={'independent','shared'} and all(set(x)==set(range(30)) for x in modes.values())
 summary[case]={}
 for mode,samples in modes.items():
  values=list(samples.values())
  summary[case][mode]={'samples':len(values),'mean_ns_per_portfolio':statistics.fmean(values),'median_ns_per_portfolio':statistics.median(values),'min_ns':min(values),'max_ns':max(values)}
 logs=[math.log(modes['independent'][i]/modes['shared'][i]) for i in range(30)]
 bootstrap=sorted(math.exp(statistics.fmean(rng.choices(logs,k=30))) for _ in range(10000))
 summary[case]['paired_speedup']={'geometric_mean':math.exp(statistics.fmean(logs)),'bootstrap_percentile_95':[percentile(bootstrap,.025),percentile(bootstrap,.975)],'resamples':10000,'seed':20261114}
assert len(summary)==3
(s/'timing-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({'allocation':allocation,'timing':summary},indent=2))
