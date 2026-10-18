"""Source-bound native and downstream qualification; no concurrent measurements."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes, run

C = ['--offline', '--locked']
CORE = ['-p', 'hyperbrep', '-p', 'hyperbrep-io']
commands = [
    ('scalar-equality', ['cargo', 'test', *C, '--release', '-p', 'hyperreal', '--all-features', '--lib', 'equality'], {}, 900),
    ('scalar-equality-doc', ['cargo', 'test', *C, '--release', '-p', 'hyperreal', '--all-features', '--doc', 'immediate_equality'], {}, 900),
    ('point-contract', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--test', 'point_equality_contract'], {}, 900),
    ('point-group', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'point::'], {}, 900),
    ('new-debug', ['cargo', 'test', *C, *CORE, '-p', 'hypercurve', '--test', 'measurement_admission', '--test', 'measurement_exchange', '--test', 'path_orientation', '--no-fail-fast'], {}, 900),
    ('curve-clippy', ['cargo', 'clippy', *C, '-p', 'hypercurve', '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 1200),
    ('native-clippy', ['cargo', 'clippy', *C, *CORE, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 1200),
    ('minimal-clippy', ['cargo', 'clippy', *C, *CORE, '--no-default-features', '--all-targets', '--', '-D', 'warnings'], {}, 1200),
    ('native-release', ['cargo', 'test', *C, *CORE, '--all-features', '--release', '--no-fail-fast'], {}, 1800),
    ('native-minimal', ['cargo', 'test', *C, *CORE, '--no-default-features', '--release', '--no-fail-fast'], {}, 1800),
    ('curve-tests', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--test', 'native_curve_images', '--test', 'hypercurve_curve_intersection', '--test', 'hypercurve_analytic_parallel_region', '--test', 'hypercurve_path_closure', '--test', 'path_orientation', '--no-fail-fast'], {}, 1800),
    ('curve-winding', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'curve_region_boolean::regularized_face_winding_tests'], {}, 900),
    ('curve-successors', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'curve_region_boolean::certified_successor_tests'], {}, 1800),
    ('rustdoc', ['cargo', 'doc', *C, *CORE, '-p', 'hypercurve', '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}, 1200),
    ('fuzz-check', ['cargo', 'check', *C, '--manifest-path', 'crates/hyperbrep/fuzz/Cargo.toml', '--bins'], {}, 900),
]
for name, example, folder in [
    ('analytic', 'analytic_step', 'exports'), ('faceted', 'faceted_step', 'faceted-exports'),
    ('advanced', 'advanced_step', 'advanced-exports'), ('supplied', 'supplied_step', None),
    ('circular', 'circular_step', None), ('similarity', 'analytic_similarity', 'scaled-exports'),
    ('torus', 'torus_step', 'torus-exports'), ('cone', 'cone_step', 'cone-exports'),
    ('region', 'region_extrusion_step', 'region-exports'),
]:
    command = ['cargo', 'run', *C, '-p', 'hyperbrep-io', '--example', example, '--release']
    if folder:
        command += ['--', str(OUT/folder)]
    commands.append((name+'-example', command, {}, 900))
commands += [('fmt', ['cargo', 'fmt', '--all', '--', '--check'], {}, 300), ('diff-check', ['git', 'diff', '--check'], {}, 300)]
source = hashes()
failures = []
blocked = []
executed = []
for label, command, extra, seconds in commands:
    code = run(label, command, seconds, extra)
    assert hashes() == source
    executed.append(label)
    if code:
        row = json.loads((OUT/'attempts.json').read_text())[-1]
        log = (OUT/row['log']).read_text()
        (blocked if label == 'new-debug' and 'FACTORS > 0' in log else failures).append(label)
    (OUT/'qualification-driver.json').write_text(json.dumps(dict(
        source=source, executed=executed, failures=failures, upstream_debug_blocked=blocked,
        scope='Affected source-path BREP/IO and shared curve qualification. Not full pre-push, packaging, MSRV, coverage, formal proof, fuzz campaign or general resource bounds.'), indent=2)+'\n')
print('failed:', failures, 'upstream-owned debug blockers:', blocked, flush=True)
raise SystemExit(bool(failures))
