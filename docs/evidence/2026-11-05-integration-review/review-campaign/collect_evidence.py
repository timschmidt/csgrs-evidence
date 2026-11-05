"""Collect the final integration evidence only after every gate is qualified.

Preserve failed attempts, actual revisions and unchanged-dependency proofs.
Never archive compiler caches, downloaded tools or third-party package bytes.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
OLD = ROOT / 'target/prepush-20261105'
OUT = ROOT / 'target/final-integration-evidence-20261105'

subprocess.run(['python3', str(HERE / 'audit_gates.py')], check=True)
supplemental = json.loads((HERE / 'supplemental-results.json').read_text())
assert supplemental and all(row['exit_code'] == 0 for row in supplemental)
required_supplemental = {'brep-all-features-fixed', 'axis-strict-clippy', 'axis-msrv-regression', 'consolidated-fmt', 'io-full', 'model-resource', 'ffi-resource', 'docs', 'wasm', 'fuzz-bins', 'msrv', 'final-repository-budget', 'final-spelling'}
assert {row['name'] for row in supplemental} == required_supplemental
for row in supplemental:
    path = ROOT / row['log']
    assert hashlib.sha256(path.read_bytes()).hexdigest() == row['log_sha256'], path
assert json.loads((HERE / 'brep-cost/summary.json').read_text())['all_processes_completed']
if OUT.exists():
    raise SystemExit(f'Refuse to overwrite {OUT}')
OUT.mkdir()
inventory = []

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def copy_file(path, relative):
    destination = OUT / relative
    destination.parent.mkdir(parents=True, exist_ok=True)
    if path.is_symlink():
        target = os.readlink(path)
        destination.symlink_to(target)
        inventory.append({'path': str(relative), 'symlink': target})
    else:
        shutil.copy2(path, destination)
        inventory.append({'path': str(relative), 'bytes': path.stat().st_size, 'sha256': digest(path)})

def copy_tree(path, relative):
    assert path.is_dir(), path
    for entry in sorted(path.rglob('*')):
        if entry.is_file() or entry.is_symlink():
            copy_file(entry, Path(relative) / entry.relative_to(path))

for parent, name in [(OLD, 'initial-campaign'), (HERE, 'final-campaign')]:
    for path in sorted(parent.iterdir()):
        if path.is_file() and path.suffix in {'.py', '.json', '.jsonl', '.log', '.tsv', '.txt', '.toml', '.patch'}:
            copy_file(path, Path(name) / path.name)

for name in ['spatial-directed-clean', 'spatial-asan-clean', 'artifacts']:
    copy_tree(OLD / name, Path('initial-campaign') / name)
for name in ['brep-fixed-source', 'brep-combined-source', 'brep-external-downstream']:
    copy_tree(OLD / name, Path('brep-campaigns') / name)
copy_tree(HERE / 'brep-cost', 'matched-brep-cost')

# The minimized source-cache counterexample has its own disposable Cargo home
# and compiler output. Keep the recipe and exact diagnostics, not those caches.
for path in sorted((HERE / 'package-cache-reproduction').iterdir()):
    if path.is_file():
        copy_file(path, Path('package-cache-counterexample') / path.name)

coverage = [
    (OLD / 'coverage-hypersolve', 'initial-hypersolve'),
    (OLD / 'coverage-hyperspatial', 'hyperspatial'),
    (OLD / 'coverage-hypertri', 'hypertri'),
    (OLD / 'coverage-hypersolve-final', 'nested-path-hypersolve-failure'),
    (HERE / 'coverage-hypersolve-external', 'final-hypersolve'),
]
for folder, label in coverage:
    assert folder.is_dir(), folder
    for path in sorted(folder.iterdir()):
        if path.is_file():
            copy_file(path, Path('coverage') / label / path.name)
    raw = folder / 'profraw'
    files = [{'path': str(path.relative_to(raw)), 'bytes': path.stat().st_size, 'sha256': digest(path)} for path in sorted(raw.glob('*.profraw'))]
    destination = OUT / 'coverage' / label / 'raw-profile-inventory.json'
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(json.dumps(files, indent=2) + '\n')

for base, label in [(Path('/tmp/csgrs-prepush-runner-20261105'), 'initial'), (Path('/tmp/csgrs-final-prepush-runner-20261105'), 'final')]:
    copy_tree(base / 'hypercurve-capabilities', Path('hypercurve-capabilities') / label)

site = HERE / 'site'
assert site.is_dir()
site_files = [{'path': str(path.relative_to(site)), 'bytes': path.stat().st_size, 'sha256': digest(path)} for path in sorted(site.rglob('*')) if path.is_file()]
(OUT / 'site-inventory.json').write_text(json.dumps(site_files, indent=2) + '\n')
packages = []
for compiler in ['1.99.1', '1.95.0']:
    folder = ROOT / 'target/research-closeout-builds' / (compiler + '-normal/release-check/package')
    for path in sorted(folder.glob('*.crate')):
        packages.append({'compiler': compiler, 'name': path.name, 'bytes': path.stat().st_size, 'sha256': digest(path)})
assert len(packages) == 36
(OUT / 'package-inventory.json').write_text(json.dumps(packages, indent=2) + '\n')

(OUT / 'README.md').write_text('''# Final source integration and pre-push qualification

The gate audit distinguishes actual final-source executions from earlier
executions whose complete owner/local-dependency inputs remain unchanged.
Every original revision and failed attempt remains. Geometry, test-only and
release-validation changes have separate exact source-equivalence records.
Full native and binding tests establish the named corpus, not universal
algebraic closure. Coverage retains its actual denominator and exclusions.

The packaging counterexample corrects an earlier qualification limitation:
per-package verification could compile a previous temporary-registry dependency
source despite a current archive. Earlier command passes remain historical
observations. Clean consumers patched to unpacked current packages exercised
those actual packages. The final package checks additionally isolate synthetic
registry source caches and verify the current dependency archives.

Matched BRep probes retain all ordinary case outcomes, receipts, timing,
allocation requests and binary sizes, including adverse observations. Their
independent geometry checks and native materialization/replay remain in timing.
Short contended samples do not establish a speedup or a universal resource bound.

Compiler caches, tool binaries/downloads, third-party package bytes, duplicate
coverage HTML and site/package binaries are excluded. Merged coverage profiles,
annotated reports, raw-profile inventories and artifact hashes remain. Hosted
GitHub artifact/Pages configuration and deployment are inspected, not locally
executed. Registry publication and BRep WASM execution are separate open claims.
''')
(OUT / 'seal.json').write_text(json.dumps({'recorded': time.time(), 'gate_audit': json.loads((HERE / 'gate-audit.json').read_text()), 'supplemental': supplemental, 'files': inventory}, indent=2) + '\n')
print(f'Collected {len(inventory)} retained files at {OUT}')
