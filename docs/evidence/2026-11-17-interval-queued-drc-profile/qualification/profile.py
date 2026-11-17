import json
import os
import pathlib
import re
import selectors
import signal
import subprocess
import time

stage = pathlib.Path(__file__).resolve().parent
prefix = pathlib.Path('/tmp/interval-refactor/profiling-tools/gdb')
binary = '/mnt/development/.interval-refactor-build/coordinated-ci/stable/release/deps/hyperdrc-1844e5fbe37d2531'
env = os.environ.copy()
env['LD_LIBRARY_PATH'] = str(prefix / 'usr/lib/x86_64-linux-gnu')
env['DEBUGINFOD_URLS'] = ''
env['HYPERDRC_REQUIRE_COMPLEX_FIXTURES'] = '1'
env['RUST_TEST_THREADS'] = '1'
env.pop('PYTHONHOME', None)
env.pop('PYTHONPATH', None)
argv = [str(prefix / 'usr/bin/gdb'), '--data-directory=' + str(prefix / 'usr/share/gdb'), '--nx', '--quiet', '--interpreter=mi2']
proc = subprocess.Popen(argv, cwd='/mnt/development/csgrs-coordinated-ci', env=env, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, start_new_session=True)
sel = selectors.DefaultSelector()
sel.register(proc.stdout, selectors.EVENT_READ)
raw = (stage / 'drc-stack-profile.log').open('w')
buffer = b''
responses = {}
token = 0
running = False
exited = False
inferior = None
inferior_start = None
exit_reason = None
samples = []
started = time.monotonic()
result = {'debugger_command': argv, 'binary': binary, 'sampling_period_seconds': 2, 'outer_limit_seconds': 600, 'purpose': 'Diagnostic stack sampling, not an acceptance timing run.'}
(stage / 'drc-profile-active.json').write_text(json.dumps({'pid': proc.pid, 'proc_starttime': pathlib.Path('/proc', str(proc.pid), 'stat').read_text().split()[21]}, indent=2) + '\n')

def read_events(wait):
    global buffer, running, exited, inferior, inferior_start, exit_reason
    for key, _ in sel.select(wait):
        data = os.read(key.fd, 65536)
        if not data:
            raise RuntimeError('Debugger stream closed before requested completion')
        buffer += data
        while b'\n' in buffer:
            line, buffer = buffer.split(b'\n', 1)
            line = line.decode(errors='replace').rstrip('\r')
            raw.write(line + '\n')
            raw.flush()
            match = re.match(r'(\d+)\^(.*)', line)
            if match:
                responses[int(match[1])] = match[2]
            if line.startswith('*running'):
                running = True
            if line.startswith('*stopped'):
                running = False
                if 'exited' in line:
                    exited, exit_reason = True, line
            if line.startswith('=thread-group-started'):
                match = re.search(r'pid="(\d+)"', line)
                if match:
                    inferior = int(match[1])
                    inferior_start = pathlib.Path('/proc', str(inferior), 'stat').read_text().split()[21]
            if line.startswith('=thread-group-exited'):
                exited, exit_reason = True, line

def command(text):
    global token
    token += 1
    current = token
    proc.stdin.write((str(current) + text + '\n').encode())
    proc.stdin.flush()
    deadline = time.monotonic() + 20
    while current not in responses:
        if time.monotonic() >= deadline:
            raise TimeoutError('Debugger command timeout: ' + text)
        read_events(0.2)
    response = responses.pop(current)
    if response.startswith('error'):
        raise RuntimeError(text + ': ' + response)
    return response

try:
    for setting in ['pagination off', 'confirm off', 'mi-async on', 'disable-randomization off', 'debuginfod enabled off', 'auto-load safe-path /nonexistent', 'environment LD_LIBRARY_PATH=']:
        command('-gdb-set ' + setting)
    command('-file-exec-and-symbols ' + json.dumps(binary))
    command('-exec-arguments --exact zz_complex_project_performance_tests::kicad_board_completes_smoke_check_suite --nocapture --test-threads=1')
    command('-exec-run')
    while not exited:
        next_sample = time.monotonic() + 2
        while not exited and time.monotonic() < next_sample:
            read_events(min(0.2, max(0, next_sample - time.monotonic())))
        if exited:
            break
        if time.monotonic() - started > 600:
            raise TimeoutError('Declared 600-second profiling limit reached')
        command('-exec-interrupt')
        deadline = time.monotonic() + 20
        while running and not exited:
            if time.monotonic() > deadline:
                raise TimeoutError('Inferior did not stop for sampling')
            read_events(0.2)
        if exited:
            break
        threads = command('-thread-info')
        matches = re.findall(r'\{id="(\d+)",.*?name="([^"]+)"', threads)
        workers = [thread for thread, name in matches if name.startswith('zz_complex_')]
        if workers:
            stack = command('-stack-list-frames --thread ' + workers[0] + ' 0 30')
            sample = {'elapsed_seconds': time.monotonic() - started, 'thread_id': workers[0], 'functions': re.findall(r'func="([^"]+)"', stack), 'raw_stack': stack}
            samples.append(sample)
            (stage / 'drc-stack-samples.json').write_text(json.dumps(samples, indent=2) + '\n')
        command('-exec-continue')
    result.update(completed=True, inferior_exit_record=exit_reason)
except Exception as error:
    result.update(completed=False, error=repr(error))
finally:
    if not exited and inferior is not None:
        path = pathlib.Path('/proc', str(inferior), 'stat')
        if path.exists() and path.read_text().split()[21] == inferior_start:
            os.kill(inferior, signal.SIGKILL)
    try:
        command('-gdb-exit')
    except Exception as error:
        result['debugger_shutdown_note'] = repr(error)
        if proc.poll() is None:
            proc.terminate()
    try:
        proc.wait(timeout=10)
    except subprocess.TimeoutExpired:
        proc.kill()
        proc.wait()
    result.update(debugger_exit_code=proc.returncode, elapsed_seconds=time.monotonic()-started, samples=len(samples))
    raw.close()
    (stage / 'drc-stack-profile-result.json').write_text(json.dumps(result, indent=2) + '\n')
    (stage / 'drc-profile-active.json').unlink()
    print(json.dumps(result), flush=True)
