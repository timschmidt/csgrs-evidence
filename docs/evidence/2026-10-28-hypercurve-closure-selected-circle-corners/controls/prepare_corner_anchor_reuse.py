from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
checkout = (root / 'empty-native-replay').resolve()
controls = root / 'controls'
record = controls / 'corner-anchor-reuse-prepared.json'
assert not record.exists()
baseline = controls / 'selected-circle-corners-qualification-corner4'
log = (baseline / 'qualification-full-suite.log').read_text()
assert '---- algebraic_chords_survive_nonsingular_exact_affine_transforms stdout ----' in log
assert 'the exact-center chord join must exercise its retained chord-frame fallback' in log
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec); spec.loader.exec_module(e)
before, _, patch = e.source_snapshot()
(controls / 'corner-anchor-reuse-before.patch').write_bytes(patch)
p = checkout / 'crates/hypercurve/src/bezier_region/offset_joins.rs'
text = p.read_text()
old = '''    let chord_frame = || {
        crate::bezier_offset::BezierAlgebraicCuspSemicircle2::from_retained_center_and_chord_normal('''
new = '''    let chord_frame = |represented_fallback| {
        #[cfg(feature = "dispatch-trace")]
        if represented_fallback {
            hyperreal::dispatch_trace::record(
                "hypercurve",
                "curve-region-exact-offset-join",
                "selected-chord-pair-round-chord-frame-fallback",
            );
        }
        #[cfg(not(feature = "dispatch-trace"))]
        let _ = represented_fallback;
        crate::bezier_offset::BezierAlgebraicCuspSemicircle2::from_retained_center_and_chord_normal('''
assert text.count(old) == 1
text = text.replace(old, new)
old = '''    let (selected, represented_frame) = if let Some((tangent_x, tangent_y)) =
        represented_unit_tangent.as_ref()
    {'''
new = '''    // Keep the original chord as the frame when the center needs the
    // general carrier. The generic unit-normal constructor would otherwise
    // build a new direction chord and discard this available source relation.
    let (selected, represented_frame) = if let Some((tangent_x, tangent_y)) =
        represented_unit_tangent.as_ref()
        && matches!(&previous.source_end, CurvePoint2(CurvePointData2::Algebraic(_)))
    {'''
assert text.count(old) == 1
text = text.replace(old, new)
old = '''                #[cfg(feature = "dispatch-trace")]
                hyperreal::dispatch_trace::record(
                    "hypercurve",
                    "curve-region-exact-offset-join",
                    "selected-chord-pair-round-chord-frame-fallback",
                );
                (chord_frame()?, false)'''
assert text.count(old) == 1
text = text.replace(old, '                (chord_frame(true)?, false)')
assert text.count('        (chord_frame()?, false)') == 1
text = text.replace('        (chord_frame()?, false)', '        (chord_frame(represented_unit_tangent.is_some())?, false)')
p.write_text(text)
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=checkout, check=True)
after, _, _ = e.source_snapshot()
record.write_text(json.dumps({'owner': 'Hypercurve selected chord-pair round-join frame selection', 'properties': ['P12', 'P15', 'P18', 'P19', 'P20'], 'domain': 'Existing exact affine-transformed algebraic chords and their round offset joins, including exact centers and one-field centers.', 'reproduced_failure': 'The unchanged affine-chord regression no longer reaches its required original chord-frame path because the newly general unit-normal constructor builds a replacement direction chord.', 'change': 'Reuse the already retained chord-normal frame for centers outside the native one-field representation. Keep the generic constructor available to consumers without an original chord. The original dispatch assertion and geometric assertions remain unchanged.', 'before': before, 'after': after, 'primary_source_unchanged': True, 'epoch': time.time()}, indent=2) + '\n')
print(record.read_text())
