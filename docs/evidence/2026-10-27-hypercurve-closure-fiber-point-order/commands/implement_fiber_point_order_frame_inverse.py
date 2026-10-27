from pathlib import Path
import json
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
(root/'fiber-point-order-angular-contract.json').write_text(json.dumps({
'baseline':'Prototype1 passes exact linear cancellation and every old point/circle test. Original midpoint now reaches Blocked(Unsupported), after the common-source circle residual is available.',
'owner':'Existing selected-circle rational half chart and shared point-form difference authority',
'domain':'A previously certified incident point whose common-field coordinate difference from the center reduces to represented constants, and a circle with a represented unit normal. Centers remain jointly selected points of arbitrary admitted degree. The coefficients may be algebraic Real values; no coordinate flattening of the center is required.',
'change':'Recover only proved constant displacements; reuse the exact normal/tangent inverse already used for analytic-parallel frame points. Preserve radius sign, half ownership, diameter endpoints and strict policy. More general selected angular fields keep the existing path and remain open when it lacks an algorithm.',
'acceptance':'Retain the original full positive program; add arbitrary points on the half, complements, endpoints, algebraic similarities, split/reversal and further replay.'},indent=2)+'\n')
p=checkout/'crates/hypercurve/src/bezier_offset/rational_form.rs';s=p.read_text();anchor='/// Compares a linear projection before separating correlated point coordinates.'
addition='''/// Recovers a represented displacement when common-field cancellation makes
/// both differences constant. This never materializes the original coordinates
/// or substitutes an enclosure for a nonconstant selected value.
pub(super) fn common_point_constant_displacement(
    first: &CurvePoint2,
    second: &CurvePoint2,
    policy: &CurveContext,
) -> CurveResult<Classification<Option<(Real, Real)>>> {
    let mut values = Vec::with_capacity(2);
    for numerator in [
        BivariatePolynomial::new(vec![vec![Real::zero()], vec![Real::one()]]),
        BivariatePolynomial::new(vec![vec![Real::zero(), Real::one()]]),
    ] {
        let one = BivariatePolynomial::new(vec![vec![Real::one()]]);
        let difference = match point_form_difference(
            PointFormSource2::new(first.clone(), numerator.clone(), one.clone()),
            PointFormSource2::new(second.clone(), numerator, one), policy,
        )? {
            Classification::Decided(form) => form,
            Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
        };
        let constant = |polynomial: &BivariatePolynomial| {
            polynomial.coefficients.iter().enumerate().all(|(i, row)| {
                row.iter().enumerate().all(|(j, coefficient)| {
                    (i == 0 && j == 0) || coefficient.definitely_zero()
                })
            }).then(|| polynomial.coefficients.first().and_then(|row| row.first()).cloned().unwrap_or_else(Real::zero))
        };
        let (Some(numerator), Some(denominator)) =
            (constant(&difference.numerator), constant(&difference.denominator))
        else {
            return Ok(Classification::Decided(None));
        };
        if let Classification::Uncertain(reason) = point_rational_denominator_sign(
            &difference.source, &difference.denominator, policy,
        )? {
            return Ok(Classification::Uncertain(reason));
        }
        values.push((numerator / denominator)?);
    }
    Ok(Classification::Decided(Some((values.remove(0), values.remove(0)))))
}

'''
assert anchor in s;s=s.replace(anchor,addition+anchor);p.write_text(s)
p=checkout/'crates/hypercurve/src/bezier_offset/cusp_semicircle.rs';s=p.read_text()
a=s.index('    pub(crate) fn parameter_at_certified_incident_point(')
b=s.index('        if let CurvePoint2(CurvePointData2::Endpoint(endpoint))',a)
helper='''        // The existing rational half chart uses normal coordinate n and
        // oriented tangent coordinate b: u=b/(r+n+b). Keep this inverse shared
        // by procedural frame points and proved constant displacements.
        let from_frame_coordinates = |normal: Real, tangent: Real| -> CurveResult<Option<(Real, bool)>> {
            Ok(match real_sign(&(&tangent * self.radial_distance()), &CurveContext::STRICT) {
                Some(RealSign::Zero) => {
                    match real_sign(&(&normal * self.radial_distance()), &CurveContext::STRICT) {
                        Some(RealSign::Positive) => Some((Real::zero(), false)),
                        Some(RealSign::Negative) => Some((Real::one(), false)),
                        _ => None,
                    }
                }
                Some(sign) => {
                    let complementary = sign == RealSign::Negative;
                    let radius = if complementary { -self.radial_distance().clone() } else { self.radial_distance().clone() };
                    Some(((&tangent / (radius + normal + &tangent))?, complementary))
                }
                None => None,
            })
        };
'''
s=s[:b]+helper+s[b:]
a=s.index('    pub(crate) fn parameter_at_certified_incident_point(')
b=s.index('            let parameter =\n                match real_sign',a)
c=s.index('            if let Some((parameter, complementary)) = parameter {',b)
s=s[:b]+'''            let parameter = from_frame_coordinates(normal, tangent)?;
'''+s[c:]
a=s.index('    pub(crate) fn parameter_at_certified_incident_point(')
b=s.index('        let radial = match BezierAlgebraicChord2::try_new_from_certified_distinct_endpoints(',a)
addition='''        let represented_normal = match self.data.frame.chord_normal() {
            Some(frame) => frame.anchor.certified_unit_tangent()
                .or_else(|| frame.anchor.certified_axis_direction().map(BezierAlgebraicChordAxisDirection2::unit_tangent))
                .map(|(x, y)| (-y, x)),
            None => self.data.frame.represented_unit_normal()?,
        };
        if let Some((normal_x, normal_y)) = represented_normal {
            match common_point_constant_displacement(point, &center, policy)? {
                Classification::Decided(Some((x, y))) => {
                    let normal = Real::dot2_refs([&x, &y], [&normal_x, &normal_y]);
                    let tangent = self.turn_sign() * (&normal_x * &y - &normal_y * &x);
                    if let Some((parameter, complementary)) = from_frame_coordinates(normal, tangent)? {
                        return Ok(Classification::Decided(publish(
                            BezierAlgebraicCuspSemicircleParameter2::Exact(parameter), complementary,
                        )));
                    }
                }
                Classification::Uncertain(UncertaintyReason::BudgetExhausted) => {
                    return Ok(Classification::Uncertain(UncertaintyReason::BudgetExhausted));
                }
                Classification::Decided(None) | Classification::Uncertain(_) => {}
            }
        }
'''
s=s[:b]+addition+s[b:];p.write_text(s)
