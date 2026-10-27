from pathlib import Path
import json
r=Path('/tmp/hypercurve-closure-prepush'); c=Path('/tmp/hypercurve-closure-algebraic-similarities')
results=json.loads((r/'algebraic-pair-diagnostic4-results.json').read_text())
assert len(results)==1 and results[0]['source_stable'] and results[0]['outcome']=='external_timeout'
# Remove temporary diagnostics, retaining their original frozen snapshots.
(c/'crates/hypercurve/src/bezier_offset/fiber_sign.rs').write_bytes((r/'algebraic-pair-pre-diagnostic-fiber-sign.rs').read_bytes())
(c/'crates/hypercurve/tests/polynomial_algebraic_pairs.rs').write_bytes((r/'algebraic-pair-pre-diagnostic-test.rs').read_bytes())
p=c/'crates/hypersolve/src/curve_resultant.rs';s=p.read_text();old='fn normalize_bivariate_projective_scale(\n';assert s.count(old)==1;s=s.replace(old,'pub(crate) fn normalize_bivariate_projective_scale(\n');p.write_text(s)
p=c/'crates/hypersolve/src/algebraic_fiber.rs';s=p.read_text();old='fn count_common_fiber_roots(\n';assert s.count(old)==1
wrapper="""/// Keep a nonzero scalar equation factor out of a selected-field GCD when
/// the original arithmetic did not decide. Every coefficient ratio must have
/// an exact rational proof; a declined projection leaves the original outcome.
fn rational_projective_fiber_equation(
    polynomial: &BivariatePolynomial,
) -> Option<Cow<'_, BivariatePolynomial>> {
    if polynomial.coefficients.iter().flatten().all(|coefficient| {
        coefficient.exact_rational_ref().is_some()
    }) {
        return Some(Cow::Borrowed(polynomial));
    }
    let (mut normalized, _) =
        crate::curve_resultant::normalize_bivariate_projective_scale(polynomial)?;
    for coefficient in normalized.coefficients.iter_mut().flatten() {
        *coefficient = coefficient.exact_rational_normal_form()?.into();
    }
    Some(Cow::Owned(normalized))
}

fn count_common_fiber_roots(
    first: &BivariatePolynomial,
    second: &BivariatePolynomial,
    retained_parameter: CurveResultantParameter,
    fiber_lower: &Real,
    fiber_upper: &Real,
    endpoints: FiberIntervalEndpoints,
    field: &mut LocalAlgebraicField,
) -> Result<LocalRootCountOutcome, LocalFieldError> {
    let outcome = count_common_fiber_roots_once(
        first, second, retained_parameter, fiber_lower, fiber_upper, endpoints, field,
    );
    if !matches!(outcome, Err(LocalFieldError::Undecided)) {
        return outcome;
    }
    let (Some(first), Some(second)) = (
        rational_projective_fiber_equation(first),
        rational_projective_fiber_equation(second),
    ) else {
        return outcome;
    };
    if matches!(&first, Cow::Borrowed(_)) && matches!(&second, Cow::Borrowed(_)) {
        return outcome;
    }
    // Projective normalization proves its scalar divisor nonzero under STRICT.
    // It is independent of both parameters, so it preserves common roots and
    // multiplicities on this same selected sheet, including degree drops.
    count_common_fiber_roots_once(
        &first, &second, retained_parameter, fiber_lower, fiber_upper, endpoints, field,
    )
}

"""
s=s.replace(old,wrapper+'fn count_common_fiber_roots_once(\n');p.write_text(s)
for source,target in [('run_algebraic_pair_solver_baseline3.py','run_algebraic_pair_solver_prototype1.py'),('run_algebraic_pair_prototype3.py','run_algebraic_pair_prototype4.py')]:
 s=(r/source).read_text()
 if 'solver' in source:
  s=s.replace('solver-baseline3','solver-prototype1').replace("['common_fiber_count_preserves_composed_seventh_root_scale']", "['unscaled_quintic_common_fiber_is_exact', 'common_fiber_count_preserves_algebraic_constant_scaling', 'common_fiber_count_preserves_composed_seventh_root_scale']").replace('len(results) == 1','len(results) == 3')
 else:s=s.replace('prototype3','prototype4')
 (r/target).write_text(s)
print('Prototype source prepared; formatting and stable-source tests still required.')
