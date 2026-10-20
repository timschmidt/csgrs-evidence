"""Keep original command logs; require clean whitespace for all other changes."""
import json
from pathlib import Path
import subprocess

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
prefix = str(OUT.relative_to(ROOT))
records = {}
for name, suffix in [('all_files', []), ('non_logs', ['--', '.', ':!'+prefix+'/**/*.log', ':!'+prefix+'/*.log'])]:
    command = ['git', 'diff', '--cached', '--check', *suffix]
    result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    records[name] = dict(command=command, exit_code=result.returncode, output=result.stdout)
assert records['non_logs']['exit_code'] == 0, records['non_logs']
assert records['all_files']['exit_code'] in [0, 2]
records['scope'] = 'Staged source, tests, documents and evidence checked before commit. Raw command logs retain original Cargo EOF blank lines; they are the only exclusions. No push or full pre-push qualification.'
(OUT/'staged-whitespace.json').write_text(json.dumps(records, indent=2)+'\n')
print(json.dumps({name: records[name]['exit_code'] for name in ['all_files', 'non_logs']}))
