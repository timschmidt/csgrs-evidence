"""Publish a reproduced diagnostic frontier without claiming a feature."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
write = lambda name, data: (OUT/name).write_text(json.dumps(data, indent=2)+'\n')
baseline = read('baseline.json')
source = hashes()
assert source == baseline['source'] == read('reproduction.json')['source']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == baseline['revision']
attempts = read('attempts.json')
assert len(attempts) == 10 and all(row['exit_code'] == 0 and row['source_unchanged'] for row in attempts)
assert {row['label'] for row in attempts} >= {'baseline-build', 'probe-clippy', 'probe-format'}
rows = []
for row in read('reproduction.json')['cases']:
    log = (OUT/row['log']).read_text()
    assert row['exit_code'] == 0 and row['resources']['exit_code'] == 0
    assert 'area_certainty=Certified' in log and 'extrusion_certainty=Certified' in log
    error = re.search(r'^extrusion_error=(.*)$', log, re.M)
    item = dict(case=row['case'], log=row['log'], area='available' if 'area=available' in log else 'unsupported',
        construction='unsupported' if error else 'native_result',
        local_decision_certainty='Certified',
        curves=[line for line in log.splitlines() if line.startswith('curve=')])
    if error:
        item['error'] = error.group(1)
        assert item['error'] == 'UnsupportedPlanarProfile'
    else:
        assert row['case'] == 'parallel_square'
        assert 'independent_area=Decided { value: Equal, certainty: Exact, stage: Exact }' in log
        assert 'independent_volume=Decided { value: Equal, certainty: Exact, stage: Exact }' in log
        assert 'archive_bytes=33834' in log and 'cold_replay=identical' in log
        item.update(bodies=1, independent_area='16', independent_volume='48', cold_replay='byte-identical')
    rows.append(item)
assert len(rows) == 7
assert sum(row['construction'] == 'unsupported' for row in rows) == 6
assert {row['case'] for row in rows if row['area'] == 'available'} == {'uncut', 'parallel_square'}
write('frontier.json', dict(source=source, rows=rows, counts=dict(native_result=1, unsupported=6),
    scope='Diagnostic construction frontier. One native control has exact area/volume and cold replay; no new runtime capability, full modeling workflow, STEP, benchmark or release admission.'))

(OUT/'README.md').write_text('''# Retained profile extrusion frontier

Reproduced on `b89c43cd16081ca7049654e2c763e4cb3e8790b9` after a fresh
upstream fetch confirmed `7ed43501755fd64a01f54c3078d12229cbc0129d`.
Production source and dependency locks are unchanged. The
[contract](contract.md) fixes the original geometry, independent formulas,
ownership and missing acceptance workflow before implementation.

| Original recipe | Exact area available | BREP extrusion | Cold replay |
| --- | --- | --- | --- |
| Uncut parabola and closing line | Yes, `32/3` | `UnsupportedPlanarProfile` | Unreachable |
| Parabola minus rectangle | No | `UnsupportedPlanarProfile` | Unreachable |
| Parabola XOR rectangle | No | `UnsupportedPlanarProfile` | Unreachable |
| Affine image of difference | No | `UnsupportedPlanarProfile` | Unreachable |
| Affine image of XOR | No | `UnsupportedPlanarProfile` | Unreachable |
| Zero-offset analytic square | Yes, `16` | One body; exact volume `48` | 33,834 bytes, identical |
| Nonzero quadratic parallel cap | No | `UnsupportedPlanarProfile` | Unreachable |

The [frontier](frontier.json) and [seven original logs](reproduction.json)
retain every result. Local curve decision receipts are `Certified`, including
the error paths; that does not turn unsupported extrusion into successful
geometry. The four Boolean/affine variants pass the original independent
inside, outside and boundary classifications before the BREP call. The square
control proves an already-supported case, not newly implemented capability.
All seven processes exit successfully because the diagnostic records typed
errors intentionally. Construction succeeds in one case, not seven.

The uncut profile narrows the first implementation target. Its parabola is
native, its area has an independently verified exact value, and its closing
line retains an algebraic-chord carrier with represented endpoints.
`construction::persistent_extrusion_curves` rejects a missing native geometry
view. The whole-region line/arc view cannot handle the mixed parabola boundary.
The analytic square already uses that shared whole-region proof successfully.

The first candidate should reuse a complete native-image proof from Hypercurve
for each eligible retained boundary while preserving the authoritative source
and parameter mapping. Put that proof and any reusable view in the curve owner;
spatial lifting, topology, persistence and continued solid operations belong
to BREP. Do not infer a whole curve from endpoint coordinates or a family tag,
and do not expose raw internal fragments merely to duplicate the proof in BREP.
Public API shape must follow the demonstrated certificate and its downstream
needs. Existing native parameters and selected-source machinery should be
evaluated before adding a generic spatial carrier.

The four clipped variants retain endpoints without independent coordinates and
currently have no representable area result. The nonzero analytic parallel
also lacks the required curve/measurement route. Those are separate subsequent
domains: retain source/root identity and exact whole-image evidence, then
qualify measurement, extrusion, cold replay and further composition together.
Do not resolve them by dropping the integral check, fitting, chord sampling,
coordinate rounding or returning an incomplete solid.

The external source-path probe builds with its retained offline lock, passes
warning-denied all-target Clippy and rustfmt, and completes all seven original
diagnostics under separate 300-second time containment. [Commands](attempts.json),
[setup](setup.json), [source/fixture identity](baseline.json),
[frozen executable](baseline-binary.json), [source reconstruction](source-reconstruction.json),
[manifest](manifest.json) and [audit](audit.json) retain the evidence.
Process wall/CPU/RSS samples are containment observations, not matched
benchmarks or production resource bounds. This probe does not test continued
solid modeling, STEP exchange, source-provenance persistence, actual bindings,
installed packages or general curve support. It changes no runtime code and
closes no work package. The preceding complete feature/cost qualification
remains the baseline for a future implementation. No push.
''')

status_path = ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
identity = 'retained-region-extrusion-frontier-2026-10-17'
assert not any(row['id'] == identity for row in status['increments'])
relative = 'evidence/'+OUT.name
status['increments'].append(dict(id=identity, kind='diagnostic',
    work_packages=['WP00', 'WP02', 'WP03', 'WP06', 'WP08', 'WP21'],
    properties=['P1', 'P6', 'P8', 'P9', 'P11', 'P12', 'P15', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P26', 'P35', 'P36', 'P37', 'P39'],
    change='Reproduce the normalized retained-profile extrusion frontier on the committed prism-admission baseline; no runtime change.',
    evidence=relative+'/manifest.json',
    validation='Seven original recipe diagnostics: six UnsupportedPlanarProfile outcomes, one already-supported analytic-square extrusion with independently exact area 16/volume 48 and byte-identical cold replay. Original Boolean/affine classification assertions pass. External source-path release build, warning-denied all-target Clippy and rustfmt pass.',
    limits='This is a diagnostic frontier, not seven successful workflows, a capability extension, matched benchmark, continued-modeling/STEP/source-provenance proof or package admission. Production source/dependencies remain unchanged; all work packages stay open.'))
status['next_actions'].insert(1,
    'Use '+relative+'/manifest.json for the current retained-region extrusion blocker. '
    'The uncut mixed parabola/retained-line region has exact area but fails UnsupportedPlanarProfile; '
    'four original algebraic Boolean/affine variants and a curved analytic parallel also fail. '
    'The analytic-square control already succeeds. First investigate a shared whole-image proof/view '
    'in Hypercurve for eligible retained boundaries, consumed by BREP without losing source/parameter '
    'identity; qualify complete spatial topology, cold persistence and continued modeling. Keep the '
    'selected-parameter measurement and general analytic domains separate, with original full inputs '
    'and explicit blockers. Do not reconstruct a curve from endpoints or duplicate the curve kernel.')
status_path.write_text(json.dumps(status, indent=2)+'\n')
plan_path = ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
plan = plan_path.read_text()
needle = 'The retained diagonal STEP case also has a\n'
assert needle in plan
plan_path.write_text(plan.replace(needle, '''The [retained-region extrusion diagnostic](evidence/2026-10-17-retained-region-extrusion/README.md)
reproduces the next cross-layer boundary on the committed cost baseline.
Even an uncut mixed parabola/retained-line profile has exact area but fails
spatial promotion; the analytic-square control already succeeds. Reuse native
whole-image proof in the curve owner, retain source/parameter identity, and
admit BREP topology, cold replay and continued modeling together. General
selected-parameter measurement and analytic parallel extrusion are subsequent
domains, not reasons to weaken the current proof or input corpus.

'''+needle, 1))
assert hashes() == source
print('Recorded seven diagnostic outcomes without changing runtime source.', flush=True)
