from pathlib import Path
import hashlib
import json
import subprocess
import time

raw = Path(__file__).resolve().parent
pointer = json.loads((raw / 'latest-held-report.json').read_text())
assert pointer['status'] == 0
record = Path(pointer['record'])
inputs = [p for p in record.iterdir() if p.name.startswith('heaptrack') and p.suffix in ['.gz', '.zst']]
assert len(inputs) == 1, inputs
trace = inputs[0]
stacks = record / 'held-stacks.txt'
cmd = ['heaptrack_print', '-f', str(trace), '--disable-builtin-suppressions',
       '--disable-embedded-suppressions', '--merge-backtraces', '0',
       '--print-leaks', '1', '--print-peaks', '0', '--print-allocators', '0',
       '--print-temporary', '0', '--peak-limit', '40', '--sub-peak-limit', '3',
       '--print-flamegraph', str(stacks), '--flamegraph-cost-type', 'leaked']
start = time.monotonic()
with (record / 'heaptrack-print.stdout').open('w') as out, (record / 'heaptrack-print.stderr').open('w') as err:
    status = subprocess.run(cmd, stdout=out, stderr=err, timeout=300).returncode
(record / 'heaptrack-print-command.json').write_text(json.dumps({
    'command': cmd, 'status': status, 'seconds': time.monotonic() - start,
    'input_sha256': hashlib.sha256(trace.read_bytes()).hexdigest(),
    'terminology': 'heaptrack calls these leaked bytes because the diagnostic exits with reachable roots held; no leak inference is made.',
}, indent=2) + '\n')
assert status == 0
total = 0
exclusive = {}
sites = {}
inclusive_laurent = 0
for line in stacks.read_text().splitlines():
    frames, count = line.rsplit(' ', 1)
    count = int(count)
    total += count
    if 'pi_laurent' in frames:
        inclusive_laurent += count
    project = next((frame for frame in reversed(frames.split(';'))
                    if any(frame.startswith((crate + '::', '<' + crate + '::')) for crate in [
                        'hyperreal', 'hyperlattice', 'hyperlimit', 'hypersolve',
                        'hypercurve', 'hypermesh', 'hypertri', 'hyperbrep',
                        'hyperdrc', 'hypercircuit', 'hyperphysics', 'hyperspatial'])), None)
    if project is None:
        category = 'no recognized project frame'
    elif 'hyperreal::' in project:
        if any(name in project for name in ['retain_linear', 'retain_negation_entry', 'retain_inverse_entry', 'retain_square_reduction']):
            category = 'Hyperreal rational derived cache records'
        elif 'EvaluationCache' in project:
            category = 'Hyperreal Computable evaluation cache'
        elif 'rational::' in project:
            category = 'Hyperreal rational arithmetic/value storage'
        else:
            category = 'Hyperreal other scalar work'
    else:
        category = next(crate for crate in ['hyperlattice', 'hyperlimit', 'hypersolve', 'hypercurve', 'hypermesh', 'hypertri', 'hyperbrep', 'hyperdrc', 'hypercircuit', 'hyperphysics', 'hyperspatial'] if crate + '::' in project)
    exclusive[category] = exclusive.get(category, 0) + count
    key = project or '[none]'
    sites[key] = sites.get(key, 0) + count
assert sum(exclusive.values()) == total
result = {'held_trace_bytes': total,
          'exclusive_innermost_project_frame': sorted(exclusive.items(), key=lambda item: -item[1]),
          'top_project_sites': sorted(sites.items(), key=lambda item: -item[1])[:50],
          'inclusive_pi_laurent_bytes': inclusive_laurent,
          'scope': 'Allocation origin, not a complete semantic ownership graph. Inclusive Laurent bytes overlap exclusive categories and must not be added. Rust counters exclude C allocations/allocator overhead; heaptrack may include non-Rust/system payload.'}
(record / 'attribution.json').write_text(json.dumps(result, indent=2) + '\n')
(record / 'analysis-driver.py').write_bytes(Path(__file__).read_bytes())
print(json.dumps({k: v for k, v in result.items() if k != 'top_project_sites'}, indent=2))
