from pathlib import Path
import json
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-point-fillets'
result = json.loads((c / 'selected-point-regressions-gauge-owners-baseline1/results.json').read_text())
assert [row['exit_code'] for row in result] == [0, 101, 101]
p = w / 'crates/hypercurve/src/bezier_offset/algebraic_chord/points.rs'
s = p.read_text()
s = s.replace('recursive_projective_evidence_points(&endpoints, policy)', 'positive_recursive_projective_evidence_points(&endpoints, policy)')
old = """        let point = match tangent_cross_sign {
            RealSign::Positive => point,"""
new = """        // The cross-sign certificate names the two finite traversals.
        // The compact line equations above use their retained supports;
        // transport the sign through either reversal before normalization.
        let tangent_cross_sign = if self.data.first.retained_support_orientation_is_reversed()
            ^ self.data.second.retained_support_orientation_is_reversed()
        {
            product_sign(tangent_cross_sign, RealSign::Negative)
        } else {
            tangent_cross_sign
        };
        let point = match tangent_cross_sign {
            RealSign::Positive => point,"""
assert s.count(old) == 1
s = s.replace(old, new)
p.write_text(s)
p = w / 'crates/hypercurve/src/bezier_offset/recursive_quadratic.rs'
s = p.read_text()
old = """        CurvePoint2(CurvePointData2::AlgebraicChordPair(_))
        | CurvePoint2(CurvePointData2::AlgebraicCuspChord(_))
        | CurvePoint2(CurvePointData2::AlgebraicCuspChordDerived(_))
        | CurvePoint2(CurvePointData2::AlgebraicChordParallel(_))
        | CurvePoint2(CurvePointData2::AnalyticParallel(_)) => {
            Ok(Classification::Decided(RealSign::Positive))
        }
"""
new = """        CurvePoint2(CurvePointData2::AlgebraicChordParallel(point)) => {
            // Importing a cardinal displacement can reuse a translated
            // authored algebraic point, including its signed weight. Match
            // the exact representation chosen by the source importer.
            if point.data.source.certified_axis_direction().is_some()
                && let Some(cardinal) = point.strict_cardinal_point_evidence(policy)?
            {
                return recursive_projective_evidence_denominator_sign(&cardinal, policy);
            }
            Ok(Classification::Decided(RealSign::Positive))
        }
        CurvePoint2(CurvePointData2::AlgebraicChordPair(_))
        | CurvePoint2(CurvePointData2::AlgebraicCuspChord(_))
        | CurvePoint2(CurvePointData2::AlgebraicCuspChordDerived(_))
        | CurvePoint2(CurvePointData2::AnalyticParallel(_)) => {
            Ok(Classification::Decided(RealSign::Positive))
        }
"""
assert s.count(old) == 1
s = s.replace(old, new)
p.write_text(s)
p = w / 'crates/hypercurve/CHANGELOG.md'
s = p.read_text()
s = s.replace('## [0.4.0] - Unreleased\n', '## [0.4.0] - Unreleased\n\n- Normalize signed homogeneous point weights before shared orientation and\n  coordinate predicates. Supporting-line intersections transport their tangent\n  certificate through retained-support reversals, and cardinal displacements\n  preserve the sign of the imported endpoint representation.\n', 1)
p.write_text(s)
p = w / 'docs/MIGRATIONS.md'
s = p.read_text()
marker = 'These changes alter represented sets, coordinates, file lengths or checksums.\n'
entry = '\n- **Shared selected-point queries (2026-10-29).** Independent rational queries\n  over admitted selected fields can now compose exactly while preserving each\n  original selector and denominator guard. Callers that previously handled\n  `Blocked(Unsupported)` for different selectors may receive certified results;\n  opposite roots remain distinct. `CurvePointDefinition2::RationalQueryPair`\n  and `CurveError::UncertainFiniteCurveProjection` require new exhaustive-match\n  arms. Native SVG graph tags 26 and 27 retain query-pair points and source-bound\n  query parameters. Older readers reject these tags; existing records keep\n  their encoding. HyperBRep archives retain the corresponding source recipes.\n  Replay validates source references, selectors and original guards, including\n  unused definitions. This capability does not complete general algebraic\n  region operations or their resource envelope.\n'
assert marker in s
s = s.replace(marker, marker + entry, 1)
p.write_text(s)
p = c / 'probe_selected_point_regressions.py'
s = p.read_text()
marker = "cases = [\n"
assert s.count(marker) == 1
s = s.replace(marker, marker + "    ('hypercurve', 'bezier_offset::projective_gauge_tests::reversed_support_intersections_keep_positive_recursive_weights'),\n    ('hypercurve', 'bezier_offset::projective_gauge_tests::cardinal_displacements_retain_the_imported_weight_sign'),\n")
p.write_text(s)
