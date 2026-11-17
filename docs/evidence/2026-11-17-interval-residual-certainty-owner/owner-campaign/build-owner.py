from pathlib import Path
import gzip
import hashlib
import json
import os
import re
import shutil
import signal
import subprocess
import time

from artifact_sizes import native

s = Path(__file__).parent
r = Path('/mnt/development/interval-residual-certainty/csgrs')
target = Path('/dev/shm/interval-residual-certainty-owner')
artifacts = Path('/mnt/development/.interval-refactor-build/residual-certainty-artifacts')
candidate = 'aad7409a5928e309812d9a5cc361d46313685266'
boundaries = [('fixed', 'c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb'),
              ('current', '4192d8c726d3333a31cb7eddc30cc0d464d61411'),
              ('candidate', candidate)]
parent, watcher = 1621335, 3416600


def save(name, value):
    (s / name).write_text(json.dumps(value, indent=2) + '\n')


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def state(pid, start):
    raw = Path(f'/proc/{pid}/stat').read_text()
    fields = raw[raw.rfind(')') + 2:].split()
    assert fields[19] == start
    return fields[0]


def git(*args):
    return subprocess.check_output(['git', *args], cwd=r)


assert state(parent, '38218939') == 'T' and state(watcher, '45823480') == 'S'
assert git('rev-parse', 'HEAD').decode().strip() == candidate
assert not git('status', '--porcelain=v1')
assert not target.exists() and not (s / 'owner-completion.json').exists()
assert sha(s.parent / 'coordinated-ci/quiet-workflow-executed-plan.json') == '1674343e351f5abe53f9c7bfdc9a5414f514ae15f38f3b328b1652ef6fb981b4'
target.mkdir()
(s / 'symbols').mkdir()
env = os.environ | {'CARGO_TARGET_DIR': str(target), 'CARGO_BUILD_JOBS': '6',
                    'CARGO_NET_OFFLINE': 'true', 'CARGO_TERM_COLOR': 'never',
                    'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1'}
commands, rows, references = [], [], {}
bench_names = json.loads((s / 'certification-cases.json').read_text())
bench_filter = '^(' + '|'.join(bench_names) + ')$'
started = time.monotonic()
deadline = started + 21600
held = False


def terminate_owned(process):
    if process.poll() is None:
        os.killpg(process.pid, signal.SIGTERM)
        try:
            process.wait(timeout=5)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()


def run(name, command, cwd=r, budget=1800, run_env=None):
    remaining = deadline - time.monotonic()
    assert remaining > 0, 'campaign budget exhausted before starting command'
    timeout = min(budget, remaining)
    raw = Path(f'/proc/{os.getpid()}/stat').read_text()
    save('owner-active.json', dict(pid=os.getpid(), proc_starttime=raw[raw.rfind(')') + 2:].split()[19], name=name, command=command, cwd=str(cwd), per_command_budget=budget, effective_timeout=timeout, started_unix=time.time()))
    before = time.monotonic()
    with (s / (name + '.stdout')).open('w') as out, (s / (name + '.stderr')).open('w') as err:
        process = subprocess.Popen(command, cwd=cwd, env=run_env or env, stdout=out, stderr=err, start_new_session=True)
        try:
            code = process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            terminate_owned(process)
            code = 124
        except BaseException:
            terminate_owned(process)
            save(name + '-interrupted.json', dict(command=command, child_pid=process.pid, child_exit=process.returncode, seconds=time.monotonic() - before))
            raise
    row = dict(name=name, command=command, cwd=str(cwd), exit_code=code, seconds=time.monotonic() - before, effective_timeout=timeout)
    commands.append(row)
    save('owner-commands.json', commands)
    assert code == 0, row
    print(name, 'passed', flush=True)
    return row


def measure(name, source):
    destination = artifacts / name
    assert not destination.exists()
    assert shutil.disk_usage(artifacts).free - Path(source).stat().st_size >= 20 * 1024**3
    shutil.copy2(source, destination)
    result = native(destination)
    outputs = {}
    for suffix, command in [('size', ['size', '-A']), ('sections', ['readelf', '-SW']), ('symbols', ['nm', '-S', '--defined-only'])]:
        data = subprocess.check_output([*command, str(destination)])
        path = s / 'symbols' / (name + '.' + suffix + '.gz')
        path.write_bytes(gzip.compress(data, compresslevel=1, mtime=0))
        assert gzip.decompress(path.read_bytes()) == data
        outputs[suffix] = dict(path=str(path), bytes=len(data), sha256=hashlib.sha256(data).hexdigest())
    sections, allocated, executable = {}, 0, 0
    listing = gzip.decompress(Path(outputs['sections']['path']).read_bytes()).decode()
    for line in listing.splitlines():
        match = re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+(\S+)\s+[0-9a-f]+\s+[0-9a-f]+\s+([0-9a-f]+)\s+[0-9a-f]+\s+([A-Z]*)', line)
        if match:
            section, kind, length, flags = match.groups()
            length = int(length, 16)
            sections[section] = dict(bytes=length, type=kind, flags=flags)
            allocated += length if 'A' in flags else 0
            executable += length if 'X' in flags else 0
    assert allocated > 0 and executable >= result['text']
    result.update(allocated_bytes=allocated, executable_bytes=executable, elf_sections=sections, listings=outputs)
    return result


def qualify(row):
    name, kind, features = row['name'], row['kind'], row['features']
    executable = row['size']['path']
    run_env = dict(env)
    cwd = r
    if kind in ['unit', 'smoke', 'regression']:
        args = ['--test-threads=1']
    elif kind == 'certification':
        args = ['--test', bench_filter]
    elif kind == 'representations':
        args = ['--test']
    elif kind == 'retained_fuzz':
        args = ['--list']
    else:
        args = []
        cwd = s / (name + '-trace-output')
        cwd.mkdir()
        run_env.pop('HYPERSOLVE_SKIP_BENCHMARK_REPORTS')
    result = run(name + '-functional', [executable, *args], cwd=cwd, budget=900, run_env=run_env)
    output = (s / (name + '-functional.stdout')).read_text()
    row['functional_exit_code'] = result['exit_code']
    if kind in ['unit', 'smoke', 'regression']:
        counts = re.findall(r'test result: ok\. (\d+) passed; 0 failed; (\d+) ignored;', output)
        assert len(counts) == 1 and int(counts[0][0]) > 0
        names = re.findall(r'^test (.+) \.\.\. (ok|ignored)$', output, flags=re.M)
        assert len(names) == sum(map(int, counts[0]))
        row.update(functional_cases=int(counts[0][0]), ignored_cases=int(counts[0][1]), test_outcomes=names)
        if kind == 'regression':
            assert row['functional_cases'] == 4 and row['ignored_cases'] == 0
        else:
            key = features, kind
            if key in references:
                assert names == references[key], ('test identities/outcomes differ', name)
            else:
                references[key] = names
    elif kind in ['certification', 'representations']:
        names = re.findall(r'^Testing (.+)$', output, flags=re.M)
        assert names and output.count('Success') == len(names)
        if kind == 'certification':
            assert sorted(names) == sorted(bench_names)
        else:
            source = (r / 'crates/hypersolve/benches/representations.rs').read_text().split('vec![', 1)[1].split('\n    ]\n}', 1)[0]
            expected = ['real_representations/full_solver_boundary/' + x for x in re.findall(r'\(\s*"([^\"]+)"\s*,', source)]
            assert sorted(names) == sorted(expected)
        key = features, kind
        if key in references:
            assert names == references[key]
        else:
            references[key] = names
        row.update(functional_cases=len(names), benchmark_cases=names)
    elif kind == 'trace':
        report = (cwd / 'dispatch_trace.md').read_bytes()
        assert len(output.splitlines()) == 11
        key = features, kind
        if key in references:
            assert (report, output) == references[key], 'full dispatch report or stdout differs'
        else:
            references[key] = report, output
        row.update(functional_cases=11, dispatch_report_sha256=hashlib.sha256(report).hexdigest(), dispatch_stdout_sha256=hashlib.sha256(output.encode()).hexdigest())
    else:
        assert not re.findall(r'^Testing (.+)$', output, flags=re.M)
        row.update(functional_cases=0, functional_scope='Metadata-only startup; workload intentionally not invoked by existing harness. No fuzz completion or timing claim.')
    save('owner-builds.json', rows)


def build(label, revision, features, group):
    options = ['--all-features'] if features == 'all' else ['--no-default-features']
    if group == 'tests':
        kinds = ['unit', 'smoke'] + (['regression'] if label == 'candidate' else [])
        command = ['cargo', '+1.95.0', 'test', '--release', '--lib', '--test', 'smoke']
        if label == 'candidate':
            command += ['--test', 'residual_certainty']
    else:
        kinds = ['certification', 'representations', 'retained_fuzz'] + (['trace'] if features == 'all' else [])
        command = ['cargo', '+1.95.0', 'bench']
        for kind in kinds:
            command += ['--bench', 'dispatch_trace' if kind == 'trace' else kind]
    command += ['--no-run', '--locked', '--offline', '-p', 'hypersolve', '--message-format=json', *options]
    name = f'owner-{label}-{features}-{group}-build'
    result = run(name, command)
    compiled = {}
    for line in (s / (name + '.stdout')).read_text().splitlines():
        message = json.loads(line)
        if message.get('reason') == 'compiler-artifact' and message.get('executable'):
            compiled.setdefault(message['target']['name'], []).append(message)
    for kind in kinds:
        wanted = {'unit': 'hypersolve', 'regression': 'residual_certainty', 'trace': 'dispatch_trace'}.get(kind, kind)
        assert len(compiled.get(wanted, [])) == 1, (wanted, compiled.keys())
        artifact = compiled[wanted][0]
        image_name = f'owner-residual-{label}-{features}-{kind}'
        row = dict(name=image_name, label=label, revision=revision, features=features, kind=kind, build_command=name, build_exit_code=result['exit_code'], cargo_artifact=artifact, lock_sha256=sha(r / 'Cargo.lock'), size=measure(image_name, artifact['executable']), added=kind == 'regression')
        rows.append(row)
        save('owner-builds.json', rows)
        qualify(row)
        print(image_name, row['size']['file'], 'bytes;', row['functional_cases'], 'functional cases', flush=True)


try:
    os.kill(watcher, signal.SIGSTOP)
    held = True
    assert state(watcher, '45823480') == state(parent, '38218939') == 'T'
    save('owner-hold.json', dict(time=time.time(), watcher=watcher, parent=parent, budget_seconds=21600, original_watcher_horizon_reset=False))
    run('toolchain', ['rustc', '+1.95.0', '-vV'])
    for label, revision in boundaries:
        subprocess.run(['git', 'checkout', '--detach', revision], cwd=r, check=True, capture_output=True)
        assert not git('status', '--porcelain=v1')
        sources = ['Cargo.toml', 'Cargo.lock', 'crates/hypersolve/Cargo.toml', 'crates/hypersolve/src/certification.rs', 'crates/hypersolve/src/failed_constraints.rs', 'crates/hypersolve/benches/certification.rs', 'crates/hypersolve/benches/representations.rs', 'crates/hypersolve/benches/retained_fuzz.rs', 'crates/hypersolve/benches/dispatch_trace.rs', 'crates/hypersolve/benches/support/retained_fuzz.rs']
        if label == 'candidate':
            sources.append('crates/hypersolve/tests/residual_certainty.rs')
        source_rows = []
        for source in sources:
            data = (r / source).read_bytes()
            assert data == git('show', revision + ':' + source)
            destination = s / 'sources' / label / source
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_bytes(data)
            source_rows.append(dict(path=source, sha256=sha(destination)))
        save(label + '-sources.json', source_rows)
        for features in ['none', 'all']:
            for group in ['tests', 'benches']:
                build(label, revision, features, group)
        assert not git('status', '--porcelain=v1')
    for features in ['none', 'all']:
        run('owner-' + features + '-clippy', ['cargo', '+1.95.0', 'clippy', '--locked', '--offline', '-p', 'hypersolve', '--all-targets', '--all-features' if features == 'all' else '--no-default-features', '--', '-D', 'warnings'])
    run('owner-format', ['cargo', '+1.95.0', 'fmt', '--all', '--', '--check'])
    assert len(rows) == 35 and time.monotonic() <= deadline
    assert not git('status', '--porcelain=v1')
    save('owner-completion.json', dict(terminal=True, exit_code=0, artifacts=len(rows), ordinary_artifacts=33, added_regression_artifacts=2, functional_cases=sum(row['functional_cases'] for row in rows), metadata_only_artifacts=6, seconds=time.monotonic() - started, admitted=False, runtime_claim=False))
except BaseException as error:
    save('owner-completion.json', dict(terminal=True, exit_code=1, error=repr(error), artifacts=len(rows), commands=len(commands), seconds=time.monotonic() - started, admitted=False))
    raise
finally:
    subprocess.run(['git', 'checkout', 'interval-residual-certainty'], cwd=r, check=True, capture_output=True)
    if held:
        assert state(watcher, '45823480') == state(parent, '38218939') == 'T'
        os.kill(watcher, signal.SIGCONT)
        save('owner-hold-released.json', dict(time=time.time(), watcher=watcher, seconds=time.monotonic() - started))
