"""Publish the scoped upstream integration and its downstream planning requirements."""
import json
from pathlib import Path

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-upstream-native-integration'
m = json.loads((OUT / 'manifest.json').read_text())
b = json.loads((OUT / 'benchmark-summary.json').read_text())
path = ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
text = path.read_text()
text = text.replace('`72cd216cc758d364c9e40b8969fef2df155bec8b` and concurrent development ownership.',
                    '`73472622dd4034b8b8777cb2a116c4020f6bb328` and concurrent development ownership.', 1)
old = '''The [latest integration record](evidence/2026-10-16-upstream-corrections/README.md)
records the two grammar corrections, unchanged BREP/dependency implementations,
retained executable identities and merged-source qualification. Separately
pending native work mentioned in upstream evidence is not admitted by a merge
that does not contain it. The previous parked scalar investigation remains
preserved and unapplied.'''
new = '''The [latest integration record](evidence/2026-10-16-upstream-native-integration/README.md)
qualifies the unchanged BREP implementation against upstream `73472622d`, including
the scalar root-square/eighth-angle proofs and BREP's earcut configuration. Its
complete preserved corpus includes the oblique continuation; inherited failures
and adverse cost observations remain explicit. The [preceding integration record]
(evidence/2026-10-16-upstream-corrections/README.md) remains historical evidence.
Both 45-degree cone reconstruction orders now return native results in the
wider diagnostic. Promote them with independent exact set/topology and
composition expectations before claiming semantic admission; counts and replay
alone do not establish that extension.

Downstream sketch, feature and annotation layers must consume the new typed text
contracts: `curve::truetype_text`, `curve::hershey_strings` and
`parts::dimension::annotate` return `Result`; the text context forms retain local certainty.
TrueType now retains native line/quadratic/cubic outlines with exact Real layout
and 127/360 millimeters per point. The font parser's f32/composite/CFF boundary
still qualifies source fidelity. Carry that qualification into sketch-to-solid
work; the existing sampled mesh extrusion and STL quantization have separate
contracts. Keep native CurveRegion2 profiles through exact BREP construction
where supported. See the [current text contract](../../../readme.md).

`solid::merge` is checked structural concatenation; assembly/display consumers
must keep it distinct from Boolean union. `distribute_linear`, `distribute_grid`
and `distribute_arc` retain typed failures and validate sources even for zero or
one copy. Copy-count and reservation checks do not establish total-work or heap
bounds. `solid::minkowski_sum` now operates on represented bounded closed-PWN
material, including cavities and disconnected components; intentional point-sum
convexification uses `minkowski_hull`. Preserve that operation choice, local
certainty and source qualification in feature history. Analytic BREP offsets
retain their own surface/fidelity contract. These implementations remain in
CSGRS/Hypermesh; BREP consumers do not duplicate them.

The [triangulation contract](../../hypertri/README.md) adds checked simple-ring
triangulation with authored winding and documents a protected-cell diagonal/order
migration. Use the appropriate ring or region carrier and preserve its scope;
record affected artifact migrations with independent set/topology checks.
Upstream's separately pending 35-file native workload remains unadmitted: its
original full-board and copper-neck runtime gates still fail. Its source review
and profiling are diagnostic evidence, not performance acceptance. The previous
parked scalar investigation remains preserved and unapplied. Scope the next BREP
comparison-reuse experiment to one helper call; any new persistent proof cache
needs separate identity, lifetime, resource and state-matrix admission.'''
assert old in text
text = text.replace(old, new).replace('The [preceding integration record]\n(', 'The [preceding integration record](')
path.write_text(text)

path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(path.read_text())
identity = 'upstream-native-integration-2026-10-16'
assert not any(r['id'] == identity for r in status['increments'])
status['increments'].append(dict(
    id=identity, work_packages=['WP00', 'WP14a', 'WP15', 'WP16', 'WP17', 'WP21', 'WP23'],
    properties=['P1', 'P3', 'P4', 'P5', 'P6', 'P8', 'P9', 'P17', 'P18', 'P19', 'P20', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
    decision=m['decision'],
    change='Merge six upstream commits through 73472622d, retain both histories and all non-BREP ledger fields, and requalify unchanged BREP consumers. Carry typed text/distribution, solid Minkowski semantics and explicit font/triangulation migrations into downstream planning.',
    evidence='evidence/2026-10-16-upstream-native-integration/manifest.json',
    validation=m['validation'], cost_evidence=m['cost_evidence'], limits=m['limits']))
status['acceptance_contract']['upstream_revision'] = m['upstream']
status['acceptance_contract']['latest_integration'] = 'evidence/2026-10-16-upstream-native-integration/README.md'
status['next_actions'] = [
    action.replace('The seam-cut candidate is the new exact-feature baseline;',
                   'The seam-cut increment remains a historical exact-feature baseline;')
          .replace('The curved-composition increment is now the next exact-feature baseline.',
                   'The curved-composition increment retains its historical exact-feature baseline.')
          .replace('Treat the sector increment as the next measured exact-feature baseline;',
                   'Use the upstream-native integration as the current measured baseline; '
                   'preserve the historical sector and oblique baselines;')
    for action in status['next_actions']
]
status['next_actions'].append(
    'Use the merged-source qualification as the current BREP baseline. Preserve typed text and '
    'distribution failures, native outline carriers, parser/finite-projection fidelity and the '
    'solid-sum versus explicit Minkowski-hull choice in downstream features. Keep protected-cell '
    'triangulation migrations explicit. The separate 35-file native workload remains upstream-owned '
    'and unadmitted; its review/profile does not close runtime, cache or release gates. '
    'Promote the newly returning diagonal-cone reconstruction diagnostics with independent exact '
    'set/topology and composition tests; body counts/replay alone do not admit them.')
path.write_text(json.dumps(status, indent=2) + '\n')

path = ROOT / 'docs/properties-status.json'
ledger = json.loads(path.read_text())
entry = ledger['current_work']['hyperbrep']
entry['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-upstream-native-integration/manifest.json'
entry['latest_integration_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-upstream-native-integration/README.md'
entry['upstream_revision'] = m['upstream']
entry['qualification'] = m['validation'] + ' ' + m['cost_evidence'] + ' ' + m['limits']
path.write_text(json.dumps(ledger, indent=2) + '\n')

adverse = '\n'.join(f'- `{r["corpus"]}/{r["case"]}`: {r["ratio"]:.6f}.' for r in b['over_ten_percent'])
path = ROOT / 'crates/hyperbrep/PERFORMANCE.md'
title = '## Upstream native integration (2026-10-16)'
assert title not in path.read_text()
with path.open('a') as out:
    out.write('\n' + title + '\n\n'
              'The [integration evidence](docs/evidence/2026-10-16-upstream-native-integration/README.md) '
              'compares the same completed BREP contracts before and after the dependency merge.\n\n'
              + m['cost_evidence'] + '\n\n'
              + ('Rows above 10% in this campaign:\n\n' + adverse + '\n\n' if adverse else '')
              + 'Prior pcurve, provenance, archive, spline and cached-arc observations remain visible. '
              'Any conic comparison-reuse experiment needs its own source-bound qualification and '
              'complete preserved receipts; it introduces no performance claim by being planned.\n')

(OUT / 'README.md').write_text(
    '# Upstream native corrections: BREP integration\n\n'
    'Merge `3bb56dd9c` advances `brep` through upstream `73472622d`. BREP/IO implementation '
    'and tests are unchanged from `8f615970f`. The [integration record](integration.json) '
    'identifies both parents and the ledger conflict resolution; the [contract](contract.md) '
    'defines this consumer qualification.\n\n'
    + m['validation'] + '\n\n' + m['cost_evidence'] + '\n\n'
    + ('Adverse timing rows:\n\n' + adverse + '\n\n' if adverse else '')
    + 'The [complete frontier](continuation-frontier.json) retains the full original cutters, '
    'rotations and unavailable dependent steps. Successful body counts/replay are separate from '
    'the independent exact acceptance tests. Source inventories are not credited as full source '
    'review: the incoming scalar proof changes, public consumer contracts and native admission '
    'review were inspected; no whole-upstream audit is claimed.\n\n'
    'Upstream explicitly migrates TrueType to native curves and exact layout, and corrects '
    'protected-cell triangulation diagonals/order. Its text/distribution errors, structural '
    'concatenation and material-set Minkowski semantics remain in their owning crates. These '
    'contracts are carried into the BREP development plan. The [upstream native recheck]'
    '(../../../../../docs/evidence/2026-10-16-native-admission-recheck/progress-v1.md) '
    'keeps its separately pending workload, failed runtime gates and profiling limits visible.\n\n'
    'Every [attempt](attempts.json) retains its outcome and source identity, including the '
    'failed scalar reproductions. The [manifest](manifest.json), [source reconstruction]'
    '(source-reconstruction.json), [lossless source overlays](source-overlays.tar.gz) and '
    '[audit](audit.json) link the final record.\n\n' + m['migration'] + '\n\n' + m['limits'] + '\n')
print('updated BREP plan, costs and status; only BREP in the shared ledger')
