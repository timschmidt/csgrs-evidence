"""Bind the final source, unchanged dependencies, commands and raw costs."""
import hashlib, json, subprocess
from pathlib import Path
root = Path('/mnt/development/csgrs')
out = Path(__file__).resolve().parent
baseline = subprocess.check_output(['git', 'rev-parse', 'f653f1ed2'], cwd=root, text=True).strip()
unchanged = ['Cargo.toml', 'Cargo.lock', 'crates/hyperreal/vendor']
for name in ('hyperreal', 'hyperlattice', 'hyperlimit', 'hypersolve', 'hypertri', 'hyperbrep-io'):
    unchanged.extend(['crates/' + name + '/src', 'crates/' + name + '/Cargo.toml'])
unchanged.extend(['crates/hypercurve/Cargo.toml', 'crates/hyperbrep/benches/kernel.rs', 'crates/hypercurve/benches/arc.rs'])
subprocess.run(['git', 'diff', '--exit-code', baseline, '--', *unchanged], cwd=root, check=True, stdout=subprocess.DEVNULL)
assert not subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard', '--', *unchanged], cwd=root, text=True)
production = subprocess.check_output(['git', 'diff', '--name-only', baseline, '--', 'crates/hyperbrep/src', 'crates/hypercurve/src'], cwd=root, text=True).splitlines()
assert sorted(production) == sorted([
    'crates/hyperbrep/src/ownership/references.rs',
    'crates/hyperbrep/src/ownership/staging.rs',
    'crates/hyperbrep/src/topology/builder.rs',
    'crates/hyperbrep/src/topology/error.rs',
    'crates/hypercurve/src/curve_string.rs',
]), production
(out / 'dependency-audit.json').write_text(json.dumps(dict(baseline=baseline, unchanged_paths=unchanged, changed_production_files=production, lockfile_unchanged=True), indent=2) + '\n')
files = [root / p for p in (
    'Cargo.toml', 'Cargo.lock', 'properties.md', 'docs/properties-status.json',
    'crates/hyperbrep/Cargo.toml', 'crates/hypercurve/Cargo.toml',
    'crates/hyperbrep/README.md', 'crates/hyperbrep/PERFORMANCE.md', 'crates/hypercurve/PERFORMANCE.md',
    'crates/hyperbrep/docs/ARCHITECTURE.md', 'crates/hyperbrep/docs/SUPPORT_MATRIX.md',
    'crates/hyperbrep/docs/SELECTED_ARCHIVE.md', 'crates/hyperbrep/docs/ALGORITHM_RESEARCH.md',
    'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json', 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
    'crates/hyperbrep/benches/kernel.rs', 'crates/hyperbrep/benches/closed_edges.rs',
    'crates/hypercurve/benches/arc.rs', 'crates/hyperbrep/tools/benchmark_receipt.py',
    'crates/hyperbrep/tests/closed_edges.rs', 'crates/hyperbrep/tests/support/closed_cylinder.rs',
    'crates/hypercurve/tests/hypercurve_curve_string.rs', 'crates/hypercurve/tests/support/mod.rs',
    'crates/hypercurve/tests/support/scalars.rs',
    'crates/hyperbrep/docs/evidence/2026-10-15-step-faceted/measure.c',
    'crates/hyperbrep/docs/evidence/2026-10-15-periodic-cylinder/research/occt-cylinder.step',
    'crates/hyperbrep/docs/evidence/2026-10-15-periodic-cylinder/research/fixture-audit.json',
)]
for name in ('hyperbrep', 'hypercurve'):
    files += [p for p in (root / ('crates/' + name + '/src')).rglob('*') if p.is_file()]
def record(path, base):
    return dict(path=str(path.relative_to(base)), bytes=path.stat().st_size, sha256=hashlib.sha256(path.read_bytes()).hexdigest())
sources = [record(p, root) for p in sorted(set(files))]
artifacts = [record(p, out) for p in sorted(out.rglob('*')) if p.is_file() and p.name not in ('manifest.json', 'verification.json') and '__pycache__' not in p.parts]
(out / 'manifest.json').write_text(json.dumps(dict(schema_version=1, baseline_revision=baseline, scope='Partial WP03/native closed circle/ellipse admission and Hypercurve full-circle composition; all 28 work-package gates open', sources=sources, artifacts=artifacts), indent=2) + '\n')
print(len(sources), 'sources;', len(artifacts), 'artifacts')
