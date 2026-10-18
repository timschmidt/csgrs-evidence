"""Check the newly split module is packaged and historical evidence stays out."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes, run
source = hashes()
baseline = OUT.parent/'2026-10-17-package-upstream-integration/package-comparison.json'
old = json.loads(baseline.read_text())['crates']['hyperbrep']
assert run('package-list', ['cargo', 'package', '--offline', '--locked', '-p', 'hyperbrep', '--allow-dirty', '--list'], 300) == 0
row = json.loads((OUT/'attempts.json').read_text())[-1]
members = (OUT/row['log']).read_text().splitlines()
expected = set(old['files']) | set(old['generated']) | {'src/geometry/planes.rs'}
assert set(members) == expected and len(members) == 185
assert not any(name.startswith('docs/evidence/') for name in members)
files = {}
for name in members:
    path = ROOT/'crates/hyperbrep'/name
    if path.is_file():
        files[name] = dict(sha256=hashlib.sha256(path.read_bytes()).hexdigest(), bytes=path.stat().st_size)
changed = [name for name, old_file in old['files'].items() if files[name] != old_file]
assert set(changed) == {'src/geometry.rs', 'src/topology/validation/prism_topology.rs',
                        'PERFORMANCE.md', 'docs/DEVELOPMENT_PLAN.md', 'docs/IMPLEMENTATION_STATUS.json'}
assert hashes() == source
(OUT/'package-payload.json').write_text(json.dumps(dict(source=source, command=row,
    baseline=str(baseline.relative_to(ROOT)), baseline_sha256=hashlib.sha256(baseline.read_bytes()).hexdigest(),
    members=members, files=files, generated=old['generated'], changed_physical_members=changed,
    added=['src/geometry/planes.rs'], evidence_members=0,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Cargo membership and physical source bytes only. The new module is included; historical evidence remains excluded. This does not build/publish an archive or close registry, MSRV or installed-consumer gates.'), indent=2)+'\n')
print('Package lists 185 members, includes planes.rs, excludes historical evidence.', flush=True)
