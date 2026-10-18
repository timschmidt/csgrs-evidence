"""Preserve original curve fixtures and reproduce the BREP boundary on HEAD."""
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

from check import ENV, OUT, ROOT, hashes, run

BASELINE = 'b89c43cd16081ca7049654e2c763e4cb3e8790b9'
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
write = lambda name, data: (OUT/name).write_text(json.dumps(data, indent=2)+'\n')
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == BASELINE
assert subprocess.check_output(['git', 'rev-parse', 'origin/main'], cwd=ROOT, text=True).strip() == '7ed43501755fd64a01f54c3078d12229cbc0129d'
project = OUT/'consumer-project'
setup_file = OUT/'setup.json'
if not setup_file.exists():
    setup = []
    for label, command in [
        ('format-probe', ['rustfmt', '--edition', '2024', str(project/'main.rs')]),
        ('lock-probe', ['cargo', 'generate-lockfile', '--offline', '--manifest-path', str(project/'Cargo.toml')]),
        ('metadata-probe', ['cargo', 'metadata', '--offline', '--locked', '--format-version=1', '--manifest-path', str(project/'Cargo.toml')]),
    ]:
        log = OUT/(label+'.log')
        with log.open('w') as output:
            result = subprocess.run(['timeout', '300s', *command], cwd=ROOT, env=ENV, stdout=output, stderr=subprocess.STDOUT)
        setup.append(dict(label=label, command=command, exit_code=result.returncode, log=log.name))
        write('setup.json', setup)
        assert result.returncode == 0, setup[-1]
else:
    assert all(row['exit_code'] == 0 for row in json.loads(setup_file.read_text()))

source = hashes()
write('baseline.json', dict(revision=BASELINE, source=source,
    upstream='7ed43501755fd64a01f54c3078d12229cbc0129d',
    source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    fixtures={str(p.relative_to(ROOT)): sha(p) for p in [
        ROOT/'crates/hypercurve/tests/hypercurve_curve_intersection.rs',
        ROOT/'crates/hypercurve/tests/hypercurve_analytic_parallel_region.rs',
        OUT/'contract.md']},
    scope='Original geometry and classification assertions, independently derived expected areas/volumes, strict policy, typed BREP failures. Diagnostic only, no feature or benchmark admission.'))
assert run('baseline-build', ['cargo', 'build', '--offline', '--locked', '--release',
    '--manifest-path', str(project/'Cargo.toml')], 900) == 0
binary = Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-retained-region-probe'
frozen = Path('/tmp/hyperbrep-retained-region-baseline')
assert not frozen.exists()
shutil.copy2(binary, frozen)
write('baseline-binary.json', dict(path=str(frozen), sha256=sha(frozen), bytes=frozen.stat().st_size))
sampler = OUT.parent/'2026-10-17-prism-admission-cost/final-review/measure.py'
results = []
for case in ['uncut', 'difference', 'xor', 'affine_difference', 'affine_xor', 'parallel_square', 'parallel_cap']:
    resources = OUT/('baseline-'+case+'-resources.json')
    code = run('baseline-'+case, ['python3', '-B', str(sampler), str(resources), str(frozen), case], 300)
    row = json.loads((OUT/'attempts.json').read_text())[-1]
    results.append(dict(case=case, exit_code=code, log=row['log'],
        resources=json.loads(resources.read_text()) if resources.exists() else None))
    write('reproduction.json', dict(source=source, sampler_sha256=sha(sampler), cases=results,
        completed=len(results)==7, scope='Full original input recipes. External 300-second containment per diagnostic; no production total-work, memory or cancellation bound.'))
    assert hashes() == source and sha(frozen) == json.loads((OUT/'baseline-binary.json').read_text())['sha256']
print(json.dumps(results, indent=2), flush=True)
