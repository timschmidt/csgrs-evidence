from pathlib import Path
import importlib.util
import json
import os
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-closure-integration'
spec = importlib.util.spec_from_file_location('gate', c / 'selected_closure_candidate_gate.py')
gate = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gate)
qualified = gate.wait()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
assert source == qualified
def git(*args, env=None):
    return subprocess.check_output(['git', *args], cwd=w, env=env, text=True).strip()
assert not git('ls-files', '--others', '--exclude-standard')
index = c / 'selected-closure-integration-source1.index'
assert not index.exists()
env = {**os.environ, 'GIT_INDEX_FILE': str(index)}
git('read-tree', 'HEAD', env=env)
git('add', '-A', env=env)
tree = git('write-tree', env=env)
parent = git('rev-parse', 'HEAD')
commit = git('commit-tree', tree, '-p', parent, '-m', 'Checkpoint integrated selected-query fibers, derivatives and retained pole guards', env=env)
ref = 'refs/heads/checkpoint-selected-closure-integration-source1'
git('update-ref', ref, commit, '0' * 40)
assert e.source_snapshot()[0] == source
record = {'commit':commit,'tree':tree,'parent':parent,'ref':ref,'source':source,'focused_groups':16,'strict_msrv_passed':True,'scope':'Private incremental source checkpoint only. The dedicated worktree HEAD/index and frozen bytes remain unchanged. Finalized predecessor/evidence alignment, combined broad admission and all pre-push checks remain required.','epoch':time.time()}
(c / 'selected-closure-integration-checkpoint.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2),flush=True)
