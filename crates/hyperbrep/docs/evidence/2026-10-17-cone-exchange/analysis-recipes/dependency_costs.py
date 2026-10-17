"""Prospectively frozen scalar/predicate and rounding costs; retain every row."""
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import statistics
import subprocess
import sys
import time

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import ENV,OUT,ROOT,hashes,run

read=lambda p:json.loads(p.read_text())
write=lambda p,v:p.write_text(json.dumps(v,indent=2)+'\n')
source=hashes(); recipe=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
base=read(OUT/'baseline-dependency-binaries.json')
rounding=base['executables']['library_perf']
candidate={}
for label,metadata,names in [('dependency-build',base['executables']['scalar_micro'],['scalar_micro','predicates']),('rounding-build',rounding,['library_perf'])]:
    assert run(label,metadata['build']['command'],1200)==0
    attempt=read(OUT/'attempts.json')[-1]
    for line in (OUT/attempt['log']).read_text().splitlines():
        if not line.startswith('{'):continue
        row=json.loads(line)
        if row.get('reason')!='compiler-artifact' or row['target']['kind']!=['bench']:continue
        name=row['target']['name'];assert name in names
        path=Path('/tmp')/f'hyperbrep-cone-exchange-continuation-final-{name}'
        assert not path.exists()
        shutil.copy2(row['executable'],path)
        candidate[name]=dict(path=str(path),bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),features=row['features'],build=attempt)
assert set(candidate)=={'scalar_micro','predicates','library_perf'}
write(OUT/'candidate-dependency-binaries.json',dict(executables=candidate,source=source))
metadata=dict(baseline=base['executables'],candidate=candidate)
for side in metadata.values():
    for item in side.values():assert hashlib.sha256(Path(item['path']).read_bytes()).hexdigest()==item['sha256']
assert hashes()==source
DEST=OUT/'dependency-costs-v1';DEST.mkdir(exist_ok=False)
write(DEST/'inputs.json',dict(source=source,recipe_sha256=recipe,executables=metadata))
write(DEST/'environment.json',dict(platform=platform.platform(),cpu=json.loads(subprocess.check_output(['lscpu','--json'],text=True)),
    cpu_affinity=sorted(os.sched_getaffinity(0)),measured_cpu=0,rustc=subprocess.check_output(['rustc','-Vv'],env=ENV,text=True),
    cargo=subprocess.check_output(['cargo','-V'],env=ENV,text=True),sampling='Three alternating pairs with isolated Criterion homes; all compilation completes before timing.',
    scope='Local microcosts, not controlled-host or aggregate speedup. Correctness, exact geometric receipts, allocations and package delivery are separate evidence.'))
launcher='/tmp/hyperbrep-cone-exchange-dependency-measure'
subprocess.run(['cc','-O2','-Wall','-Wextra','-Werror',str(OUT.parent/'2026-10-15-step-faceted/measure.c'),'-o',launcher],check=True)
filters=dict(
    scalar_micro='^(construction_speed|raw_cache_hit_cost|structural_query_speed|exact_transcendental_special_forms|real_cotangent|symbolic_reductions|exact_product_sums)/',
    predicates='^(point2_equality|real_sign_pair|filter_cost_breakdown|orient2d|orient3d|incircle2d|insphere3d)/',
    library_perf='^real_stable_scalar_substrate/')
commands=[];costs=[]
for corpus,pattern in filters.items():
    values={side:[] for side in metadata}
    for trial in range(1,4):
        for side in (['baseline','candidate'] if trial%2 else ['candidate','baseline']):
            label=f'{corpus}-{side}-{trial}';exe=metadata[side][corpus]
            assert exe['features']==metadata['baseline'][corpus]['features']
            home=Path('/tmp')/f'hyperbrep-cone-exchange-dependency-criterion-{label}';home.mkdir(exist_ok=False)
            extra=dict(CRITERION_HOME=str(home),HYPERREAL_SKIP_BENCHMARK_REPORTS='1',HYPERLIMIT_SKIP_BENCHMARK_REPORTS='1')
            command=[launcher,str(DEST/f'{label}-resources.json'),'taskset','-c','0',exe['path'],pattern,'--bench','--noplot','--warm-up-time','0.1','--measurement-time','0.3','--sample-size','20','--nresamples','1000']
            print('running',label,flush=True);start=time.monotonic()
            with (DEST/f'{label}.log').open('w') as log:
                result=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','1800s',*command],cwd=ROOT,env=ENV|extra,stdout=log,stderr=subprocess.STDOUT)
            commands.append(dict(label=label,command=command,environment=extra,exit_code=result.returncode,elapsed_seconds=time.monotonic()-start,external_timeout_seconds=1800))
            write(DEST/'commands.json',commands)
            assert hashes()==source and hashlib.sha256(Path(__file__).read_bytes()).hexdigest()==recipe
            assert result.returncode==0,label
            samples=[]
            for path in sorted(home.glob('**/new/benchmark.json')):
                row=read(path);samples.append(dict(name=row['full_id'],benchmark=row,estimates=read(path.with_name('estimates.json')),samples=read(path.with_name('sample.json'))))
            assert samples,label
            write(DEST/f'{label}-samples.json',samples)
            values[side].append({r['name']:r['estimates']['mean']['point_estimate'] for r in samples})
    cases=set(values['baseline'][0]);assert all(set(row)==cases for trials in values.values() for row in trials)
    for case in sorted(cases):
        a=statistics.median(r[case] for r in values['baseline']);b=statistics.median(r[case] for r in values['candidate'])
        costs.append(dict(corpus=corpus,case=case,baseline_median_ns=a,candidate_median_ns=b,ratio=b/a))
    write(DEST/'costs.json',costs)
assert len(costs)==196
write(DEST/'summary.json',dict(cases=len(costs),processes=len(commands),adverse_timing_rows=[r for r in costs if r['ratio']>1.10],
    median_case_ratio=statistics.median(r['ratio'] for r in costs),maximum_case_ratio=max(r['ratio'] for r in costs),
    binary_sizes=[dict(corpus=name,baseline_bytes=metadata['baseline'][name]['bytes'],candidate_bytes=metadata['candidate'][name]['bytes']) for name in filters],
    limitation='Shared-host unchanged Criterion bodies; no scalar allocation counters or controlled-host speedup claim. All baselines were frozen before the current production edits.'))
print('completed dependency costs:',len(costs),'cases',flush=True)
