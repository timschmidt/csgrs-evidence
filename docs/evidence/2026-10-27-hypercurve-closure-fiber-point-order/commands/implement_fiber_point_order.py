from pathlib import Path
checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
p=checkout/'crates/hypercurve/src/bezier_offset/rational_form.rs';s=p.read_text()
s=s.replace('use hypersolve::bivariate_arithmetic::bivariate_compose;', '''use hypersolve::bivariate_arithmetic::{
    bivariate_add, bivariate_compose, bivariate_multiply, bivariate_scale, bivariate_subtract,
};''')
anchor='/// Pulls a query into its original coordinate field.'
addition='''/// Aligns source-bound queries using their retained coordinate maps. The
/// caller keeps the original immutable inputs and denominator guards; these
/// pulled-back forms are temporary predicate views, not replacement points.
pub(crate) fn common_point_form_sources(
    mut first: PointFormSource2,
    mut second: PointFormSource2,
    policy: &CurveContext,
) -> CurveResult<Classification<[PointFormSource2; 2]>> {
    if first.source.shares_storage(&second.source) || first.source == second.source {
        return Ok(Classification::Decided([first, second]));
    }
    for form in [&mut first, &mut second] {
        *form = match point_form_source(
            &form.source, &form.numerator, &form.denominator, policy,
        )? {
            Classification::Decided(form) => form,
            Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
        };
        if let Some(point) = form.source.coordinates() {
            form.numerator = BivariatePolynomial::new(vec![vec![bivariate_evaluate_exact(
                &form.numerator, point.x(), point.y(),
            )]]);
            form.denominator = BivariatePolynomial::new(vec![vec![bivariate_evaluate_exact(
                &form.denominator, point.x(), point.y(),
            )]]);
        }
    }
    let constant = |polynomial: &BivariatePolynomial| {
        polynomial.coefficients.iter().enumerate().all(|(i, row)| {
            row.iter().enumerate().all(|(j, coefficient)| {
                (i == 0 && j == 0) || coefficient.definitely_zero()
            })
        })
    };
    if constant(&first.numerator) && constant(&first.denominator) {
        first.source = second.source.clone();
    } else if constant(&second.numerator) && constant(&second.denominator) {
        second.source = first.source.clone();
    }
    Ok(match first.source.same_point(&second.source, policy) {
        Classification::Decided(true) => Classification::Decided([first, second]),
        Classification::Decided(false) => Classification::Uncertain(UncertaintyReason::Unsupported),
        Classification::Uncertain(reason) => Classification::Uncertain(reason),
    })
}

fn point_form_difference(
    first: PointFormSource2,
    second: PointFormSource2,
    policy: &CurveContext,
) -> CurveResult<Classification<PointFormSource2>> {
    Ok(common_point_form_sources(first, second, policy)?.map(|[first, second]| {
        let (numerator, denominator) = if first.denominator == second.denominator {
            (bivariate_subtract(&first.numerator, &second.numerator), first.denominator)
        } else {
            (bivariate_subtract(
                &bivariate_multiply(&first.numerator, &second.denominator),
                &bivariate_multiply(&second.numerator, &first.denominator),
            ), bivariate_multiply(&first.denominator, &second.denominator))
        };
        PointFormSource2::new(first.source, numerator, denominator)
    }))
}

/// Compares a linear projection before separating correlated point coordinates.
pub(super) fn common_point_linear_order(
    first: &CurvePoint2,
    second: &CurvePoint2,
    a: &Real,
    b: &Real,
    policy: &CurveContext,
) -> CurveResult<Classification<std::cmp::Ordering>> {
    let numerator = BivariatePolynomial::new(vec![vec![Real::zero(), b.clone()], vec![a.clone()]]);
    let one = BivariatePolynomial::new(vec![vec![Real::one()]]);
    let form = match point_form_difference(
        PointFormSource2::new(first.clone(), numerator.clone(), one.clone()),
        PointFormSource2::new(second.clone(), numerator, one), policy,
    )? {
        Classification::Decided(form) => form,
        Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
    };
    Ok(point_rational_form_sign(&form.source, &form.numerator, &form.denominator, policy)?.map(|sign| {
        match sign {
            RealSign::Negative => std::cmp::Ordering::Less,
            RealSign::Zero => std::cmp::Ordering::Equal,
            RealSign::Positive => std::cmp::Ordering::Greater,
        }
    }))
}

/// Signs |P-C|^2-r^2 in one certified common coordinate field. The squared
/// denominator is positive only after both original difference denominators
/// have been proved nonzero under the consuming policy.
pub(super) fn common_point_circle_residual_sign(
    point: &CurvePoint2,
    center: &CurvePoint2,
    radius_squared: &Real,
    policy: &CurveContext,
) -> CurveResult<Classification<RealSign>> {
    let coordinate_difference = |numerator: BivariatePolynomial| {
        let one = BivariatePolynomial::new(vec![vec![Real::one()]]);
        point_form_difference(
            PointFormSource2::new(point.clone(), numerator.clone(), one.clone()),
            PointFormSource2::new(center.clone(), numerator, one), policy,
        )
    };
    let dx = match coordinate_difference(BivariatePolynomial::new(vec![vec![Real::zero()], vec![Real::one()]]))? {
        Classification::Decided(value) => value,
        Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
    };
    let dy = match coordinate_difference(BivariatePolynomial::new(vec![vec![Real::zero(), Real::one()]]))? {
        Classification::Decided(value) => value,
        Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
    };
    let [dx, dy] = match common_point_form_sources(dx, dy, policy)? {
        Classification::Decided(forms) => forms,
        Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
    };
    for form in [&dx, &dy] {
        if let Classification::Uncertain(reason) = point_rational_denominator_sign(
            &form.source, &form.denominator, policy,
        )? {
            return Ok(Classification::Uncertain(reason));
        }
    }
    let (x, y, denominator) = if dx.denominator == dy.denominator {
        (dx.numerator, dy.numerator, dx.denominator)
    } else {
        (bivariate_multiply(&dx.numerator, &dy.denominator),
         bivariate_multiply(&dy.numerator, &dx.denominator),
         bivariate_multiply(&dx.denominator, &dy.denominator))
    };
    let residual = bivariate_subtract(
        &bivariate_add(&bivariate_multiply(&x, &x), &bivariate_multiply(&y, &y)),
        &bivariate_scale(bivariate_multiply(&denominator, &denominator), radius_squared),
    );
    point_polynomial_sign(&dx.source, &residual, policy)
}

'''
assert anchor in s;s=s.replace(anchor,addition+anchor);p.write_text(s)
p=checkout/'crates/hypercurve/src/curve_point/rational/arithmetic.rs';s=p.read_text()
s=s.replace('use hypersolve::exact_factor::bivariate_evaluate_exact;\n','')
a=s.index('            use crate::bezier_offset::{PointFormSource2, point_form_source};')
b=s.index('            // Keeping one already shared denominator',a)
s=s[:a]+'''            use crate::bezier_offset::{PointFormSource2, common_point_form_sources};
            let [first, second] = match common_point_form_sources(
                PointFormSource2::new(self.source.clone(), self.numerator.clone(), self.denominator.clone()),
                PointFormSource2::new(other.source.clone(), other.numerator.clone(), other.denominator.clone()),
                policy,
            )? {
                Classification::Decided(forms) => forms,
                Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
            };
'''+s[b:]
a=s.index('\nfn constant(');s=s[:a]+'\n';p.write_text(s)
p=checkout/'crates/hypercurve/src/bezier_offset.rs';s=p.read_text()
a=s.index('pub(crate) fn algebraic_chord_points_linear_order(');b=s.index('    // Preserve each endpoint',a)
s=s[:b]+'''    match common_point_linear_order(first, second, coefficient_x, coefficient_y, policy)? {
        Classification::Decided(order) => return Ok(Classification::Decided(order)),
        Classification::Uncertain(UncertaintyReason::BudgetExhausted) => {
            return Ok(Classification::Uncertain(UncertaintyReason::BudgetExhausted));
        }
        Classification::Uncertain(_) => {}
    }

'''+s[b:];p.write_text(s)
p=checkout/'crates/hypercurve/src/bezier_offset/cusp_semicircle.rs';s=p.read_text()
a=s.index('    pub(crate) fn retained_point_incidence_sign(');b=s.index('        if let Classification::Decided(center) = self.center_point_evidence(policy)?',s.index('        let refined =',a))
s=s[:b]+'''        if let Classification::Decided(center) = self.center_point_evidence(policy)? {
            match common_point_circle_residual_sign(
                point, &center, &(self.radial_distance() * self.radial_distance()), policy,
            )? {
                Classification::Decided(sign) => return Ok(Classification::Decided(sign)),
                Classification::Uncertain(UncertaintyReason::BudgetExhausted) => {
                    return Ok(Classification::Uncertain(UncertaintyReason::BudgetExhausted));
                }
                Classification::Uncertain(_) => {}
            }
        }
'''+s[b:];p.write_text(s)
