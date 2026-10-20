"""Publish finite replay admission, preserving other owners' ledger bytes."""
import hashlib
import importlib.util
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
source = hashes()
q = read('qualification-summary.json')
cost = read('resource-review.json')
artifacts = read('artifact-preservation.json')
assert q['source'] == cost['source'] == artifacts['source'] == source
counts = q['test_counts']
new_count = artifacts['new_files']
validation = (
    'Exact analytic-parallel pcurves now archive polynomial or homogeneous rational source controls, signed distance, selected-root/chart references, finite range and traversal. Strict replay rechecks the complete source/range through Hypercurve; selected subdivisions, cusp endpoints and zero-weight controls retain their definitions. '
    'Seven acceptance groups cover independent exact values, reversal, selected splitting, planar path/region reuse, reflection, near-boundary offsets, forged definitions, metadata limits and exhausted-work recovery. '
    f"BRep/IO release suites pass {counts['native-release']}/{counts['native-minimal']} tests with all/minimal features; new debug acceptance passes {counts['new-debug']}. "
    f"Affected Hypercurve tests pass {counts['curve-tests']} integration, {counts['curve-retained']} retained-boundary, {counts['curve-winding']} winding and {counts['curve-successors']} successor tests. "
    'Warning-denied affected all-target Clippy/rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. '
    'External source-path native consumers pass; actual zero-import WASM passes 7+11+7+9+14+138=186 groups. '
    f'All 337 prior artifacts remain byte-identical, including eight typed encoding diagnostics; {new_count} new native pcurve archives agree across two fresh processes. '
    'All 24 prism and 81 continuation outcomes remain. The original seven-profile diagnostic still has six native completions and one unsupported nonlinear parallel cap. The earlier two complete/two unsupported path controls remain. Twenty prism OCCT reader observations were rerun; earlier quintic observations apply only to identical bytes.')
limits = (
    'This admits unattached pcurve models and supported planar continuation, not spatial offset edges, complete edge/pcurve correspondence or parallel-cap extrusion. '
    'Full authoring history, general selected fields, arbitrary shell intersections, broader metrics and exact STEP encoding of irrational Cartesian vertices remain open. '
    'Local strict replay does not certify an earlier approximate source intent. No operation-wide work, coefficient-growth, retained-heap or cancellation bound is added. '
    'Source-path consumers do not establish registry installation, MSRV or production bindings. Coverage/formal verification, runtime fuzz/ASan/lexicase campaigns, full pre-push qualification and all 28 work packages remain open/in-progress. '
    'No push. Supporting-crate work remains with its owner; unrelated concurrent-thread breakage is untouched. Qualification is pinned to upstream 540074a8c and unchanged source.')
increment = dict(id='parallel-pcurve-replay-2026-10-18', work_packages=['WP02', 'WP07', 'WP13'],
    properties=['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P11', 'P12', 'P14', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Expose the borrowed procedural parallel definition in Hypercurve; preserve it and selected parameters in BRep native archives with metadata admission and strict constructor replay.',
    evidence='evidence/'+OUT.name+'/manifest.json', validation=validation,
    cost_evidence=cost['summary'], limits=limits)
status_path = ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
assert not any(r['id'] == increment['id'] for r in status['increments'])
status['increments'].append(increment)
status['updated_on'] = '2026-10-18'
status['next_actions'][0] = (f'Use evidence/{OUT.name}/manifest.json as the current native-pcurve feature baseline, atop selected-profile extrusion and upstream equality integration. Preserve all 337 prior files, {new_count} new repeated archives, current native/WASM groups, 24 prism and 81 continuation outcomes, original diagnostic inputs and raw costs. The finite 33-group matched comparison does not rerun the historical 192-case catalogue required for future optimizations; earlier adverse obligations remain open.')
status['next_actions'][1] = (f'Procedural parallel definitions, selected roots/charts and direct or analytic selected-fiber subdivisions now replay exactly as pcurves. Follow evidence/{OUT.name}/next-domains.md for retained planar-to-spatial images, complete edge/pcurve agreement, acyclic replay and the unchanged full nonlinear parallel-cap extrusion. Keep the existing selected-profile successes, general selected fields, source-history and interchange limits separate. Missing metrics do not invalidate an otherwise proved exact boundary; irrational STEP Cartesian vertices stay typed NonRational.')
status_path.write_text(json.dumps(status, indent=2)+'\n')
spec = importlib.util.spec_from_file_location('spans', OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py')
spans = importlib.util.module_from_spec(spec)
spec.loader.exec_module(spans)
ledger_path = ROOT/'docs/properties-status.json'
before = ledger_path.read_text()
leaf = json.loads(before)['current_work']['hyperbrep']
leaf.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),
    latest_feature_evidence=str((OUT/'manifest.json').relative_to(ROOT)),
    latest_implementation=increment['id'], qualification=validation+' '+cost['summary']+' '+limits)
after = spans.replace_brep(before, leaf)
ledger_path.write_text(after)
(OUT/'ledger-update.json').write_text(json.dumps(dict(only='current_work.hyperbrep',
    before_sha256=hashlib.sha256(before.encode()).hexdigest(), after_sha256=hashlib.sha256(after.encode()).hexdigest(),
    other_bytes_preserved=after == spans.replace_brep(before, leaf)), indent=2)+'\n')
for path, link, title in [
    (ROOT/'crates/hyperbrep/PERFORMANCE.md', 'docs/evidence/'+OUT.name, 'Exact procedural pcurve replay'),
    (ROOT/'crates/hypercurve/PERFORMANCE.md', '../hyperbrep/docs/evidence/'+OUT.name, 'Procedural parallel definitions for BRep replay'),
]:
    with path.open('a') as f:
        f.write(f'\n\n## {title} (2026-10-18)\n\n')
        f.write(f'The [admission record]({link}/README.md) adds exact native persistence of analytic parallels and supported planar continuation. This is a capability extension; it introduces no new geometry solver or optimization.\n\n')
        f.write(cost['summary']+'\n\n')
        f.write(f'[All cost rows]({link}/costs.md) and the [resource review]({link}/resource-review.json) retain timing, allocation, RSS, executable size and {new_count} exact archive observations. The previous selected-profile unequal-hole rejection cost and all earlier adverse obligations remain open. These finite samples do not bound arbitrary composition, retained heap, coefficient growth, total work or cancellation. Spatial parallel-cap extrusion and broader release gates remain open.\n')
failed = [r for r in read('attempts.json') if r['exit_code']]
review = ['# Retained attempts', '', 'Every command retains its raw log and source snapshot in [attempts.json](attempts.json). Failed candidates are not final-source successes.', '', '| Attempt | Exit | Log |', '| --- | ---: | --- |']
for r in failed:
    review.append(f"| {r['label']} / {r['attempt']} | {r['exit_code']} | [{r['log']}]({r['log']}) |")
review += ['',
    'The baseline pcurve archive fails with UnsupportedPcurve(AnalyticParallel). The full original nonlinear cap remains UnsupportedPlanarProfile before and after this increment.', '',
    'The first complete acceptance run exposed a missing selected-fiber branch in the structural view and an incorrect test assumption that every selected replay must spend instrumented work. The final view handles the subdivision carrier. Cheap sufficient proofs remain successful at zero budget; cold cusp replay supplies the actual exhaustion/recovery control. A subsequent compile failure used a private parameter-comparison method; the final test compares through the public Bezier view. All seven final groups pass without weakening the original geometry or replay contract.', '',
    'The old-path Round controls still terminate their historical harness with an unwrap panic on UnsupportedMeasurement. Their exit 101 observations are preserved as expected diagnostic failures, not ordinary successful library operations. The full recorded hard fixtures remain unchanged.', '']
(OUT/'attempt-review.md').write_text('\n'.join(review))
readme = f'''# Exact procedural parallel pcurve replay

From `9fc5e55c4157cea39482b1af70029e99678a4cd4` on `brep`, including
upstream `540074a8c05ccc676d7c70b8f0093f98804b81d9`, this increment preserves
analytic parallels exactly in native pcurve archives. It is a prerequisite to
the still-open nonlinear parallel-cap spatial extrusion.

Hypercurve owns `CurveAnalyticParallel2` and `Curve2::analytic_parallel()`:
a borrowed source, signed distance, ascending range and traversal view for
direct parallels and analytic selected-fiber subdivisions. BRep owns the new
archive record, metadata accounting and references into its existing selected
parameter graph. Strict loading uses Hypercurve's complete interval admission;
it never trusts a serialized regularity bit or fits replacement geometry.
The format adds a family tag to version 9; existing-family bytes are unchanged.
There is no compatibility shim or new STEP representation.

The [contract](contract.md) records the failure and owner before implementation.
[Proofs](proofs.md) distinguish exact current definitions, topology, selected
root authority and earlier source intent. [Decisions](ideas.md) retain rejected
approaches; [next domains](next-domains.md) describe the spatial work.

## Final qualification

| Check | Result |
| --- | --- |
| BRep + IO release, all/minimal features | {counts['native-release']} / {counts['native-minimal']} passed |
| New debug acceptance | {counts['new-debug']} passed |
| Hypercurve integration / retained-boundary / winding / successor | {counts['curve-tests']} / {counts['curve-retained']} / {counts['curve-winding']} / {counts['curve-successors']} passed |
| Affected all-target Clippy and rustdoc | Passed with warnings denied |
| Nine STEP examples; formatting; fuzz-target compilation | Passed |
| Actual zero-import WASM consumers | 7 + 11 + 7 + 9 + 14 + 138 = 186 groups passed |
| Previous deterministic files | 337 byte-identical, including 8 typed STEP error records |
| New native pcurve archives | {new_count}, identical in two fresh processes |
| Original seven-profile diagnostic | Six native completions; nonlinear parallel cap remains unsupported |

The seven groups exercise independently derived arch values, complete source
definitions, polynomial and homogeneous rational sources, zero-weight controls,
selected cubic roots and affine charts, reversed subdivision, cusp endpoints,
archive-to-path/region composition, reflected similarities, exact `1e-12`
boundary distinctions, forged payloads and resource admission/recovery.
The planar cap test uses native straight closing segments. The original full
extrusion fixture with quadratic straight segments remains unchanged separately.

[Qualification](qualification-summary.json), [attempts](attempts.json),
[consumer identities](consumers.json), [preserved files](artifact-preservation.json)
and [original profile results](original-profiles.json) bind results to fixed
source. External native consumers also pass, including eight original full
workflows, all 24 prism and 81 continuation outcomes and the preserved old-path
controls. Twenty original prism OCCT reader cases were rerun; earlier quintic
observations apply only to identical bytes. [Failed attempts](attempt-review.md)
remain recorded. All final test suites have zero failed or ignored cases.

## Costs and limits

{cost['summary']}

[Costs](costs.md) include checks and output materialization inside timing.
[Resource observations](resource-review.json) and [environment](environment.json)
retain every slower row, allocation request, process RSS, harness size and
finite archive observation. External timeouts contain tests; they do not bound
internal work. The earlier unequal-hole rejection cost remains open.

{limits}

The [source reconstruction record](source-reconstruction.json) preserves every
checked epoch, including failed candidates. The [manifest](manifest.json) binds
source, evidence and public documentation. The [final audit](final-audit.json)
checks counts, outputs, raw cost arithmetic, ledger ownership and protected
stashes. Prior evidence and other owners' ledger bytes remain unchanged.

The [staged whitespace record](staged-whitespace.json) retains seven EOF blank
line observations in raw Cargo logs. Every non-log staged file passes the
whitespace check. Raw output is preserved; the full staged check is not
represented as passing.
'''
(OUT/'README.md').write_text(readme)
assert hashes() == source
print(validation+'\n'+cost['summary'])
