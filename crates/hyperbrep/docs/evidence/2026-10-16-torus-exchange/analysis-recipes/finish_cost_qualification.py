"""Resume after the retained main receipt failure and its explicit migration review."""
import hashlib
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import hashes, run

read = lambda name: json.loads((OUT/name).read_text())
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
before = hashes()
recipe = Path(__file__)
recipe_hash = digest(recipe)
attempts = read('attempts.json')
main = [r for r in attempts if r['label']=='benchmarks'][-1]
assert main['exit_code'] == 1 and main['source_unchanged']
assert read(main['source']) == before
assert read('receipt-artifact-binding.json')['passed']
assert run('benchmark-receipt-review', ['python3', str(recipe.with_name('review_receipts.py'))], 600) == 0
assert run('dependency-costs', ['python3', str(recipe.with_name('dependency_costs.py'))], 5400) == 0
assert hashes() == before and digest(recipe) == recipe_hash
record = dict(recipe=str(recipe), sha256=recipe_hash,
    preceding_recipe='analysis-recipes/cost_qualification.py',
    preceding_recipe_sha256=digest(recipe.with_name('cost_qualification.py')),
    original_main_campaign=main, receipt_review='receipt-review.json',
    source_unchanged=True, main_campaign_qualified_with_explicit_migration=True,
    scope='All 105 main processes completed before the retained original receipt gate failed. Supplemental matched-feature captures and exact archive proofs ran afterward, then a separate explicit five-row migration review. No main timing was rerun or discarded. The dependency microcost campaign runs after every supplemental build/probe has finished, without concurrent tests/builds from this task.')
(OUT/'cost-qualification-driver.json').write_text(json.dumps(record, indent=2)+'\n')
print('reviewed main campaign and dependency microcost qualification complete', flush=True)
