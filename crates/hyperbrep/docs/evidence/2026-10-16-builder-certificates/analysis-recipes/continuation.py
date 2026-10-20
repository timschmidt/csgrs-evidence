"""Replay the unchanged full diagnostic inputs; bind this added driver separately.

These files were not inputs to the preceding native suite. Its complete guarded
input map must still match. This driver additionally freezes itself and every
historical input it reads, and checks those bytes after each command.
"""
import ast
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

OLD = OUT.parent/'2026-10-16-prism-continuation'
PROJECT = Path('/tmp/hyperbrep-builder-certificates-probe')
inputs = [Path(__file__), OLD/'frontier.rs.txt', OLD/'preceding-frontier.rs.txt',
          OLD/'prism-frontier.rs.txt', OLD/'reproduce.py', OLD/'prism_occt.py',
          OLD/'diagnostic-project/Cargo.toml', OLD/'diagnostic-project/Cargo.lock']
inputs.extend((OLD/'final-prism-artifacts').glob('*'))
for folder in ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports']:
    inputs.extend((OLD/folder).glob('*.step'))

def input_hashes():
    return {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in sorted(inputs) if p.is_file()}

source = hashes()
driver = input_hashes()
(OUT/'continuation-inputs.json').write_text(json.dumps(driver, indent=2)+'\n')
attempts = json.loads((OUT/'attempts.json').read_text())
for label in ['native-debug', 'native-release', 'native-minimal', 'native-clippy',
              'native-minimal-clippy', 'rustdoc', 'analytic-example', 'faceted-example',
              'advanced-example', 'supplied-example', 'circular-example',
              'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build',
              'wasm-runtime', 'fmt', 'diff-check']:
    row = [r for r in attempts if r['label'] == label][-1]
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    assert json.loads((OUT/row['source']).read_text()) == source, label

def checked(label, command, seconds=900):
    result = run(label, command, seconds)
    assert hashes() == source
    assert input_hashes() == driver, 'diagnostic driver or inputs changed'
    if result:
        raise SystemExit(result)

step_rows = []
for folder in ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports']:
    before = sorted((OLD/folder).glob('*.step'))
    after = sorted((OUT/folder).glob('*.step'))
    assert [p.name for p in before] == [p.name for p in after]
    for a, b in zip(before, after):
        step_rows.append(dict(path=str(b.relative_to(OUT)), bytes=b.stat().st_size,
                              sha256=hashlib.sha256(b.read_bytes()).hexdigest(),
                              unchanged=a.read_bytes() == b.read_bytes()))
(OUT/'preserved-step-artifacts.json').write_text(json.dumps(step_rows, indent=2)+'\n')
assert len(step_rows) == 22 and all(x['unchanged'] for x in step_rows)

(PROJECT/'src/bin').mkdir(parents=True, exist_ok=True)
for name in ['Cargo.toml', 'Cargo.lock']:
    shutil.copyfile(OLD/'diagnostic-project'/name, PROJECT/name)
for name, binary in [('frontier.rs.txt', 'frontier'),
                     ('preceding-frontier.rs.txt', 'preceding_frontier'),
                     ('prism-frontier.rs.txt', 'prism')]:
    shutil.copyfile(OLD/name, PROJECT/'src/bin'/f'{binary}.rs')
(PROJECT/'src/lib.rs').write_text('')
checked('diagnostic-build', ['cargo', 'build', '--offline', '--locked', '--release',
                             '--manifest-path', str(PROJECT/'Cargo.toml'), '--bins'])
for family in ['cylinder', 'cone', 'torus']:
    for rotation in ['identity', 'diagonal', 'rational']:
        checked(f'final-{family}-{rotation}',
                [str(Path(ENV['CARGO_TARGET_DIR'])/'release/frontier'), family, rotation], 600)
checked('preceding-frontier', [str(Path(ENV['CARGO_TARGET_DIR'])/'release/preceding_frontier')])

# Evaluate only the fixed CASES assignment, preserving its complete original
# inventory and iteration order. The source bytes are pinned above.
tree = ast.parse((OLD/'reproduce.py').read_text())
assignment = next(node for node in tree.body if isinstance(node, ast.Assign)
                  and any(isinstance(t, ast.Name) and t.id == 'CASES' for t in node.targets))
namespace = {}
exec(compile(ast.Module(body=[assignment], type_ignores=[]), str(OLD/'reproduce.py'), 'exec'), namespace)
cases = namespace['CASES']
assert len(cases) == 24
exports = OUT/'final-prism-artifacts'
exports.mkdir(exist_ok=True)
for case in cases:
    checked('final-prism-'+'-'.join(case),
            [str(Path(ENV['CARGO_TARGET_DIR'])/'release/prism'), *case, str(exports)], 240)
checked('prism-occt', ['python3', str(OLD/'prism_occt.py'), str(exports),
                      str(OUT/'prism-occt.json')], 300)
before, after = sorted((OLD/'final-prism-artifacts').glob('*')), sorted(exports.glob('*'))
assert [p.name for p in before] == [p.name for p in after]
rows = [dict(file=b.name, bytes=b.stat().st_size,
             sha256=hashlib.sha256(b.read_bytes()).hexdigest(),
             unchanged=a.read_bytes() == b.read_bytes()) for a, b in zip(before, after)]
(OUT/'preserved-prism-artifacts.json').write_text(json.dumps(rows, indent=2)+'\n')
assert all(x['unchanged'] for x in rows), 'performance-only change altered an exact artifact'
(OUT/'continuation-input-admission.json').write_text(json.dumps(dict(
    passed=input_hashes() == driver and hashes() == source,
    source_inputs_unchanged=True, diagnostic_inputs_unchanged=True,
    scope='Complete guarded native input map retained; added diagnostic driver and all read historical inputs independently bound.'
), indent=2)+'\n')
