"""Bind the reviewed decision and update only BREP's shared ledger."""
import hashlib,json,subprocess,sys
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[4]
sys.path.insert(0,str(OUT))
from check import hashes
sys.path.insert(0,str(OUT.parent/'2026-10-16-upstream-format-integration'))
from ledger_spans import replace_brep
BASELINE='fa541102c93c617cdef28faa0e5451fd0c0c8d25'
UPSTREAM='99b88f707b04053de7f40a86d6d029e3c07460d9'
ID='torus-exchange-2026-10-16'
read=lambda p:json.loads(p.read_text())
write=lambda p,v:p.write_text(json.dumps(v,indent=2)+'\n')
digest=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
source=hashes()
assert source==read(OUT/'final-source.json')
identity=hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest()
q=read(OUT/'qualification-summary.json')
b=read(OUT/'benchmark-summary.json')
d=read(OUT/'retention-decision.json')
assert d['decision']=='kept' and d['source_identity']==identity
assert d['reviewed_benchmark_sha256']==digest(OUT/'benchmark-summary.json')
assert d['reviewed_dependency_cost_sha256']==digest(OUT/'dependency-costs-v1/summary.json')
assert q['source']==source and all(r['exit_code']==0 for r in q['commands'])
assert b['matched_cases']==167 and b['unchanged_receipts']==162
assert b['reviewed_receipt_migrations']==5 and b['all_receipts_accounted_for']
assert read(OUT/'dependency-summary.json')['preserved_test_outcomes']
increment=dict(id=ID,work_packages=d['work_packages'],properties=d['properties'],change=d['change'],
    evidence=f'evidence/{OUT.name}/manifest.json',decision='kept',validation=d['validation'],
    retention_rationale=d['rationale'],limits=d['limits'])
status_path=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status=read(status_path)
assert not status['complete'] and len(status['work_packages'])==28
assert all(row['status'] in ['open','in-progress'] for row in status['work_packages'])
status['updated_on']=d['reviewed_on']
if any(row['id']==ID for row in status['increments']):
    assert status['increments'][-1]['id']==ID
    status['increments'][-1]=increment
else:status['increments'].append(increment)
for index,value in d['next_actions'].items():status['next_actions'][int(index)]=value
write(status_path,status)
ledger_path=ROOT/'docs/properties-status.json'
ledger_text=ledger_path.read_text()
brep=json.loads(ledger_text)['current_work']['hyperbrep']
brep.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),latest_implementation=ID,
    qualification=d['validation']+' '+d['rationale']+' '+d['limits'])
ledger_path.write_text(replace_brep(ledger_text,brep))
helpers=['crates/hyperbrep/docs/evidence/2026-10-15-closed-edges/receipts.py',
    'crates/hyperbrep/tools/benchmark_receipt.py',
    'crates/hyperbrep/docs/evidence/2026-10-15-step-faceted/measure.c','.cargo/config.toml']
helper_hashes={}
for name in helpers:
    assert subprocess.check_output(['git','show',f'{BASELINE}:{name}'],cwd=ROOT)==(ROOT/name).read_bytes()
    helper_hashes[name]=digest(ROOT/name)
documents=['crates/hyperbrep/docs/ARCHITECTURE.md','crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
    'crates/hyperbrep/docs/SUPPORT_MATRIX.md','crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',
    'crates/hyperbrep/PERFORMANCE.md','crates/hyperbrep-io/PERFORMANCE.md',
    'crates/hyperbrep-io/docs/STEP_MAPPING.md','crates/hyperbrep/README.md',
    'crates/hyperbrep-io/README.md','docs/properties-status.json']
manifest=dict(baseline=BASELINE,upstream=UPSTREAM,decision='kept',scope=d['change'],
    retention_rationale=d['rationale'],properties=d['properties'],source_identity=identity,
    source=f'source-{identity}.json',contract='contract.md',review='review.md',
    capability_migration='capability-migration.md',retention_decision='retention-decision.json',
    qualification='qualification-summary.json',attempts='attempts.json',test_counts=q['tests'],wasm=q['wasm'],
    benchmark='benchmark-summary.json',receipt_review='receipt-review.json',
    receipt_migrations='approved-receipt-migrations.json',receipt_artifact_binding='receipt-artifact-binding.json',
    dependency='dependency-summary.json',
    dependency_costs='dependency-costs-v1/summary.json',growth='growth-summary.json',idea_ledger='idea-ledger.json',
    frontier='continuation-frontier.json',preceding_frontier='preceding-frontier.json',
    frontier_migration='frontier-migration.json',frontier_extension='frontier-extension-summary.json',
    prism_frontier='prism-frontier.json',artifacts=['preserved-step-artifacts.json','preserved-prism-artifacts.json'],
    reconstruction='source-reconstruction.json',audit='audit.json',
    benchmark_helpers=dict(observation='Final helper/config audit against baseline; not a retroactive pre-run observation.',files=helper_hashes),
    analysis_recipes={str(p.relative_to(OUT)):digest(p) for p in sorted((OUT/'analysis-recipes').glob('*.py'))},
    documents={name:digest(ROOT/name) for name in documents},
    evidence_files={str(p.relative_to(OUT)):digest(p) for p in sorted(OUT.rglob('*'))
        if p.is_file() and '__pycache__' not in p.parts and p.name not in ['manifest.json','audit.json']},
    validation=d['validation'],limitations=d['limits'])
write(OUT/'manifest.json',manifest)
assert hashes()==source
print(json.dumps(dict(decision='kept',evidence_files=len(manifest['evidence_files']),
    qualified_commands=len(q['commands']),work_packages_open=28)))
