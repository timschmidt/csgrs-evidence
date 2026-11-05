"""Seal reviewable main validation data after every required command passes.

Build caches, tool binaries/downloaded archives and duplicate rendered coverage
are excluded. Corpus reports retain exact input/output bytes. Failed attempts
remain beside their passing retries. The isolated BRep merge has a separate
source and qualification record and is deliberately excluded here.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import shlex
import subprocess
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
OUT = ROOT / 'target/main-prepush-evidence-20261105'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

plans = [json.loads((HERE / name).read_text()) for name in ('plan.json', 'lint-plan.json')]
expected = {item['sequence'] for plan in plans for item in plan}
latest = {}
attempts = []
for line in (HERE / 'results.jsonl').read_text().splitlines():
    row = json.loads(line)
    latest[row['sequence']] = row
    attempts.append(row)
missing = sorted(expected - latest.keys())
failed = sorted(i for i in expected & latest.keys() if latest[i]['exit_code'])
if missing or failed:
    raise SystemExit(f'Validation incomplete: missing={missing}, latest failed={failed}')
current_revision = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
mixed = sorted(i for i in expected if latest[i]['revision'] != current_revision)
if mixed:
    raise SystemExit(f'Validation belongs to another source revision: {mixed}')
source = json.loads((HERE / 'compiled-input-hashes.json').read_text())
changed = [name for name, digest in source.items() if sha(ROOT / name) != digest]
if changed:
    raise SystemExit(f'Compiled inputs changed: {changed}')
if subprocess.check_output(['git', 'diff', '--name-only', 'HEAD'], cwd=ROOT).strip():
    raise SystemExit('Restore all generated reports and resolve intended tracked edits before sealing')
for row in attempts:
    path = ROOT / row['log']
    if sha(path) != row['log_sha256']:
        raise SystemExit(f'Attempt log digest mismatch: {path}')
if OUT.exists():
    raise SystemExit(f'Refuse to overwrite {OUT}')
OUT.mkdir()
kept = []

def copy_file(source_path, relative):
    destination = OUT / relative
    destination.parent.mkdir(parents=True, exist_ok=True)
    if source_path.is_symlink():
        target = os.readlink(source_path)
        destination.symlink_to(target)
        kept.append(dict(path=str(relative), kind='symlink', target=target))
    elif source_path.is_file():
        shutil.copy2(source_path, destination)
        kept.append(dict(path=str(relative), bytes=source_path.stat().st_size, sha256=sha(source_path)))

def copy_tree(source_path, relative):
    for path in sorted(source_path.rglob('*')):
        if path.is_file() or path.is_symlink():
            copy_file(path, Path(relative) / path.relative_to(source_path))

root_names = {
    'actions.json', 'setup.json', 'plan.json', 'plan.txt', 'lint-plan.json',
    'results.jsonl', 'compiled-input-hashes.json', 'run.py', 'make_plan.py',
    'make_lint_plan.py', 'collect_main_evidence.py', 'branch-dispositions-recheck.json',
    'cache-cleanup.json', 'historical-compiler-cache-cleanup.json',
    'historical-coverage-cache-cleanup.json', 'historical-owner-cache-cleanup.json',
    'root-debug-cache-cleanup.json', 'root-release-cache-cleanup.json',
    'channel-rust-nightly.toml', 'channel-rust-stable.toml',
    'evidence-output-path-correction.json', 'evidence-verify.log',
    'go-download-metadata.json', 'go-install.json', 'go-install.log', 'install_go.py',
    'nightly-install.log', 'pages-retry-driver.log', 'site-reassembly-driver.log',
    'site-reassembly-record.json', 'spatial-batch-split.json', 'stop_after_coverage.py',
    'stop_runners.py', 'toolchain-correction-stops.json', 'toolchain-versions.json',
    'workspace-metadata.json', 'run_release_checks.py', 'release-checkout.json',
    'release-stable-driver.log', 'release-msrv-driver.log',
}
for path in sorted(HERE.iterdir()):
    if path.name in root_names or re.fullmatch(r'\d{3}-\d+\.log', path.name) or path.name.startswith('runner-stops-'):
        copy_file(path, Path('campaign') / path.name)
for name in ('spatial-directed-clean', 'spatial-asan-clean', 'artifacts'):
    copy_tree(HERE / name, Path('campaign') / name)
# Earlier directed selections are distinct successful attempts. Their JSON
# reports retain actual timings, family selection and corpus bytes.
prior_directed = set()
for row in attempts:
    if 89 <= row['sequence'] <= 100:
        words = shlex.split(row['command'])
        output = words[words.index('--output') + 1] if '--output' in words else 'target/hyperspatial-directed'
        path = ROOT / output
        if not path.is_relative_to(HERE):
            prior_directed.add(path)
for path in sorted(prior_directed):
    if not path.is_dir():
        raise SystemExit(f'Prior directed evidence missing: {path}')
    copy_tree(path, Path('earlier-directed') / path.name)
for name in ('coverage-hypersolve', 'coverage-hyperspatial', 'coverage-hypertri'):
    for path in sorted((HERE / name).iterdir()):
        if path.is_file():
            copy_file(path, Path('coverage') / name / path.name)
    raw = HERE / name / 'profraw'
    if raw.exists():
        profiles = [dict(path=str(p.relative_to(raw)), bytes=p.stat().st_size, sha256=sha(p)) for p in sorted(raw.rglob('*')) if p.is_file()]
        (OUT / 'coverage' / name / 'profraw-inventory.json').write_text(json.dumps(profiles, indent=2) + '\n')
capabilities = Path('/tmp/csgrs-prepush-runner-20261105/hypercurve-capabilities')
if not capabilities.is_dir():
    raise SystemExit('Final capability catalog is missing')
copy_tree(capabilities, 'hypercurve-capabilities')
site = HERE / 'site'
site_files = [dict(path=str(p.relative_to(site)), bytes=p.stat().st_size, sha256=sha(p)) for p in sorted(site.rglob('*')) if p.is_file()]
(OUT / 'site-artifact-inventory.json').write_text(json.dumps(site_files, indent=2) + '\n')
packages = []
for compiler in ('1.99.1', '1.95.0'):
    path = ROOT / 'target/research-closeout-builds' / (compiler + '-normal/release-check/package')
    packages.extend(dict(compiler=compiler, name=p.name, bytes=p.stat().st_size, sha256=sha(p)) for p in sorted(path.glob('*.crate')))
(OUT / 'package-artifact-inventory.json').write_text(json.dumps(packages, indent=2) + '\n')
metadata = dict(
    recorded=time.time(), revision=subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
    complete_named_commands=len(expected), recorded_attempts=len(attempts), compiled_inputs=len(source),
    latest_results=[latest[i] for i in sorted(expected)], files=kept,
    exclusions=['Reproducible compiler caches and binaries', 'Downloaded third-party tool archives; digests/versions retained', 'Duplicate HTML coverage rendering', 'Per-process profraw bytes; merged profdata and full raw-file digest inventories retained', 'Built site/WASM and package bytes; file digests/sizes retained', 'Unrelated .claude worktree', 'Isolated BRep integration, independently qualified'],
    hosted_limitations=['Actions checkout/cache/artifact services and hosted Pages configuration/deployment inspected, not reproduced locally'],
    scope='Main CI/local workflow qualification on unchanged compiled inputs. No universal exact-closure, 100% coverage, hardware, deployment or installed-registry-release claim.',
)
(OUT / 'seal.json').write_text(json.dumps(metadata, indent=2) + '\n')
print(f'Sealed {len(kept)} files in {OUT}')
