"""Sequential continuation checks, final builds, then isolated timed campaigns."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

recipe = Path(__file__)
before = hashes()
recipe_hash = hashlib.sha256(recipe.read_bytes()).hexdigest()
assert not json.loads((OUT / 'final-qualification-driver.json').read_text())['failures']
steps = [
    recipe.with_name('continuation.py'),
    recipe.with_name('frontier.py'),
    recipe.with_name('growth.py'),
    recipe.with_name('refresh_dependency_binaries.py'),
]
for step in steps:
    print('phase', step.name, flush=True)
    subprocess.run(['python3', str(step)], cwd=ROOT, env=ENV, check=True)
    assert hashes() == before
subprocess.run(['python3', str(OUT / 'build_benchmarks.py'), 'candidate'], cwd=ROOT, env=ENV, check=True)
subprocess.run(['python3', str(recipe.with_name('feature_graph.py'))], cwd=ROOT, env=ENV, check=True)
assert run('benchmarks', ['python3', str(OUT / 'benchmark.py'), '--name', 'benchmark-v1'], 7200) == 0
assert run('dependency-costs', ['python3', str(recipe.with_name('dependency_costs.py'))], 5400) == 0
assert hashes() == before and hashlib.sha256(recipe.read_bytes()).hexdigest() == recipe_hash
(OUT / 'cost-qualification-driver.json').write_text(json.dumps(dict(
    recipe=str(recipe.relative_to(ROOT)), sha256=recipe_hash,
    source_unchanged=True,
    scope='Continuation and all benchmark compilation finish before timing. Two timed campaigns execute sequentially, without concurrent tests or builds from this task. Their independent source guards, process records and raw samples remain authoritative.'
), indent=2) + '\n')
print('continuation and cost qualification complete', flush=True)
