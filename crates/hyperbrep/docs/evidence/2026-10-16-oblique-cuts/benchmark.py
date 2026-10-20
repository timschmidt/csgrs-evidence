"""Matched preserved corpora and absolute new-domain costs, with every trial retained.

Run after benchmark-build, without simultaneous tests/compilation. The fourteen default BREP/arc/STEP corpora remain complete; no controlled-host
speedup or broader stack-catalogue claim is made.
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
parser.add_argument('--only', nargs='+', choices=['advanced','faceted','kernel','arc','closed_edges','circles','export','pcurves','edge_images','analytic_export','analytic_similarity','seam_cuts','coplanar','sectors'])
args = parser.parse_args()
DEST = OUT/args.name
DEST.mkdir(exist_ok=False)
source = hashes()
(DEST/'source.json').write_text(json.dumps(source,indent=2)+'\n')
sys.path.insert(0,str(OUT.parent/'2026-10-15-closed-edges'))
import receipts
brep = receipts.brep
old = {item['name']:dict(item,path=item['frozen']) for item in json.loads((OUT/'baseline-binaries.json').read_text())['binaries']}
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
        path=Path('/tmp')/f'hyperbrep-oblique-{args.name}-{name}'
        shutil.copy2(original,path)
        new[name]=dict(path=str(path),bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),features=item['features'])
(DEST/'executables.json').write_text(json.dumps(dict(baseline=old,candidate=new,build=attempt),indent=2)+'\n')
env=ENV|{'HYPERREAL_SKIP_BENCHMARK_REPORTS':'1'}
for key in ('HYPERCURVE_BENCH_ARC_ONLY','HYPERCURVE_BENCH_ARC_COUNT','HYPERCURVE_BENCH_ARC_ITERATIONS'):
    env.pop(key,None)
for key in list(env):
    if key.startswith('CSGRS_') and key.endswith('_BENCH_ITERS'): env.pop(key,None)
(DEST/'environment.json').write_text(json.dumps(dict(
    platform=platform.platform(),cpu=json.loads(subprocess.check_output(['lscpu','--json'],text=True)),
    cpu_affinity=sorted(os.sched_getaffinity(0)),measured_cpu=0,
    rustc=subprocess.check_output(['rustc','-Vv'],env=env,text=True),
    cargo=subprocess.check_output(['cargo','-V'],env=env,text=True),
    sampling='Full native harnesses with their existing cases, iteration counts, timing boundaries and exact receipts; three alternating pairs per corpus.',
    optional_build_environment={key:env.get(key) for key in ('RUSTFLAGS','CARGO_ENCODED_RUSTFLAGS','CARGO_BUILD_TARGET','RUSTC_WRAPPER')},
    arc='Full default 256-arc corpus; environment overrides removed.',
    limits='External containment only; allocator requests and process RSS are not total retained-heap admission.',
),indent=2)+'\n')
launcher='/tmp/hyperbrep-oblique-measure'
subprocess.run(['cc','-O2','-Wall','-Wextra','-Werror',str(OUT.parent/'2026-10-15-step-faceted/measure.c'),'-o',launcher],check=True)
records=[]
def run(kind,side,trial):
    label=f'{kind}-{side}-{trial}'
    assert old[kind]['features']==new[kind]['features'],kind
    exe=(old if side=='baseline' else new)[kind]['path']
    options=[]
    extra={}
    if kind.endswith('_micro') or kind=='end_to_end':
        options=['^(construction_speed|raw_cache_hit_cost|structural_query_speed|exact_transcendental_special_forms|real_cotangent|symbolic_reductions|exact_product_sums|computable_cache|computable_bounds|computable_compare|computable_transcendentals)/','--bench','--noplot','--warm-up-time','0.01','--measurement-time','0.03','--sample-size','10','--nresamples','1000']
        if kind=='end_to_end': options[0]='.*'
        home=Path('/tmp')/f'hyperbrep-oblique-{args.name}-{label}'
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
    if kind.endswith('_micro') or kind=='end_to_end':
        values=[]
        for file in sorted(home.glob('**/new/benchmark.json')):
            data=json.loads(file.read_text())
            estimate=json.loads(file.with_name('estimates.json').read_text())
            samples=json.loads(file.with_name('sample.json').read_text())
            values.append(dict(name=data['full_id'],benchmark=data,estimates=estimate,samples=samples))
        assert values,label
        (DEST/(label+'-samples.json')).write_text(json.dumps(values,indent=2)+'\n')
        return {x['name']:x['estimates']['mean']['point_estimate'] for x in values}
    if kind=='mesh_pipeline':
        rows=[]
        for name,n,field,value,us in re.findall(r'^(\w+) iterations=(\d+) (polygons|words|triangles)=(\d+) elapsed_us=(\d+)$',log,re.M):
            rows.append(dict(name=name,iterations=int(n),elapsed_ns=int(us)*1000,output_field=field,output_value=int(value)))
        assert len(rows)==6,rows
    elif kind in ('pcurves','edge_images','analytic_export','analytic_similarity','seam_cuts','coplanar','sectors'):
        values=[json.loads(line) for line in log.splitlines()]
        assert len(values)==dict(pcurves=6,edge_images=3,analytic_export=8,analytic_similarity=9,seam_cuts=6,coplanar=11,sectors=7)[kind]
        return dict(rows=[dict(name=x['case'],iterations=x['iterations'],elapsed_ns=x['elapsed_ns'],
                              checksum=x.get('receipt'),outcome=x['outcome']) for x in values],
                    facts=[],allocations={x['case']:dict(calls=x['allocation_calls'],requested_bytes=x['requested_bytes']) for x in values})
    elif kind in ('kernel','arc','closed_edges'):
        rows=receipts.read(kind,log)
    else:
        if kind=='export':
            names=['export/box','export/hole','export/concave','export/split','export/32_bodies','export/reject_third']
        elif kind=='circles':
            names=['circles/closed_fresh_document','circles/closed_reused_document','circles/partial_fresh_document','circles/partial_reused_document','circles/edits_replay_composition','circles/reject_off_circle']
        else:
            names=brep.expected_cases((ROOT/f'crates/hyperbrep-io/benches/{kind}.rs').read_text())
        rows=[asdict(x) for x in brep.read_receipt(log,names)]
    facts=[line for line in log.splitlines() if line.startswith('fixture ')]
    alloc={name:dict(calls=int(calls),requested_bytes=int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',log)}
    return dict(rows=rows,facts=facts,allocations=alloc)

kinds=args.only or ['advanced','faceted','kernel','arc','closed_edges','circles','export','pcurves','edge_images','analytic_export','analytic_similarity','seam_cuts','coplanar','sectors']
for kind in kinds:
    sides={side:[] for side in ['baseline','candidate']}
    for trial in range(1,4):
        order=list(sides) if trial%2 else list(reversed(sides))
        for side in order:
            sides[side].append(run(kind,side,trial))
    base=sides.get('baseline',sides['candidate'])
    cand=sides['candidate']
    costs=[]
    if kind.endswith('_micro') or kind=='end_to_end':
        assert all(set(x)==set(base[0]) for trials in sides.values() for x in trials)
        for name in sorted(base[0]):
            b=statistics.median(x[name] for x in base)
            c=statistics.median(x[name] for x in cand)
            costs.append(dict(case=name,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b))
    else:
        for side,trials in sides.items():
            for row in trials:
                if kind in ('mesh_pipeline','pcurves','edge_images','analytic_export','analytic_similarity','seam_cuts','coplanar','sectors'):
                    comparable=lambda rows:[{k:v for k,v in r.items() if k!='elapsed_ns'} for r in rows]
                    expected_rows=comparable(base[0]['rows'])
                    actual_rows=comparable(row['rows'])
                    assert expected_rows==actual_rows
                else:
                    receipts.compare(base[0]['rows'],row['rows'])
                assert row['facts']==base[0]['facts']
        for i,row in enumerate(base[0]['rows']):
            name=row['name'];n=row['iterations']
            med=lambda trials:statistics.median(x['rows'][i]['elapsed_ns']/n for x in trials)
            b,c=med(base),med(cand)
            item=dict(case=name,iterations=n,candidate_median_ns=c)
            item.update(baseline_median_ns=b,ratio=c/b)
            for side,trials in sides.items():
                if name in trials[0]['allocations']:
                    item[side+'_allocation_per_iteration']={field:statistics.median(x['allocations'][name][field]/n for x in trials) for field in ['calls','requested_bytes']}
            costs.append(item)
    (DEST/(kind+'-costs.json')).write_text(json.dumps(costs,indent=2)+'\n')
    print('complete',kind,'cases',len(costs),'median ratio',statistics.median(x.get('ratio',1) for x in costs),'worst ratio',max(x.get('ratio',1) for x in costs),flush=True)
