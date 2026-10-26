from pathlib import Path
import hashlib
import json
import os
import shutil
import subprocess
import time

raw = Path(__file__).resolve().parent
main = Path('/home/tim/Documents/GitHub/workspace/csgrs')
root = Path('/tmp/csgrs-r19-trace')
assert not root.exists()
record = raw / 'setup'
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
expected = json.loads((raw.parent / 'r18/primary-validation-1792974640892738184/sources-before.json').read_text())
def inventory(where):
    return {name: hashlib.sha256((where / name).read_bytes()).hexdigest() for name in expected}
assert inventory(main) == expected
(raw / 'baseline-sources.json').write_text(json.dumps(expected, indent=2) + '\n')
patch = subprocess.check_output(['git', 'diff', '--binary'], cwd=main)
(raw / 'baseline.patch').write_bytes(patch)
command = ['git', 'clone', '--shared', '--no-hardlinks', str(main), str(root)]
with (record / 'clone.log').open('w') as out:
    subprocess.run(command, stdout=out, stderr=subprocess.STDOUT, check=True)
subprocess.run(['git', 'apply', '--binary', str(raw / 'baseline.patch')], cwd=root, check=True)
untracked = set(subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=main, text=True).splitlines())
for name in expected:
    if name in untracked:
        for dest in [root / name, raw / 'untracked-source' / name]:
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(main / name, dest)
assert inventory(root) == expected and inventory(main) == expected
result = {'created_ns': time.time_ns(), 'root': str(root), 'head': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip(),
    'source_count': len(expected), 'source_manifest': str(raw / 'baseline-sources.json'), 'sources_identical': True,
    'target': '/tmp/csgrs-r19-target', 'primary_unchanged': True,
    'status': 'Provisional final R18 primary source, byte-identical to its running validation input. R19 reproduction is independent; no R19 retention before R18 source validation completes. Any source correction requires renewed attribution/reproduction.',
    'clone_command': command}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
print('R19 isolated source frozen', len(expected), 'inputs;', root)
