from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
parent = Path('/tmp/hypercurve-closure-circle-differentials')
child = Path('/tmp/hypercurve-closure-rational-point-images')
base = json.loads((root / 'chord-replay-final-commit.json').read_text())['commit']
assert not child.exists() and not (root / 'rational-point-images-fork.json').exists()

def snapshot(checkout, name):
    spec = importlib.util.spec_from_file_location(name, checkout / 'scripts/successive-operations.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.source_snapshot()

source, files, patch = snapshot(parent, 'parent_evidence')
assert source['revision'] == base
assert source == json.loads((root / 'circle-differentials-final-source-before.json').read_text())
(root / 'rational-point-images-parent-candidate.patch').write_bytes(patch)
with (root / 'rational-point-images-worktree.log').open('w') as out:
    subprocess.run(['git', 'worktree', 'add', '-b', 'hypercurve-rational-point-images', str(child), base], cwd=parent, stdout=out, stderr=subprocess.STDOUT, check=True)
subprocess.run(['git', 'apply', '--binary', '-'], input=patch, cwd=child, check=True)
for name in source['untracked_inputs']:
    dest = child / name
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes((parent / name).read_bytes())
actual, actual_files, _ = snapshot(child, 'child_evidence')
assert actual == source and actual_files == files
assert snapshot(parent, 'parent_evidence_after')[0] == source
result = {'parent_checkout': str(parent), 'child_checkout': str(child), 'source': source,
          'source_files': files, 'all_source_bytes_equal': True, 'recorded_epoch': time.time()}
(root / 'rational-point-images-fork.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({'child_checkout': str(child), 'base': base, 'all_source_bytes_equal': True, 'parent_unchanged': True}))
