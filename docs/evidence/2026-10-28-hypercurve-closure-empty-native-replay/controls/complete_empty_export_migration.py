from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = root / 'empty-native-replay'
run = controls / 'empty-native-replay-qualification-empty1'
rows = json.loads((run / 'results.json').read_text())
assert rows[-1]['name'] == 'full-suite' and rows[-1]['exit_code'] == 101 and rows[-1]['source_stable']
log = (run / 'qualification-full-suite.log').read_text()
assert log.count(' ... FAILED') == 1
assert 'assertion failed: SvgGeometry2::empty().to_svg().is_err()' in log
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, _, patch = e.source_snapshot()
assert before == json.loads((run / 'source-after.json').read_text())
(controls / 'empty-export-migration-before.patch').write_bytes(patch)
p = checkout / 'crates/hypercurve/tests/hypercurve_svg.rs'
s = p.read_text()
old = '    assert!(SvgGeometry2::empty().to_svg().is_err());'
new = '''    // Empty native documents are valid successful geometry. The unit viewBox
    // supplies display dimensions without adding a geometric boundary.
    let empty = SvgGeometry2::empty().to_svg().unwrap();
    assert!(empty.contains("viewBox=\\"0 0 1 1\\""));
    assert!(empty.contains("data-hypercurve-path=\\"5:"));
    let replayed = import_svg_document(&empty).unwrap();
    assert!(replayed.region().is_empty());
    assert!(replayed.wires().is_empty() && replayed.paths().is_empty());
    assert_eq!(replayed.to_svg().unwrap(), empty);'''
assert s.count(old) == 1
p.write_text(s.replace(old, new))
p = checkout / 'docs/MIGRATIONS.md'
s = p.read_text()
needle = '## Fallible constructors and operations\n'
new = '''## Exact empty SVG documents

Hypercurve and CSGRS now export a valid exact empty region without strokes as
an SVG document. Previously this returned an error because the empty set has
no finite bounding box. The document uses a unit `viewBox` for display and a
version-five native graph with no definitions or roots; the viewport creates
no geometry. Native reimport returns the empty region, which remains a valid
operand for further operations. Callers that used export failure to detect
emptiness should inspect the geometry instead.

Invalid export options still fail. A region whose empty topology depends on
an approximate decision still fails strict exact export; removing its final
boundary does not certify its source geometry.

'''
assert s.count(needle) == 1 and '## Exact empty SVG documents' not in s
p.write_text(s.replace(needle, new + needle))
p = checkout / 'crates/hypercurve/CHANGELOG.md'
s = p.read_text()
needle = '## [0.4.0] - Unreleased\n'
new = '''
- Export and replay exact empty SVG documents through the native zero-root
  graph, using a unit display viewport. Empty topology retains consumed policy
  through Boolean identities, affine transforms and finite projection; strict
  consumers continue to reject inherited approximate topology.
'''
assert s.count(needle) == 1
p.write_text(s.replace(needle, needle + new))
subprocess.run(['cargo','+1.99.1','fmt','--all'], cwd=checkout, check=True)
after = e.source_snapshot()[0]
e.save_json(controls / 'empty-export-migration-applied.json', {
    'before':before, 'after':after, 'epoch':time.time(),
    'changed_paths':['crates/hypercurve/tests/hypercurve_svg.rs','docs/MIGRATIONS.md','crates/hypercurve/CHANGELOG.md'],
    'reason':'Document the intentional empty-export extension and replace the obsolete rejection with exact replay and deterministic serialization assertions. The original tight-circle resource rejection remains unchanged.',
    'production_bytes_unchanged':True,
})
print(json.dumps(after,sort_keys=True))
