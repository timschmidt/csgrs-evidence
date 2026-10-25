from pathlib import Path
import gzip
import hashlib
import json
import os
import signal
import subprocess
import threading
import time

raw = Path(__file__).resolve().parent
pointer = json.loads((raw / 'latest-held-report.json').read_text())
assert pointer['status'] == 0
capture = Path(pointer['record'])
inputs = [p for p in capture.iterdir() if p.name.startswith('heaptrack') and p.suffix in ['.gz', '.zst']]
assert len(inputs) == 1, inputs
trace = inputs[0]
record = raw / ('held-analysis-stream-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
read_fd, write_fd = os.pipe()
cmd = ['heaptrack_print', '-f', str(trace), '--disable-builtin-suppressions',
       '--disable-embedded-suppressions', '--merge-backtraces', '0',
       '--print-leaks', '1', '--print-peaks', '0', '--print-allocators', '0',
       '--print-temporary', '0', '--peak-limit', '40', '--sub-peak-limit', '3',
       '--print-flamegraph', '/proc/self/fd/' + str(write_fd),
       '--flamegraph-cost-type', 'leaked']
start = time.monotonic()
total, lines, zero_lines, expanded = 0, 0, 0, 0
exclusive, sites = {}, {}
inclusive_laurent = 0
stream_digest = hashlib.sha256()
crates = ['hyperreal', 'hyperlattice', 'hyperlimit', 'hypersolve',
          'hypercurve', 'hypermesh', 'hypertri', 'hyperbrep',
          'hyperdrc', 'hypercircuit', 'hyperphysics', 'hyperspatial']
prefixes = tuple(prefix for crate in crates for prefix in (crate + '::', '<' + crate + '::'))
expired = threading.Event()

with (record / 'print.stdout').open('w') as out, (record / 'print.stderr').open('w') as err:
    proc = subprocess.Popen(cmd, stdout=out, stderr=err, pass_fds=(write_fd,), start_new_session=True)
    os.close(write_fd)

    def timeout():
        expired.set()
        try:
            os.killpg(proc.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass

    timer = threading.Timer(600, timeout)
    timer.start()
    problem = None
    try:
        with os.fdopen(read_fd, 'rb') as stream, (record / 'held-stacks.txt.gz').open('wb') as disk:
            with gzip.GzipFile(filename='', mode='wb', fileobj=disk, mtime=0, compresslevel=1) as compressed:
                while line := stream.readline(8 * 1024 * 1024 + 1):
                    assert len(line) <= 8 * 1024 * 1024, 'overlong derived stack'
                    lines += 1
                    expanded += len(line)
                    assert expanded <= 16 * 1024 ** 3, 'expanded stream cap'
                    assert disk.tell() <= 512 * 1024 ** 2, 'compressed stream cap'
                    stream_digest.update(line)
                    compressed.write(line)
                    frames, count = line.decode().rstrip('\n').rsplit(' ', 1)
                    count = int(count)
                    if not count:
                        zero_lines += 1
                        continue
                    total += count
                    if 'pi_laurent' in frames:
                        inclusive_laurent += count
                    project = next((frame for frame in reversed(frames.split(';')) if frame.startswith(prefixes)), None)
                    if project is None:
                        category = 'no recognized project frame'
                    elif project.startswith(('hyperreal::', '<hyperreal::')):
                        if any(name in project for name in ['retain_linear', 'retain_negation_entry', 'retain_inverse_entry', 'retain_square_reduction']):
                            category = 'Hyperreal rational derived cache records'
                        elif 'EvaluationCache' in project:
                            category = 'Hyperreal Computable evaluation cache'
                        elif 'rational::' in project:
                            category = 'Hyperreal rational arithmetic/value storage'
                        else:
                            category = 'Hyperreal other scalar work'
                    else:
                        category = next(crate for crate in crates if project.startswith((crate + '::', '<' + crate + '::')))
                    exclusive[category] = exclusive.get(category, 0) + count
                    key = project or '[none]'
                    sites[key] = sites.get(key, 0) + count
        status = proc.wait(timeout=30)
    except BaseException as error:
        problem = repr(error)
        try:
            os.killpg(proc.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        status = proc.wait()
    finally:
        timer.cancel()
metadata = {'command': cmd, 'status': status, 'seconds': time.monotonic() - start,
            'problem': problem, 'timeout': expired.is_set(), 'input': str(trace),
            'input_sha256': hashlib.sha256(trace.read_bytes()).hexdigest(),
            'expanded_bytes': expanded, 'expanded_sha256': stream_digest.hexdigest(),
            'stack_rows': lines, 'zero_weight_rows': zero_lines,
            'retention': 'Entire derived stream losslessly compressed as received; zero-weight stacks counted and retained but do not contribute allocation bytes.',
            'limits': {'seconds': 600, 'expanded_bytes': 16 * 1024 ** 3, 'compressed_bytes': 512 * 1024 ** 2, 'line_bytes': 8 * 1024 ** 2},
            'terminology': 'heaptrack calls these leaked bytes because the diagnostic exits with reachable roots held; no leak inference is made.'}
(record / 'command.json').write_text(json.dumps(metadata, indent=2) + '\n')
assert status == 0 and problem is None and not expired.is_set(), record
restored = hashlib.sha256()
with gzip.open(record / 'held-stacks.txt.gz', 'rb') as stream:
    while chunk := stream.read(1 << 20):
        restored.update(chunk)
assert restored.hexdigest() == stream_digest.hexdigest()
assert sum(exclusive.values()) == total
result = {'held_trace_bytes': total,
          'exclusive_innermost_project_frame': sorted(exclusive.items(), key=lambda item: -item[1]),
          'top_project_sites': sorted(sites.items(), key=lambda item: -item[1]),
          'inclusive_pi_laurent_bytes': inclusive_laurent,
          'compression_round_trip_verified': True,
          'scope': 'Allocation origin, not a complete semantic ownership graph. Inclusive Laurent bytes overlap exclusive categories and must not be added. Rust counters exclude C allocations/allocator overhead; heaptrack may include non-Rust/system payload.'}
(record / 'attribution.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-held-analysis.json').write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print(json.dumps({k: v for k, v in result.items() if k != 'top_project_sites'}, indent=2))
