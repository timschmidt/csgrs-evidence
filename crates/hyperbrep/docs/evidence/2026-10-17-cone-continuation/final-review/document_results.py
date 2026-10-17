"""Publish the measured cone domain without closing broader project gates."""
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read = lambda p: json.loads((OUT / p).read_text())
write = lambda p, value: (OUT / p).write_text(json.dumps(value, indent=2)+'\n')
source = hashes()
q, b, d = [read(name) for name in ['qualification-summary.json', 'benchmark-summary.json', 'dependency-costs-v1/summary.json']]
dep = read('dependency-summary.json')
assert q['source'] == source and b['exact_receipts_preserved']
assert read('uncertainty-fixture-migration.json')['admitted']
validation = (
    f"Native/IO debug and release all-feature suites each pass {q['tests']['native-release']['passed']} tests; "
    f"minimal features pass {q['tests']['native-minimal']['passed']}. "
    f"The source-path WASM runtime passes {q['wasm']['probe_groups']} groups with zero imports. "
    f"Four dependency library suites pass {dep['candidate']['totals']['passed']} tests, retain {dep['candidate']['totals']['ignored']} existing ignored cases, "
    "and add thirteen private proof/incidence groups. Their prior named outcomes are retained through the explicitly recorded uncertainty-fixture migration. "
    "Focused public scalar/predicate and affected curve integration tests pass in both checked feature configurations; the full all-feature curve integration corpus is retained. "
    "Warning-denied native/dependency Clippy, rustdoc, STEP examples, optional OCCT reads, fuzz-target compilation and repository Cargo formatting pass. "
    "Every admitted check uses the final guarded source. The inherited zero-factor debug failure remains reproduced in both checked configurations.")
cost = (
    f"All {b['matched_cases']} existing completed main cases retain their receipts across eighteen corpora and 108 alternating processes. "
    "Three new complete cone workflows have absolute costs only. "
    f"{len(b['adverse_timing_rows'])} existing timing rows exceed a 1.10 ratio, with maximum {b['maximum_case_ratio']:.6f}; "
    f"{len(b['increased_allocation_rows'])} rows increase allocation calls or requested bytes. "
    f"The dependency supplement retains all {d['cases']} scalar/predicate/rounding cases in eighteen processes, "
    f"including {len(d['adverse_timing_rows'])} ratios above 1.10 and maximum {d['maximum_case_ratio']:.6f}.")
limits = (
    "The 81-slot diagnostic inventory now returns 81 native results, but only independently tested domains earn semantic acceptance. "
    "Six partial/reversed prism controls remain unsupported. Standalone expanded cone endpoint coordinates retained from failed prototypes remain undecided; the completed workflows preserve their already available endpoint witnesses. "
    "General Boolean closure, cone STEP exchange, further charts and trace families remain open. "
    "Per-attempt algebra limits do not bound total work, matcher work, heap bytes or end-to-end cancellation. "
    "Shared-host timings, allocation requests, RSS and serialized growth do not establish general speedups or resource bounds. "
    "A supplemental standalone formatter audit retains 97 byte-identical inherited edits in the included algebra.rs source; seven other affected included files pass. "
    "Package/MSRV/actual C-Python-JS delivery, full coverage, formal proofs, directed libFuzzer/ASan/lexicase, release and full pre-push admission remain open. "
    "All 28 work packages remain open or in progress; no push.")
write('retention-decision.json', dict(decision='kept',
    reason='Scoped exact-completion extension with independent analytic workflows, reproduced cold scalar/curve blockers, explicit fixture migration and preserved existing benchmark receipts. This is not an optimization claim.',
    validation=validation, costs=cost, limitations=limits,
    next='Preserve this complete native baseline while qualifying exact cone STEP parameter correspondence and finite-decimal encoding. Isolate repeated proof costs under unchanged completed contracts; coordinate unrelated fixes with the upstream owner.'))

(OUT / 'README.md').write_text(f'''# Exact rotated cone continuation

The original radius-5 to radius-2, height-6 cone frustum and 40-unit cutter
rotated by exact (3/5,4/5) now complete the axial band and complementary
reconstruction in both operand orders. All three workflows continue through
two split/reload/recut/reunion/empty-recovery cycles. Independent integrated
volume/area, paired edge incidence and sixteen point expectations with exact
1/10^12 offsets remain inside each complete-workflow test and measurement.
Cold replay precedes live-object semantic queries.

Baseline: `352fb486a9090c18f43a75b909fa60c4181ecb21`. Hyperreal owns the
root, reciprocal and trigonometric relations; Hypercurve owns retained circular
incidence and overlap endpoint images. HyperBRep retains strict native topology
and archive validation. No public API or archive schema changes.

{validation}

{cost}

## Contract and evidence

- [Contract](contract.md), [proof review](review.md), [experiment record](analysis-notes.md)
  and [all attempts](attempts.json) retain original failures, failed prototypes,
  temporary observer sources and their removal, and the full original inputs.
- The [independent Fraction oracle](captured-oracle.json) proves all 23 retained
  scalar captures using rational-root, reciprocal, quadrant and unit-circle
  identities. It does not prove the later large expanded-coordinate captures;
  those remain explicit limitations. Full native analytic tests establish the
  admitted geometric domain separately. The [analytic oracle](analytic-oracle.json)
  independently recomputes the five measure sets and 80 finite point expectations
  with Fraction integration and exact rational rotation.
- The [fixture migration](uncertainty-fixture-migration.json) preserves the
  original unit-circle constructors as certified positive cases and adds a
  separate exact angle-addition zero for the existing unresolved, consumed-
  terminal and strict/approximate/strict cache checks. Policies, geometry,
  resolution and assertions remain intact. Passing aborted/structural-fact
  and solver residual-ball fixtures are deliberately unchanged.
- [Qualification](qualification-summary.json) and the [dependency comparison](dependency-summary.json)
  bind final-source commands, feature configurations and prior named outcomes.
  The inherited external-owner zero-factor debug failures remain failures.
  A separate [included-file formatting audit](included-format-review.json)
  reproduces exactly the same 97 algebra.rs edits on the pinned baseline and
  candidate. The supplemental failed check remains recorded; seven other
  affected included files pass and Cargo formatting passes separately.
- The [81-slot frontier](continuation-frontier.json) changes only the three
  rationally rotated cone outcomes. Fifteen preceding workflows and all 24
  prism controls retain their outcomes; [61 STEP artifacts](preserved-artifacts.json)
  remain byte-identical. Diagnostic counts do not establish set equality.
- [Growth](growth-summary.json) retains the previous torus states and every
  observed cone state through both cycles, with archive sizes, serialized node
  occurrences/depth and rational coefficient bits. These are not live DAG or
  retained-heap measurements.
- [Main costs](benchmark-summary.json), [dependency costs](dependency-costs-v1/summary.json)
  and the [compiler feature graphs](feature-graph-admission.json) preserve
  prospective baselines, raw samples, every adverse row, process resources
  and executable sizes. A faster old failure is never a success baseline.
- The [next cone STEP investigation](future-cone-step.md) distinguishes native
  slant coordinates, direct spatial boundary encoding and finite-generator
  alternatives. It is a feasibility plan, not admitted exchange support.
- [Retention](retention-decision.json), [ideas](idea-ledger.json),
  [source reconstruction](source-reconstruction.json), [manifest](manifest.json)
  and [audit](audit.json) bind the retained source and complete evidence.

## Reproduction and limits

`check.py` records commands, environments, external timeouts and exact source
snapshots. `analysis-recipes/qualify.py` executes the local/downstream matrix.
`final-review/finish_checks.py` runs diagnostics and then isolated main and
dependency measurements. Its `final-review/continuation.py` uses the explicitly
[corrected observer wrapper](diagnostic-wrapper-correction.json); the original
inner-doc-comment compile failure and source remain retained. Every crate,
test, benchmark and WASM input remains frozen, and the corrected standalone
probe inputs have their own byte bindings. No compilation or tests from this task overlap a
timed campaign. Historical `/tmp` paths need local setup; they are not a
portable package installation recipe.

Sector process resources and binary sizes include three additional workflows.
The edge-image preflight extends acceptance outside timed cases, so its whole-
process resources also include that migration. WASM adds nine groups and
executes the same explicit fixture migration within its existing edge-image
group; its old group count does not imply byte-identical test work. Binary
sizes describe harnesses, not shipped packages. OCCT is an optional floating-
point interoperability oracle, and source-path WASM is not a shipped JS binding.

{limits}
''')

ideas = [
    ('Shared rational-root and Pi/InvPi relations', 'kept', 'The original joint passes; this prototype alone still fails full geometry. Retained only as part of the combined completion extension, with no isolated speed claim.'),
    ('Exact rational quadrant trigonometry and equal-argument unit-circle relations', 'kept', 'All 23 captured zeros, owning-layer guards and complete native cone workflows pass in the combined extension. No approximate value is substituted.'),
    ('Positive rational-function proof reuse within one attempt', 'kept', 'The original cold repeated subexpressions exhausted 512 nodes; structural positive reuse resolves them with the same budgets. Keys remain borrowed from the owned input and no failed proof is cached.'),
    ('Native circular incidence through the retained quadratic frame', 'kept', 'Original cold query and rational-circle guards pass, preserving poles, collapsed curves, ranges and retracing controls.'),
    ('Preserve paired included overlap endpoint images', 'kept', 'Source endpoint priority and both carrier parameters are retained. Full band and both reconstruction workflows pass two continuation cycles.'),
    ('Higher normalizer limits, tolerance or lower fixture resolution', 'rejected', 'The admitted workflow uses existing exact certificates and endpoint witnesses without changing limits, policy or geometry.'),
    ('Solve the later expanded contacts only by native angular classification', 'rejected', 'The retained large coordinate queries still block native angular/radial classification. Their failures remain recorded.'),
    ('Extend scalar algebra to replace an already owned endpoint witness', 'rejected', 'Not needed for this domain: preserve the existing paired witness in its curve owner. General expanded-coordinate proof support remains an open independent domain.'),
    ('Use the compact circle formula as the reproduced failure', 'already-satisfied', 'That formula worked before the incidence change. The actual serialized 4 KB query and full workflows remain the acceptance boundary.'),
    ('Reinterpret region boundary indices as BREP arena indices', 'architecture-inapplicable', 'Region preparation can reverse, split, coalesce or reorder boundaries. Existing source-use recovery remains authoritative.'),
    ('Treat an earlier error as a successful-work speed baseline', 'rejected', 'All 172 preceding completed cases are frozen prospectively. The three new complete cone workflows receive absolute costs only.'),
    ('Disable the valid unit-circle proof to preserve old Unknown fixtures', 'rejected', 'Explicitly migrate the newly decidable inputs and preserve terminal coverage with a separate independently justified exact zero.'),
]
write('idea-ledger.json', dict(ideas=[dict(idea=a, decision=b, evidence=c) for a,b,c in ideas],
    interaction='The combined domain needs all retained proof/incidence/image changes. Earlier isolated prototypes and all adverse observations remain recorded. No ledger entry alone establishes compliance.'))

(OUT / 'ideas.md').write_text('# Idea ledger\n\n| Idea | Decision | Evidence and limits |\n| --- | --- | --- |\n' +
    '\n'.join(f'| {idea} | {decision} | {evidence} |' for idea,decision,evidence in ideas) +
    '\n\nThe combined exact-completion domain, every adverse cost observation and remaining limits are bound by [retention](retention-decision.json). Individual prototype success and this ledger do not establish whole-operation or release compliance.\n')

performance = ROOT / 'crates/hyperbrep/PERFORMANCE.md'
heading = '## Exact rotated cone continuation (2026-10-17)'
assert heading not in performance.read_text()
table = '\n'.join(f"| `{r['corpus']}/{r['case']}` | {r['ratio']:.6f} |" for r in b['adverse_timing_rows']) or '| No rows above 1.10 | — |'
micro = '\n'.join(f"| `{r['corpus']}/{r['case']}` | {r['ratio']:.6f} |" for r in d['adverse_timing_rows']) or '| No rows above 1.10 | — |'
new = '\n'.join(f"| `{r['case']}` | {r['candidate_median_ns']/1e9:.6f} | {r['candidate_allocation_per_iteration']['calls']:,.0f} | {r['candidate_allocation_per_iteration']['requested_bytes']:,.0f} |" for r in b['costs'] if 'ratio' not in r)
performance.write_text(performance.read_text()+f'''

{heading}

The [admission record](docs/evidence/2026-10-17-cone-continuation/README.md)
qualifies the original cone band and both complementary reconstruction orders,
including two further native continuation cycles. This extends exact completion;
it is not an optimization. The additional algebra attempt follows every previous
successful proof path and may add work when earlier attempts are insufficient.

{cost}

All existing main timing ratios above 1.10:

| Case | Candidate/baseline median |
| --- | ---: |
{table}

New complete-workflow absolute costs, including cold replay, exact measures,
classification, topology, both further cycles and archive receipts:

| Case | Seconds | Allocation calls | Requested bytes |
| --- | ---: | ---: | ---: |
{new}

Requested bytes are cumulative allocator requests over each completed workload,
not peak or retained memory. Process RSS and serialized archive sizes are
recorded separately in the linked evidence.

All dependency timing ratios above 1.10:

| Case | Candidate/baseline median |
| --- | ---: |
{micro}

Every allocation, RSS and size row remains in the linked record, including
increases. Sector process resources include three new cases; edge-image process
resources include an extended untimed preflight; WASM adds nine groups. These
are shared-host harness observations, not controlled-host speedups, package
sizes or operation-wide resource bounds. A median of unrelated case ratios is
not an aggregate speedup. Earlier adverse observations and open cost gates
remain visible. Isolate repeated proof costs under this complete baseline before
changing scheduling or caches; preserve exact receipts and failed controls.
''')

# Specification and status updates are evidence-linked, not executable proof.
plan = ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
text = plan.read_text()
old = '''inventory now has 78 native results and three undecided cone continuations.
These diagnostic counts do not replace independent semantic acceptance.
Preserve all 172 completed BREP/curve/STEP benchmark cases and every historical
adverse cost row. Investigate the [retained cone scalar blocker](evidence/2026-10-17-curved-continuation/next-cone-proof.md)
through the existing scalar algebra authority, then requalify its full native
composition. The independent cone identity is not production support.'''
assert old in text
text = text.replace(old, '''inventory now has 81 native results after the [cone continuation increment](evidence/2026-10-17-cone-continuation/README.md).
Its three formerly undecided cone workflows also have independent full-size
analytic measures, near-boundary classification and two complete continuation
cycles. These diagnostic counts do not replace semantic acceptance.
Hyperreal owns the shared root/reciprocal/trigonometric proofs; Hypercurve owns
retained circular incidence and paired overlap endpoint images. The stronger
proofs require an explicit uncertainty-fixture migration, retaining the old
identity inputs as positive checks and separate terminal-policy controls.
Preserve all 175 completed BREP/curve/STEP benchmark cases and every historical
adverse row. General expanded-coordinate queries remain an open domain; do not
discard an available endpoint witness and demand that scalar algebra recreate
it. Next qualify exact cone STEP parameter correspondence and encoding against
the [updated feasibility note](evidence/2026-10-17-cone-continuation/future-cone-step.md), keeping native slant-distance semantics distinct
from exchange chart units. Do not credit native completion as exchange support.''')
plan.write_text(text)

matrix = ROOT / 'crates/hyperbrep/docs/SUPPORT_MATRIX.md'
text = matrix.read_text()
old = '''continuation blockers. The current 81-slot rerun has 78 native results and three
undecided cone continuations; see the
[reviewed frontier](evidence/2026-10-17-curved-continuation/continuation-frontier.json).'''
assert old in text
text = text.replace(old, '''continuation blockers. The current 81-slot rerun has 81 native results; see the
[reviewed frontier](evidence/2026-10-17-cone-continuation/continuation-frontier.json).
The three formerly undecided cone workflows now have independent full-size
analytic and repeated-composition acceptance.''')
text = text.replace('torus Boolean closure, cone completion or whole-operation resource bounds.', 'torus Boolean closure or whole-operation resource bounds. The later cone domain\nis documented separately below.')
text += '''

## Rationally rotated cone continuation

The radius-5 to radius-2, height-6 cone frustum and a 40-unit cutter rotated by
exact (3/5,4/5) complete the axial band and complementary reconstruction in
both operand orders. Each workflow runs two edge-split/archive-reload/recut/
reunion/empty-recovery cycles. Exact independent volume and area, sixteen point
expectations with 1/10^12 offsets, and paired edge incidence remain required on
live and cold-replayed states.

The [admission record](evidence/2026-10-17-cone-continuation/README.md) binds
Hyperreal's shared exact relations and Hypercurve's retained circle/overlap
witnesses to this finite domain. The original partition, native incidence
capture, overlap trim and complete workflows are separate regressions. No
topology epsilon, display chord, scalar formula in BREP or serialized proof
privilege is introduced. General cone Boolean closure and standalone expanded
coordinate queries remain open. Cone STEP still returns a typed unsupported
surface diagnostic; native continuation does not establish exchange support.
'''
matrix.write_text(text)

status_path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
identity = 'rotated-cone-continuation-2026-10-17'
assert not any(row['id'] == identity for row in status['increments'])
status['increments'].append(dict(id=identity, work_packages=['WP00','WP03','WP06','WP07','WP08','WP21'],
    properties=['P1','P2','P3','P4','P5','P6','P8','P9','P10','P11','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P38','P39'],
    decision='kept for exact completion; not an optimization',
    change='Complete the three original rationally rotated cone band/reconstruction workflows through two further split/reload/Boolean/empty-recovery cycles. Shared scalar relations, native retained circular incidence and paired overlap endpoint images stay in their owning crates; explicit test migration preserves positive identities and terminal-policy coverage.',
    evidence='evidence/2026-10-17-cone-continuation/manifest.json', validation=validation, cost_evidence=cost, limits=limits))
status['next_actions'][0] = 'Preserve all 81 native diagnostic slots and their independent acceptance domains, including all three cone workflows through two continuation cycles; preserve fifteen preceding workflows, 18 native prism results and six unsupported prism controls. Qualify cone STEP parameter correspondence and finite-decimal encoding without confusing native slant-distance and exchange chart units. General Boolean closure, standalone expanded coordinate queries and release/resource gates remain open.'
status['next_actions'][1] = 'Use evidence/2026-10-17-cone-continuation/manifest.json as the current exact feature baseline. Preserve all 175 completed main cases and every current/historical adverse observation. '+cost+' Isolate proof costs before altering scheduling or caches. Supporting crate changes must preserve ownership; unrelated repairs remain with the concurrent upstream thread.'
status_path.write_text(json.dumps(status, indent=2)+'\n')
sys.path.insert(0, str(OUT.parent/'2026-10-16-upstream-format-integration'))
from ledger_spans import replace_brep
path = ROOT / 'docs/properties-status.json'
ledger = path.read_text()
entry = json.loads(ledger)['current_work']['hyperbrep']
entry.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)), latest_implementation=identity,
    latest_feature_evidence=str((OUT/'manifest.json').relative_to(ROOT)), qualification=validation+' '+cost+' '+limits)
path.write_text(replace_brep(ledger, entry))

review = OUT / 'review.md'
review_text = review.read_text()
assert review_text.startswith('# Proof review (qualification in progress)')
review_text = review_text.replace('# Proof review (qualification in progress)',
    '# Proof review and final scoped qualification', 1)
review.write_text(review_text + '\n## Final qualification\n\n' + validation + '\n\n' +
    cost + '\n\n' + limits + '\n\nEarlier candidate/pending descriptions above record the review at those checkpoints. '
    'The final [qualification](qualification-summary.json), [fixture migration](uncertainty-fixture-migration.json) '
    'and [retention decision](retention-decision.json) establish the scope now retained; they do not close the listed open gates.\n')
notes = OUT / 'analysis-notes.md'
notes.write_text(notes.read_text() + '\n## Final admission checkpoint\n\n' + validation + '\n\n' + cost +
    '\n\nThe final source is frozen through native, downstream, diagnostic and isolated cost qualification. '
    'The cone STEP follow-up remains a [feasibility investigation](future-cone-step.md). '
    'All failed prototypes and inherited failures remain in the evidence inventory.\n')
assert hashes() == source
print('published measured cone admission and BREP-owned status documents')
