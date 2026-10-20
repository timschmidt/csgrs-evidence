"""Publish the final, measured sector increment into its existing ledgers."""
import json
from pathlib import Path

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-sector-cuts'
manifest = json.loads((OUT / 'manifest.json').read_text())
validation = manifest['validation']
costs = manifest['cost_evidence']
migration = manifest['migration']
limits = manifest['limits']

path = ROOT / 'crates/hyperbrep/docs/SUPPORT_MATRIX.md'
text = path.read_text()
old = '''General quarter/band cuts, nonlinear periodic gluing, torus/cone STEP exchange,
full provenance/resource admission and work-package gates remain open.'''
new = '''Selected quarter/band workflows are extended below. Nonlinear periodic gluing,
torus/cone STEP exchange, full provenance/resource admission and work-package
gates remain open.

## Convex analytic sectors and axial bands

The [sector increment](evidence/2026-10-16-sector-cuts/README.md) completes five
original quarter/band cases and thirty exact similarity configurations. The
corpus checks 175 nonempty Boolean continuation outputs and 35 canonical empty
results, including both applicable operand orders, complementary reconstruction,
exact independent volume/area and point tables, opposite paired edge uses,
untrusted replay, subdivision and reflected rescaling. It retains the original
40-unit cutters and includes 1e-12 classification offsets.

Native annular line partitions preserve input trace identities and model
revisions; a bridge that crosses a hole is rejected. Mixed straight/circular
traces coalesce only with complete connected-interval evidence. Clipping retains
the native spatial/UV correspondence, including nonlinear angular charts and
distinct endpoint identities at a periodic seam.

The admitted cone/torus shell proof requires a complete multiplicity-one native
UV grid inside at most two axis-containing planes and two axial bounds. It
proves the entire angular and axial occupancy, with planar completion justified
by that restricted arrangement. See [the architecture](ARCHITECTURE.md#analytic-sector-and-band-continuation).
This finite corpus does not establish arbitrary-angle or general Boolean
closure. STEP attempts for these cone/torus outputs still return typed
`UnsupportedSurface` with body/entity identity; same-context supported-cylinder
recovery is tested. Broader release and resource gates remain open.'''
assert old in text
path.write_text(text.replace(old, new))

path = ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
text = path.read_text()
old = '''Preserve unfinished closed-edge work and its original evidence, then migrate
its Boolean callers to BodySet and rebase qualification and costs on the
integrated source before retention. Its
tests establish only their declared native domain, not general Boolean closure
or curved STEP exchange. Existing archive cost regressions remain open.'''
new = '''Preserve the admitted closed-edge, pcurve, analytic-transform, repeated-cut
and [sector/band corpora](evidence/2026-10-16-sector-cuts/README.md), including
their original failures, exact expectations and adverse cost observations.
The original fifteen-case continuation diagnostic now has native results for
every case; independently checked coverage is stated separately in the evidence.
Extend the ordinary workflow matrix through non-seam and arbitrary-angle cuts,
disconnected/nested combinations and reusable selected contacts, with explicit
unsupported and resource outcomes. Cone/torus STEP exchange and a clean packaged
consumer must accompany their own supported-domain proofs. Do not credit
source-path WASM or an optional floating-point oracle as shipped release coverage.

Surrounding crates remain owned by the concurrent upstream thread. The sector
increment needed one reproduced scalar certificate, `acos(±1/2)`, after checking
upstream. Its full dependency-check outcomes remain visible in the evidence;
passing BREP checks do not close an inherited whole-scalar or release gate.
Do not repair unrelated dependency findings in this branch merely to turn a
broader dashboard green. Existing archive and spline timing exceptions remain
open until their original contracts are requalified.'''
assert old in text
text = text.replace(old, new)
old = '''Continue from its complete fifteen-case diagnostic frontier: quarter/band cuts
and mixed angular/axial subdivisions still need complete partition/selection/
shell proofs. Do not infer general closure or STEP support from these successful
compositions. Preserve full-size regressions, parameter/provenance evidence and
unchanged archive admission limits; check upstream before any necessary dependency
fix while the surrounding library is developed independently.'''
new = '''The [sector/band increment](evidence/2026-10-16-sector-cuts/README.md)
continues the five remaining quarter/band cases through native annular partition,
mixed circular traces, exact clipping correspondence and complete convex-sector
coverage. Its five original and thirty transformed configurations independently
check measures, point classification, manifold incidence, repeated composition
and replay. Preserve the complete fifteen-case diagnostic separately from those
independent semantic oracles. General nonlinear subdivision and curved-shell
embedding still need their own proofs; STEP support does not follow from a
successful Boolean. Preserve full-size regressions, parameter/provenance evidence
and unchanged archive admission limits. Check upstream before any necessary
dependency fix while the surrounding library is developed independently.'''
assert old in text
text = text.replace(old, new)
path.write_text(text)

path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(path.read_text())
status['updated_on'] = '2026-10-16'
status['increments'].append(dict(
    id='native-analytic-sector-band-continuation',
    work_packages=['WP03', 'WP06', 'WP07', 'WP08', 'WP17', 'WP21', 'WP23'],
    properties=['P1', 'P2', 'P5', 'P6', 'P8', 'P9', 'P15', 'P17', 'P18', 'P19', 'P20', 'P24', 'P35', 'P36', 'P37', 'P39'],
    change='Complete native annular bridge partitions, connected circular trace unions, actual clipping correspondences and complete convex cone/torus sector/band certificates. Preserve usable analytic area integrals and compact exact iso coefficients before interpolation. One seven-line scalar acos-half certificate repairs a reproduced BREP blocker; no unrelated dependency repair.',
    source='../src/topology/validation/sector.rs',
    source_files=manifest['source_files'],
    evidence='evidence/2026-10-16-sector-cuts/manifest.json',
    validation=validation, cost_evidence=costs, migration=migration, limits=limits,
))
status['next_actions'][0] = (
    'Preserve all fifteen original continuation diagnostics and the independently checked sector corpus: '
    'five original plus thirty exact similarity configurations, 175 nonempty outputs and 35 empty results, '
    'independent exact measures/classification, opposite incidence, subdivision/reflection/replay and '
    'complementary reconstruction. Extend non-seam/arbitrary-angle, disconnected/nested and selected-contact '
    'workflows through the native owners, with full fixtures and explicit typed outcomes. The finite sector '
    'proof does not establish general curved-shell embedding. Only change a dependency for a reproduced '
    'BREP blocker after checking concurrent upstream corrections. See evidence/2026-10-16-sector-cuts/manifest.json '
    '(WP03/WP06/WP07/WP08, P17-P20/P35/P39).'
)
status['next_actions'].append(
    'Treat the sector increment as the next measured exact-feature baseline; preserve all raw prior/current '
    'costs, receipt comparisons, necessary migrations and inherited dependency-check failures. Close '
    'controlled-host timing, full dependency and shipped-consumer gates with their original fixtures and '
    'contracts, not a successful subset. Cone/torus STEP writers remain the explicit exchange frontier.'
)
path.write_text(json.dumps(status, indent=2) + '\n')

path = ROOT / 'docs/properties-status.json'
ledger = json.loads(path.read_text())
entry = ledger['current_work']['hyperbrep']
entry['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-sector-cuts/manifest.json'
entry['qualification'] = validation + ' ' + costs + ' ' + limits
entry['upstream_revision'] = manifest['upstream']
path.write_text(json.dumps(ledger, indent=2) + '\n')

path = ROOT / 'crates/hyperbrep/PERFORMANCE.md'
with path.open('a') as f:
    f.write('\n## Analytic sector and band continuation (2026-10-16)\n\n')
    f.write('The [source-bound record](docs/evidence/2026-10-16-sector-cuts/README.md) '
            'retains the complete preserved corpus, new successful workflows and affected scalar costs.\n\n')
    f.write(costs + '\n\n' + migration + '\n\n')
    f.write('These observations qualify their named contracts only. All 28 work-package gates remain '
            'open; prior timing exceptions and the explicit dependency/release limitations in the '
            'manifest remain. Previously failed geometry is not a speedup baseline.\n')

(OUT / 'README.md').write_text(
    '# Analytic sector and band continuation\n\n'
    'This increment extends exact native cone/torus composition on the retained full-size corpus. '
    'The [contract](contract.md) identifies its owners, proofs, reproduced failures and limits. '
    'The [manifest](manifest.json) distinguishes executed qualification, inherited failures, costs '
    'and remaining gates. All 28 work packages remain open.\n\n'
    + validation + '\n\n' + costs + '\n\n' + migration + '\n\n'
    'Every [attempt](attempts.json), including rejected trials and unsuccessful checks, retains '
    'its command, outcome and source hashes. The [source reconstruction record](source-reconstruction.json) '
    'and [lossless overlays](source-overlays.tar.gz) preserve candidate source bytes. '
    'The [final audit](audit.json) checks scope, links, ledgers and retained data.\n\n'
    + limits + '\n'
)
print('updated BREP plan, support, implementation/cost records and only its shared-ledger entry')
