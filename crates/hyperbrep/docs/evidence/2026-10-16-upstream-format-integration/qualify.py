"""Qualify the merged tree while preserving both owners' source and evidence."""
import hashlib
import json
import os
from pathlib import Path
import platform
import subprocess
import sys
import time

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[4]
PRIOR = OUT.parent / '2026-10-16-prism-continuation'
sys.path.insert(0, str(PRIOR))
from check import ENV, hashes as prior_hashes

read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
digest = lambda data: hashlib.sha256(data).hexdigest()

def hashes():
    source = prior_hashes()
    source[str(Path(__file__).relative_to(ROOT))] = digest(Path(__file__).read_bytes())
    for path in [ROOT / '.cargo/config.toml', Path(ENV['CARGO_HOME']) / 'config.toml']:
        if path.exists():
            source[str(path)] = digest(path.read_bytes())
    return source

def run(label, command, seconds=1200, extra=None):
    source = hashes()
    identity = digest(json.dumps(source, sort_keys=True).encode())
    write(OUT / ('source-' + identity + '.json'), source)
    ledger = OUT / 'commands.json'
    rows = read(ledger) if ledger.exists() else []
    attempt = 1 + sum(row['label'] == label for row in rows)
    logname = f'{label}-{attempt}.log'
    print('running', label, attempt, flush=True)
    started = time.monotonic()
    with (OUT / logname).open('w') as log:
        process = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s',
                                  str(seconds) + 's', *command], cwd=ROOT,
                                 env=ENV | (extra or {}), stdout=log, stderr=subprocess.STDOUT)
    unchanged = hashes() == source
    rows.append(dict(label=label, attempt=attempt, command=command,
        environment=extra or {}, external_timeout_seconds=seconds,
        elapsed_seconds=time.monotonic() - started, exit_code=process.returncode,
        source='source-' + identity + '.json', source_unchanged=unchanged, log=logname))
    write(ledger, rows)
    assert unchanged, label
    print('finished', label, 'exit', process.returncode, flush=True)
    return process.returncode

if __name__ == '__main__':
    merge = read(OUT / 'merge-review.json')
    assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT).decode().strip() == merge['baseline']
    assert subprocess.check_output(['git', 'rev-parse', 'MERGE_HEAD'], cwd=ROOT).decode().strip() == merge['upstream']
    old = read(PRIOR / 'final-source.json')
    now = prior_hashes()
    differences = {path: dict(baseline=old.get(path), candidate=now.get(path))
                   for path in sorted(set(old) | set(now)) if old.get(path) != now.get(path)}
    assert set(differences) == set(merge['non_evidence_changes']), differences
    for path in differences:
        upstream = subprocess.check_output(['git', 'show', merge['upstream'] + ':' + path], cwd=ROOT)
        assert digest(upstream) == now[path], path
    write(OUT / 'source-comparison.json', dict(
        baseline=merge['baseline'], upstream=merge['upstream'], changes=differences,
        preserved_files=len(set(old) & set(now)) - len(set(old) & set(differences)),
        incoming_bytes_match_upstream=True,
        scope='All earlier guarded BREP, IO, dependency, fixture, benchmark and qualification files are unchanged except the five exact incoming root-format paths. No BREP or dependency runtime change is introduced by integration.'))
    environment = dict(platform=platform.platform(),
        rustc=subprocess.check_output(['rustc', '-vV'], env=ENV, text=True),
        cargo=subprocess.check_output(['cargo', '-V'], env=ENV, text=True),
        optional_build_environment={key:value for key,value in os.environ.items()
                                    if key.startswith(('RUST', 'CARGO', 'GMP'))},
        explicit_build_environment={key:ENV[key] for key in ['PATH', 'CARGO_HOME', 'CARGO_TARGET_DIR', 'GMP_MPFR_SYS_CACHE']},
        storage={name:subprocess.check_output(['findmnt','-n','-o','SOURCE,FSTYPE,TARGET','-T',path],text=True)
                 for name,path in [('source',str(ROOT)),('target',ENV['CARGO_TARGET_DIR']),('cargo',ENV['CARGO_HOME'])]})
    write(OUT / 'environment.json', environment)
    C = ['--offline', '--locked']
    CORE = ['-p', 'hyperbrep', '-p', 'hyperbrep-io']
    FORMAT = ['-p', 'csgrs', '--no-default-features', '--features', 'obj-io,stl-io',
              '--test', 'obj_export_failures', '--test', 'stl_import_contracts']
    WASM = Path('/tmp/hyperbrep-prism-wasm-probe')
    commands = [
        ('native-release', ['cargo','test',*C,*CORE,'--all-features','--release','--no-fail-fast'], {}),
        ('native-minimal', ['cargo','test',*C,*CORE,'--no-default-features','--release','--no-fail-fast'], {}),
        ('native-clippy', ['cargo','clippy',*C,*CORE,'--all-features','--all-targets','--','-D','warnings'], {}),
        ('native-minimal-clippy', ['cargo','clippy',*C,*CORE,'--no-default-features','--all-targets','--','-D','warnings'], {}),
        ('rustdoc', ['cargo','doc',*C,*CORE,'--all-features','--no-deps'], {'RUSTDOCFLAGS':'-D warnings'}),
        ('fuzz-check', ['cargo','check',*C,'--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'], {}),
        ('format-debug', ['cargo','test',*C,*FORMAT,'--no-fail-fast'], {}),
        ('format-release', ['cargo','test',*C,*FORMAT,'--release','--no-fail-fast'], {}),
        ('format-clippy', ['cargo','clippy',*C,*FORMAT,'--','-D','warnings'], {}),
        ('example-features', ['cargo','check',*C,'-p','csgrs','--no-default-features','--features','curve,stl-io','--example','basic_shapes'], {}),
        ('example-clippy', ['cargo','clippy',*C,'-p','csgrs','--no-default-features','--features','curve,stl-io','--example','basic_shapes','--','-D','warnings'], {}),
        ('wasm-build', ['cargo','build',*C,'--manifest-path',str(WASM/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'], {}),
        ('wasm-runtime', ['python3',str(WASM/'run.py')], {}),
        ('fmt', ['cargo','fmt','--all','--','--check'], {}),
        ('diff-check', ['git','diff','--check'], {}),
    ]
    failures = [label for label, command, extra in commands if run(label, command, extra=extra)]
    print('failed checks:', failures, flush=True)
    raise SystemExit(bool(failures))
