from pathlib import Path
import ast
root = Path(__file__).resolve().parent
source = (root / 'archive_point_replay_evidence.py').read_text()
# The archive traversal and byte checks are shared; its mathematical receipt is
# rewritten for this increment rather than inheriting the preceding claim.
source = source.replace('point-replay', 'circle-replay').replace('point_replay', 'circle_replay')
source = source.replace("root / 'chord-replay-final-commit.json'", "root / 'point-replay-final-commit.json'")
source = source.replace("root / 'chord-replay-evidence-archive.json'", "root / 'point-replay-evidence-archive.json'")
source = source.replace('refs/heads/hypercurve-chord-replay-evidence-2026-10-27', 'refs/heads/hypercurve-point-replay-evidence-2026-10-27')
source = source.replace("{'suites': 90, 'passed': 2820, 'failed': 0, 'ignored': 34}", "{'suites': 91, 'passed': 2832, 'failed': 0, 'ignored': 34}")
source = source.replace("downstream['suites'] == 10 and downstream['passed'] == 63", "downstream['suites'] == 11 and downstream['passed'] == 64")
source = source.replace("len(report['fixtures']) == 170", "len(report['fixtures']) == 181")
source = source.replace("copy(root / 'circle-replay-next-baseline.rs', Path('commands/circle-replay-next-baseline.rs'))\n", '')
source = source.replace('Record selected point graph replay qualification', 'Record selected circle frame replay qualification')
lines = source.splitlines(keepends=True)
node = next(n for n in ast.parse(source).body if isinstance(n, ast.Expr) and isinstance(n.value, ast.Call) and isinstance(n.value.func, ast.Attribute) and n.value.func.attr == 'write_text' and "'source.json'" in ast.get_source_segment(source, n))
metadata = '''(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve selected-circle and retained chord owners, native SVG dependency graph, exact point-location dispatch and shared CurveRegion2 arrangement; CSGRS SVG adapter qualification',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P28', 'P29', 'P30'],
    'domain': 'Chord-normal selected-circle frames with previously checked exact center and chord definitions, nonzero signed radius, scalar or signed normal-contact angular selections, independently incident points, finite ascending chart range and traversal. Transported represented unit chord directions remain checked evidence. The demonstrated complete workflows use the degree-seven fillet, algebraic similarities, native/generated boundaries, a hole and disconnected material.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 181, 'commands': results,
    'source_attribution': 'Every final command ran on the complete source snapshot in commands/circle-replay-final-source-before.json and commands/circle-replay-final-files-before.json, with matching after records. Three ledger receipts are added only after qualification. The reparent record proves preservation of every other source byte.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'The unchanged T source reproduces complete circular fillet export as Unsupported after selected-line export succeeds. Its independent retained-point circle query also fails before serialization. Both original positive assertions and qualified-library digests are preserved. Diagnostic records identify a ChordNormal frame and SelectedChordNormalContact angular definition. The completed T parent and its source/evidence records remain ancestors.',
    'change': 'Append HCP4 circle frame20, scalar angular selector21, signed normal contact22, finite oriented circle range23 and independent incident-point selector24. Reuse the existing center/frame/contact/fragment owners; no scalar-coordinate flattening or alternate circle solver. Exact point-location dispatch now permits retained points on selected circles and shares the same owner for coordinate points. A radial point-inversion selector preserves the original independent point instead of a derived solver cache. Record25 retains transported unit chord components, re-proving unit length, perpendicular equality and positive orientation while preserving support/range identity. Represented endpoint directions that the existing constructor recovers retain their old encoding.',
    'closure_argument': 'A checked center, nonzero directed chord, signed radius and orientation define the selected circle half. Checked angular endpoints and ascending range select a finite oriented arc. A literal signed normal contact replays P=C+dN, radius and half selection; an independently incident point replays its circle equation and selected half. A stored unit direction is evidence only after exact length, parallelism and orientation validation. Prior typed references retain shared sources and reject cycles or wrong owners. No construction tangent flag is serialized; later operations consume the retained relations and shared arrangement authority.',
    'qualification': 'Eleven public Hypercurve witnesses cover fresh-process full fillet replay then exact point location, split, reversal and second archive; algebraic rotation/scaling and reflection; all four empty-set Boolean operators and boundary reconstruction; mixed native/generated boundaries with hole and disconnected material; changed-neighbor endpoint and interior transverse contacts in both orders; valid and invalid unit directions; literal signed normal-contact validation; finite-arc clipping and 2^-80 separation; malformed references, radius, half and range definitions including unused records; reached byte/depth limits and larger retries. A private unit test checks consumed approximate-policy rejection. One root SVG adapter case repeats complete fillet replay before further exact operations. Exact geometric expectations are separate from full SVG determinism.',
    'attempts': 'Prototype1 exports the original full circle but its stronger retained-point query fails. The unmodified T baseline reproduces that query gap. Prototype2 connects point-location dispatch but the split/reversed second archive lacks its selected angular record. Prototype3 adds the original independent incident-point record; five cases pass, while the algebraic similarity full-SVG assertion finds a display-only difference after reload. A diagnostic proves exact metadata and viewBox identical and both cold/warm query paths stable. The missing transported chord unit direction changes finite point construction after replay. Prototype4 adds its checked record and stops at a missing test argument borrow. Prototype5 catches the distinction between support and finite-curve references, a redundant direction record on an existing exact-chart fixture, and a malformed contact classified as undecided. Prototype6 preserves kinds, omits reconstructible represented directions, and passes all old replay tests, policy and root adapter checks; the invalid contact assertion remains failing. Prototype7 validates the literal signed relation instead of using the modeling solver’s two-sided search, preserving undecided versus proved-invalid outcomes. It adds the changed-neighbor and mixed-topology witnesses without weakening original assertions. A separate fiber-center probe preserves an outstanding midpoint Ordering blocker, with its initial type-import setup errors retained.',
    'limitations': [
        'This finite corpus is not a universal algebraic curve or operation closure proof. Other generated Rational, ParallelNormal and SelectedRadial circle frames, general mapped angular contacts, repeated-offset chart transport and filled-region native archives remain required work.',
        'A correlated degree-seven/five fiber center imports and evaluates its independently derived endpoints, but a midpoint query returns Blocked(Ordering). This is an implementation gap, not resource exhaustion or completed geometric capability. The original positive source and failure remain available.',
        'Depth and extension bytes are checked before publication, and failures do not poison retries. They do not bound total solver work, coefficient growth, scalar expression trees, temporary or retained heap use, or cooperative cancellation. External timeouts are containment only.',
        'Construction-time tangent endpoint flags are not replay authority. The new contact records retain exact normal and selected-point relations; more general contact and provenance transports remain open.',
        'Full repository pre-push qualification, remote publication and published-package delivery remain pending for these source bytes.'
    ],
}, indent=2) + '\\n')
'''
source = ''.join(lines[:node.lineno - 1]) + metadata + ''.join(lines[node.end_lineno:])
p = root / 'archive_circle_replay_evidence.py'
assert not p.exists()
ast.parse(source)
p.write_text(source)
for old, new in [('close_point_replay_increment.py','close_circle_replay_increment.py'), ('close_point_replay_when_qualified.py','close_circle_replay_when_qualified.py'), ('persist_point_replay_increment.py','persist_circle_replay_increment.py')]:
    s = (root / old).read_text().replace('point-replay','circle-replay').replace('point_replay','circle_replay')
    s = s.replace("root / 'chord-replay-final-commit.json'", "root / 'point-replay-final-commit.json'")
    s = s.replace('Replay exact selected point dependency graphs', 'Replay exact selected circle frames and angular contacts')
    p = root / new
    assert not p.exists()
    ast.parse(s)
    p.write_text(s)
print('Prepared circle archive, closeout and persistence controls; none executed.')
