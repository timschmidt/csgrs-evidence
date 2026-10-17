"""Run remaining final-source checks, reusing already passed identical inputs."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ENV, ROOT, hashes

source = hashes()
recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
qualifier = OUT / 'analysis-recipes/qualify.py'
# Load only declarative command construction; never execute its argparse or
# check loop while discovering the command catalogue.
prefix = qualifier.read_text().split('parser = argparse.ArgumentParser()', 1)[0]
namespace = dict(__file__=str(qualifier), __name__='qualification_catalogue')
exec(compile(prefix, str(qualifier), 'exec'), namespace)
labels = [row[0] for row in namespace['COMMANDS']]
attempts = json.loads((OUT / 'attempts.json').read_text())
latest = {row['label']: row for row in attempts}
reused = {}
for label in labels:
    row = latest.get(label)
    if row and row['exit_code'] == 0 and row['source_unchanged'] and json.loads((OUT / row['source']).read_text()) == source:
        reused[label] = row
remaining = [label for label in labels if label not in reused]
assert remaining
command = ['python3', str(qualifier), '--only', *remaining]
print('reusing passed final-source checks:', sorted(reused), flush=True)
result = subprocess.run(command, cwd=ROOT, env=ENV)
driver = json.loads((OUT / 'qualification-drivers.json').read_text())[-1]
assert driver['executed'] == remaining
assert result.returncode == 1 and set(driver['failures']) == {
    'inherited-zero-factor-default', 'inherited-zero-factor-all-features',
}, (result.returncode, driver)
assert hashes() == source
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
(OUT / 'continued-qualification.json').write_text(json.dumps(dict(
    source=source, recipe_sha256=recipe, command=command, reused=reused,
    executed=remaining, expected_external_owner_failures=driver['failures'],
    passed_scoped_qualification=True,
    scope='Reuse requires byte-identical guarded inputs and a passed recorded command. The inherited debug failures remain recorded failures and do not count as complete owner-wide or pre-push admission.'), indent=2)+'\n')
print('remaining scoped qualification completed; inherited failures retained', flush=True)
