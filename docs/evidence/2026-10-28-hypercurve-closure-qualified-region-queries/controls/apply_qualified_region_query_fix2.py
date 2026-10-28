from pathlib import Path
import ast
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
controls = Path(__file__).resolve().parent
checkout = controls.parent / 'qualified-region-queries'
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, _, patch = e.source_snapshot()
assert before['tree_sha256'] == '4c03986039ab0766b27c454ba473da36ebf94347f42e336f40c1c3dff8e2db92'
(controls / 'qualified-region-query-fix2-before.patch').write_bytes(patch)
path = checkout / 'crates/hypercurve/src/bezier_region.rs'
source = path.read_text()
needle = '''            |attempt| -> CurveResult<Classification<Option<LineArcRegion2>>> {
                match self.retained_native_line_arc_region(attempt)? {'''
replacement = '''            |attempt| -> CurveResult<Classification<Option<LineArcRegion2>>> {
                // The cache tries strict evaluation first. An inherited policy
                // barrier is uncertainty here, so an authorized approximate
                // request can continue without certifying its native view.
                match ExactCurveError::classify_result(
                    self.validate_regularized_topology_replay(
                        CurveOperation2::NativeTopology,
                        attempt,
                    ),
                )? {
                    Classification::Decided(()) => {}
                    Classification::Uncertain(reason) => {
                        return Ok(Classification::Uncertain(reason));
                    }
                }
                match self.retained_native_line_arc_region(attempt)? {'''
assert source.count(needle) == 1
path.write_text(source.replace(needle, replacement))
subprocess.run(['rustfmt', '+1.99.1', '--edition', '2024', str(path)], cwd=checkout, check=True)
after, _, _ = e.source_snapshot()
e.save_json(controls / 'qualified-region-query-fix2-applied.json', {
    'before': before, 'after': after, 'epoch': time.time(),
    'cause': 'Native cache strict trial surfaced an inherited policy barrier as CurveError, preventing authorized approximate evaluation.',
    'fix': 'Translate the policy barrier into Classification uncertainty inside the cache evaluator; retain the outer guard before cached replay.',
    'acceptance': 'All eight original public probes remain unchanged, including strict/approximate/strict sequences and independent positive-height source proof.',
})
print(json.dumps(after, sort_keys=True))
