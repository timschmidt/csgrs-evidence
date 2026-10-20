"""Three alternating CPU-0 kernel pairs and three instrumented new-fixture runs.

Freeze the all-feature kernel bench at 51d41cc50 before candidate compilation;
metadata and baseline Cargo artifact messages are retained beside this script.
No new capability has an equivalent successful baseline implementation.
"""
import hashlib,importlib.util,json,os,re,statistics,subprocess,sys,time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
baseline=Path('/tmp/hyperbrep-cylinder-kernel-before')
old=json.loads((out/'baseline-executable.json').read_text())
assert hashlib.sha256(baseline.read_bytes()).hexdigest()==old['sha256'],'rebuild baseline 51d41cc50 first'
subprocess.run(['git','diff','--exit-code','51d41cc50','--','crates/hyperbrep/benches/kernel.rs'],cwd=root,check=True)
executables={'baseline':baseline};metadata={'baseline':old|{'revision':subprocess.check_output(['git','rev-parse','51d41cc50'],cwd=root,text=True).strip()}}
for bench in ['kernel','periodic_cylinder']:
    cmd=['cargo','build','--offline','--locked','-p','hyperbrep','--release','--all-features','--bench',bench,'--message-format=json']
    p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True)
    (out/(bench+'-build.log')).write_text(p.stderr);(out/(bench+'-artifacts.jsonl')).write_text(p.stdout);assert p.returncode==0,p.stderr
    items=[json.loads(line) for line in p.stdout.splitlines()]
    exe=Path(next(x['executable'] for x in items if x.get('reason')=='compiler-artifact' and x['target']['name']==bench and x['target']['kind']==['bench'] and x.get('executable')))
    executables[bench]=exe;metadata[bench]=dict(path=str(exe),bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest())
(out/'executables.json').write_text(json.dumps(metadata,indent=2)+'\n')
launcher='/tmp/hyperbrep-cylinder-measure'
subprocess.run(['cc','-O2','-Wall','-Wextra','-Werror',str(out.parent/'2026-10-15-step-faceted/measure.c'),'-o',launcher],check=True)
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
records=[]
def run(label,exe,expected):
    cmd=[launcher,str(out/(label+'-resources.json')),'taskset','-c','0',str(exe)]
    print('running',label,flush=True);started=time.time();p=subprocess.run(cmd,cwd=root,capture_output=True,text=True)
    log=p.stdout+p.stderr;(out/(label+'.log')).write_text(log)
    records.append(dict(label=label,command=cmd,exit_code=p.returncode,elapsed_seconds=time.time()-started))
    (out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n');assert p.returncode==0,log
    parsed=m.read_receipt(log,expected)
    facts=[line for line in log.splitlines() if line.startswith('fixture ')]
    alloc={name:dict(calls=int(calls),requested_bytes=int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',log)}
    return parsed,facts,alloc
expected=m.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text());assert len(expected)==66
sides={'baseline':[],'kernel':[]}
for trial in range(1,4):
    for side in (['baseline','kernel'] if trial%2 else ['kernel','baseline']):
        sides[side].append(run(f'{side}-{trial}',executables[side],expected))
for side in sides.values():
    for row in side:m.compare(sides['baseline'][0][0],row[0])
ratios=[]
for i,case in enumerate(expected):
    med=lambda side:statistics.median(x[0][i].elapsed_ns/x[0][i].iterations for x in sides[side])
    b,c=med('baseline'),med('kernel')
    ratios.append(dict(case=case,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b))
(out/'kernel-costs.json').write_text(json.dumps(ratios,indent=2)+'\n')
expected=m.expected_cases((root/'crates/hyperbrep/benches/periodic_cylinder.rs').read_text());assert len(expected)==6
rows=[run(f'periodic-{trial}',executables['periodic_cylinder'],expected) for trial in range(1,4)]
for row in rows:m.compare(rows[0][0],row[0]);assert rows[0][1]==row[1]
costs=[]
for i,case in enumerate(expected):
    iterations=rows[0][0][i].iterations
    costs.append(dict(case=case,iterations=iterations,checksum=rows[0][0][i].checksum,
        median_ns=statistics.median(x[0][i].elapsed_ns/iterations for x in rows),
        allocation_calls_per_iteration=statistics.median(x[2][case]['calls']/iterations for x in rows),
        requested_bytes_per_iteration=statistics.median(x[2][case]['requested_bytes']/iterations for x in rows)))
(out/'periodic-costs.json').write_text(json.dumps(costs,indent=2)+'\n')
print(json.dumps(dict(periodic=costs,kernel_ratio_median=statistics.median(r['ratio'] for r in ratios),kernel_ratio_max=max(r['ratio'] for r in ratios),adverse_over_ten_percent=[r for r in ratios if r['ratio']>1.1]),indent=2))
