from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
record = raw / ('raw-decode-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
(record / 'decoder.cpp').write_bytes((raw / 'decode_heaptrack.cpp').read_bytes())
binary = raw / 'decode-heaptrack-binary'
metadata = {'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
            'compiler': subprocess.check_output(['c++', '--version'], text=True),
            'build_command': ['c++', '-std=c++17', '-O2', '-Wall', '-Wextra', '-Werror', str(raw / 'decode_heaptrack.cpp'), '-o', str(binary)],
            'format_sources': [
                'https://raw.githubusercontent.com/KDE/heaptrack/v1.5.0/src/analyze/accumulatedtracedata.cpp',
                'https://raw.githubusercontent.com/KDE/heaptrack/v1.5.0/src/util/linereader.h'],
            'scope': 'Independent format-3 event replay: positive/negative multiplicities by allocation-info index; exact bytes by trace; export only live traces and required metadata. No suppressions, filters, timing windows or truncation.'}
(record / 'metadata.json').write_text(json.dumps(metadata, indent=2) + '\n')


def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024 ** 3, 8 * 1024 ** 3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (512 * 1024 ** 2, 512 * 1024 ** 2))


sources = []
for name in ['held', 'dropped']:
    paths = list((raw / 'heaptrack-control').glob(name + '.zst'))
    assert len(paths) == 1
    sources.append((name, paths[0]))
capture = Path(json.loads((raw / 'latest-held-report.json').read_text())['record'])
sources.append(('nano', capture / 'heaptrack.zst'))
results = {}
for name, path in sources:
    folder = record / name
    folder.mkdir()
    start = time.monotonic()
    with (folder / 'zstd.stderr').open('w') as decompress_err, (folder / 'decode.stderr').open('w') as decoder_err, (folder / 'decode.stdout').open('w') as out:
        decompressor = subprocess.Popen(['zstdcat', str(path)], stdout=subprocess.PIPE, stderr=decompress_err, preexec_fn=limits, start_new_session=True)
        proc = subprocess.Popen([str(binary), str(folder)], stdin=decompressor.stdout, stdout=out, stderr=decoder_err, preexec_fn=limits, start_new_session=True)
        decompressor.stdout.close()
        try:
            status = proc.wait(timeout=300)
            zstatus = decompressor.wait(timeout=30)
        except subprocess.TimeoutExpired:
            for child in [proc, decompressor]:
                try:
                    os.killpg(child.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
                child.wait()
            status = zstatus = 'timeout'
    result = {'input': str(path), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
              'decoder_status': status, 'decompressor_status': zstatus,
              'seconds': time.monotonic() - start, 'commands': [['zstdcat', str(path)], [str(binary), str(folder)]]}
    (folder / 'command.json').write_text(json.dumps(result, indent=2) + '\n')
    assert status == 0 and zstatus == 0, folder
    result['counts'] = json.loads((folder / 'decode.stdout').read_text())
    if name in ['held', 'dropped']:
        assert result['counts']['live_bytes'] == (4096 if name == 'held' else 0)
    results[name] = result
    print('RAW DECODE', name, result['counts'], flush=True)
(record / 'completion.json').write_text(json.dumps(results, indent=2) + '\n')
(raw / 'latest-raw-decode.json').write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
