//! Fibers over retained query parameters share the selected-field solver.

use super::*;
use crate::selected_field::{self as field, FieldError, Value};
use hypersolve::selected_polynomial_field::SelectedPolynomialContext;
use hypersolve::OrderedFieldRootIsolationStatus;

fn resolve<T>(operation: impl FnOnce() -> field::Result<T>) -> ExactCurveResult<T> {
    ExactCurveError::decided(
        CurveOperation2::Evaluation,
        field::finish(operation).map_err(|cause| {
            ExactCurveError::invalid(
                CurveOperation2::Evaluation, crate::CurveFamily2::ImplicitPolynomial, cause,
            )
        })?,
    )
}

fn coefficients(
    equation: &BivariatePolynomial,
    parameter: &CurveParameter2,
    policy: &CurveContext,
) -> field::Result<(Value, Vec<Value>)> {
    let query = field::available(parameter.as_polynomial_query())?.query();
    // Re-evaluate the original recipe, including its denominator. The stored
    // enclosure and a serialized singleton flag are not selection evidence.
    let x = crate::bezier_offset::selected_field_query(&query, policy)?;
    let degree = equation.coefficients.iter().map(Vec::len).max().unwrap_or(0);
    let coefficients = (0..degree).map(|power| {
        let coefficients = equation.coefficients.iter()
            .map(|row| row.get(power).cloned().unwrap_or_else(Real::zero)).collect::<Vec<_>>();
        field::polynomial(&coefficients, &x)
    }).collect::<field::Result<Vec<_>>>()?;
    Ok((x, coefficients))
}

impl PolynomialPoint2 {
    pub(crate) fn query_fiber_roots(
        equation: &BivariatePolynomial,
        parameter: &CurveParameter2,
        domain: &[Real; 2],
        refinement_steps: usize,
        policy: &CurveContext,
    ) -> ExactCurveResult<Vec<IsolatedRootInterval>> {
        let strict = policy.strict_counterpart();
        resolve(|| {
            let (x, coefficients) = coefficients(equation, parameter, &strict)?;
            let mut context = SelectedPolynomialContext { field: x.field().clone(), policy: &strict };
            let report = hypersolve::isolate_ordered_field_polynomial_roots_complete(
                coefficients, &domain[0], &domain[1], refinement_steps, &mut context,
            )?;
            match report.status {
                OrderedFieldRootIsolationStatus::Isolated => Ok(report.intervals),
                OrderedFieldRootIsolationStatus::BudgetExhausted => Err(FieldError::Uncertain(UncertaintyReason::BudgetExhausted)),
                OrderedFieldRootIsolationStatus::InvalidInterval => Err(FieldError::InvalidSelector),
                OrderedFieldRootIsolationStatus::IdenticallyZero => Err(FieldError::ZeroPolynomial),
                OrderedFieldRootIsolationStatus::CompleteFallbackRequired => Err(FieldError::Uncertain(UncertaintyReason::Unsupported)),
            }
        })
    }

    pub(crate) fn from_parameter_fiber(
        equation: BivariatePolynomial,
        parameter: CurveParameter2,
        roots: &[IsolatedRootInterval],
        policy: &CurveContext,
    ) -> ExactCurveResult<Vec<CurvePoint2>> {
        if let Some(base) = parameter.as_bezier_parameter() {
            return Self::from_fiber(equation, base.clone(), roots);
        }
        let strict = policy.strict_counterpart();
        resolve(|| {
            let (x, coefficients) = coefficients(&equation, &parameter, &strict)?;
            let parent = x.field();
            // A zero fiber is not a singleton even with a claimed exact root.
            let mut nonzero = false;
            for coefficient in &coefficients {
                nonzero |= field::decided(coefficient.sign(&strict)?)? != hyperreal::RealSign::Zero;
            }
            if !nonzero { return Err(FieldError::ZeroPolynomial); }
            roots.iter().map(|root| {
                let values = if let Some(exact) = &root.exact_root {
                    if crate::classify::compare_reals(&root.lower, exact, &strict) != Some(Ordering::Equal)
                        || crate::classify::compare_reals(&root.upper, exact, &strict) != Some(Ordering::Equal) {
                        return Err(FieldError::InvalidSelector);
                    }
                    let y = parent.constant(exact.clone())?;
                    let point = [x.clone(), y];
                    if field::decided(field::bivariate(&equation, &point)?.sign(&strict)?)? != hyperreal::RealSign::Zero {
                        return Err(FieldError::NoRoot);
                    }
                    point
                } else {
                    let selected = field::decided(parent.select(
                        coefficients.clone(), root.lower.clone(), root.upper.clone(), &strict,
                    )?)?;
                    [selected.lift(&x)?, selected.generator()?]
                };
                Ok(Self::from_joint_values(
                    crate::CurvePointDefinition2::PolynomialFiber {
                        equation: equation.clone(), parameter: parameter.clone(),
                        root: IsolatedRootInterval { distinct_root_count: 1, ..root.clone() },
                    }, values,
                ))
            }).collect()
        })
    }
}
