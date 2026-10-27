//! Rational substitution proposes sections; original fibers select contacts.

use std::cmp::Ordering;

use hyperreal::RealSign;
use hypersolve::BivariatePolynomial;
use hypersolve::bivariate_arithmetic::{
    bivariate_active_total_degree, bivariate_homogeneous_compose, bivariate_parameter_derivative,
    polynomial_add, polynomial_derivative, polynomial_multiply, polynomial_subtract,
};

use super::*;
use crate::bezier_parameter::signed_coefficients_at_parameter;
use crate::bezier_split::CurveParameterDomain2;
use crate::curve::polynomial_is_zero;
use crate::curve_support::CurveSupport2;
use crate::{BezierParameterPolynomial, BezierSplitFragment2, CurveFamily2};

fn invalid(cause: CurveError) -> ExactCurveError {
    ExactCurveError::invalid(
        CurveOperation2::Intersection,
        CurveFamily2::ImplicitPolynomial,
        cause,
    )
}

fn blocked(reason: UncertaintyReason) -> ExactCurveError {
    ExactCurveError::blocked(
        CurveOperation2::Intersection,
        CurveFamily2::ImplicitPolynomial,
        reason,
    )
}

fn decided<T>(result: CurveResult<Classification<T>>) -> ExactCurveResult<T> {
    match result.map_err(invalid)? {
        Classification::Decided(value) => Ok(value),
        Classification::Uncertain(reason) => Err(blocked(reason)),
    }
}

fn compose(
    polynomial: &BivariatePolynomial,
    x: &[Real],
    y: &[Real],
    w: &[Real],
    degree: usize,
) -> ExactCurveResult<Vec<Real>> {
    let univariate = |coefficients: &[Real]| {
        BivariatePolynomial::new(
            coefficients
                .iter()
                .cloned()
                .map(|value| vec![value])
                .collect(),
        )
    };
    let substituted = bivariate_homogeneous_compose(
        polynomial,
        &univariate(x),
        &univariate(y),
        &univariate(w),
        degree,
    )
    .ok_or_else(|| blocked(UncertaintyReason::Unsupported))?;
    Ok(substituted
        .coefficients
        .into_iter()
        .map(|row| row.into_iter().next().unwrap_or_else(Real::zero))
        .collect())
}

struct Section {
    equation: Vec<Real>,
    fy: Vec<Real>,
    cross: Vec<Real>,
}

impl Section {
    fn new(equation: &BivariatePolynomial, curve: &RationalBezier2) -> ExactCurveResult<Self> {
        let basis = curve.homogeneous_power_basis().map_err(invalid)?;
        let (x, y, w) = (&basis.x_numerator, &basis.y_numerator, &basis.weight);
        let degree = |polynomial: &BivariatePolynomial| {
            bivariate_active_total_degree(polynomial)
                .ok_or_else(|| blocked(UncertaintyReason::Unsupported))
        };
        let fx =
            bivariate_parameter_derivative(equation, hypersolve::CurveResultantParameter::First);
        let fy =
            bivariate_parameter_derivative(equation, hypersolve::CurveResultantParameter::Second);
        let gradient_degree = degree(&fx)?.max(degree(&fy)?);
        let fx = compose(&fx, x, y, w, gradient_degree)?;
        let fy = compose(&fy, x, y, w, gradient_degree)?;
        let dw = polynomial_derivative(w);
        let derivative = |numerator: &[Real]| {
            polynomial_subtract(
                &polynomial_multiply(&polynomial_derivative(numerator), w),
                &polynomial_multiply(numerator, &dw),
            )
        };
        let cross = polynomial_add(
            &polynomial_multiply(&fx, &derivative(x)),
            &polynomial_multiply(&fy, &derivative(y)),
        );
        Ok(Self {
            equation: compose(equation, x, y, w, degree(equation)?)?,
            fy,
            cross,
        })
    }

    fn cross(
        &self,
        parameter: &BezierParameter2,
        policy: &CurveContext,
    ) -> ExactCurveResult<Option<RealSign>> {
        let sign = |coefficients: &[Real]| match signed_coefficients_at_parameter(
            coefficients,
            parameter,
            policy,
        )
        .map_err(invalid)?
        {
            Classification::Decided(sign) => Ok(Some(sign)),
            Classification::Uncertain(UncertaintyReason::BudgetExhausted) => {
                Err(blocked(UncertaintyReason::BudgetExhausted))
            }
            Classification::Uncertain(_) => Ok(None),
        };
        let Some(fy) = sign(&self.fy)? else {
            return Ok(None);
        };
        if fy == RealSign::Zero {
            return Ok(None);
        }
        Ok(sign(&self.cross)?.map(|value| {
            if fy == RealSign::Negative {
                negate(value)
            } else {
                value
            }
        }))
    }
}

fn negate(value: RealSign) -> RealSign {
    match value {
        RealSign::Positive => RealSign::Negative,
        RealSign::Negative => RealSign::Positive,
        RealSign::Zero => RealSign::Zero,
    }
}

fn branch_parameter(
    curve: &Curve2,
    point: &CurvePoint2,
    policy: &CurveContext,
) -> ExactCurveResult<Option<CurveParameter2>> {
    let value = decided(crate::bezier_offset::point_affine_form_parameter(
        point,
        &[Real::one(), Real::zero(), Real::zero()],
        policy,
    ))?;
    for (boundary, outside) in [
        (curve.parameter_domain().start(), Ordering::Less),
        (curve.parameter_domain().end(), Ordering::Greater),
    ] {
        match decided(value.cmp_by_refinement(boundary, policy))? {
            Ordering::Equal => return Ok(Some(boundary.clone())),
            order if order == outside => return Ok(None),
            _ => {}
        }
    }
    Ok(Some(value))
}

fn append_contact(
    contacts: &mut Vec<CurveIntersectionContact2>,
    contact: CurveIntersectionContact2,
    policy: &CurveContext,
) -> ExactCurveResult<()> {
    for previous in contacts.iter() {
        let same = |a: &CurveLocation2, b: &CurveLocation2| -> ExactCurveResult<bool> {
            let a = decided(a.parameter_with_policy(policy))?;
            let b = decided(b.parameter_with_policy(policy))?;
            Ok(decided(a.cmp_by_refinement(&b, policy))? == Ordering::Equal)
        };
        if same(&previous.first, &contact.first)? && same(&previous.second, &contact.second)? {
            return Ok(());
        }
    }
    contacts.push(contact);
    Ok(())
}

pub(super) fn intersect(
    first: &Curve2,
    second: &Curve2,
    policy: &CurveContext,
) -> ExactCurveResult<Option<CurveIntersectionResult2>> {
    let (branch_curve, curve, branch_first) =
        match (first.polynomial_branch(), second.polynomial_branch()) {
            (Some(_), None) => (first, second, true),
            (None, Some(_)) => (second, first, false),
            _ => return Ok(None),
        };
    let branch = branch_curve
        .polynomial_branch()
        .expect("selected polynomial dispatch");
    if !branch.is_source_image() {
        return Ok(None);
    }
    let strict = policy.strict_counterpart();
    let policy = &strict;
    let spans = curve.source_spans(policy, CurveOperation2::Intersection)?;
    let mut contacts = Vec::new();
    for (span_index, span) in spans.iter().enumerate() {
        let Some(rational) =
            decided(CurveSupport2::from_fragment(&span.fragment).exact_rational_component(policy))?
        else {
            return Ok(None);
        };
        let section = Section::new(branch.topology().equation(), &rational)?;
        if polynomial_is_zero(&section.equation, policy)? {
            // A continuous section needs selected component correspondence.
            // It must never be published as a finite or empty result.
            return Ok(None);
        }
        if polynomial_is_zero(section.equation.get(1..).unwrap_or(&[]), policy)? {
            continue;
        }
        let range = if matches!(span.fragment, BezierSplitFragment2::Materialized { .. }) {
            CurveParameterRange2::unit()
        } else {
            span.fragment.curve_region_parameter_range()
        };
        let envelope = decided(rational.finite_discovery_envelope(&range, policy))?;
        let (lower, upper) = envelope
            .scalar_endpoints()
            .expect("finite discovery envelope is represented");
        let polynomial = decided(BezierParameterPolynomial::try_new_power_basis_with_policy(
            section.equation.clone(),
            policy,
        ))?;
        let candidates = decided(polynomial.isolate_interval_roots(lower, upper, policy))?;
        let fragment = span.curve();
        for candidate in candidates {
            let parameter = CurveParameter2::from(candidate.clone());
            if !decided(
                CurveParameterDomain2::new(&range, None)
                    .contains_finite_parameter(&parameter, policy),
            )? {
                continue;
            }
            let point = fragment
                .point_at_with_policy(&parameter, policy)?
                .into_value();
            let Some(source_parameter) = branch_parameter(branch_curve, &point, policy)? else {
                continue;
            };
            let source_point = branch_curve
                .point_at_with_policy(&source_parameter, policy)?
                .into_value();
            match point.same_point(&source_point, policy) {
                Classification::Decided(false) => continue,
                Classification::Decided(true) => {}
                Classification::Uncertain(reason) => return Err(blocked(reason)),
            }
            let branch_location = CurveLocation2::new(
                0,
                CurveSpanRange2::from_affine_chart(&Real::one(), &Real::zero()),
                source_parameter,
            );
            let location = CurveLocation2::new(span_index, span.chart(), parameter);
            let flip = branch.is_reversed() ^ span.fragment.source_is_reversed() ^ !branch_first;
            let cross = section
                .cross(&candidate, policy)?
                .map(|value| if flip { negate(value) } else { value });
            let (first, second) = if branch_first {
                (branch_location, location)
            } else {
                (location, branch_location)
            };
            append_contact(
                &mut contacts,
                CurveIntersectionContact2 {
                    first,
                    second,
                    point: source_point,
                    tangent_cross_sign: cross,
                    certified_transverse: cross.is_some_and(|sign| sign != RealSign::Zero),
                },
                policy,
            )?;
        }
    }
    Ok(Some(CurveIntersectionResult2 {
        data: Arc::new(CurveIntersectionResultData {
            span_pair_count: spans.len(),
            contacts: contacts.into(),
            overlaps: Arc::from([]),
            blockers: Arc::from([]),
            parameter_components: None,
        }),
    }))
}
