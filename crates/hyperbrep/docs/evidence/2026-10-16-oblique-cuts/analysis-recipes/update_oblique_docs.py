"""Publish only the measured BREP increment; surrounding owners remain unchanged."""
import json
from pathlib import Path

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-oblique-cuts'
m = json.loads((OUT / 'manifest.json').read_text())
b = json.loads((OUT / 'benchmark-summary.json').read_text())
f = json.loads((OUT / 'continuation-frontier.json').read_text())

def append(relative, text):
    path = ROOT / relative
    assert text.splitlines()[1] not in path.read_text(), relative
    with path.open('a') as out:
        out.write(text)

append('crates/hyperbrep/docs/ARCHITECTURE.md', '''
## Periodic conic parameters in Boolean continuation

The native conic parameter is an identity in an authored chart, not just an
angle modulo one revolution. Inverse queries, plane contacts and Boolean edge
atomization now share `geometry::angular_parameter_lifts`. For a validated
unit-speed conic interval of length at most tau, a certified integer ceiling
selects the first equivalent parameter in that interval. A full-period seam
retains both endpoint identities; a shorter interval can return no preimage.
Stored endpoints are reused on certified equality. Enumeration does not grow
with the chart's turn count; scalar quotient and coefficient costs retain their
existing resource limitations.

This repairs a lost subdivision when a retained parameter pi/2 belongs to a
coalesced target arc spanning [7pi/4, 11pi/4]: the target preimage is 5pi/2.
Previously the parameter was discarded as outside the interval, leaving the
torus band cap unpaired. Direct inverse queries also previously lost valid
preimages in distant authored charts because normalization added only one turn.

`retained_curve_face_intervals` receives the actual spatial curve and obtains
native boundary contacts before recovering its clipped endpoints. For an
interior angular pcurve parameter, `retained_spatial_parameter` reuses a native
contact only after certifying equal full spatial parameterization and finding
one lift in the target domain. The native trim contact supplies the proof that
the point is on this fragment; matching endpoints or circle supports alone
does not justify reuse. Original pcurve endpoints use the retained correspondence
so the two ends of a periodic seam remain distinct. Other correspondences and
ambiguous lifts continue through the existing exact mapping.

The [acceptance corpus](../tests/support/oblique.rs) retains the original
40-unit cutter rotated 45 degrees relative to a radius-5/minor-radius-2 torus,
then clips the half by z >= 1. Independent volume, area and point expectations
exercise intersection in both orders, subtraction, reconstruction in both
orders, subdivision, exact similarities and archive replay. Chart controls use
both conic families, reversed/restricted curves, turns through +/-10^12 and
1e-12 seam gaps. Wrong phase and different-support contacts are negative controls.
For minor radius 2 and major radius 5, the disk segment above z = 1 has area
S = 4pi/3 - sqrt(3). Rotation through pi gives volume 5pi*S. The curved area is
20pi^2/3, the axial annular cap has area 10pi*sqrt(3), and the two longitudinal
caps contribute 2S. The complement uses the remaining disk area and adds the
same shared axial cap. These expectations are derived independently of BREP
measurement; the exact similarity cases apply the corresponding square/cube
scaling laws and transformed point tables.
The [evidence](evidence/2026-10-16-oblique-cuts/README.md) also retains all nine
wider oblique fixtures and their failures. This extends parameter evidence
reuse; it does not supply a general curved-shell embedding proof or general
oblique Boolean closure.
''')

append('crates/hyperbrep/docs/SUPPORT_MATRIX.md', '''
## Oblique torus bands and distant conic charts

The [periodic-parameter increment](evidence/2026-10-16-oblique-cuts/README.md)
checks circle/ellipse inverse queries and plane contacts on seven charts through
+/-10^12 turns, including reversal, restriction, both complete-period seam
identities and an exact 1e-12 seam gap. Boolean atomization lifts retained native
preimages into the target angular interval; clipping reuses contacts only on a
certified equal complete parameterization.

A 45-degree relative half cut of the original torus continues into an axial
band, subtraction and complementary reconstruction in both orders. Identity,
reflected 1/1000 scale and reflected sqrt(2) scale exercise 18 nonempty outputs
and three canonical empty results, with exact independent measures/classification,
paired incidence, subdivision, transformed replay and full archive checks.
Four torus STEP attempts retain typed body/entity diagnostics and supported
same-context cylinder export recovers.

The complete nine-fixture diagnostic still has oversized cylinder subtraction/
clear blockers, cone continuation uncertainty and rationally rotated torus
witness uncertainty. Its successful body counts are not independent set proofs.
General oblique closure, cone/torus STEP, complete provenance/resource admission
and release gates remain open.
''')

path = ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md'
text = path.read_text()
old = '''The original fifteen-case continuation diagnostic now has native results for
every case; independently checked coverage is stated separately in the evidence.
Extend the ordinary workflow matrix through non-seam and arbitrary-angle cuts,
disconnected/nested combinations and reusable selected contacts, with explicit
unsupported and resource outcomes.'''
new = '''The original fifteen-case continuation diagnostic continues to return native
results for every case. The [oblique increment](evidence/2026-10-16-oblique-cuts/README.md)
adds distant conic chart queries and a 45-degree torus half/band workflow with
reconstruction, exact transforms and replay. Preserve its complete nine-fixture
diagnostic, including oversized cylinder subtraction/clear blockers, cone
continuation uncertainty and rationally rotated torus witness uncertainty;
successful body counts are separate from independent semantic acceptance.
Extend these full-size cases through reusable selected contacts and complete
native arrangement/embedding proofs (WP03/WP06/WP07/WP08), then disconnected and
nested combinations. Keep unsupported, undecided and resource outcomes explicit;
do not replace original fixtures with easier seam-aligned cuts. For oversized
prism subtraction, first test the exact Cartesian-product containment case in
`z_prism_boolean`: the source's axial interval lies inside the cutter's interval.
Keep the union precondition and partial-overlap cases explicit; retain the
original 40-unit cutters and both rational/radical rotations in acceptance.'''
assert old in text
path.write_text(text.replace(old, new).replace(
    'rotations in acceptance. Cone/torus', 'rotations in acceptance.\n\nCone/torus'))

path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(path.read_text())
increment_id = 'periodic-conic-oblique-continuation'
assert not any(r['id'] == increment_id for r in status['increments'])
status['increments'].append(dict(
    id=increment_id, work_packages=['WP03', 'WP06', 'WP07', 'WP08', 'WP17', 'WP21', 'WP23'],
    properties=['P1', 'P3', 'P5', 'P6', 'P8', 'P11', 'P17', 'P18', 'P19', 'P20', 'P24', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Share certified periodic conic lifting across inverse/contact/atomization; preserve complete-parameterization clipping preimages and distinct seam endpoints. No dependency implementation edits.',
    source='../src/geometry.rs', source_files=m['source_files'],
    evidence='evidence/2026-10-16-oblique-cuts/manifest.json',
    validation=m['validation'], cost_evidence=m['cost_evidence'], migration=m['migration'], limits=m['limits']))
status['next_actions'][0] = (
    'Preserve the full nine-fixture oblique frontier and preceding fifteen-case continuation corpus, '
    'alongside the independently checked 45-degree torus band/reconstruction, distant conic charts '
    'and sector workflows. Resolve oversized cylinder subtraction/clear, cone continuation uncertainty '
    'and rationally rotated torus witness uncertainty through native retained-contact, arrangement '
    'and embedding owners. Do not infer arbitrary-angle closure from the finite successful matrix. '
    'Only repair dependencies for a reproduced BREP blocker after checking upstream. See '
    'evidence/2026-10-16-oblique-cuts/manifest.json (WP03/WP06/WP07/WP08, P17-P20/P35/P39).')
status['next_actions'].insert(1,
    'Evaluate reuse of certified interval-bound comparisons inside geometry::angular_parameter_lifts. '
    'The oblique increment repeats membership/end-point comparisons and records partial-pcurve '
    'allocation/latency increases; the causal contribution has not been isolated. Preserve every '
    'admitted conic and oblique workflow, exact receipt and prior adverse observation, and qualify '
    'the complete affected corpus before retaining the performance change. Keep that experiment '
    'separate from the correctness/completion repair.')
path.write_text(json.dumps(status, indent=2) + '\n')
path = ROOT / 'docs/properties-status.json'
ledger = json.loads(path.read_text())
entry = ledger['current_work']['hyperbrep']
entry['latest_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-oblique-cuts/manifest.json'
entry['qualification'] = m['validation'] + ' ' + m['cost_evidence'] + ' ' + m['limits']
entry['upstream_revision'] = m['upstream']
path.write_text(json.dumps(ledger, indent=2) + '\n')

adverse = '\n'.join(f'- `{r["corpus"]}/{r["case"]}`: {r["ratio"]:.6f}.' for r in b['over_ten_percent'])
append('crates/hyperbrep/PERFORMANCE.md', '\n## Periodic conic continuation (2026-10-16)\n\n'
       'The [source-bound record](docs/evidence/2026-10-16-oblique-cuts/README.md) '
       'retains complete before/after outputs and the original failed fixtures.\n\n'
       + m['cost_evidence'] + '\n\n'
       + ('Rows above 10% in this campaign:\n\n' + adverse + '\n\n' if adverse else '')
       + 'Retain this increment for its exact inverse-query repair and completed Boolean continuation. '
       'It makes no aggregate speedup claim. Earlier archive/spline/cached-arc observations remain '
       'visible; a favorable later sample does not discharge their gates. No operation-wide resource '
       'bound is established.\n\n'
       'The new periodic lifting helper repeats certified membership/end-point comparisons. '
       'Reusing those comparisons is the next BREP performance experiment. Its contribution to the '
       'partial-pcurve allocation/latency changes has not yet been isolated; preserve the full '
       'admitted corpus and exact receipts when evaluating it.\n')

final_counts = f['final']['counts']
with (OUT / 'contract.md').open('a') as out:
    out.write('\n## Retained increment and unresolved domain\n\n'
              'The full nine-fixture investigation above remains the development frontier. '
              'This increment admits the periodic conic query repair and the 45-degree torus '
              'half/band continuation in identity and two reflected exact scales, including '
              'complementary reconstruction after archive replay. The original full-size '
              'fixtures and every baseline/final outcome are retained. Cylinder subtraction/clear, '
              'cone continuation and rationally rotated torus witnesses remain unresolved work; '
              'they are not reclassified as supported or removed from the declared investigation. '
              'See the manifest for independently checked outputs and separately recorded '
              'diagnostic counts, source-bound checks, adverse costs and inherited gates.\n')
(OUT / 'README.md').write_text(
    '# Periodic conic parameters and oblique continuation\n\n'
    'This increment repairs lost exact parameter identities in native inverse queries and Boolean '
    'continuation. The [contract](contract.md) records the baseline and domain; the '
    '[manifest](manifest.json) records executed checks, costs and remaining gates.\n\n'
    + m['validation'] + '\n\n'
    'The original torus cap failure omitted the 5pi/2 subdivision of a seam-crossing arc. '
    'Certified periodic lifting now preserves that native preimage. Complementary reconstruction '
    'reuses complete-parameterization contact evidence instead of recreating the same angular '
    'parameter through expanded inverse expressions. Wrong chart phases, different supports and '
    'both seam identities have explicit controls.\n\n'
    'The [complete frontier](continuation-frontier.json) records all 81 operation slots across nine '
    f'fixtures: {final_counts.get("native_result",0)} native results, '
    f'{final_counts.get("unsupported",0)} unsupported, {final_counts.get("undecided",0)} undecided, '
    f'and {final_counts.get("not_attempted_after_prerequisite_failure",0)} unavailable after a prerequisite '
    'failure. Counts and successful replay are diagnostics, not independent exact set oracles. '
    'The original 40-unit cutters and rational/radical rotations remain intact.\n\n'
    + m['cost_evidence'] + '\n\n'
    + ('Adverse timing rows:\n\n' + adverse + '\n\n' if adverse else '')
    + 'Three near-axis inverse probes return typed uncertainty at radius membership, before the '
    'existing quadrant-candidate path. They neither establish a false result nor verify that '
    'unreached path. No speculative scalar/curve repair is included.\n\n'
    'Every [attempt](attempts.json), including compile/lint failures and the initially failing '
    'continuations, retains its command and source identity. The [source reconstruction record]'
    '(source-reconstruction.json) and [lossless overlays](source-overlays.tar.gz) preserve all '
    'candidate source bytes. The [audit](audit.json) checks the final scope, hashes and ledgers.\n\n'
    + m['migration'] + '\n\n' + m['limits'] + '\n\n'
    'The [final upstream checkpoint](upstream-checkpoint-final.json) fetched six newer commits '
    'through `73472622d` after these checks and measurements. They are outside this qualified '
    'source snapshot; merge and BREP requalification follow this commit separately.\n')
print('updated BREP architecture, support, plan, evidence and only its shared-ledger entry')
