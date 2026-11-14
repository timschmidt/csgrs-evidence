from pathlib import Path
import subprocess,json,os,time,hashlib,re,statistics,math,random
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-curve-interval-ranges');target=Path('/mnt/development/.interval-refactor-build/curve-interval-ranges')
source=json.loads((s/'SOURCE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
assert (s/'qualified-driver.exit').read_text().strip()=='0'
assert (s/'package-final/package-driver.exit').read_text().strip()=='0'
assert (s/'cost-probe-build-v3.exit').read_text().strip()=='0'
assert subprocess.run(['pgrep','-x','rustc'],stdout=subprocess.DEVNULL).returncode==1
binary,=[p for p in (target/'release/deps').glob('interval_ranges-*') if p.is_file() and os.access(p,os.X_OK)]
cpu=min(os.sched_getaffinity(0));cmd=['taskset','-c',str(cpu),str(binary)]
env=os.environ|{'CURVE_RANGE_ITERATIONS':'32','CURVE_RANGE_SAMPLES':'30'}
assert not (s/'benchmark.log').exists()
start=time.monotonic()
with (s/'benchmark.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
(s/'benchmark.json').write_text(json.dumps(dict(command=cmd,source_commit=source['commit'],returncode=p.returncode,seconds=time.monotonic()-start,binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),binary_bytes=binary.stat().st_size,cpu=cpu,iterations=32,samples=30,warmup_samples=2,scope='three complete sixteen-cell range portfolios; graph and native basis preparation, all report/projection materialization, native comparisons and destruction included; original source common; scalar caches warmed; unrelated host activity uncontrolled'),indent=2)+'\n');assert p.returncode==0
rows={}
for case,mode,sample,iterations,ns in re.findall(r'^(polynomial|rational|degree8)/(shared|independent) sample=(\d+) iterations=(\d+) total_ns=(\d+)$',(s/'benchmark.log').read_text(),re.M):
 rows.setdefault(case,{}).setdefault(mode,{})[int(sample)]=int(ns)/int(iterations)
assert len(rows)==3
summary={};rng=random.Random(20261114)
for case,modes in rows.items():
 assert set(modes)=={'shared','independent'}
 for points in modes.values():assert set(points)==set(range(30))
 logs=[math.log(modes['independent'][i]/modes['shared'][i]) for i in range(30)]
 boot=sorted(math.exp(statistics.mean(rng.choices(logs,k=30))) for _ in range(10000))
 summary[case]={mode:{'samples':30,'mean_ns':statistics.mean(v.values()),'median_ns':statistics.median(v.values()),'min_ns':min(v.values()),'max_ns':max(v.values())} for mode,v in modes.items()}
 summary[case]['paired_speedup']={'geometric_mean':math.exp(statistics.mean(logs)),'bootstrap_percentile_95':[boot[250],boot[9749]],'resamples':10000,'seed':20261114}
(s/'timing-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
assert (s/'cost-probe.exit').read_text().strip()=='0'
print(json.dumps(summary,indent=2))
