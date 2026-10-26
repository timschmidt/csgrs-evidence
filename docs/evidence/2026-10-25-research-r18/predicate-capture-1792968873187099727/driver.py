from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
build = json.loads((raw / 'latest-capture-build.json').read_text())
binary = Path(build['binary'])
assert build['graph_controls_passed']
assert hashlib.sha256(binary.read_bytes()).hexdigest() == build['sha256']
record = raw / ('predicate-capture-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 1024**2, 64 * 1024**2))
def refs(value):
    if isinstance(value, dict):
        if set(value) == {'r16_node_ref'}:
            yield value['r16_node_ref']
        else:
            for v in value.values():
                yield from refs(v)
    elif isinstance(value, list):
        for v in value:
            yield from refs(v)
rows = []
for case in ['binary64', 'decimal']:
    folder = record / case
    folder.mkdir()
    env = os.environ.copy()
    env.update(R18_CAPTURE_DIR=str(folder))
    cmd = ['/usr/bin/time', '-v', str(binary), case + '_compound_round_trip_union_matches_unit_cube',
           '--exact', '--test-threads=1', '--nocapture']
    start = time.monotonic()
    with (folder / 'stdout').open('w') as out, (folder / 'stderr').open('w') as err:
        proc = subprocess.Popen(cmd, cwd='/tmp/csgrs-r18-trace', env=env, stdout=out,
                                stderr=err, preexec_fn=limits, start_new_session=True)
        try:
            status = proc.wait(timeout=300)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            status = 'timeout'
    stderr = (folder / 'stderr').read_text()
    files = []
    for path in sorted(folder.glob('predicate-*.json')):
        data = json.loads(path.read_text())
        assert data['format'] == 'r16-exact-real-dag-v1'
        graph = data['computable']
        if graph is not None:
            assert 0 <= graph['root'] < len(graph['nodes'])
            for i, node in enumerate(graph['nodes']):
                assert all(0 <= child < i for child in refs(node))
        files.append({'path': str(path.relative_to(record)), 'bytes': path.stat().st_size,
                      'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                      'nodes': len(graph['nodes']) if graph is not None else 0,
                      'postorder_references_valid': True})
    rows.append({'case': case, 'command': cmd, 'status': status,
                 'seconds': time.monotonic() - start, 'files': files,
                 'stages': [line for line in stderr.splitlines() if line.startswith('R18_')],
                 'capture_errors': [line for line in stderr.splitlines() if line.startswith('R18_CAPTURE_ERROR')]})
    (record / 'results.json').write_text(json.dumps(rows, indent=2) + '\n')
    print('R18 CAPTURE', case, status, 'graphs', len(files), record, flush=True)
assert rows[0]['status'] == 101 and rows[0]['files'] and not rows[0]['capture_errors']
assert rows[1]['status'] == 0 and not rows[1]['files'] and not rows[1]['capture_errors']
result = {'record': str(record), 'build': build, 'runs': rows,
          'original_outcomes_preserved': True,
          'limits': {'seconds_per_case': 300, 'address_space_bytes': 8 * 1024**3,
                     'file_bytes': 64 * 1024**2, 'graphs': 16, 'one_graph_bytes': 32 * 1024**2},
          'scope': 'Diagnostic snapshot after the unchanged exact cascade declines. No arithmetic or recognizer limits changed; no native performance claim.'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-predicate-capture.json').write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print('R18 CAPTURE COMPLETE', record, flush=True)
