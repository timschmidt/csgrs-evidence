from pathlib import Path
import hashlib
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
source = (root / 'selected-circle-corners').resolve()
target = source.parent / 'empty-native-replay'
alias = root / 'empty-native-replay'
record = controls / 'empty-native-worktree-prepared.json'
assert not target.exists() and not alias.exists() and not record.exists()
spec = importlib.util.spec_from_file_location('evidence', source / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
qualified_candidate = json.loads((controls / 'selected-circle-corners-qualification-corner3/source-before.json').read_text())
assert before == qualified_candidate
assert before['untracked_inputs'] == []
branch = 'hypercurve-empty-native-replay'
subprocess.run(['git', '--git-dir='+str(root/'code.git'), 'worktree', 'add', '-b', branch, str(target), before['revision']], check=True)
subprocess.run(['git', 'apply', '--index', '-'], input=patch, cwd=target, check=True)
alias.symlink_to(target, target_is_directory=True)
spec2 = importlib.util.spec_from_file_location('candidate', target / 'scripts/successive-operations.py')
c = importlib.util.module_from_spec(spec2)
spec2.loader.exec_module(c)
copied, copied_files, _ = c.source_snapshot()
assert copied == before and copied_files == files
assert e.source_snapshot()[0] == before
(controls / 'empty-native-parent-candidate.patch').write_bytes(patch)
record.write_text(json.dumps({'source': before, 'copied_source': copied, 'target': str(target), 'branch': branch, 'parent_qualification_pending': True, 'precondition': 'Corner source remains byte-identical to its active qualification. Reparent to its qualified commit and copy receipt files before final empty increment qualification.', 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'epoch': time.time()}, indent=2)+'\n')
print(record.read_text())
