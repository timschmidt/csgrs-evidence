from pathlib import Path
import importlib.util, json, os, subprocess, sys, time
sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
parent = r / 'selected-field-root-discovery'
physical = parent.resolve().parent / 'selected-query-fibers'
alias = r / 'selected-query-fibers'
assert not physical.exists() and not alias.exists()
def git(*args, env=None):
    return subprocess.check_output(['git', *args], cwd=parent, env=env, text=True).strip()
spec = importlib.util.spec_from_file_location('e', parent / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
qualification = json.loads((c / 'selected-field-root-discovery-qualification-final5/complete.json').read_text())
assert qualification['all_passed'] and qualification['groups'] == 15
assert source == qualification['source']
assert not git('ls-files', '--others', '--exclude-standard')
index = c / 'selected-query-fibers-source1.index'
assert not index.exists()
env = {**os.environ, 'GIT_INDEX_FILE': str(index)}
git('read-tree', 'HEAD', env=env)
git('add', '-A', env=env)
tree = git('write-tree', env=env)
head = git('rev-parse', 'HEAD')
checkpoint = git('commit-tree', tree, '-p', head, '-m', 'Checkpoint qualified selected-field root discovery for geometric fiber consumers', env=env)
git('update-ref', 'refs/heads/checkpoint-selected-query-fibers-source1', checkpoint, '0' * 40)
git('worktree', 'add', '-b', 'hypercurve-selected-query-fibers', str(physical), checkpoint)
alias.symlink_to(physical)
assert e.source_snapshot()[0] == source
record = {'checkout': str(physical), 'branch': 'hypercurve-selected-query-fibers', 'parent': checkpoint, 'checkpoint': checkpoint, 'checkpoint_tree': tree, 'root_source': source, 'root_source_checkpoint_parent': head, 'needs_finalized_root_parent_alignment': True, 'scope': 'Private checkpoint of root discovery after all fifteen broad qualification groups pass. Geometric selected-query fibers remain unimplemented; parent source and running qualifications remain unchanged.', 'epoch': time.time()}
(c / 'selected-query-fibers-prepared.json').write_text(json.dumps(record, indent=2) + '\n')
(c / 'selected-query-fibers-root-parent.patch').write_bytes(patch)
print(json.dumps(record, indent=2))
