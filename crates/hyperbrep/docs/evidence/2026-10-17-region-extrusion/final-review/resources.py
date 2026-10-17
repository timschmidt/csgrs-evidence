"""Observe completed workflows after qualification, with no overlapping task builds."""
import hashlib
import json
from pathlib import Path
import platform
import shutil
import statistics
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ENV, hashes, run

read=lambda name:json.loads((OUT/name).read_text())
sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
source=hashes()
recipe=sha(Path(__file__))
sampler=Path(__file__).with_name('measure.py')
sampler_hash=sha(sampler)
assert read('finish-checks.json')['passed']
artifacts=[json.loads(line) for line in (OUT/'region-benchmark-build-1.log').read_text().splitlines() if line.startswith('{')]
built=next(row for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']=='region_exchange' and row.get('executable'))
benchmark=Path('/tmp/hyperbrep-region-exchange-benchmark')
assert not benchmark.exists()
shutil.copy2(built['executable'],benchmark)
binaries=dict(benchmark=dict(path=str(benchmark),bytes=benchmark.stat().st_size,sha256=sha(benchmark)),
    components=read('components-binary.json'),
    old_baseline=json.loads((OUT.parent/'2026-10-17-stroke-upstream-integration/candidate-consumer-binary.json').read_text()),
    old_candidate=read('old-path-control.json')['binary'])
(OUT/'resource-binaries.json').write_text(json.dumps(binaries,indent=2)+'\n')
outputs=OUT/'resource-samples'
outputs.mkdir(exist_ok=True)
rows=[]
def observe(label,command,expected_code=0):
    resource=outputs/(label+'.json')
    code=run(label,['python3',str(sampler),str(resource),*command],300)
    recorded=read('attempts.json')[-1]
    metrics=json.loads(resource.read_text())
    assert code==metrics['exit_code']==expected_code
    assert hashes()==source and sha(sampler)==sampler_hash
    for binary in binaries.values():assert sha(Path(binary['path']))==binary['sha256']
    return recorded,metrics,(OUT/recorded['log']).read_text()

def output_rows(directory,reference):
    result=[]
    files=sorted(directory.glob('*'))
    for path in files:
        assert path.read_bytes()==(reference/path.name).read_bytes()
        result.append(dict(path=str(path.relative_to(OUT)),bytes=path.stat().st_size,sha256=sha(path)))
    return result

cases=[f'{cap}-reverse-{reverse}' for cap in ['Butt','Round'] for reverse in ['false','true']]
for sample in range(3):
    label=f'cost-region-{sample}'
    command,metrics,log=observe(label,[str(benchmark)])
    measurements=[json.loads(line) for line in log.splitlines() if line.startswith('{')]
    assert len(measurements)==4
    for measurement,case in zip(measurements,cases):
        cap,reverse=case.split('-reverse-')
        assert measurement['case']==f'region_exchange/{cap}/reverse_{reverse}'
        assert measurement['outcome']=='certified' and measurement['iterations']==3
        step=(OUT/'region-exports'/(case+'.step')).read_bytes()
        native=(OUT/'region-exports'/(case+'.json')).read_bytes()
        receipt=0xcbf29ce484222325
        for byte in step+native:receipt=((receipt^byte)*0x100000001b3)&((1<<64)-1)
        assert (measurement['step_bytes'],measurement['native_bytes'],measurement['receipt'])==(len(step),len(native),receipt)
    rows.append(dict(kind='region_benchmark',sample=sample,command=command,metrics=metrics,measurements=measurements))

    label=f'cost-components-{sample}'
    directory=outputs/(label+'-artifacts')
    command,metrics,log=observe(label,[binaries['components']['path'],str(directory)])
    for reverse in ['false','true']:assert f'case=components-reverse-{reverse} outcome=certified' in log
    files=output_rows(directory,OUT/'component-exports')
    assert len(files)==4
    rows.append(dict(kind='components',sample=sample,command=command,metrics=metrics,artifacts=files))

    for phase in (['baseline','candidate'] if sample%2==0 else ['candidate','baseline']):
        for case in cases:
            complete=case.startswith('Butt')
            label=f'cost-old-path-{phase}-{sample}-{case}'
            directory=outputs/(label+'-artifacts')
            command,metrics,log=observe(label,[binaries['old_'+phase]['path'],str(directory),case],0 if complete else 101)
            assert (f'case={case} outcome=certified' in log) if complete else ('Geometry(UnsupportedMeasurement)' in log)
            files=output_rows(directory,OUT/'old-path-artifacts')
            assert len(files)==(2 if complete else 0)
            rows.append(dict(kind='old_path',phase=phase,sample=sample,case=case,
                outcome='certified' if complete else 'unsupported_measurement',command=command,metrics=metrics,artifacts=files))

summaries=[]
for case in cases:
    cap,reverse=case.split('-reverse-')
    name=f'region_exchange/{cap}/reverse_{reverse}'
    measurements=[m for row in rows if row['kind']=='region_benchmark' for m in row['measurements'] if m['case']==name]
    values={key:statistics.median(m[key]/m['iterations'] for m in measurements)
        for key in ['elapsed_ns','allocation_calls','requested_bytes']}
    summaries.append(dict(case=case,per_complete_workflow=values,successful_completions=9,
        scope='Three measured iterations in each of three fresh processes, following one complete warmup per case.'))
old=[]
for case in cases:
    phases={phase:{key:statistics.median(row['metrics'][key] for row in rows
        if row['kind']=='old_path' and row['phase']==phase and row['case']==case)
        for key in ['wall_seconds','user_seconds','system_seconds','maximum_rss_kib']}
        for phase in ['baseline','candidate']}
    value=dict(case=case,completed=case.startswith('Butt'),medians=phases)
    if value['completed']:value['wall_ratio']=phases['candidate']['wall_seconds']/phases['baseline']['wall_seconds']
    old.append(value)
processes={kind:{key:statistics.median(row['metrics'][key] for row in rows if row['kind']==kind)
    for key in ['wall_seconds','user_seconds','system_seconds','maximum_rss_kib']}
    for kind in ['region_benchmark','components']}
assert sha(Path(__file__))==recipe
hardware=dict(uname=list(platform.uname()),cpu=subprocess.check_output(['lscpu'],text=True),
    memory=Path('/proc/meminfo').read_text(),rustc=subprocess.check_output(['rustc','-Vv'],env=ENV,text=True),
    cargo=subprocess.check_output(['cargo','-V'],env=ENV,text=True))
(OUT/'resource-observations.json').write_text(json.dumps(dict(source=source,recipe_sha256=recipe,
    sampler=dict(path=str(sampler),sha256=sampler_hash,method='Linux wait4; per-child peak RSS in KiB; child wall includes launch, excludes sampler setup and report writing.'),
    binaries=binaries,rows=rows,complete_region_workflows=summaries,process_medians=processes,
    preserved_old_path=old,hardware=hardware,
    procedure='No task builds or correctness runs overlap measurement. Three fresh processes per configuration. New region benchmark: one complete warmup and three timed iterations per case, allocation requests include reallocations; independent full assertions and materialized native/STEP artifacts remain inside timing. Component consumer executes both complete workflows per process, no warmup. Original path phases alternate order; unchanged original inputs and unsupported failures retained. OS/shared caches are not flushed.',
    limitations='Absolute new-capability costs, not a speedup claim. No ratio compares a new success to an old failure. Old successful-process comparisons are short shared-host observations, not a controlled optimization campaign. Allocation bytes are requests, not live heap; RSS is process-wide and is not an operation-wide bound. No new production allocation or cache policy. Binary sizes are consumer observations, not shipped-package sizes. Existing private construction and callers are unchanged; earlier broad benchmark receipts remain pinned to their own source.'),indent=2)+'\n')
print(json.dumps(dict(new=summaries,processes=processes,old=old),indent=2),flush=True)
