"""Compare package declarations with the preceding unmodified-manifest audit."""
import gzip
import json
from pathlib import Path
import runpy
import sys

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
scope = runpy.run_path(str(W / 'runner_v1.py'))
ROOT, R, sha, dump = (scope[key] for key in ['ROOT', 'R', 'sha', 'dump'])
decision = json.loads((R / 'proposal-result.json').read_text())
assert decision['retention_decision'] == 'kept'
old_root = Path('/run/user/1000/csgrs-release-consumer-audit-v1')
old_record = json.loads((old_root / 'metadata/result.json').read_text())
assert old_record['exit_code'] == 0 and not old_record['resource_stops']
assert sha(old_root / 'metadata/stdout.gz') == old_record['outputs_sha256']['stdout.gz']
before = json.loads(gzip.open(old_root / 'metadata/stdout.gz', 'rt').read())
after = json.loads(gzip.open(R / 'metadata-after/stdout.gz', 'rt').read())
targets = {key: {'before': before.pop(key), 'after': after.pop(key)}
           for key in ['target_directory', 'build_directory']}
assert all(row['before'] == old_record['environment_overrides']['CARGO_TARGET_DIR'] for row in targets.values())
new_record = json.loads((R / 'metadata-after/result.json').read_text())
assert all(row['after'] == new_record['environment_overrides']['CARGO_TARGET_DIR'] for row in targets.values())
assert before == after
dump(R / 'metadata-comparison.json', {'equal_except_declared_output_directory': True,
    'before_stdout_sha256': sha(old_root / 'metadata/stdout.gz'),
    'after_stdout_sha256': sha(R / 'metadata-after/stdout.gz'),
    'target_directories': targets, 'workspace_packages': len(after['workspace_members']),
    'scope': 'Cargo no-deps declarations, not a resolved dependency graph or compiled feature matrix.'})
print(json.dumps({'metadata_declarations_unchanged': True, 'workspace_packages': len(after['workspace_members'])}))
