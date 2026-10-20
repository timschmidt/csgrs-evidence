"""Recheck fixture plumbing and explicitly reuse unchanged production checks."""
import hashlib
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes, run

before = json.loads((OUT/'qualification-driver-before-harness.json').read_text())
source = hashes()
changed = sorted(name for name in before['source'].keys() | source.keys()
                 if before['source'].get(name) != source.get(name))
support = 'crates/hyperbrep-io/tests/support/selected_profiles.rs'
assert set(changed) == {support, 'crates/hyperbrep-io/tests/selected_profiles.rs',
    str((OUT/'consumer-project/cases.rs').relative_to(ROOT))}
old = next(path.read_text() for directory in OUT.glob('overlay-*')
           if (path := directory/support).is_file()
           and hashlib.sha256(path.read_bytes()).hexdigest() == before['source'][support])
new = (ROOT/support).read_text()
body = lambda text: text.split('pub fn selected_profile_step_vertices_remain_explicitly_unencodable', 1)[1].split('{', 1)[1]
normalize = lambda text: ''.join(text.replace('native::profile(', 'profile(').replace('native::replay(', 'replay(').split())
assert normalize(body(old)) == normalize(body(new))
C = ['--offline', '--locked']
CORE = ['-p', 'hyperbrep', '-p', 'hyperbrep-io']
checks = [
    ('new-consumer-clippy', ['cargo', 'clippy', *C, '--all-targets', '--manifest-path', str(OUT/'consumer-project/Cargo.toml'), '--', '-D', 'warnings']),
    ('native-clippy', ['cargo', 'clippy', *C, *CORE, '--all-features', '--all-targets', '--', '-D', 'warnings']),
    ('minimal-clippy', ['cargo', 'clippy', *C, *CORE, '--no-default-features', '--all-targets', '--', '-D', 'warnings']),
    ('new-debug', ['cargo', 'test', *C, *CORE, '-p', 'hypercurve', '--test', 'selected_profiles', '--test', 'retained_bezier_images', '--no-fail-fast']),
    ('harness-release', ['cargo', 'test', *C, '-p', 'hyperbrep-io', '--all-features', '--release', '--test', 'selected_profiles']),
    ('harness-minimal', ['cargo', 'test', *C, '-p', 'hyperbrep-io', '--no-default-features', '--release', '--test', 'selected_profiles']),
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check']),
    ('diff-check', ['git', 'diff', '--check']),
]
for label, command in checks:
    assert run(label, command, 1200) == 0, label
    assert hashes() == source
rerun = {label for label, _ in checks}
reused = [label for label in before['executed'] if label not in rerun]
reason = ('Only fixture module plumbing and the combined consumer changed. Production, library tests, '
          'all other test assertions, dependencies, features, examples and validation scripts are identical. '
          'The IO acceptance body is identical after removing native:: aliases and whitespace; both callers '
          'pass the same original profile/replay functions. Rechecked all eleven debug groups, the IO group '
          'under both release feature configurations, affected all-target Clippy and formatting. Reused '
          'unchanged production checks explicitly; their original logs/snapshots remain authoritative.')
(OUT/'harness-requalification.json').write_text(json.dumps(dict(source=source, previous_source=before['source'],
    changed=changed, acceptance_body_unchanged=True, production_unchanged=True, reused_checks=reused,
    executed=[label for label, _ in checks], reason=reason, passed=True), indent=2)+'\n')
executed = [label for label in before['executed'] if label != 'diff-check']
executed += ['harness-release', 'harness-minimal', 'diff-check']
(OUT/'qualification-driver.json').write_text(json.dumps(dict(source=source, executed=executed,
    failures=[], upstream_debug_blocked=[], reused_checks=reused,
    reuse_record='harness-requalification.json', scope=before['scope']+' '+reason), indent=2)+'\n')
print('Harness requalification passed; unchanged production checks explicitly reused', flush=True)
