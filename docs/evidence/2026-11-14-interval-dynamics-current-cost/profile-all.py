"""Instruction attribution, not timing; preserve every owner workload and raw profile."""
from pathlib import Path
from collections import defaultdict
from concurrent.futures import ThreadPoolExecutor
import gzip, hashlib, json, os, re, shutil, subprocess, time

s = Path(__file__).parent
art = Path('/mnt/development/.interval-refactor-build/dynamics-current-cost-artifacts')
tool = '/tmp/interval-refactor/profiling-tools/valgrind/usr/bin/valgrind'
lib = '/tmp/interval-refactor/profiling-tools/valgrind/usr/libexec/valgrind'
variants = ['baseline', 'extraction', 'provider-control']
cases = [line.split('|', 2)[1] for line in (s/'observer-baseline.log').read_text().splitlines() if line.startswith('RESULT|')]
assert len(cases) == len(set(cases)) == 194
assert len(json.loads((s/'wide-runs.json').read_text())) == 6
(s/'profiles').mkdir(exist_ok=True)

def parse(raw):
    names = {}; counts = defaultdict(int); current = None; callee = False
    for line in raw.splitlines():
        if line.startswith(('fn=', 'cfn=')):
            match = re.fullmatch(r'(c?fn)=\((\d+)\)(?: (.*))?', line)
            assert match, line
            kind, key, name = match.groups()
            if name is not None:
                names[key] = name
            if kind == 'fn':
                current = key; callee = False
        elif line.startswith('calls='):
            callee = True
        elif re.match(r'^[+*\-0-9]', line):
            fields = line.split()
            if len(fields) == 2:
                if not callee and current is not None:
                    counts[current] += int(fields[1])
                callee = False
    result = defaultdict(int)
    for key, value in counts.items():
        result[names[key]] += value
    summary = int(re.search(r'^summary: (\d+)', raw, re.M)[1])
    assert sum(result.values()) == summary
    return summary, dict(result)

def worker(slot):
    common = Path(f'/tmp/interval-refactor/dynamics-current-cost-profile-executable-{slot}')
    rows = []
    for case in cases[slot::4]:
        for variant in variants:
            source = art/('observer-'+variant)
            shutil.copy2(source, common)
            stem = s/'profiles'/f'{case}-{variant}'
            raw_path = stem.with_suffix('.out')
            cmd = [tool, '--tool=callgrind', '--collect-atstart=no',
                   '--toggle-collect=dynamics_profile_epoch',
                   '--callgrind-out-file='+str(raw_path), str(common)]
            settings = {'VALGRIND_LIB':lib, 'OWNER_PROFILE':'1', 'OWNER_CASE':case}
            start = time.monotonic()
            with stem.with_suffix('.log').open('w') as log:
                run = subprocess.run(cmd, env=os.environ|settings, stdout=log, stderr=subprocess.STDOUT, timeout=300)
            assert run.returncode == 0, (case, variant, run.returncode)
            raw = raw_path.read_bytes()
            count, attribution = parse(raw.decode())
            compressed = gzip.compress(raw, mtime=0)
            stem.with_suffix('.out.gz').write_bytes(compressed)
            raw_path.unlink()
            row = dict(case=case, variant=variant, command=cmd, env=settings,
                       returncode=run.returncode, elapsed_seconds_not_timing=time.monotonic()-start,
                       sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                       raw_profile_sha256=hashlib.sha256(raw).hexdigest(),
                       compressed_profile_sha256=hashlib.sha256(compressed).hexdigest(),
                       instructions_per_32_completed_callbacks=count,
                       self_instructions=attribution)
            rows.append(row)
            stem.with_suffix('.json').write_text(json.dumps(row, indent=2)+'\n')
        print(slot, case, flush=True)
    return rows

with ThreadPoolExecutor(max_workers=4) as pool:
    rows = [row for group in pool.map(worker, range(4)) for row in group]
assert len(rows) == 582
out = []
for case in cases:
    data = {r['variant']:r for r in rows if r['case'] == case}
    counts = {v:data[v]['instructions_per_32_completed_callbacks'] for v in variants}
    names = set().union(*(r['self_instructions'] for r in data.values()))
    changed = []
    for name in sorted(names):
        values = {v:data[v]['self_instructions'].get(name, 0) for v in variants}
        if len(set(values.values())) > 1:
            changed.append(dict(function=name, self_instructions=values))
    out.append(dict(case=case, instructions=counts,
                    extraction_delta=counts['extraction']-counts['baseline'],
                    provider_delta=counts['provider-control']-counts['baseline'],
                    attribution_changes=changed))
(s/'all-profile-comparison.json').write_text(json.dumps(out, indent=2)+'\n')
print({v: {k:sum((r[v]>0 if k=='increased' else r[v]<0 if k=='decreased' else r[v]==0) for r in out) for k in ['increased','decreased','unchanged']} for v in ['extraction_delta','provider_delta']}, flush=True)
