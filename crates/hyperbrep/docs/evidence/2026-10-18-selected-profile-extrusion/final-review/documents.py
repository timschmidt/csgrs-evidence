"""Publish the finite admission record and update only BRep's root-ledger leaf."""
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
assert q['source'] == cost['source'] == source
cost['summary'] += ' The unequal_holes expected-rejection group rises from 2.696819 to 3.301229 ms (1.224120 ratio), with allocation calls 9123 to 11483; this adverse cost remains an explicit open obligation, not a speedup claim.'
counts = q['test_counts']
validation = (
    f"Original parabola difference/XOR and orientation-reversing affine profiles now complete exact native extrusion, area/volume, all planar construction front doors, holes/disconnected material, splitting, cold replay, repeated supported slab cuts/restoration and empty identities. "
    f"Independent polynomial/weighted-quotient identities, selected-root cache preservation, near-boundary offsets, a determinant -12 spatial map, corrupted archives and typed STEP NonRational controls are retained. "
    f"BRep/IO release suites pass {counts['native-release']}/{counts['native-minimal']} tests with all/minimal features; new debug acceptance passes {counts['new-debug']}. "
    f"Affected Hypercurve tests pass {counts['curve-tests']} integration, {counts['curve-retained']} retained-boundary, {counts['curve-winding']} winding and {counts['curve-successors']} successor tests. "
    "Warning-denied all-target Clippy/rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. "
    "After a fixture-only duplicate-module correction, all eleven debug groups, the IO case in both release configurations and affected all-target Clippy were rechecked; unchanged production checks are explicitly reused with source-delta evidence. "
    "Source-path native consumers and real zero-import WASM preserve the preceding groups and add eleven (179 total WASM groups). "
    "All 289 prior native/STEP artifacts remain byte-identical; forty new native archives and eight typed encoding diagnostics agree across two fresh processes. "
    "Original 24 prism and 81 continuation outcomes remain. The unchanged seven-profile diagnostic advances from two native/five unsupported to six native/one unsupported; the nonlinear parallel cap remains. "
    "The older two complete/two unsupported path controls remain. Eight prior quintic OCCT observations apply only to identical bytes; twenty older prism reader cases were rerun.")
limits = (
    "Exact image publication is separate from simplicity, earlier source qualification and a complete persistent authoring graph. "
    "General selected fields, nonlinear parallel spatial carriers, arbitrary shell intersections, broader metrics and exact STEP encoding of irrational Cartesian vertices remain open. "
    "No new operation-wide work, coefficient-growth, heap or cancellation bound is established. "
    "Source-path consumers do not establish registry installation, MSRV or production binding delivery; shared workspace test fixtures also remain part of the delivery work. "
    "Complete coverage/formal verification, runtime fuzz/ASan/lexicase campaigns, full pre-push validation and all 28 work packages remain open/in-progress. "
    "No push. Supporting-crate changes retain their ownership; unrelated concurrent-thread work is untouched. The integrated upstream baseline is 540074a8c; qualification stayed source-fixed.")
increment = dict(id='selected-profile-extrusion-2026-10-18', work_packages=['WP02', 'WP07', 'WP08', 'WP12', 'WP13'],
    properties=['P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P10', 'P11', 'P12', 'P13', 'P14', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P38', 'P39'],
    change='Share exact native Bezier restriction images and retained integrals in Hypercurve; lift them through BREP and complete disjoint-material product continuation with exact planar proofs.',
    evidence='evidence/'+OUT.name+'/manifest.json', validation=validation, cost_evidence=cost['summary'], limits=limits)
status_path = ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
assert not any(row['id'] == increment['id'] for row in status['increments'])
status['increments'].append(increment)
status['updated_on'] = '2026-10-18'
status['next_actions'][0] = ('Use evidence/'+OUT.name+'/manifest.json as the current selected-profile feature baseline, atop upstream-equality-integration. Preserve all 289 prior artifacts and 48 new repeated artifacts, all current native/WASM groups, 24 prism and 81 continuation outcomes, original diagnostic inputs and historical costs. The finite 22-group matched comparison does not rerun the full 192-case catalogue required for future optimizations.')
status['next_actions'][1] = ('The original selected parabola difference/XOR and affine profiles now complete exact native extrusion, area/volume, replay, edits, holes/components and repeated supported slab operations. Follow evidence/'+OUT.name+'/next-domains.md for the unchanged nonlinear parallel cap, general selected fields, exact retained spatial carriers, complete source-history persistence and conforming interchange. Irrational STEP Cartesian vertices stay typed NonRational. Root authority, topology, measure availability and format encodability are separate contracts.')
status['acceptance_contract']['latest_integration'] = 'evidence/2026-10-18-equality-upstream-integration/README.md'
status['acceptance_contract']['upstream_revision'] = '540074a8c05ccc676d7c70b8f0093f98804b81d9'
status_path.write_text(json.dumps(status, indent=2)+'\n')
helper = OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec = importlib.util.spec_from_file_location('spans', helper)
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
    (ROOT/'crates/hyperbrep/PERFORMANCE.md', 'docs/evidence/'+OUT.name, 'Selected-profile native extrusion'),
    (ROOT/'crates/hypercurve/PERFORMANCE.md', '../hyperbrep/docs/evidence/'+OUT.name, 'Exact retained Bezier images for BRep'),
]:
    with path.open('a') as output:
        output.write(f'\n\n## {title} (2026-10-18)\n\n')
        output.write(f'The [admission record]({link}/README.md) extends exact completion through native subcurve images and supported product-solid continuation. This is a capability extension, not an optimization.\n\n')
        output.write(cost['summary']+'\n\n')
        output.write(f'The [adverse review]({link}/adverse-review.md) explains the retained rejection cost and the separate proof-search experiment required before any optimization.\n\n')
        output.write(f'[Every cost row]({link}/costs.md) and the [resource review]({link}/resource-review.json) retain slower observations, allocation requests, process RSS, executable sizes and forty exact archive states. New completed workflows have absolute costs only. Prior rejected ideas and adverse cost obligations remain attached to their original revisions. Allocation requests, archive nesting and process RSS do not bound retained heap, coefficient growth, total work or cancellation. All distribution and broader work-package gates remain open.\n')

attempts = read('attempts.json')
failed = [row for row in attempts if row['exit_code']]
review = ['# Retained attempts', '', 'Every attempt keeps its raw log and source snapshot in [attempts.json](attempts.json). Earlier failures establish the missing capability or describe candidate/test/harness corrections; they are not final-source successes.', '', '| Attempt | Exit | Raw evidence |', '| --- | ---: | --- |']
for row in failed:
    review.append(f"| {row['label']} / {row['attempt']} | {row['exit_code']} | [{row['log']}]({row['log']}) |")
review += ['', 'The public baseline fails with `UnsupportedPlanarProfile`. Initial test compile failures concern private root-cache access and an IO fixture importing unrelated serde-json test bodies; the final fixtures use public queries and a shared source recipe. The original XOR partial-height subtraction and following reconstruction reproduce missing product-set continuation, then pass with the complete planar proofs. The first native-image candidate lacked the source-restriction carrier path; the retained image tests now cover it explicitly.', '',
           'The combined consumer also exposed duplicate loading of the shared fixture under warning-denied Clippy. The IO acceptance function now receives the original profile/replay functions from its caller. [Harness requalification](harness-requalification.json) records the three changed test/consumer files, identical acceptance body and unchanged production. All eleven debug groups, both release IO variants and affected all-target lint were rerun. The full earlier production qualification is reused explicitly, not relabeled as a fresh full-suite execution.', '',
           'One consumer Clippy attempt was interrupted with observed exit 130 before the sequential journal could finish its row. [The interruption record](harness-interruption.json) preserves the command, raw output, source identity and missing elapsed duration. It was rerun after qualification; no success is attributed to the interrupted attempt. Original unsupported nonlinear-offset and irrational-STEP controls remain failures by their declared typed contracts.', '']
(OUT/'attempt-review.md').write_text('\n'.join(review))
readme = f'''# Exact selected-profile extrusion

This increment starts from `5de11cdf22322b326fb995e72b6267d18be20373` on `brep`,
including upstream `540074a8c05ccc676d7c70b8f0093f98804b81d9`. It admits the
original selected parabola difference/XOR and affine profiles through exact
native extrusion, replay, editing and repeated supported slab composition.
It does not claim general retained spatial carriers or complete CAD coverage.

The [contract](contract.md) records ownership and reproduced failures before
the fixes. [Proofs](proofs.md), [research](research.md), and [decisions](ideas.md)
separate complete native images, selected-root authority, topology, source
history and format encodability. [Remaining domains](next-domains.md) keep
the unchanged nonlinear parallel cap and broader work explicit.

## API and exact acceptance

Hypercurve adds `CurveNativeImage2` and `Curve2::native_image()`. It borrows
native geometry, preserves existing line/arc traversal proofs, or substitutes
one retained Bezier span exactly when its endpoints have represented views.
Quadratic selected roots replay their polynomial and isolator without changing
their original scalar caches. Native subcurve images are shared with retained
area integration. HyperBRep consumes them through existing whole-boundary
validation. Its interval continuation uses complete planar intersection and
component proofs; empty intersection alone does not justify an unstitched union.

The original parabola has `x=4t-2`, `y=x²`, selected roots of `8t²-8t+1` and
native subcurve controls `(-sqrt(2),2),(0,-2),(sqrt(2),2)`. Independent areas are
`8sqrt(2)/3` for difference and `22/3+16sqrt(2)/3` for XOR. The tests retain
all original geometry, reversed/affine variants, exact `1e-12` offsets,
holes/disconnected components, two further cut/restoration cycles, empty
identities, shared faces, tiny positive overlaps and damaged archive rejection.
Independent nonmonotone quartic and weighted cubic identities prevent an
endpoint-only image claim. Higher-degree unavailable endpoint views remain typed.
STEP rejects the selected profiles' irrational Cartesian vertices as
`NonRational`; the eight new text files record errors, not successful STEP.

## Final source qualification

| Check | Result |
| --- | --- |
| BRep + IO all-feature / minimal release | {counts['native-release']} / {counts['native-minimal']} passed; none failed or ignored |
| New debug acceptance | {counts['new-debug']} passed |
| Hypercurve integration / retained-boundary / winding / successor | {counts['curve-tests']} / {counts['curve-retained']} / {counts['curve-winding']} / {counts['curve-successors']} passed |
| Affected all-target Clippy and rustdoc | Passed with warnings denied |
| Nine STEP examples; formatting; fuzz-target compilation | Passed; no fuzz campaign claimed |
| Source-path native consumers | New 11, previous 7/9/14 groups, eight original full workflows and retained controls passed |
| Real zero-import WASM | 11 + 7 + 9 + 14 + 138 = 179 groups passed |
| Previous deterministic artifacts | All 289 byte-identical |
| New deterministic artifacts | 40 native archives and 8 typed encoding diagnostics agree across two fresh processes |
| Original retained-profile diagnostic | 6 native completions, 1 unsupported nonlinear parallel cap |

[Qualification](qualification-summary.json), [commands and attempts](attempts.json),
[consumer identities](consumers.json), [original profile results](original-profiles.json),
[new/recent artifacts](artifacts.json) and [older artifacts](artifact-comparison.json)
bind these results to the frozen source. The original 24 prism and 81 continuation
outcomes remain, with twenty prism OCCT reader cases rerun. Eight previous
quintic reader observations apply only to identical current bytes. The original
two complete/two unsupported path controls remain. [Retained failures](attempt-review.md)
include unsuccessful candidates and the interrupted/repeated harness check.
After fixing duplicate fixture loading in the combined consumer, the same IO
acceptance body takes its original profile/replay functions as parameters.
[Harness requalification](harness-requalification.json) records the three
test/consumer-only changes, rerun debug/release/lint checks, and explicit reuse
of the full unchanged-production qualification. The earlier checks keep their
original source snapshots; they are not represented as a fresh full-suite run.

## Costs and open gates

{cost['summary']}

[All observations](costs.md) include full checked operations and materialization
inside timing, one warmup and three measured repetitions per process. No task
build/test overlaps timing. [Resources](resource-review.json) and
[environment](environment.json) retain allocator requests, process RSS, archive
nesting/limbs, sizes, toolchain and hardware. [Storage identity](storage-identity.json)
checks the actual source/target/cache filesystems; it is not a whole-history audit.
External process timeouts provide containment, not an internal resource bound.
The [adverse review](adverse-review.md) records why the completeness extension
is retained while keeping the unequal-hole rejection cost explicitly open.

{limits}

[Source reconstruction](source-reconstruction.json) retains every checked epoch,
including failed candidates. The [manifest](manifest.json) binds evidence and
documentation; the [audit](audit.json) checks reconstruction, outputs, consumers,
cost records, ledger ownership and protected stashes. No earlier evidence is
rewritten and no compatibility shim is added.

The [staged whitespace record](staged-whitespace.json) retains eleven EOF
blank-line observations in raw Cargo logs. Code, fixtures, data and documentation
pass their separate non-log check. Raw output is unchanged; the full staged
whitespace check is not represented as passing.
'''
(OUT/'README.md').write_text(readme)
assert hashes() == source
print(validation+'\n'+cost['summary'])
