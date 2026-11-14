from pathlib import Path
import json

s = Path(__file__).parent
assert (s / 'finalize.exit').read_text().strip() == '0'
source = json.loads((s / 'SOURCE.json').read_text())
q = json.loads((s / 'QUALIFICATION.json').read_text())
assert q['source_commit'] == source['commit']
assert json.loads((s / 'CHECKPOINT.json').read_text())['active_validation_processes'] == 0
cost = json.loads((s / 'cost-final/summary.json').read_text())
timing = json.loads((s / 'timing-summary.json').read_text())
assert cost['source_commit'] == source['commit']
lines = [
    '# Native rational curve interval ranges: retained local increment',
    '',
    f"Qualified source: `{source['commit']}`. Main integration and pending-patch",
    'preservation are recorded in INTEGRATION.json and FINAL-REPOSITORIES.json.',
    'The optional hypercurve/interval-ranges feature retains the native source',
    'and uses the existing Hypersolve expression/Jacobian authority for coordinate',
    'and local-parameter derivative enclosures. Native Aabb comparisons consume',
    'exact outward bounds with borrowed range evidence. Default dependencies and',
    'existing native evaluator bodies are unchanged.',
    '',
    f"Validation passed {q['validation_commands']} qualified commands, including",
    f"{q['full_release_tests']} owner tests across {q['full_release_suite_count']} suite summaries,",
    '12 focused witnesses in debug and optimized builds, strict Clippy and docs,',
    'the actual example, downstream work-budget tests, a WASM library check and',
    'a stable all-feature/all-target compile check. Eight archives were verified;',
    'the archived example built, ran and passed strict Clippy using archived Hyper',
    'dependencies. Stable full tests and the full pre-push matrix were not run.',
    'Existing ignored tests remain ignored and do not count as completed coverage.',
    '',
    '## Measured completed workloads',
    '',
    'Each portfolio includes preparation, sixteen coordinate/derivative reports,',
    'native bound projection and comparisons, retained output and destruction.',
    'Common source construction is excluded; scalar caches are warm. Timing uses',
    '30 paired samples of 32 portfolios, alternating modes on one pinned CPU.',
    'Other host activity is uncontrolled. Allocation counts use repository-locked',
    'dependencies, five identical observations per row and a balanced live-byte',
    'scope. Requested bytes exclude allocator overhead and are not RSS.',
    '',
    '| Fixture | Shared speedup, paired geometric mean (95% bootstrap) | Allocations independent → shared | Peak requested live bytes independent → shared |',
    '| --- | --- | --- | --- |',
]
for case in ('polynomial', 'rational', 'degree8'):
    a, b = cost['rows'][case + '/independent'], cost['rows'][case + '/shared']
    v = timing[case]['paired_speedup']
    lo, hi = v['bootstrap_percentile_95']
    lines.append(f"| {case} | {v['geometric_mean']:.3f}× ({lo:.3f}–{hi:.3f}) | {a['allocations']} → {b['allocations']} | {a['peak_requested_live']} → {b['peak_requested_live']} |")
lines += [
    '',
    'Native arithmetic work is identical within each pair. Structural graph work',
    'is reduced. These measurements compare shared and independent preparation',
    'of the new complete range workload; they do not establish a universal speedup',
    'or a performance improvement for existing modeling operations.',
    '',
    '## Limits and adverse evidence',
    '',
    'C1 evidence does not assert immersion, injectivity, nonzero tangents or an',
    'exact hull. Overestimated denominator ranges can return a typed noncertificate.',
    'Structural and dyadic limits do not bound total scalar refinement, coefficient',
    'growth, payload cloning, whole-process memory or uninterrupted native basis',
    'conversion. Cancellation is checked around conversion and before publication.',
    'CAPABILITIES.json separates demonstrated fixtures from general closure targets.',
    '',
    'The first candidate populated a native cache and changed high-degree dispatch.',
    'Its probe and intentionally stopped owner run remain preserved. The retained',
    'adapter borrows an existing basis or owns its conversion without filling that',
    'cache. Fresh-process witnesses preserve complete native traces, fixed counts',
    'and certified receipts under STRICT and APPROXIMATE_512. Earlier test-fixture',
    'and rustdoc failures remain in their original logs; no count was loosened.',
    '',
    'The first standalone allocation probe resolved four newer dependencies.',
    'Its successful measurements are superseded, not erased. cost-final/ contains',
    'the repository-locked replacement and its dependency audit. The archive-only',
    'consumer intentionally has its own recorded consumer lock. Standalone cache',
    'diagnostics have a matched before/after lock and are independently supported',
    'by repository-locked unit tests.',
    '',
    'General monotonicity, interval Newton/Krawczyk integration, certified native',
    'subdivision scheduling, normal-parallel/implicit/surface adapters and wider',
    'Phase 13 adoption remain open. No phase completion, push or publication is',
    'claimed. The full fifteen-phase goal remains active.',
    '',
]
(s / 'STATUS.md').write_text('\n'.join(lines))
print('STATUS.md generated from completed qualification and integration evidence')
