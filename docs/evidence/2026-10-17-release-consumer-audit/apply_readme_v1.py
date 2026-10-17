"""Correct the installation claim after the clean external failure reproduced."""
from pathlib import Path
import difflib
import gzip
import hashlib
import json
import subprocess

W = Path(__file__).resolve().parent
ROOT = W.parents[2]
R = Path('/run/user/1000/csgrs-release-consumer-audit-v1')
pins = json.loads((R / 'source-pins.json').read_text())
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == pins['base_revision']
for name, digest in pins['inputs_sha256'].items():
    assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == digest
registry = json.loads((R / 'registry-csgrs/versions.json').read_text())
assert registry['has_0_23_0'] is False
resolution = json.loads((R / 'consumer-registry-resolution/result.json').read_text())
assert resolution['exit_code'] == 101 and not resolution['resource_stops']
diagnostic = gzip.open(R / 'consumer-registry-resolution/stderr.gz', 'rt').read()
assert 'failed to select a version for the requirement `csgrs = "^0.23.0"`' in diagnostic
assert 'candidate versions found which didn\'t match: 0.20.1' in diagnostic
readme = ROOT / 'readme.md'
before = readme.read_text()
old = '''Install Rust with [rustup](https://rustup.rs/), then:

```sh
cargo new drilled-cube
cd drilled-cube
cargo add csgrs
```

Replace `src/main.rs` with:

The equivalent dependency entry is:

```toml
[dependencies]
csgrs = "0.23.0"
```
'''
new = '''The example below uses the unreleased `csgrs 0.23.0` API. Install Rust with
[rustup](https://rustup.rs/), then run it from this source checkout's root:

```sh
cargo run --example basic
```

It writes `drilled_cube.stl`. The program is included as `examples/basic.rs`:
'''
old_tail = '''Run it with `cargo run`. It writes `drilled_cube.stl`. The same program is
included as `examples/basic.rs` and runs with:

```sh
cargo run --example basic
```

'''
assert before.count(old) == 1 and before.count(old_tail) == 1
after = before.replace(old, new).replace(old_tail, '')
test = ROOT / 'tests/readme.rs'
test_before = test.read_text()
# JSON string quoting matches this Rust string literal's quote escapes.
test_old = '    assert!(README.contains(' + json.dumps('csgrs = "0.23.0"') + '));'
test_new = '''    let version = env!("CARGO_PKG_VERSION");
    assert!(README.contains(&format!("csgrs {version}")));'''
assert test_before.count(test_old) == 1
test_after = test_before.replace(test_old, test_new)
changes = []
for name, a, b in [('readme.md', before, after), ('tests/readme.rs', test_before, test_after)]:
    stem = name.replace('/', '-')
    (W / (stem + '.before')).write_text(a)
    (W / (stem + '.after')).write_text(b)
    changes.extend(difflib.unified_diff(a.splitlines(True), b.splitlines(True), fromfile='a/' + name, tofile='b/' + name))
(W / 'readme-installation.patch').write_text(''.join(changes))
readme.write_text(after)
test.write_text(test_after)
print(json.dumps({'changed': ['readme.md', 'tests/readme.rs'], 'quickstart_example_unchanged': True,
    'manifest_unchanged': True, 'release_qualified': False}))
