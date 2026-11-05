import hashlib, json, os, platform, statistics, subprocess, time
from pathlib import Path

root = Path(__file__).resolve().parent
out = root / 'results'
out.mkdir(exist_ok=True)
rows = {}
for case in ['plain', 'construct', 'edit', 'replay', 'brep_replay']:
    for round_index in range(4):
        variants = ['baseline', 'candidate'] if round_index % 2 == 0 else ['candidate', 'baseline']
        for variant in variants:
            stem = out / f'{case}-{variant}-{round_index}'
            command = [str(root / f'{variant}-probe'), case, '5', str(stem.with_suffix('.svg'))]
            started = time.time()
            result = subprocess.run(command, capture_output=True, text=True)
            stem.with_suffix('.tsv').write_text(result.stdout)
            stem.with_suffix('.log').write_text(result.stderr)
            with (out / 'attempts.jsonl').open('a') as f:
                f.write(json.dumps(dict(command=command, started=started, exit_code=result.returncode)) + '\n')
            result.check_returncode()
            rows.setdefault((case, variant), []).extend([list(map(int, line.split('\t')[2:])) for line in result.stdout.splitlines()])
    for suffix in ['.svg', '.svg.native']:
        files = [out / f'{case}-{variant}-{i}{suffix}' for variant in ['baseline', 'candidate'] for i in range(4)]
        assert all(p.read_bytes() == files[0].read_bytes() for p in files), files
summary = {'machine': platform.uname()._asdict(), 'samples_per_variant_case': 20,
           'order': 'alternating paired blocks of five, four rounds',
           'columns': ['elapsed_ns', 'allocated_bytes', 'allocation_calls', 'peak_bytes', 'retained_delta'],
           'exact_geometry_and_native_bytes_equal_all_cases': True,
           'binaries': {v: {'sha256': hashlib.sha256((root / f'{v}-probe').read_bytes()).hexdigest(), 'bytes': (root / f'{v}-probe').stat().st_size} for v in ['baseline', 'candidate']},
           'median': {f'{c}/{v}': [statistics.median(col) for col in zip(*values)] for (c,v), values in rows.items()}}
(out / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps(summary, indent=2), flush=True)
