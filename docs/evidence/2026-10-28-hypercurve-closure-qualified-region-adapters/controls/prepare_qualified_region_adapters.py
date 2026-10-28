from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
source = (root / 'qualified-region-queries').resolve()
target = source.parent / 'qualified-region-adapters'
alias = root / 'qualified-region-adapters'
record = controls / 'qualified-region-adapter-worktree-prepared.json'
assert not target.exists() and not alias.exists() and not record.exists()
rows = json.loads((controls / 'qualified-region-adapter-baseline1/results.json').read_text())
assert [r['exit_code'] for r in rows] == [0, 0, 101, 0]
assert all(r['source_stable'] for r in rows)
def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path / 'scripts/successive-operations.py')
    m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m); return m
e = module('parent', source)
before, files, patch = e.source_snapshot()
assert before == json.loads((controls / 'qualified-region-queries-qualification-query3/source-before.json').read_text())
branch = 'hypercurve-qualified-region-adapters'
subprocess.run(['git', '--git-dir=' + str(root / 'code.git'), 'worktree', 'add', '-b', branch, str(target), before['revision']], check=True)
subprocess.run(['git', 'apply', '--index', '-'], input=patch, cwd=target, check=True)
alias.symlink_to(target, target_is_directory=True)
copied, copied_files, _ = module('candidate', target).source_snapshot()
assert copied == before and copied_files == files
assert e.source_snapshot()[0] == before
record.write_text(json.dumps({'parent_source': before, 'copied_source': copied, 'target': str(target), 'branch': branch, 'parent_qualification_pending': True, 'all_source_bytes_preserved': True, 'epoch': time.time()}, indent=2) + '\n')
p = controls / 'qualified-region-adapter-contract.json'
contract = json.loads(p.read_text())
contract['baseline_source'] = before
contract['findings'] = {'membership':'STRICT incorrectly returns Certified false for an independently interior point after approximate empty normalization.', 'bounds':'Existing wrapper consumes the native query and retains the strict blocker and authorized approximation.'}
contract['status'] = 'Failure freshly reproduced on the frozen query parent. Identical isolated source copy prepared; no adapter fix applied yet.'
p.write_text(json.dumps(contract, indent=2) + '\n')
print(record.read_text())

