from pathlib import Path

root = Path(__file__).resolve().parent

def adapt(text):
    return (text.replace('/tmp/hypercurve-closure-polynomial-regions', '/tmp/hypercurve-closure-algebraic-similarities')
            .replace('polynomial-regions', 'algebraic-similarities')
            .replace('polynomial-region', 'algebraic-similarity')
            .replace('polynomial_region', 'algebraic_similarity')
            .replace('2754', '2745').replace('107', '98'))

archive = adapt((root / 'archive_polynomial_region_evidence.py').read_text())
archive = archive.replace('tests/algebraic_similarity_admission.rs', 'tests/polynomial_algebraic_similarities.rs')
start = archive.index("(out / 'source.json').write_text")
end = archive.index("(out / 'retained-files.json').write_text", start)
archive = archive[:start] + '''(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve polynomial similarity pullback and existing native-line section authority',
    'properties': ['P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Previously admitted selected rational-coefficient finite-fiber graph branches, closed exact parameter domains and nonsingular algebraic-coefficient similarities, queried against finite native lines. Original image and fiber definitions remain authoritative. Scalar and selected-field decisions must complete exactly.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 98, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Both positive public intersection witnesses reproduce Intersection/ImplicitPolynomial/Unsupported on committed 5de7f0cb05: a sqrt(2) image of the selected quintic and an image translated by (sqrt(3),sqrt(2)). Their original source-line controls already succeed. Raw source snapshots, commands and failures are retained.',
    'change': 'Remove the rational-coefficient-only similarity guard. The existing exact inverse similarity supplies a native line to the existing section algorithm. Source parameters, original selected fibers, active endpoints, overlap correspondences and image definitions are unchanged.',
    'closure_argument': 'A nonsingular similarity is a bijection, so incidence and overlap domains pull back exactly. Source abscissa remains the branch chart. The determinant sign transports oriented tangent crossings. Existing exact coefficient and selected-fiber decisions remain required and preserve their typed failures; no world implicitization or independent coordinate materialization is introduced.',
    'qualification': 'Seven new public witnesses cover quadratic translations/scales, a seventh-root scale, oblique maps with independent sqrt(2)/sqrt(3) coefficients, reflections, operand exchange and traversal, tangency, exact selected trim endpoints, excluded parameters, common components with repeated overlap clipping, distinct source supports separated by 2^-80, checked in-memory point replay, actual reached zero-work exhaustion, a larger retry and Certified policy transitions after dropping originals. Expanded world equations, exact source parameters and topology assertions provide independent expectations.',
    'limitations': [
        'This is bounded A2 progress, not arbitrary algebraic operation closure. General rational images, different-image polynomial pairs, algebraic topology coefficients, repeated/vertical components and implicit offsets/corners remain open.',
        'Checked point-definition replay is in memory and does not establish native archive replay in a fresh process.',
        'This branch is based on the point-location increment and excludes the separate region and horizontal-boundary increments. Its full repository pre-push qualification is still pending.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound total arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) process peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\\n')
''' + archive[end:]
archive = archive.replace('Record selected polynomial shared-region qualification', 'Record algebraic similarity native-line qualification')

receipt = adapt((root / 'prepare_polynomial_region_receipt.py').read_text())
start = receipt.index("text=f'''")
end = receipt.index("\np=checkout/'crates/hypercurve/FUTURE_WORK.md'", start)
receipt = receipt[:start] + '''text=f\'''**Algebraic similarity section increment (2026-10-27).** On committed
`{base[:10]}`, native-line queries against the selected quintic scaled by
`sqrt(2)` or translated by `(sqrt(3),sqrt(2))` reproduce
`Intersection/ImplicitPolynomial/Unsupported`. Original source-line controls
already succeed. The polynomial owner now lets the exact inverse similarity
feed the existing native-line section authority. P15 and P17–P20 require the
same original source equation, ordered fiber, parameter domain, selected
endpoints, overlap correspondence and retained image to survive the query.

A nonsingular similarity is bijective: contact and overlap pullbacks preserve
the original source abscissa, and its determinant transports oriented crossing
signs. Removing the rational-coefficient restriction adds no geometric carrier
or elimination path. Exact scalar and selected-field decisions remain required;
their undecided or exhausted outcomes keep their typed meaning.

Seven public witnesses cover the original failures, a seventh-root scale,
oblique maps using both `sqrt(2)` and `sqrt(3)`, reflection and all traversal
orders, tangency, selected trim endpoints, excluded parameters, common line
components, repeated overlap clipping and distinct `2^-80` source shifts.
Independent expanded world equations, exact source parameters and topology
assertions accompany checked in-memory point replay and further intersection.
Reached zero counted work returns exhaustion; a larger retry succeeds, and
STRICT/APPROXIMATE_512/STRICT retains Certified receipts after source drop.

Final checks pass: 2,745 Hypercurve tests (81 suites, 34 existing ignored),
43 root downstream tests and {passed:,} tests across six dependent packages
({ignored} existing ignored). Strict all-target/all-feature MSRV Clippy,
formatting, 16 matrix guards, 98 capability witnesses, typos, repository budget
and diff checks pass. Raw failures, source snapshots and exact commands are in
`{record}`, SHA-256 `{digest}`. All non-receipt source bytes remain identical
after this receipt.

General rational images, different-image polynomial pairs, broader topology
coefficient fields, repeated/vertical components and implicit offset/corner
closure remain open. Point-definition replay here is in memory, not a native
fresh-process archive. This branch excludes the separate region and horizontal
boundary increments. Counted work and external timeouts do not bound total
arithmetic, coefficient growth, retained memory or cancellation. No performance
improvement is claimed; full repository pre-push qualification remains pending.

\'''\n''' + receipt[end:]
receipt = receipt.replace("'**Polynomial shared-region increment'", "'**Algebraic similarity section increment'")
start = receipt.index("text=f'''", receipt.index("p=checkout/'docs/evidence-archive.md'"))
end = receipt.index("\nmarker='## Follow-on records", start)
receipt = receipt[:start] + '''text=f\'''The local `hypercurve-algebraic-similarity-evidence-2026-10-27` branch
ends at `{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records native-line sections through retained algebraic similarities with
original selected polynomial sources preserved. 2,745 Hypercurve tests,
43 root downstream tests, {passed:,} tests across six dependent packages,
strict MSRV Clippy, formatting, 16 matrix guards and 98 capability witnesses
pass. Expanded equations, exact parameters, tangency, overlap continuation,
selected trims, distinct nearby supports and actual exhaustion/retry are covered.
Original failed witnesses and raw source-attributed commands remain archived.
This record is local and unpushed. General image and algebraic operation closure
and fresh-process native replay remain open; full pre-push qualification is
still required before publication.

\'''\n''' + receipt[end:]

close = adapt((root / 'close_polynomial_region_increment.py').read_text())
close = close.replace('Admit selected polynomial branches to the shared region arrangement', 'Consume algebraic similarities in polynomial line sections')
persist = adapt((root / 'persist_polynomial_region_increment.py').read_text())

for filename, text in [
    ('archive_algebraic_similarity_evidence.py', archive),
    ('prepare_algebraic_similarity_receipt.py', receipt),
    ('close_algebraic_similarity_increment.py', close),
    ('persist_algebraic_similarity_increment.py', persist),
]:
    compile(text, filename, 'exec')
    p = root / filename
    assert not p.exists(), filename
    p.write_text(text)
print('Prepared guarded archive, receipt, commit and local persistence scripts; none were executed.')
