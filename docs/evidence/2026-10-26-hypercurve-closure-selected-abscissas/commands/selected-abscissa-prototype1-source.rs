//! Evaluate a polynomial fiber over the retained source of its abscissa.

use super::*;
use crate::CurvePointDefinition2;
use hypersolve::BivariatePolynomial;
use hypersolve::bivariate_arithmetic::{
    bivariate_outer_product, bivariate_substitute_first_rational,
};

/// Pulls F(x,y) back through x=N(t)/D(t), keeping the original selected t.
/// A nonzero D(t) makes the ordered y fibers identical, so the source slab's
/// root census and branch ordinal remain authoritative. No global eliminant
/// or independently selected x coordinate is needed.
pub(super) fn pullback(
    equation: &BivariatePolynomial,
    value: &CurveParameter2,
    policy: &CurveContext,
) -> ExactCurveResult<(BezierParameter2, BivariatePolynomial, crate::RationalMap2)> {
    let form = value
        .affine_form_source()
        .ok_or_else(|| blocked(UncertaintyReason::Unsupported))?;
    let (base, x, y, denominator) = match form.source().definition()? {
        CurvePointDefinition2::Rational { source, parameter } => {
            rational_source(&source, &parameter)?
        }
        CurvePointDefinition2::RationalExpression {
            parameter,
            x_numerator,
            y_numerator,
            denominator,
        } => (parameter, x_numerator, y_numerator, denominator),
        CurvePointDefinition2::Parallel { source, parameter }
            if source.distance().definitely_zero() =>
        {
            rational_source(
                &source.source().to_rational_bezier().map_err(invalid)?,
                &parameter,
            )?
        }
        _ => return Err(blocked(UncertaintyReason::Unsupported)),
    };
    let guard = decided(
        crate::bezier_parameter::signed_coefficients_at_parameter(&denominator, &base, policy)
            .map_err(invalid)?,
    )?;
    if guard == RealSign::Zero {
        return Err(invalid(CurveError::ZeroRationalPointDenominator));
    }
    let [a, b, c] = form.coefficients();
    let zero = Real::zero();
    let numerator: Vec<_> = (0..x.len().max(y.len()).max(denominator.len()))
        .map(|i| {
            Real::dot2_refs(
                [a, b],
                [x.get(i).unwrap_or(&zero), y.get(i).unwrap_or(&zero)],
            ) + c * denominator.get(i).unwrap_or(&zero)
        })
        .collect();
    let pulled = bivariate_substitute_first_rational(equation, &numerator, &denominator);
    let map = crate::RationalMap2::new(
        [
            bivariate_outer_product(&numerator, &[Real::one()]),
            bivariate_outer_product(&denominator, &[Real::zero(), Real::one()]),
        ],
        bivariate_outer_product(&denominator, &[Real::one()]),
    );
    Ok((base, pulled, map))
}

type RationalSource = (BezierParameter2, Vec<Real>, Vec<Real>, Vec<Real>);

fn rational_source(
    source: &RationalBezier2,
    parameter: &CurveParameter2,
) -> ExactCurveResult<RationalSource> {
    let base = parameter
        .as_bezier_parameter()
        .ok_or_else(|| blocked(UncertaintyReason::Unsupported))?
        .clone();
    let basis = source.homogeneous_power_basis().map_err(invalid)?;
    Ok((base, basis.x_numerator, basis.y_numerator, basis.weight))
}
