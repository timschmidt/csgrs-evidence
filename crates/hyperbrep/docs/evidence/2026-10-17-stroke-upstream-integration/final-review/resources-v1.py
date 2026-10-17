"""Observe complete frozen consumers, keeping unsupported cases separate.

Run after qualification, with no task compilation/tests overlapping. These are
small shared-host process observations, not a controlled speedup campaign.
"""
import hashlib
import json
from pathlib import Path
import platform
import statistics
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes, run

source = hashes()
recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
read = lambda name: json.loads((OUT/name).read_text())
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
binaries = {phase: read(phase+'-consumer-binary.json') for phase in ['baseline','candidate']}
for value in binaries.values():
    assert sha(Path(value['path'])) == value['sha256']
outputs = OUT/'resource-observations'
outputs.mkdir(exist_ok=True)
cases = [f'{cap}-reverse-{reverse}' for cap in ['Butt','Round'] for reverse in ['false','true']]
rows = []
for sample in range(3):
    for phase in (['baseline','candidate'] if sample % 2 == 0 else ['candidate','baseline']):
        for case in cases:
            label = f'resources-{phase}-{sample}-{case}'
            resource = outputs/(label+'.jsonl')
            artifacts = outputs/(label+'-artifacts')
            code = run(label, ['/usr/bin/time','-f',
                '{"wall_seconds":%e,"user_seconds":%U,"system_seconds":%S,"maximum_rss_kib":%M,"exit_code":%x}',
                '-o',str(resource),binaries[phase]['path'],str(artifacts),case],300)
            command = read('attempts.json')[-1]
            log = (OUT/command['log']).read_text()
            metrics = json.loads(resource.read_text().splitlines()[-1])
            assert metrics['exit_code'] == code
            complete = case.startswith('Butt')
            assert code == (0 if complete else 101)
            assert (f'case={case} outcome=certified' in log) if complete else ('Geometry(UnsupportedMeasurement)' in log)
            artifact_rows = []
            for artifact in sorted(artifacts.glob('*')):
                baseline = OUT/(phase+'-artifacts')/artifact.name
                assert artifact.read_bytes() == baseline.read_bytes()
                artifact_rows.append(dict(path=str(artifact.relative_to(OUT)),sha256=sha(artifact),bytes=artifact.stat().st_size))
            assert len(artifact_rows) == (2 if complete else 0)
            rows.append(dict(phase=phase,sample=sample,case=case,
                outcome='certified' if complete else 'unsupported_measurement',
                metrics=metrics,command=command,artifacts=artifact_rows))
            assert hashes() == source
            for value in binaries.values():
                assert sha(Path(value['path'])) == value['sha256']
summaries = []
for case in cases:
    values = {}
    for phase in binaries:
        matching = [row['metrics'] for row in rows if row['case']==case and row['phase']==phase]
        values[phase] = {name: statistics.median(row[name] for row in matching)
                         for name in ['wall_seconds','user_seconds','system_seconds','maximum_rss_kib']}
    summary = dict(case=case,completed=case.startswith('Butt'),medians=values)
    if summary['completed']:
        summary['wall_ratio'] = values['candidate']['wall_seconds']/values['baseline']['wall_seconds']
    summaries.append(summary)
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
hardware = dict(uname=list(platform.uname()),
    cpu=subprocess.check_output(['lscpu'],text=True),
    memory=Path('/proc/meminfo').read_text(),
    rustc=subprocess.check_output(['rustc','-Vv'],env=ENV,text=True),
    cargo=subprocess.check_output(['cargo','-V'],env=ENV,text=True))
(OUT/'resource-observations.json').write_text(json.dumps(dict(source=source,recipe_sha256=recipe,
    binaries=binaries,rows=rows,summaries=summaries,hardware=hardware,
    procedure='Three fresh processes per phase and original case, alternating phase order, no warmup. Each successful process constructs, transforms, inspects strict results, cold-replays, writes/reimports STEP and continues Boolean modeling. Failed cases stop at the original area assertion. OS/shared caches are not flushed. No task builds/tests overlap this script.',
    limitations='Small shared-host observations, not speedup evidence. Failed workflows have no successful-work ratio. Process RSS is not retained heap and no allocation counter is installed. Frozen executable sizes are consumer-build observations, not shipped-package size. The preceding cone allocation/benchmark campaign remains pinned to its own source.'),indent=2)+'\n')
print(json.dumps(summaries,indent=2),flush=True)
