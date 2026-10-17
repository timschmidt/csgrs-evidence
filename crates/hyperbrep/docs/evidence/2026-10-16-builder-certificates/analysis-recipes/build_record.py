"""Record the reviewed decision without changing the qualified runtime inputs."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
sys.path.insert(0, str(OUT))
from check import hashes
sys.path.insert(0, str(OUT.parent / '2026-10-16-upstream-format-integration'))
from ledger_spans import replace_brep

BASELINE = '79e807edf3c267712f5fe3ddc3757b2a7b00fe89'
UPSTREAM = '99b88f707b04053de7f40a86d6d029e3c07460d9'
IDENTITY = '23951c19ac9a16b9796e5aca425e5cdb2da37128b9be521c42d9de97058a8f9f'
ID = 'builder-certificates-2026-10-16'
read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
source = hashes()
assert source == read(OUT / 'final-source.json')
assert hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest() == IDENTITY
q = read(OUT / 'qualification-summary.json')
b = read(OUT / 'benchmark-summary.json')
assert q['source'] == source and all(r['exit_code'] == 0 for r in q['commands'])
assert b['matched_cases'] == 167 and b['exact_receipts_preserved']
exes = read(OUT / 'benchmark-v1/executables.json')
assert exes['baseline']['arc']['sha256'] == exes['candidate']['arc']['sha256']
assert len(b['adverse_timing_rows']) == 1
assert b['adverse_timing_rows'][0]['case'] == 'arc_structural_facts_replay'

rationale = (
    'Keep positive builder admission proofs after scope/lifetime review and full exact qualification. '
    'All 167 matched cases and 54 retained artifacts preserve their contracts; four fresh/reused '
    'circular-import cases have local time ratios 0.721784–0.778750 with fewer allocations. '
    'Accept eleven small requested-byte increases, disclosed RSS variation and harness/probe size costs. '
    'The sole timing row above 10% compares byte-identical arc executables at roughly 6 ns; retain that '
    'observation without assigning it to BREP or claiming an all-row timing pass. Other slower rows '
    'remain published. This is local evidence, not a universal speedup or resolution of prior regressions.')
validation = (
    'After the final runtime/test edit, BREP and IO pass 516 all-feature tests in both debug and release, '
    'and 508 minimal-feature release tests, with zero failures/ignored in each configuration. '
    'Both all-target warning-denied Clippy configurations, warning-denied rustdoc, six examples, '
    'fuzz-target compilation, eleven example and fourteen prism OCCT checks, formatting and an '
    '83-group source-path WASM runtime pass. All 81 diagnostic outcomes (74 native, five undecided, '
    'two exhausted), fifteen preceding workflows and 24 prism outcomes (18 native, six unsupported) '
    'are preserved. Diagnostic results are not independent semantic proofs. All 54 archive/STEP '
    'artifacts are byte-identical and 167 matched benchmark receipts have no migrations.')
limits = (
    'No new representation/API/archive contract or runtime change outside BREP. Certificate entry '
    'counts, allocation requests and process RSS are not heap-byte, total-work or cancellation bounds. '
    'The unchanged arc microcase remains an adverse timing observation; eleven allocation increases '
    'and native/WASM size costs remain published. Earlier prism/sector/archive/arc costs, scalar '
    'zero-factor failures, root no-curve rustdoc failure, upstream pending resource gates and historical '
    'storage failures remain open, not rerun or waived by this increment. No shipped-package, MSRV, '
    'new actual C/Python/JS binding, coverage, formal-proof, runtime fuzz/ASan/lexicase, whole-workspace '
    'or full pre-push claim. All 28 work packages remain open or in progress. No push.')
properties = ['P2', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P10', 'P11',
              'P17', 'P18', 'P19', 'P20', 'P24', 'P27', 'P35', 'P36', 'P37', 'P38', 'P39']
increment = dict(id=ID, work_packages=['WP03', 'WP08', 'WP14a', 'WP21', 'WP23'],
    properties=properties,
    change='Retain positive strict solid-admission proofs with partial-versus-transfer semantics; preserve all finalization and mutation checks.',
    evidence=f'evidence/{OUT.name}/manifest.json', decision='kept',
    validation=validation, retention_rationale=rationale, limits=limits)
status_path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = read(status_path)
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
status['updated_on'] = '2026-10-16'
if any(row['id'] == ID for row in status['increments']):
    assert status['increments'][-1]['id'] == ID
    status['increments'][-1] = increment
else:
    status['increments'].append(increment)
status['next_actions'][1] = (
    'Use integrated prism continuation plus admitted builder proof reuse as the current implementation '
    'baseline. The 167-case matched campaign in evidence/2026-10-16-builder-certificates/manifest.json '
    'preserves every receipt and measures local circular-import time/allocation savings. Retain partial '
    'versus transferred proof semantics, secondary prism derivation, cavity scope, invalidation and '
    'all adverse costs. Remaining prism-orientation work and proof cloning need separate experiments, '
    'not a claim that earlier costs are recovered. Keep per-call conic comparison reuse. Persistent '
    'caches require their own identity, lifetime, resource and state-matrix admission.')
status['next_actions'][13] = (
    'Preserve every historical feature/integration baseline and raw campaign. Extend exact STEP '
    'continuation for further native families after reproducing the blocker. Cone slant versus STEP '
    'axial parameters and exact semi-angle encoding need separate proofs; ring-torus charts need '
    'periodic seam and admissible-domain checks. See evidence/2026-10-16-builder-certificates/'
    'next-exchange-research.md; this is research, not implemented support. Close controlled-host, '
    'full dependency and shipped-consumer gates using their original contracts, not a successful subset.')
write(status_path, status)

ledger_path = ROOT / 'docs/properties-status.json'
ledger_text = ledger_path.read_text()
ledger = json.loads(ledger_text)
brep = ledger['current_work']['hyperbrep']
brep.update(latest_evidence=str((OUT / 'manifest.json').relative_to(ROOT)),
            latest_implementation=ID, qualification=validation + ' ' + rationale + ' ' + limits)
ledger_path.write_text(replace_brep(ledger_text, brep))

ideas = [
    dict(idea='Retain positive strict admission proofs in their owning builder', decision='kept',
         evidence=['review.md', 'qualification-summary.json', 'benchmark-summary.json'], rationale=rationale),
    dict(idea='Preserve complete available certificate sets during validated transfer', decision='already-satisfied',
         evidence=['review.md'], rationale='Existing transfer semantics are retained; no missing admission proof may inherit their absence semantics.'),
    dict(idea='Treat absent admission facts as permanent unsupported/negative knowledge', decision='rejected',
         evidence=['contract.md', 'review.md'], rationale='Rejected by proof scope before implementation or timing; absence is not a proof and can hide secondary prism/loft derivation or stronger later facts.'),
    dict(idea='Introduce process-global or pointer-key proof caching for this duplicated finalization work', decision='architecture-inapplicable',
         evidence=['contract.md', 'review.md'], rationale='The sufficient proof already belongs to this live immutable builder; global state is unnecessary for this trial. No global-cache experiment or general impossibility claim is made.'),
]
write(OUT / 'idea-ledger.json', ideas)
helpers = ['crates/hyperbrep/docs/evidence/2026-10-15-closed-edges/receipts.py',
           'crates/hyperbrep/tools/benchmark_receipt.py',
           'crates/hyperbrep/docs/evidence/2026-10-15-step-faceted/measure.c']
helper_hashes = {}
for name in helpers:
    data = subprocess.check_output(['git', 'show', f'{BASELINE}:{name}'], cwd=ROOT)
    assert data == (ROOT / name).read_bytes()
    helper_hashes[name] = digest(ROOT / name)
documents = ['crates/hyperbrep/docs/ARCHITECTURE.md', 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
             'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json', 'crates/hyperbrep/PERFORMANCE.md',
             'docs/properties-status.json']
manifest = dict(baseline=BASELINE, upstream=UPSTREAM, decision='kept',
    scope='Positive builder admission proof reuse; BREP runtime and its evidence/documentation only.',
    retention_rationale=rationale, properties=properties, source_identity=IDENTITY,
    source=f'source-{IDENTITY}.json', contract='contract.md', review='review.md',
    qualification='qualification-summary.json', attempts='attempts.json',
    test_counts=q['tests'], wasm=q['wasm'], benchmark='benchmark-summary.json',
    idea_ledger='idea-ledger.json', frontier='continuation-frontier.json',
    preceding_frontier='preceding-frontier.json', prism_frontier='prism-frontier.json',
    artifacts=['preserved-step-artifacts.json', 'preserved-prism-artifacts.json'],
    reconstruction='source-reconstruction.json', audit='audit.json',
    benchmark_helpers=dict(observation='Final audit: helpers byte-identical to pinned baseline; not a retroactive pre-run observation.', files=helper_hashes),
    analysis_recipes={str(p.relative_to(OUT)): digest(p) for p in sorted((OUT / 'analysis-recipes').glob('*.py'))},
    documents={name: digest(ROOT / name) for name in documents},
    evidence_files={str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*'))
                    if p.is_file() and '__pycache__' not in p.parts and
                    p.name not in ['manifest.json', 'audit.json']},
    validation=validation, limitations=limits)
write(OUT / 'manifest.json', manifest)
assert hashes() == source
print(json.dumps(dict(decision='kept', evidence_files=len(manifest['evidence_files']),
                      qualified_commands=len(q['commands']), work_packages_open=28)))
