"""Update only BREP-owned status after the merged consumers are qualified."""
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[4]
read=lambda name:json.loads((OUT/name).read_text())
q=read('qualification-summary.json')
cost=read('resource-observations.json')
baseline=read('baseline.json')
validation=(
    f"Merged-source native/IO release suites pass {q['tests']['native-release']['passed']} all-feature "
    f"and {q['tests']['native-minimal']['passed']} minimal-feature tests. Hypercurve's all-feature "
    f"library and two upstream stroke targets pass {q['tests']['curve-release']['passed']} tests "
    f"with {q['tests']['curve-release']['ignored']} existing ignores; the ten new stroke controls "
    'also pass in debug. Both native all-target Clippy configurations, the stroke/consumer lints, '
    'warning-denied rustdoc, eight STEP examples, fuzz-target compilation and Cargo formatting '
    'pass. The warning-denied standalone WASM build executes all 111 groups with zero imports. '
    'All 81 preceding native diagnostic outcomes and 71 original STEP artifacts are preserved. '
    'Optional OCCT readers pass their independent topology/measure expectations. '
    'The new four-case stroke-path consumer completes two butt workflows with four byte-identical '
    'STEP/native artifacts; both round workflows retain Geometry(UnsupportedMeasurement) on both '
    'revisions. Its original all-cases-success contract remains failed. The inherited zero-factor '
    'debug failure is reproduced in both scalar feature configurations and left with its owner.'
)
resource=(
    'Three fresh processes per phase and original stroke case preserve all outcomes and completed '
    'artifacts. The two successful workflows have complete-process timing/RSS observations; '
    'the two unsupported workflows have no successful-work ratio. All raw samples and executable '
    f"sizes remain recorded ({cost['binaries']['baseline']['bytes']} baseline and "
    f"{cost['binaries']['candidate']['bytes']} candidate bytes). These shared-host observations "
    'do not establish a speedup, retained-heap bound, allocation count or shipped-package size. '
    'The preceding 176-case cone campaign and 196-case dependency campaign remain historical '
    'evidence on their pinned source, including every adverse timing/allocation observation.'
)
completed=[row for row in cost['summaries'] if row['completed']]
resource+=' Completed-case observations: '+ '; '.join(
    f"{row['case']} {row['medians']['baseline']['wall_seconds']*1000:.3f} to "
    f"{row['medians']['candidate']['wall_seconds']*1000:.3f} ms "
    f"(ratio {row['wall_ratio']:.6f}), RSS "
    f"{row['medians']['baseline']['maximum_rss_kib']} to "
    f"{row['medians']['candidate']['maximum_rss_kib']} KiB"
    for row in completed)+'.'
limits=(
    'This merge adds no BREP runtime algorithm and does not admit the unsupported round-cap path '
    'measurement workflow. A public normalized-region extrusion entry point is separate future '
    'work; preserve the general rational-path blocker while qualifying that extension. General '
    'Boolean/analytic exchange closure, whole-operation work/heap/cancellation bounds, package/MSRV '
    'and actual C/Python/JavaScript delivery, formal proofs, coverage, runtime fuzz/ASan/lexicase, '
    'release and the full pre-push matrix remain open. All 28 work packages remain open or in '
    'progress. No push is part of this checkpoint.'
)
summary='''# Upstream stroke and containment integration

Merge upstream `be2a0c37bfe57799c62a36125a5cb883a5458f00` into `brep` after
the conical STEP commit `8b9e0bdc8ba85a0985d7e6734bfe259a177f902c`.
The source merge is automatic. The only conflict is the shared property ledger;
all unrelated upstream bytes are preserved while the BREP entry is updated.
Normative agent, property and admission rules remain identical to both parents.

Hypercurve owns the new exact line-stroke construction. The integration keeps
native BREP and STEP source unchanged, preserves upstream's mesh/facade and
circuit corrections, and requalifies the affected BREP consumers. Supporting
crate changes remain allowed when a BREP feature needs them; unrelated repairs
remain with the concurrent thread. Rejected circle-support indexing trials
remain evidence and are not retained runtime optimizations.

'''+validation+'\n\n'+resource+'''

## Preserved incomplete workflow

The independent consumer uses the original (0,0)-(3,4) line, half-width 1,
height 3, both traversal directions and butt/round caps. Exact expected volumes
are 30 and 30+3*pi; exact total boundary areas are 62 and 50+8*pi. Both butt
cases continue through translation, cold replay, STEP reimport, coincident
Booleans, empty subtraction and recovery. Both round cases stop at the existing
rational-Bézier extrusion-face area blocker. The consumer's unwrap asserts on
the typed native result; the native kernel does not panic.

The first combined run stopped at the first round case. Its source, binary and
log remain. The case selector changes execution isolation only; it preserves
all inputs and assertions and exposes the second round outcome. The candidate
driver retains its all-cases-success assertion and fails. No fixture, policy,
resolution or expected measurement was weakened for this integration.

The next BREP increment can expose the existing normalized-region extrusion
authority through the model-owning API, retaining certified native circles
and the original component proof. It needs independent acceptance; that route
does not establish measurement of arbitrary rational extrusion surfaces.

## Evidence

- [Prospective contract](contract.md), [review and next-domain obligations](review.md),
  [idea disposition](idea-ledger.json) and [all command attempts](attempts.json).
- [Qualification](qualification-summary.json), [four-case baseline](baseline-consumer-outcomes.json),
  [four-case merged result](candidate-consumer-outcomes.json), [diagnostic source](final-review/frontier.rs)
  and [cold failing model](round-stroke.json).
- [81-slot inventory](continuation-frontier.json), [61 preceding artifacts](preserved-artifacts.json),
  [ten cone artifacts](preserved-cone-artifacts.json) and [four stroke artifacts](consumer-artifact-comparison.json).
- [Resource observations](resource-observations.json), [cache cleanup](cache-cleanup.json),
  [sampler correction](resource-harness-correction.json),
  [ledger preservation](ledger-update.json), [source reconstruction](source-reconstruction.json),
  [manifest](manifest.json) and [audit](audit.json).

Run `final-review/qualify.py` followed by `final-review/supplement.py` against
the recorded merged source. The latter preserves full continuation inputs,
executes optional floating-point readers, reproduces inherited failures, and
runs resource observations after other task work stops. Temporary source-path
projects and optional Python tooling require local setup; they do not establish
installation from a published package. The source archive reconstructs every
recorded attempt, including the original failed consumer.

The first resource sampler could not launch the absent `/usr/bin/time`; no
native workload ran in that failed sample. Its recipe and raw failures remain.
`final-review/resume_supplement.py` preserves the already completed geometry
checks and reruns only the sampler using per-child Linux `wait4` accounting.
The native binaries, inputs, assertions and artifact comparisons are unchanged.

## Remaining scope

'''+limits+'\n'
(OUT/'README.md').write_text(summary)
(OUT/'retention-decision.json').write_text(json.dumps(dict(decision='kept',
    reason='Integrates upstream corrections while preserving all preceding completed BREP consumers and the new original typed blockers. No unsupported result is counted as successful completion.',
    validation=validation,cost_evidence=resource,limits=limits),indent=2)+'\n')
(OUT/'idea-ledger.json').write_text(json.dumps([
    dict(idea='Merge the pinned upstream corrections and qualify affected BREP consumers',decision='kept',evidence='qualification-summary.json'),
    dict(idea='Retain the native single-line stroke authority in Hypercurve',decision='already-satisfied',evidence='Upstream source is preserved; this integration introduces no duplicate curve algorithm.'),
    dict(idea='Treat fast failure of the round-path measurement workflow as successful extrusion acceptance',decision='rejected',evidence='Both original round workflows return Geometry(UnsupportedMeasurement); candidate all-success assertion remains failed.'),
    dict(idea='Fit rational circle spans or duplicate native arc recognition in BREP IO',decision='rejected',evidence='The next public region route must reuse the existing certified native view and retained component proof.'),
    dict(idea='Promote rejected upstream circle indexes or repair unrelated workspace failures in this merge',decision='rejected',evidence='No BREP feature requires those changes; upstream evidence and concurrent ownership are preserved.'),
    dict(idea='Claim a merge-wide speedup from the short consumer probe or old cone campaign',decision='rejected',evidence='resource-observations.json; all preceding cone/dependency costs remain pinned to their original source.')
],indent=2)+'\n')
status=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
ledger=json.loads(status.read_text())
identity='stroke-upstream-integration-2026-10-17'
assert all(row['id']!=identity for row in ledger['increments'])
ledger['increments'].append(dict(id=identity,work_packages=['WP00','WP08','WP14a','WP21','WP23'],
    properties=['P1','P6','P11','P12','P15','P17','P18','P19','P20','P24','P25','P26','P27','P35','P36','P37','P39'],
    change='Merge upstream be2a0c37b, preserve both histories and all unrelated ledger bytes, and requalify unchanged BREP/STEP consumers against the new curve dependency.',
    evidence='evidence/2026-10-17-stroke-upstream-integration/manifest.json',validation=validation,cost_evidence=resource,limits=limits))
ledger['next_actions'][0]=('Expose strict normalized CurveRegion2 extrusion through the ordinary model-owning builder, reusing the existing native component/line-arc proof. Reproduce the missing public API first; qualify original butt/round strokes, holes, disconnected/empty material, invalid heights, certainty, cold replay, STEP, continued Booleans and resource observations. Preserve the existing rational-path measurement blockers separately.')
ledger['next_actions'][1]=('Use the stroke-upstream-integration record for the merged be2a0c37b source and the cone-exchange record for the latest geometry/STEP feature. Preserve 81 native diagnostic outcomes, 71 preceding STEP artifacts, all conical subdivisions and failure controls, and the 176 main/196 dependency benchmark contracts. New source requires fresh applicable evidence; historical timings do not qualify later merges. Supporting crate work is allowed when needed for BREP features; leave unrelated repairs to their owner.')
assert len(ledger['work_packages'])==28 and not ledger['complete']
assert all(row['status'] in ['open','in-progress'] for row in ledger['work_packages'])
status.write_text(json.dumps(ledger,indent=2)+'\n')

helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('ledger_spans',helper)
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
path=ROOT/'docs/properties-status.json'
before=path.read_text()
brep=json.loads(before)['current_work']['hyperbrep']
brep.update(latest_evidence='crates/hyperbrep/docs/evidence/2026-10-17-stroke-upstream-integration/manifest.json',
    upstream_revision=baseline['upstream'],latest_integration_evidence='crates/hyperbrep/docs/evidence/2026-10-17-stroke-upstream-integration/README.md',
    latest_implementation='conical-line-step-exchange-2026-10-17',
    latest_feature_evidence='crates/hyperbrep/docs/evidence/2026-10-17-cone-exchange/manifest.json',
    qualification=validation+' '+resource+' '+limits)
brep['implementation_ownership']['surrounding_crates']=('Concurrent upstream development in another thread. Changes needed to implement BREP features or preserve their correctness, evidence, supported behavior or resources are allowed in the owning crate, with affected consumer qualification. Do not pursue unrelated breakage already owned by that thread.')
upstream=subprocess.check_output(['git','show',baseline['upstream']+':docs/properties-status.json'],cwd=ROOT,text=True)
after=module.replace_brep(upstream,brep)
path.write_text(after)
for content in [before,after]:
    parsed=json.loads(content);parsed['current_work'].pop('hyperbrep')
    upstream_value=json.loads(upstream);upstream_value['current_work'].pop('hyperbrep',None)
    assert parsed==upstream_value
# replace_brep itself asserts byte preservation on both sides of the edited span.
assert after==module.replace_brep(upstream,json.loads(after)['current_work']['hyperbrep'])
sha=lambda text:hashlib.sha256(text.encode()).hexdigest()
(OUT/'ledger-update.json').write_text(json.dumps(dict(upstream=baseline['upstream'],
    upstream_sha256=sha(upstream),before_sha256=sha(before),after_sha256=sha(after),
    helper=str(helper.relative_to(ROOT)),helper_sha256=hashlib.sha256(helper.read_bytes()).hexdigest(),
    unrelated_upstream_values_preserved=True,unrelated_upstream_bytes_preserved=True),indent=2)+'\n')
print(validation,flush=True)
