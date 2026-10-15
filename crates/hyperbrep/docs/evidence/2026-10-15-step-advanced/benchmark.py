"""New advanced-import absolute costs and paired existing faceted-import costs.

Build/freeze the faceted benchmark at 60e789d04 before building this candidate.
The harness changes only import_faceted_representation to import_representation.
The raw JSON geometry outputs and complete output comparisons remain required.
"""
import hashlib,importlib.util,json,os,re,statistics,subprocess,sys,time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
baseline=Path('/tmp/hyperbrep-before-advanced')
old=json.loads((out/'baseline-executable.json').read_text())
assert hashlib.sha256(baseline.read_bytes()).hexdigest()==old['sha256'],'rebuild the recorded baseline before candidate'
old_source=subprocess.check_output(['git','show','60e789d04:crates/hyperbrep-io/benches/faceted.rs'],cwd=root,text=True)
assert old_source.count('import_faceted_representation')==1
assert old_source.replace('import_faceted_representation','import_representation')==(root/'crates/hyperbrep-io/benches/faceted.rs').read_text()
executables={'baseline':baseline};metadata={'baseline':old|{'path':str(baseline)}}
for bench in ['advanced','faceted']:
    cmd=['cargo','build','--offline','--locked','-p','hyperbrep-io','--release','--bench',bench,'--message-format=json']
    p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True)
    (out/(bench+'-build.log')).write_text(p.stderr);(out/(bench+'-artifacts.jsonl')).write_text(p.stdout);assert p.returncode==0,p.stderr
    items=[json.loads(line) for line in p.stdout.splitlines()]
    exe=Path(next(x['executable'] for x in items if x.get('reason')=='compiler-artifact' and x['target']['name']==bench and x['target']['kind']==['bench'] and x.get('executable')))
    executables[bench]=exe;metadata[bench]=dict(path=str(exe),bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest())
(out/'executables.json').write_text(json.dumps(metadata,indent=2)+'\n')
launcher='/tmp/hyperbrep-advanced-measure'
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
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/advanced.rs').read_text());assert len(expected)==6
exports=[run(f'advanced-{trial}',executables['advanced'],expected) for trial in range(1,4)]
for row in exports:
    m.compare(exports[0][0],row[0]);assert exports[0][1]==row[1]
costs=[]
for i,case in enumerate(expected):
    iterations=exports[0][0][i].iterations
    costs.append(dict(case=case,iterations=iterations,checksum=exports[0][0][i].checksum,
        median_ns=statistics.median(x[0][i].elapsed_ns/iterations for x in exports),
        allocation_calls_per_iteration=statistics.median(x[2][case]['calls']/iterations for x in exports),
        requested_bytes_per_iteration=statistics.median(x[2][case]['requested_bytes']/iterations for x in exports)))
(out/'advanced-costs.json').write_text(json.dumps(costs,indent=2)+'\n')
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/faceted.rs').read_text());assert len(expected)==7
sides={'baseline':[],'faceted':[]}
for trial in range(1,4):
    for side in (['baseline','faceted'] if trial%2 else ['faceted','baseline']):
        sides[side].append(run(f'import-{side}-{trial}',executables[side],expected))
for side in sides.values():
    for row in side:
        m.compare(sides['baseline'][0][0],row[0]);assert row[1]==sides['baseline'][0][1]
ratios=[]
for i,case in enumerate(expected):
    med=lambda side:statistics.median(x[0][i].elapsed_ns/x[0][i].iterations for x in sides[side])
    alloc=lambda side:dict(calls=statistics.median(x[2][case]['calls']/x[0][i].iterations for x in sides[side]),requested_bytes=statistics.median(x[2][case]['requested_bytes']/x[0][i].iterations for x in sides[side]))
    b,c=med('baseline'),med('faceted');ba,ca=alloc('baseline'),alloc('faceted')
    ratios.append(dict(case=case,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b,baseline_allocation_per_iteration=ba,candidate_allocation_per_iteration=ca))
(out/'import-costs.json').write_text(json.dumps(ratios,indent=2)+'\n')
print(json.dumps(dict(advanced=costs,faceted_comparison=ratios),indent=2))
