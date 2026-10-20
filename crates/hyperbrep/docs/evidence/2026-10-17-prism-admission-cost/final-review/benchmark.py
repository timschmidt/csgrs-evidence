"""Matched complete-domain cost campaign; every original receipt is mandatory."""
from dataclasses import asdict
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import statistics
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes
sys.path.insert(0,str(OUT.parent/'2026-10-15-closed-edges'))
import receipts
brep=receipts.brep
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
read=lambda n:json.loads((OUT/n).read_text())
source=hashes()
assert not read('qualification-driver.json')['failures']
old=read('baseline.json')['current']
new=read('relation-benchmark-binaries.json')['executables']
assert set(old)==set(new) and len(old)==22
assert read('finish-checks.json')['passed'] and read('finish-checks.json')['source']==source
assert read('relation-benchmark-binaries.json')['source']==source
for name,item in old.items():assert item['features']==new[name]['features']
for item in [*old.values(),*new.values()]:assert sha(item['path'])==item['sha256']
DEST=OUT/'costs';DEST.mkdir(exist_ok=False)
sampler=Path(__file__).with_name('measure.py')
inputs={str(p):sha(p) for p in [Path(__file__),sampler,Path(receipts.__file__),ROOT/'crates/hyperbrep/tools/benchmark_receipt.py']}
env=ENV|{'HYPERREAL_SKIP_BENCHMARK_REPORTS':'1','HYPERLIMIT_SKIP_BENCHMARK_REPORTS':'1'}
for key in list(env):
    if key in ['HYPERCURVE_BENCH_ARC_ONLY','HYPERCURVE_BENCH_ARC_COUNT','HYPERCURVE_BENCH_ARC_ITERATIONS'] or key.startswith('CSGRS_') and key.endswith('_BENCH_ITERS'):env.pop(key,None)
cpu=min(os.sched_getaffinity(0))
(DEST/'environment.json').write_text(json.dumps(dict(platform=platform.platform(),cpu=subprocess.check_output(['lscpu'],text=True),affinity=sorted(os.sched_getaffinity(0)),measured_cpu=cpu,rustc=subprocess.check_output(['rustc','-Vv'],env=env,text=True),cargo=subprocess.check_output(['cargo','-V'],env=env,text=True),inputs=inputs,build_environment={k:env.get(k) for k in ['RUSTFLAGS','CARGO_ENCODED_RUSTFLAGS','CARGO_BUILD_TARGET','RUSTC_WRAPPER']},procedure='Original full harnesses, original iterations/assertions/materialized receipts. Three alternating paired fresh processes per complete unchanged corpus. No task builds/tests overlap. Warmup belongs to each harness; OS/shared caches are not flushed. Full default 256-arc workload. Linux wait4 peak RSS includes the child process; allocation bytes are requests, not live retained heap.'),indent=2)+'\n')
json_counts=dict(pcurves=6,edge_images=3,analytic_export=8,analytic_similarity=9,seam_cuts=6,coplanar=11,sectors=12,oblique=3,prisms=4,prism_exchange=4,torus_exchange=3,cone_exchange=1,region_exchange=4,axial_exchange=4,axial_shell_exchange=8)
commands=[];migrations=[];all_costs=[]
def parse(kind,log):
    if kind in json_counts:
        values=[json.loads(line) for line in log.splitlines() if line.startswith('{')]
        assert len(values)==json_counts[kind],(kind,len(values))
        return dict(rows=[{**{k:v for k,v in x.items() if k not in ['case','allocation_calls','requested_bytes']},'name':x['case']} for x in values],facts=[],allocations={x['case']:dict(calls=x['allocation_calls'],requested_bytes=x['requested_bytes']) for x in values})
    if kind in ['kernel','arc','closed_edges']:rows=receipts.read(kind,log)
    else:
        if kind=='export':names=['export/box','export/hole','export/concave','export/split','export/32_bodies','export/reject_third']
        elif kind=='circles':names=['circles/closed_fresh_document','circles/closed_reused_document','circles/partial_fresh_document','circles/partial_reused_document','circles/edits_replay_composition','circles/reject_off_circle']
        else:names=brep.expected_cases((ROOT/f'crates/hyperbrep-io/benches/{kind}.rs').read_text())
        rows=[asdict(x) for x in brep.read_receipt(log,names)]
    return dict(rows=rows,facts=[line for line in log.splitlines() if line.startswith('fixture ')],allocations={name:dict(calls=int(calls),requested_bytes=int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',log)})
for kind in new:
    sides={side:[] for side in (['baseline','candidate'] if kind in old else ['candidate'])}
    for trial in range(3):
        for side in (list(sides) if trial%2==0 else list(reversed(sides))):
            label=f'{kind}-{side}-{trial}'
            executable=(old if side=='baseline' else new)[kind]
            resource=DEST/(label+'-resources.json')
            command=['python3',str(sampler),str(resource),'taskset','-c',str(cpu),executable['path']]
            print('running',label,flush=True)
            with (DEST/(label+'.log')).open('w') as output:
                result=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','1800s',*command],cwd=ROOT,env=env,stdout=output,stderr=subprocess.STDOUT)
            row=dict(label=label,command=command,external_timeout_seconds=1800,exit_code=result.returncode,resource=json.loads(resource.read_text()))
            commands.append(row);(DEST/'commands.json').write_text(json.dumps(commands,indent=2)+'\n')
            assert result.returncode==row['resource']['exit_code']==0,label
            assert hashes()==source and all(sha(p)==h for p,h in inputs.items())
            assert sha(executable['path'])==executable['sha256']
            sides[side].append(parse(kind,(DEST/(label+'.log')).read_text()))
    strip=lambda rows:[{k:v for k,v in row.items() if k not in ['elapsed_ns','per_iteration_ns']} for row in rows]
    for side,values in sides.items():
        for value in values:assert strip(value['rows'])==strip(values[0]['rows']) and value['facts']==values[0]['facts'],(kind,side,'nondeterministic receipt')
    baseline=sides.get('baseline');candidate=sides['candidate']
    if baseline:
        assert [(r['name'],r['iterations']) for r in baseline[0]['rows']]==[(r['name'],r['iterations']) for r in candidate[0]['rows']]
        for a,b in zip(strip(baseline[0]['rows']),strip(candidate[0]['rows'])):
            if a!=b:migrations.append(dict(corpus=kind,case=a['name'],baseline=a,candidate=b))
        if baseline[0]['facts']!=candidate[0]['facts']:migrations.append(dict(corpus=kind,case='facts',baseline=baseline[0]['facts'],candidate=candidate[0]['facts']))
    costs=[]
    for i,row in enumerate(candidate[0]['rows']):
        n=row['iterations'];name=row['name']
        value=dict(corpus=kind,case=name,iterations=n,candidate_median_ns=statistics.median(s['rows'][i]['elapsed_ns']/n for s in candidate))
        if baseline:
            value['baseline_median_ns']=statistics.median(s['rows'][i]['elapsed_ns']/n for s in baseline)
            value['ratio']=value['candidate_median_ns']/value['baseline_median_ns']
        else:value['scope']='Absolute completed-workflow cost; no ratio against the former failure.'
        for side,samples in sides.items():
            if name in samples[0]['allocations']:value[side+'_allocations_per_iteration']={key:statistics.median(s['allocations'][name][key]/n for s in samples) for key in ['calls','requested_bytes']}
        costs.append(value)
    all_costs+=costs
    (DEST/(kind+'-costs.json')).write_text(json.dumps(costs,indent=2)+'\n')
    (DEST/'receipt-migrations.json').write_text(json.dumps(migrations,indent=2)+'\n')
    assert not migrations,migrations
    print('complete',kind,'cases',len(costs),'worst ratio',max((r.get('ratio',1) for r in costs)),flush=True)
summary=dict(source=source,inputs=inputs,baseline=old,candidate=new,commands=len(commands),corpora=len(new),preserved_cases=sum('ratio' in x for x in all_costs),new_cases=sum('ratio' not in x for x in all_costs),costs=all_costs,migrations=migrations,receipt_preserved=not migrations,representation_migration=False,limitations='Shared-host local observations, not a controlled-host speedup or complete repository benchmark catalogue. Timing-only rows and expected rejection rows retain their original scope. All adverse rows retained. No production total-work, retained-heap or cancellation bound is established.')
(OUT/'cost-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
assert not migrations and len(commands)==132 and len(all_costs)==192
