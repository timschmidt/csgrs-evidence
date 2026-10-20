"""Matched preserved corpora and absolute new-domain costs, with every trial retained.

Run after benchmark-build, without simultaneous tests/compilation. The Criterion
catalogue is a short full-catalogue probe, not a controlled-host speedup claim.
Frozen executable/source metadata precedes production edits in this increment.
"""
import argparse
from dataclasses import asdict
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import re
import shutil
import statistics
import subprocess
import sys
import time
from check import ENV, ROOT, OUT, hashes

parser = argparse.ArgumentParser()
parser.add_argument('--name', required=True)
parser.add_argument('--only', nargs='+', choices=['advanced','faceted','kernel','arc','closed_edges','circles','scalar_micro','numerical_micro'])
args = parser.parse_args()
DEST = OUT/args.name
DEST.mkdir(exist_ok=False)
source = hashes()
(DEST/'source.json').write_text(json.dumps(source,indent=2)+'\n')
sys.path.insert(0,str(OUT.parent/'2026-10-15-closed-edges'))
import receipts
brep = receipts.brep
old = json.loads((OUT/'baseline-binaries.json').read_text())
old.update(json.loads((OUT/'scalar-baseline.json').read_text())['binaries'])
old.update(json.loads((OUT.parent/'2026-10-15-closed-edges/feature-baseline.json').read_text())['executables'])
for item in old.values():
    assert hashlib.sha256(Path(item['path']).read_bytes()).hexdigest()==item['sha256']
builds=[x for x in json.loads((OUT/'attempts.json').read_text()) if x['label']=='benchmark-build' and x['exit_code']==0]
assert builds
attempt=builds[-1]
assert json.loads((OUT/attempt['source']).read_text())==source
artifacts=[]
for line in (OUT/attempt['log']).read_text().splitlines():
    if line.startswith('{'):
        artifacts.append(json.loads(line))
new={}
for item in artifacts:
    if item.get('reason')=='compiler-artifact' and item['target']['kind']==['bench'] and item.get('executable'):
        name=item['target']['name']
        original=Path(item['executable'])
        path=Path('/tmp')/f'hyperbrep-step-circles-{args.name}-{name}'
        shutil.copy2(original,path)
        new[name]=dict(path=str(path),bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),features=item['features'])
(DEST/'executables.json').write_text(json.dumps(dict(baseline=old,candidate=new,build=attempt),indent=2)+'\n')
env=ENV|{'HYPERREAL_SKIP_BENCHMARK_REPORTS':'1'}
for key in ('HYPERCURVE_BENCH_ARC_ONLY','HYPERCURVE_BENCH_ARC_COUNT','HYPERCURVE_BENCH_ARC_ITERATIONS'):
    env.pop(key,None)
(DEST/'environment.json').write_text(json.dumps(dict(
    platform=platform.platform(),cpu=json.loads(subprocess.check_output(['lscpu','--json'],text=True)),
    cpu_affinity=sorted(os.sched_getaffinity(0)),measured_cpu=0,
    rustc=subprocess.check_output(['rustc','-Vv'],env=env,text=True),
    cargo=subprocess.check_output(['cargo','-V'],env=env,text=True),
    criterion='10 samples, 10ms warmup, 30ms requested measurement; full catalogue, 3 alternating pairs',
    optional_build_environment={key:env.get(key) for key in ('RUSTFLAGS','CARGO_ENCODED_RUSTFLAGS','CARGO_BUILD_TARGET','RUSTC_WRAPPER')},
    arc='Full default 256-arc corpus; environment overrides removed.',
    limits='External containment only; allocator requests and process RSS are not total retained-heap admission.',
),indent=2)+'\n')
launcher='/tmp/hyperbrep-step-circles-measure'
subprocess.run(['cc','-O2','-Wall','-Wextra','-Werror',str(OUT.parent/'2026-10-15-step-faceted/measure.c'),'-o',launcher],check=True)
records=[]
def run(kind,side,trial):
    label=f'{kind}-{side}-{trial}'
    exe=(old if side=='baseline' else new)[kind]['path']
    options=[]
    extra={}
    if kind.endswith('_micro'):
        options=['--bench','--noplot','--warm-up-time','0.01','--measurement-time','0.03','--sample-size','10','--nresamples','1000']
        home=Path('/tmp')/f'hyperbrep-step-circles-{args.name}-{label}'
        home.mkdir(exist_ok=False)
        extra['CRITERION_HOME']=str(home)
    command=[launcher,str(DEST/(label+'-resources.json')),'taskset','-c','0',exe,*options]
    started=time.monotonic()
    print('running',label,flush=True)
    with (DEST/(label+'.log')).open('w') as log:
        p=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','1800s',*command],cwd=ROOT,env=env|extra,stdout=log,stderr=subprocess.STDOUT)
    records.append(dict(label=label,command=command,environment=extra,exit_code=p.returncode,elapsed_seconds=time.monotonic()-started,external_timeout_seconds=1800))
    (DEST/'commands.json').write_text(json.dumps(records,indent=2)+'\n')
    assert hashes()==source,'source changed during measurements'
    assert p.returncode==0,(label,p.returncode)
    log=(DEST/(label+'.log')).read_text()
    if kind.endswith('_micro'):
        values=[]
        for file in sorted(home.glob('**/new/benchmark.json')):
            data=json.loads(file.read_text())
            estimate=json.loads(file.with_name('estimates.json').read_text())
            samples=json.loads(file.with_name('sample.json').read_text())
            values.append(dict(name=data['full_id'],benchmark=data,estimates=estimate,samples=samples))
        assert values,label
        (DEST/(label+'-samples.json')).write_text(json.dumps(values,indent=2)+'\n')
        return {x['name']:x['estimates']['mean']['point_estimate'] for x in values}
    if kind in ('kernel','arc','closed_edges'):
        rows=receipts.read(kind,log)
    else:
        if kind=='circles':
            names=['circles/closed_fresh_document','circles/closed_reused_document','circles/partial_fresh_document','circles/partial_reused_document','circles/edits_replay_composition','circles/reject_off_circle']
        else:
            names=brep.expected_cases((ROOT/f'crates/hyperbrep-io/benches/{kind}.rs').read_text())
        rows=[asdict(x) for x in brep.read_receipt(log,names)]
    facts=[line for line in log.splitlines() if line.startswith('fixture ')]
    alloc={name:dict(calls=int(calls),requested_bytes=int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',log)}
    return dict(rows=rows,facts=facts,allocations=alloc)

kinds=args.only or ['advanced','faceted','kernel','arc','closed_edges','circles','scalar_micro','numerical_micro']
for kind in kinds:
    sides={side:[] for side in (['candidate'] if kind=='circles' else ['baseline','candidate'])}
    for trial in range(1,4):
        order=list(sides) if trial%2 else list(reversed(sides))
        for side in order:
            sides[side].append(run(kind,side,trial))
    base=sides.get('baseline',sides['candidate'])
    cand=sides['candidate']
    costs=[]
    if kind.endswith('_micro'):
        assert all(set(x)==set(base[0]) for trials in sides.values() for x in trials)
        for name in sorted(base[0]):
            b=statistics.median(x[name] for x in base)
            c=statistics.median(x[name] for x in cand)
            costs.append(dict(case=name,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b))
    else:
        for trials in sides.values():
            for row in trials:
                receipts.compare(base[0]['rows'],row['rows'])
                assert row['facts']==base[0]['facts']
        for i,row in enumerate(base[0]['rows']):
            name=row['name'];n=row['iterations']
            med=lambda trials:statistics.median(x['rows'][i]['elapsed_ns']/n for x in trials)
            b,c=med(base),med(cand)
            item=dict(case=name,iterations=n,candidate_median_ns=c)
            if kind!='circles': item.update(baseline_median_ns=b,ratio=c/b)
            for side,trials in sides.items():
                if name in trials[0]['allocations']:
                    item[side+'_allocation_per_iteration']={field:statistics.median(x['allocations'][name][field]/n for x in trials) for field in ['calls','requested_bytes']}
            costs.append(item)
    (DEST/(kind+'-costs.json')).write_text(json.dumps(costs,indent=2)+'\n')
    print('complete',kind,'cases',len(costs),'median ratio',statistics.median(x.get('ratio',1) for x in costs),'worst ratio',max(x.get('ratio',1) for x in costs),flush=True)
