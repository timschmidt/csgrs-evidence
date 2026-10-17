"""Capture package contents and documented-consumer resolution in fresh roots."""
import collections
import gzip
import hashlib
import json
import os
from pathlib import Path
import resource
import selectors
import shutil
import signal
import subprocess
import time
import tomllib

W = Path(__file__).resolve().parent
ROOT = W.parents[2]
R = Path('/run/user/1000/csgrs-package-evidence-boundary-v1')


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def guards():
    failures = []
    if shutil.disk_usage(ROOT).free < 512 * 1024**2:
        failures.append('repository_free_bytes')
    if shutil.disk_usage(R.parent).free < 256 * 1024**2:
        failures.append('runtime_free_bytes')
    mem = dict(line.split(':', 1) for line in Path('/proc/meminfo').read_text().splitlines())
    if int(mem['MemAvailable'].split()[0]) * 1024 < 2 * 1024**3:
        failures.append('host_available_memory')
    files = [p for p in R.rglob('*') if p.is_file()] if R.exists() else []
    if sum(p.stat().st_size for p in files) > 16 * 1024**2:
        failures.append('runtime_output_bytes')
    if sum(p.stat().st_size for p in files if p.name.endswith('.gz')) > 12 * 1024**2:
        failures.append('compressed_log_bytes')
    return failures


def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))


def run(name, argv, cwd, extra=None):
    folder = R / name
    folder.mkdir()
    record = {'command': argv, 'cwd': str(cwd), 'environment_overrides': extra or {},
              'start_unix': time.time(), 'resource_stops': guards()}
    if record['resource_stops']:
        record.update(exit_code=None, not_run=True)
        dump(folder / 'result.json', record)
        return record
    env = dict(os.environ, CARGO_INCREMENTAL='0', CARGO_BUILD_JOBS='2',
               TMPDIR=str(R / 'tmp'), CARGO_TARGET_DIR=str(folder / 'target'))
    env.update(extra or {})
    record['environment_overrides'].update({k: env[k] for k in [
        'CARGO_INCREMENTAL', 'CARGO_BUILD_JOBS', 'TMPDIR', 'CARGO_TARGET_DIR']})
    start = time.monotonic()
    child = subprocess.Popen(argv, cwd=cwd, env=env, stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE, start_new_session=True, preexec_fn=limits)
    selector = selectors.DefaultSelector()
    streams = {}
    for label, pipe in [('stdout', child.stdout), ('stderr', child.stderr)]:
        streams[label] = gzip.open(folder / (label + '.gz'), 'wb')
        selector.register(pipe, selectors.EVENT_READ, label)
    raw_bytes = 0
    terminated_at = None
    last_guard = 0.0
    while selector.get_map() or child.poll() is None:
        now = time.monotonic()
        if now - last_guard >= 0.5:
            reasons = guards()
            if now - start > 900:
                reasons.append('wall_seconds')
            if raw_bytes > 256 * 1024**2:
                reasons.append('raw_output_bytes')
            if reasons and terminated_at is None and child.poll() is None:
                record['resource_stops'] = reasons
                os.killpg(child.pid, signal.SIGTERM)
                terminated_at = now
            if terminated_at and now - terminated_at > 5 and child.poll() is None:
                os.killpg(child.pid, signal.SIGKILL)
            last_guard = now
        for key, _ in selector.select(0.1):
            chunk = os.read(key.fileobj.fileno(), 65536)
            if chunk:
                streams[key.data].write(chunk)
                raw_bytes += len(chunk)
            else:
                selector.unregister(key.fileobj)
                key.fileobj.close()
    for stream in streams.values():
        stream.close()
    selector.close()
    record.update(exit_code=child.wait(), elapsed_seconds=time.monotonic() - start,
                  raw_output_bytes=raw_bytes, not_run=False)
    record['outputs_sha256'] = {p.name: sha(p) for p in folder.glob('*.gz')}
    dump(folder / 'result.json', record)
    print(json.dumps({'name': name, 'exit_code': record['exit_code'],
                      'seconds': record['elapsed_seconds'], 'resource_stops': record['resource_stops']}), flush=True)
    return record

