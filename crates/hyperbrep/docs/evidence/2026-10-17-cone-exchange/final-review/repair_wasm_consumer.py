"""Use the new shared map oracle in WASM; preserve the original warning/source."""
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes

before = hashes()
project = Path('/tmp/hyperbrep-cone-exchange-wasm-probe')
lib = OUT/'wasm-probe/lib.rs'
actual = project/'src/lib.rs'
assert lib.read_bytes() == actual.read_bytes()
paths = [lib, OUT/'analysis-recipes/prepare_validation.py', OUT/'analysis-recipes/qualify.py']
backup = OUT/'final-review/wasm-v1'
backup.mkdir(exist_ok=False)
for p in paths:
    shutil.copy2(p, backup/p.name)
wasm = Path(ENV['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/hyperbrep_cone_exchange_wasm_probe.wasm'
frozen = Path('/tmp/hyperbrep-cone-exchange-wasm-v1.wasm')
assert not frozen.exists()
shutil.copy2(wasm, frozen)
receipt = json.loads((OUT/'wasm-runtime-1.log').read_text())
assert hashlib.sha256(frozen.read_bytes()).hexdigest() == receipt['wasm_sha256']
needle = '    cone_exchange::inputs::existing_surface_maps();\n    8'
replacement = '''    cone_exchange::inputs::existing_surface_maps();
    // Exercise the root shared oracle on an additional cylinder within this
    // source-map group. No unused-helper suppression or relaxed check.
    {
        use hyperbrep_io::step::{StepBody, StepFile, StepReadOptions, StepWriteOptions};
        let native = hyperbrep::builder::cylinder(2.into(), 4.into()).unwrap();
        let output = analytic::export(
            &[StepBody { solid: native.bodies().next().unwrap(), name: "source maps" }],
            &StepWriteOptions::new("maps.step", "2026-10-17T00:00:00"),
        );
        let imported = analytic::reimport(&output);
        let file = StepFile::read(output.text().as_bytes(), &StepReadOptions::default()).unwrap();
        analytic::source_maps(&file, &imported);
        analytic::equal(&imported.bodies()[0].solid().volume().unwrap(),
            &(hyperbrep::Real::from(16) * hyperbrep::Real::pi()));
    }
    8'''
for p in paths[:2]:
    s = p.read_text()
    assert s.count(needle)==1
    p.write_text(s.replace(needle,replacement))
shutil.copy2(lib, actual)
subprocess.run(['rustfmt','--edition','2024',str(actual)], env=ENV, check=True)
shutil.copy2(actual, lib)
p = paths[2]
s = p.read_text()
lines = s.splitlines(keepends=True)
found = 0
for i,line in enumerate(lines):
    if "('wasm-build'," in line:
        assert ', {}, 900)' in line
        lines[i] = line.replace(', {}, 900)', ", {'RUSTFLAGS': '-D warnings'}, 900)")
        found += 1
assert found==1
p.write_text(''.join(lines))
after = hashes()
changed = {p for p in before.keys()|after.keys() if before.get(p)!=after.get(p)}
assert changed == {str(p.relative_to(ROOT)) for p in paths}
(OUT/'wasm-consumer-correction.json').write_text(json.dumps(dict(
    before=before, after=after,
    changes={p:dict(before=before[p],after=after[p]) for p in sorted(changed)},
    frozen_v1=dict(path=str(frozen),sha256=receipt['wasm_sha256'],bytes=frozen.stat().st_size),
    original_sources=str(backup.relative_to(OUT)),
    scope='Only the standalone WASM consumer, its generator and its WASM-build command changed. The same eight new groups now also exercise the root source-map helper. Build warnings are denied. All library, test, example and benchmark sources and dependency inputs are byte-identical; preceding native checks did not consume the changed WASM wrapper or generator. Final WASM build/runtime and formatting must be rerun.'),indent=2)+'\n')
print('Corrected WASM consumer; all crate sources and native test inputs remain identical.')
