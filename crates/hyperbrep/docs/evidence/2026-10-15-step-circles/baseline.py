"""Reproduce the missing mapping and freeze completed old workloads before edits."""
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent
ENV = os.environ | dict(PATH='/home/tim/.cargo/bin:' + os.environ['PATH'],
                       CARGO_HOME='/tmp/hyperbrep-review-cargo',
                       CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
BASE = '6ca4b653115821c5000e52032621ae30892d6e5e'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip() == BASE
    assert subprocess.check_output(['git','diff',BASE,'--','crates/hyperbrep-io/src'],cwd=ROOT) == b''
    records = []
    for label, command, expected in [
        ('reproduction', ['cargo','test','--offline','--locked','-p','hyperbrep-io','--test','step_circles'], 101),
        ('baseline-build', ['cargo','build','--offline','--locked','-p','hyperbrep-io','--release',
                            '--bench','advanced','--bench','faceted','--message-format=json'], 0),
    ]:
        print('running',label,flush=True)
        start = time.monotonic()
        p = subprocess.run(['timeout','--signal=TERM','--kill-after=30s','900s',*command],cwd=ROOT,env=ENV,capture_output=True,text=True)
        (OUT/(label+'.log')).write_text(p.stdout+p.stderr)
        records.append(dict(label=label,command=command,exit_code=p.returncode,
                            elapsed_seconds=time.monotonic()-start,external_timeout_seconds=900))
        (OUT/'baseline-commands.json').write_text(json.dumps(records,indent=2)+'\n')
        assert p.returncode == expected, p.stdout+p.stderr
        if label == 'reproduction':
            assert 'Unsupported("advanced support surface")' in p.stdout
            assert 'test result: FAILED.' in p.stdout
        else:
            items = [json.loads(line) for line in p.stdout.splitlines()]
            binaries = {}
            for name in ['advanced','faceted']:
                artifact = next(x for x in items if x.get('reason')=='compiler-artifact'
                                and x['target']['name']==name and x.get('executable'))
                destination = Path('/tmp/hyperbrep-before-step-circles-'+name)
                shutil.copy2(artifact['executable'],destination)
                binaries[name] = dict(path=str(destination),sha256=sha(destination),bytes=destination.stat().st_size)
            (OUT/'baseline-binaries.json').write_text(json.dumps(binaries,indent=2)+'\n')
    sources = [ROOT/'Cargo.toml', ROOT/'Cargo.lock', ROOT/'properties.md', ROOT/'docs/admission.md', ROOT/'AGENTS.md']
    for name in ['hyperbrep-io','hyperbrep','hyperreal','hyperlimit','hypercurve','hypersolve','hyperlattice']:
        crate = ROOT/'crates'/name
        sources.extend([crate/'Cargo.toml', *crate.glob('src/**/*.rs'), *crate.glob('benches/*.rs'), *crate.glob('tests/**/*.rs'), *crate.glob('tests/fixtures/*')])
    metadata = dict(revision=BASE,source_sha256={str(p.relative_to(ROOT)):sha(p) for p in sorted(set(sources)) if p.is_file()},
                    platform=platform.platform(),cpu=json.loads(subprocess.check_output(['lscpu','--json'],text=True)),
                    affinity=sorted(os.sched_getaffinity(0)),
                    rustc=subprocess.check_output(['rustc','-Vv'],env=ENV,text=True),
                    cargo=subprocess.check_output(['cargo','-V'],env=ENV,text=True))
    (OUT/'baseline-source.json').write_text(json.dumps(metadata,indent=2)+'\n')
    print('recorded expected import failure and froze both baseline executables',flush=True)

if __name__ == '__main__':
    main()
