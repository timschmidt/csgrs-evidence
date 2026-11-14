from pathlib import Path
import hashlib, json, os, shutil, subprocess, time, tomllib

s = Path(__file__).parent / 'wasm-package'
b = Path('/mnt/development/.interval-refactor-build/surface-interval-ranges-packages-final')
prior = Path(__file__).parent / 'package-final'
assert (prior / 'packaged-consumer-source.json').exists(), 'archive qualification must finish first'
source = json.loads((prior / 'packaged-consumer-source.json').read_text())
s.mkdir()
root = b / 'wasm-consumer'
(root / 'src').mkdir(parents=True)
manifest = (b / 'consumer/Cargo.toml').read_text().replace(
    'name="packaged-surface-interval-ranges"', 'name="wasm-packaged-surface-interval-ranges"')
manifest += '\n[lib]\ncrate-type=["cdylib"]\n'
(root / 'Cargo.toml').write_text(manifest)
shutil.copyfile(b / 'consumer/Cargo.lock', root / 'Cargo.lock')
example = (b / 'consumer/src/main.rs').read_bytes()
assert hashlib.sha256(example).hexdigest() == source['example_sha256']
(root / 'src/shipped_example.rs').write_bytes(example)
wrapper = '''mod shipped_example;
#[unsafe(no_mangle)]
pub extern "C" fn exercise_surface_ranges() -> u32 {
    shipped_example::run().expect("all sixteen archived example cells complete");
    16
}
'''
(root / 'src/lib.rs').write_text(wrapper)
(s / 'wrapper.rs').write_text(wrapper)
(s / 'Cargo.toml').write_text(manifest)
env = os.environ | {'CARGO_HOME': str(b / 'cargo-home'),
                    'CARGO_TARGET_DIR': str(b / 'wasm-target'),
                    'CARGO_BUILD_JOBS': '2', 'CARGO_NET_OFFLINE': 'true'}
rows = []
def run(name, cmd, capture=False):
    print('START', name, flush=True)
    start = time.monotonic()
    with (s / (name + '.log')).open('xb') as out:
        p = subprocess.run(cmd, cwd=root, env=env, stdout=out,
                           stderr=subprocess.PIPE if capture else subprocess.STDOUT)
    if capture:
        (s / (name + '.stderr')).write_bytes(p.stderr)
    rows.append(dict(name=name, command=cmd, seconds=time.monotonic()-start, returncode=p.returncode))
    (s / 'commands.json').write_text(json.dumps(rows, indent=2)+'\n')
    print(json.dumps(rows[-1]), flush=True)
    if p.returncode:
        print((s / (name + '.log')).read_text()[-6000:])
        raise SystemExit(p.returncode)
run('resolve', ['cargo', '+1.95.0', 'metadata', '--offline', '--format-version', '1'], True)
baseline = tomllib.loads((b / 'consumer/Cargo.lock').read_text())['package']
allowed = {(p['name'], p['version'], p.get('source'), p.get('checksum')) for p in baseline if p.get('source')}
assert all((p['name'], p['version'], p.get('source'), p.get('checksum')) in allowed
           for p in tomllib.loads((root / 'Cargo.lock').read_text())['package'] if p.get('source'))
shutil.copyfile(root / 'Cargo.lock', s / 'Cargo.lock')
metadata = json.loads((s / 'resolve.log').read_text())
assert all(Path(p['manifest_path']).is_relative_to(b / 'packages')
           for p in metadata['packages'] if p['name'].startswith('hyper'))
run('build', ['cargo', '+1.95.0', 'build', '--locked', '--lib', '--target', 'wasm32-unknown-unknown'])
wasm = b / 'wasm-target/wasm32-unknown-unknown/debug/wasm_packaged_surface_interval_ranges.wasm'
js = '''const fs = require('node:fs');
const assert = require('node:assert/strict');
const bytes = fs.readFileSync(process.argv[2]);
const module_ = new WebAssembly.Module(bytes);
assert.deepEqual(WebAssembly.Module.imports(module_), []);
const instance = new WebAssembly.Instance(module_, {});
const results = [];
for (let i = 0; i < 3; i++) {
  const cells = instance.exports.exercise_surface_ranges();
  assert.equal(cells, 16);
  results.push(cells);
}
console.log(JSON.stringify({runtime: process.version, imports: [], completedCells: results,
  stackConfiguration: 'linker default; no custom stack flags',
  scope: 'archived Rust example via test-only export; no public JS binding claim'}));
'''
(s / 'run.cjs').write_text(js)
run('execute', ['node', str(s / 'run.cjs'), str(wasm)])
(s / 'RESULT.json').write_text(json.dumps(dict(
    source_commit=source['source_commit'], source_example_sha256=source['example_sha256'],
    wasm_sha256=hashlib.sha256(wasm.read_bytes()).hexdigest(), wasm_bytes=wasm.stat().st_size,
    archived_example_unchanged=True, imports=0, repeated_portfolios=3,
    cells_per_portfolio=16, public_js_binding_qualification=False), indent=2)+'\n')
print('Archive-only native example also completed in WebAssembly', flush=True)
