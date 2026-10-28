from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = root / 'qualified-region-adapters'
rows = json.loads((controls / 'qualified-region-adapter-baseline1/results.json').read_text())
assert [row['exit_code'] for row in rows] == [0, 0, 101, 0]
assert all(row['source_stable'] for row in rows)
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, _, patch = e.source_snapshot()
assert before == json.loads((controls / 'qualified-region-adapter-baseline1/source-after.json').read_text())
(controls / 'qualified-region-adapter-before.patch').write_bytes(patch)
p = checkout / 'src/curve/native.rs'
s = p.read_text()
start = s.index('pub fn contains_xy_with_context(')
end = s.index('/// Returns certified planar bounds', start)
part = s[start:end]
needle = '''    if input.is_empty() {
        return Ok(decisions.finish(Some(false)));
    }
'''
assert part.count(needle) == 1
s = s[:start] + part.replace(needle, '') + s[end:]
needle = '/// undecided classifications retain their native error and context.\n'
assert s.count(needle) == 1
s = s.replace(needle, needle + '/// Empty regions retain any inherited topology qualification.\n')
p.write_text(s)
p = checkout / 'CHANGELOG.md'
s = p.read_text()
needle = '- A unit cube rotated successively'
assert s.count(needle) == 1
p.write_text(s.replace(needle, '- Planar membership validates inherited topology even for empty regions. Strict\n  queries keep typed undecided errors; authorized approximate queries retain\n  their consumed certainty through the CSGRS wrapper.\n' + needle))
tests = '''#![cfg(feature = "curve")]

use hypercurve::{
    Curve2, CurveCertainty, CurvePath2, CurveRegion2, FillRule, Point2,
    PredicatePolicy, QuadraticBezier2, Real,
};

fn point(x: i32, y: i32) -> Point2 {
    Point2::new(x.into(), y.into())
}
'''
fixture = (controls / 'qualified-region-query-tests.rs').read_text()
tests += fixture[:fixture.index('fn check_qualified_region_query')]
fixture = (controls / 'qualified-region-query-controls.rs').read_text()
tests += fixture[:fixture.index('#[test]')]
tests += (controls / 'qualified-region-adapter-tests.rs').read_text()
tests += (controls / 'qualified-region-adapter-controls.rs').read_text()
p = checkout / 'tests/qualified_region_queries.rs'
assert not p.exists()
p.write_text(tests)
p = checkout / 'tests/wasm/geometry_certainty.cjs'
s = p.read_text()
needle = '  const square = keep(CurveRegionJs.square(1));\n'
assert s.count(needle) == 1
addition = '''  const removal = keep(square.differenceWithContext(square, false));
  assert.equal(removal.certainty, Certainty.Certified);
  owned.pop();
  const removed = keep(removal.intoRegion());
  for (const source of [empty, removed]) {
    assert.equal(source.containsXY(1, 0), false);
    for (const approximate of [false, true, false]) {
      const query = keep(source.containsXYWithContext(1, 0, approximate));
      assert.equal(query.status, Status.Decided);
      assert.equal(query.value, false);
      assert.equal(query.certainty, Certainty.Certified);
      const bounds = keep(source.boundingBoxWithContext(approximate));
      assert.equal(bounds.isEmpty, true);
      assert.equal(bounds.certainty, Certainty.Certified);
    }
  }
'''
p.write_text(s.replace(needle, needle + addition))
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=checkout, check=True)
subprocess.run(['git','add','-N','tests/qualified_region_queries.rs'], cwd=checkout, check=True)
after = e.source_snapshot()[0]
e.save_json(controls / 'qualified-region-adapter-applied.json', {
    'before':before, 'after':after, 'epoch':time.time(),
    'owner':'CSGRS native membership wrapper delegates to the existing CurveRegion2 query.',
    'new_root_tests':3, 'new_javascript_controls':'Canonical and Boolean-generated exact empty membership and bounds under strict/approximate/strict requests.',
    'limitation':'The symbolic source receipt fixture is exercised through public Rust APIs; the JavaScript controls exercise exact empty geometry through the generated ABI, not the symbolic source fixture.',
})
print(json.dumps(after,sort_keys=True))
