"""Publish a retained, fully reviewed BREP conic comparison experiment."""
import json
from pathlib import Path

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-conic-comparison-reuse'
m = json.loads((OUT / 'manifest.json').read_text())
b = json.loads((OUT / 'benchmark-summary.json').read_text())
assert m['decision'] == 'kept' and m['retention_rationale']

path = ROOT / 'crates/hyperbrep/docs/ARCHITECTURE.md'
text = path.read_text()
anchor = '''Stored endpoints are reused on certified equality. Enumeration does not grow
with the chart's turn count; scalar quotient and coefficient costs retain their
existing resource limitations.'''
addition = '''

The helper computes strict orderings against the interval start and end once
for each candidate parameter. That same pair decides membership and endpoint
identity. A periodic lift changes the value, so it receives a fresh pair of
comparisons. An undecided comparison still fails explicitly; the two endpoint
identities of a complete period remain distinct. This reuse lasts only for one
helper call and adds no persistent cache. The ordering cascade already proves
the structural endpoint equality previously checked by `ParameterDomain::contains`.
The [comparison evidence](evidence/2026-10-16-conic-comparison-reuse/README.md)
retains the complete output contracts and observed costs; no general resource
bound follows from fewer comparisons or allocations.'''
assert text.count(anchor) == 1 and addition not in text
path.write_text(text.replace(anchor, anchor + addition).replace(
    'This repairs a lost subdivision when', 'The periodic lift repairs a lost subdivision when'))

path = ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
text = path.read_text()
old = '''Scope the next BREP
comparison-reuse experiment to one helper call; any new persistent proof cache
needs separate identity, lifetime, resource and state-matrix admission.'''
new = '''The
[conic comparison reuse](evidence/2026-10-16-conic-comparison-reuse/README.md)
keeps certified interval orderings within one helper call and preserves the
existing exact domain. Its current evidence becomes the next BREP baseline;
all prior adverse observations remain visible. Any new persistent proof cache
needs separate identity, lifetime, resource and state-matrix admission.

For the next prism-subtraction extension, reproduce both direct z-prism calls
and the parallel-cylinder caller after its common-coordinate transform. Capture
current planar results and STEP export before changing dispatch: region extrusion
creates extrusion surfaces, while the current advanced writer admits planes and
cylinders. Preserve every previously supported downstream export, with any
necessary exact representation or exchange support owned by BREP/IO. A native
Boolean followed by a typed export blocker is not a completed STEP workflow.'''
assert old in text
path.write_text(text.replace(old, new))

path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(path.read_text())
identity = 'conic-comparison-reuse-2026-10-16'
assert not any(row['id'] == identity for row in status['increments'])
status['increments'].append(dict(
    id=identity, work_packages=['WP03', 'WP08', 'WP14a', 'WP21', 'WP23'],
    properties=['P1', 'P3', 'P4', 'P5', 'P6', 'P8', 'P10', 'P11', 'P17', 'P18',
                'P19', 'P20', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Reuse each certified interval-bound ordering for conic membership and endpoint identity within one helper call; a lifted value receives fresh comparisons. No persistent state or dependency source changes.',
    source='../src/geometry.rs', evidence='evidence/2026-10-16-conic-comparison-reuse/manifest.json',
    decision=m['decision'], retention_rationale=m['retention_rationale'],
    validation=m['validation'], cost_evidence=m['cost_evidence'],
    migration=m['migration'], limits=m['limits']))
for index, action in enumerate(status['next_actions']):
    if action.startswith('Evaluate reuse of certified interval-bound comparisons inside geometry::angular_parameter_lifts.'):
        status['next_actions'][index] = (
            'Preserve the qualified per-call conic comparison reuse and its complete exact receipts in '
            'evidence/2026-10-16-conic-comparison-reuse/manifest.json. The isolated allocation observations '
            'do not close earlier archive, spline, pcurve or provenance cost gates. No persistent cache '
            'was added; future cache proposals still require identity, resource and state-matrix admission. '
            'Continue the original oversized prism subtraction and cone/torus composition frontier. '
            'Before changing z_prism_boolean, reproduce its direct and parallel-cylinder callers, '
            'near-height gaps, off-axis through bores, and the existing planar result/STEP contracts. '
            'Generic extrusion surfaces currently have a narrower export contract than planes and '
            'cylinders; preserve existing downstream success with any required exact BREP/IO support '
            'and explicitly record representation migrations.')
    else:
        status['next_actions'][index] = action.replace(
            'Use the upstream-native integration as the current measured baseline;',
            'Use the conic comparison reuse as the current measured baseline; preserve the upstream integration record;').replace(
            'Use the merged-source qualification as the current BREP baseline.',
            'Use the conic comparison qualification as the current BREP baseline, with the upstream integration contracts retained.')
path.write_text(json.dumps(status, indent=2) + '\n')

path = ROOT / 'docs/properties-status.json'
ledger = json.loads(path.read_text())
entry = ledger['current_work']['hyperbrep']
entry['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-conic-comparison-reuse/manifest.json'
entry['qualification'] = m['validation'] + ' ' + m['cost_evidence'] + ' ' + m['limits']
path.write_text(json.dumps(ledger, indent=2) + '\n')

pcurves = [row for row in b['costs'] if row['corpus'] == 'pcurves']
assert len(pcurves) == 6
table = ('| Case | Median time ratio | Calls before → after | Requested bytes before → after |\n'
         '| --- | ---: | ---: | ---: |\n')
for row in pcurves:
    old = row['baseline_allocation_per_iteration']
    new = row['candidate_allocation_per_iteration']
    table += (f'| `{row["case"]}` | {row["ratio"]:.6f} | {old["calls"]:,} → {new["calls"]:,} '
              f'| {old["requested_bytes"]:,} → {new["requested_bytes"]:,} |\n')
adverse = '\n'.join(f'- {row["corpus"]}: `{row["case"]}` — {row["ratio"]:.6f}.' for row in b['over_ten_percent'])
adverse_text = ('Rows above 10% in this campaign:\n\n' + adverse + '\n\n' if adverse
                else 'No case has a median time more than 10% above baseline in this campaign. Prior cost gates remain open.\n\n')
allocation_adverse = ''
if b['allocation_increases']:
    allocation_adverse = ('Observed allocation increases are retained separately from the pcurve reductions:\n\n'
                          '| Case | Calls before → after | Requested bytes before → after |\n'
                          '| --- | ---: | ---: |\n')
    for row in b['allocation_increases']:
        old = row['baseline_allocation_per_iteration']
        new = row['candidate_allocation_per_iteration']
        allocation_adverse += (f'| `{row["corpus"]}/{row["case"]}` | {old["calls"]:,} → {new["calls"]:,} '
                              f'| {old["requested_bytes"]:,} → {new["requested_bytes"]:,} |\n')
    allocation_adverse += '\nThese are process observations, not a universal allocation reduction claim.\n\n'
path = ROOT / 'crates/hyperbrep/PERFORMANCE.md'
title = '## Per-call conic comparison reuse (2026-10-16)'
assert title not in path.read_text()
with path.open('a') as output:
    output.write('\n' + title + '\n\n'
                 'The [comparison record](docs/evidence/2026-10-16-conic-comparison-reuse/README.md) '
                 'isolates one BREP helper against the qualified upstream integration.\n\n'
                 + m['retention_rationale'] + '\n\n' + m['cost_evidence'] + '\n\n'
                 'Full-campaign pcurve observations per iteration; requested allocation bytes '
                 'are not a retained-heap bound:\n\n' + table + '\n' + adverse_text + allocation_adverse
                 + 'The original focused probe and all unfavorable rows remain in the evidence. '
                 'No prior archive, spline, cached-arc, pcurve or provenance cost gate is closed '
                 'by this experiment.\n')

(OUT / 'README.md').write_text(
    '# Per-call periodic conic comparison reuse\n\n'
    'The baseline is `f2039ae4e`, qualified against upstream `73472622d`. Only '
    '`geometry::angular_parameter_lifts` changes in production. The [contract](contract.md) '
    'defines the same exact conic domain, strict authority, full-period endpoint identities '
    'and typed failures. Certified interval orderings are reused within one call; a newly '
    'lifted value is compared again. No persistent cache is added.\n\n'
    + m['retention_rationale'] + '\n\n' + m['validation'] + '\n\n'
    + m['cost_evidence'] + '\n\n'
    'Full-campaign pcurve observations per iteration:\n\n' + table + '\n' + adverse_text + allocation_adverse
    + 'The initial [focused probe](focused-v1/pcurves-costs.json) retains all six original '
    'pcurve cases and their receipts; it does not substitute for the full campaign. '
    'The [configuration comparison](configuration-comparison.json) records matching '
    'compiler versions, build settings and dependency features. The [complete frontier]'
    '(continuation-frontier.json) keeps every original cutter, rotation, typed blocker and '
    'unavailable dependent step. Body counts and replay remain diagnostic observations, '
    'separate from the independent exact acceptance tests.\n\n'
    'Every [attempt](attempts.json) retains its source identity and outcome, including the '
    'inherited failed scalar gates. The [manifest](manifest.json), [source reconstruction]'
    '(source-reconstruction.json), [source overlays](source-overlays.tar.gz) and '
    '[audit](audit.json) bind the record to the measured implementation.\n\n'
    + m['migration'] + '\n\n' + m['limits'] + '\n')
print('Updated only BREP architecture, planning, costs, status and the BREP shared-ledger entry.')
