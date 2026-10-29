from pathlib import Path
w=Path('/home/tim/Documents/GitHub/workspace/csgrs-closure-work/selected-polynomial-points')
def edit(name,old,new):
 p=w/name;s=p.read_text();assert old in s,name;p.write_text(s.replace(old,new,1))
def put(name,s):
 p=w/name;p.parent.mkdir(parents=True,exist_ok=True);assert not p.exists(),name;p.write_text(s)
put('crates/hypercurve/src/selected_field.rs', '''//! Adapters to Hypersolve's selected-field authority; no coordinate projection.

use hypersolve::{BivariatePolynomial, RealInterval};
pub(crate) use hypersolve::selected_polynomial_field::{
    SelectedPolynomialEnclosure as Enclosure, SelectedPolynomialError as FieldError,
    SelectedPolynomialField as Field, SelectedPolynomialValue as Value,
};
use crate::{Classification, CurveContext, CurveError, CurveResult, Real, UncertaintyReason};

pub(crate) type Result<T> = std::result::Result<T, FieldError<CurveError>>;

pub(crate) fn decided<T>(result: Classification<T>) -> Result<T> {
    match result {
        Classification::Decided(value) => Ok(value),
        Classification::Uncertain(reason) => Err(FieldError::Uncertain(reason)),
    }
}

pub(crate) fn curve<T>(result: CurveResult<Classification<T>>) -> Result<T> {
    decided(result.map_err(FieldError::Context)?)
}

pub(crate) fn finish<T>(operation: impl FnOnce() -> Result<T>) -> CurveResult<Classification<T>> {
    let result = operation();
    if hypersolve::work_budget::exhaustion().is_some() {
        return Ok(Classification::Uncertain(UncertaintyReason::BudgetExhausted));
    }
    match result {
        Ok(value) => Ok(Classification::Decided(value)),
        Err(FieldError::Context(error)) => Err(error),
        Err(FieldError::Uncertain(reason)) => Ok(Classification::Uncertain(reason)),
        Err(FieldError::Arithmetic(_)) => Ok(Classification::Uncertain(UncertaintyReason::Unsupported)),
        Err(FieldError::ZeroDenominator) => Err(CurveError::ZeroRationalPointDenominator),
        Err(FieldError::InvalidSelector | FieldError::InvalidEnclosure | FieldError::ZeroPolynomial
            | FieldError::NoRoot | FieldError::MultipleRoots(_)) => Err(CurveError::InvalidBezierAlgebraicParameter),
    }
}

pub(crate) fn available<T>(value: Option<T>) -> Result<T> {
    value.ok_or(FieldError::Uncertain(UncertaintyReason::Unsupported))
}

pub(crate) fn polynomial(coefficients: &[Real], value: &Value) -> Result<Value> {
    let field = value.field();
    let mut sum = field.constant(Real::zero())?;
    for coefficient in coefficients.iter().rev() {
        sum = sum.multiply(value)?.add(&field.constant(coefficient.clone())?)?;
    }
    Ok(sum)
}

pub(crate) fn bivariate(polynomial: &BivariatePolynomial, point: &[Value; 2]) -> Result<Value> {
    let mut sum = point[0].field().constant(Real::zero())?;
    for row in polynomial.coefficients.iter().rev() {
        sum = sum.multiply(&point[0])?.add(&self::polynomial(row, &point[1])?)?;
    }
    Ok(sum)
}

pub(crate) fn query(polynomials: [&BivariatePolynomial; 2], point: &[Value; 2], policy: &CurveContext) -> Result<Value> {
    let denominator = bivariate(polynomials[1], point)?;
    // Division checks the original denominator even when the numerator is zero.
    decided(bivariate(polynomials[0], point)?.divide(&denominator, policy)?)
}

pub(crate) fn joined(first: &Value, second: &Value, policy: &CurveContext) -> Result<[Value; 2]> {
    let join = decided(first.field().joined_with(second.field(), policy)?)?;
    Ok([join.embed(first)?, join.embed(second)?])
}

pub(crate) fn bounds(value: &Value, steps: usize, policy: &CurveContext) -> Result<RealInterval> {
    Ok(decided(decided(value.enclosed(policy)?)?.refined(steps, policy)?)?.interval().clone())
}
''')
edit('crates/hypercurve/src/lib.rs','mod selected_scalar;','mod selected_scalar;\nmod selected_field;\nmod selected_query_scalar;')
put('crates/hypercurve/src/bezier_offset/polynomial_field.rs', '''//! Lossless imports of admitted native authorities into selected polynomial fields.

use super::*;
use crate::selected_field::{self as field, Field, Value};
use crate::selected_scalar::SelectedScalar2;

pub(crate) fn selected_field_bezier(parameter: &BezierParameter2, policy: &CurveContext) -> field::Result<Value> {
    let sources = match parameter {
        BezierParameter2::Exact(_) => Vec::new(),
        BezierParameter2::Algebraic(root) => vec![certified_parameter_representation(root, policy)],
    };
    let rank = sources.len();
    let one = field::available(DenseTensorPolynomial::try_new(vec![1; rank], vec![Real::one()]))?;
    let native = field::available(RecursiveQuadraticField::base(sources, one.clone(), one))?;
    let field = Field::from_recursive(native.clone());
    match parameter {
        BezierParameter2::Exact(value) => Ok(field.constant(value.clone())?),
        BezierParameter2::Algebraic(_) => {
            let RecursiveQuadraticField::Base(base) = native else { unreachable!("native base") };
            let axis = field::available(DenseTensorPolynomial::from_axis_polynomial(1, 0, &[Real::zero(), Real::one()]))?;
            let value = field::available(recursive_quadratic_rational_value(&base, axis))?;
            Ok(field.import_recursive(&value)?)
        }
    }
}

pub(crate) fn selected_field_fiber(parameter: &BezierAlgebraicSelectedFiberParameter2, policy: &CurveContext) -> field::Result<[Value; 2]> {
    parameter.validate_policy(policy).map_err(field::FieldError::Context)?;
    let (equation, base) = parameter.defining_fiber();
    let x = selected_field_bezier(&BezierParameter2::Algebraic(base.clone()), policy)?;
    let parent = x.field();
    let root = parameter.root();
    if let Some(value) = &root.exact_root {
        return Ok([x.clone(), parent.constant(value.clone())?]);
    }
    let degree = equation.coefficients.iter().map(Vec::len).max().unwrap_or(0);
    let coefficients = (0..degree).map(|power| {
        let coefficients = equation.coefficients.iter().map(|row| row.get(power).cloned().unwrap_or_else(Real::zero)).collect::<Vec<_>>();
        field::polynomial(&coefficients, &x)
    }).collect::<field::Result<Vec<_>>>()?;
    // Non-point fiber selectors are admitted endpoint-free open intervals.
    // Native base roots retain their own endpoint ownership in the native field.
    let selected = field::decided(parent.select(coefficients, root.lower.clone(), root.upper.clone(), policy)?)?;
    Ok([selected.lift(&x)?, selected.generator()?])
}

pub(crate) fn selected_field_scalar(parameter: &SelectedScalar2, policy: &CurveContext) -> field::Result<Value> {
    match parameter {
        SelectedScalar2::Bezier(value) => selected_field_bezier(value, policy),
        SelectedScalar2::SelectedFiber(value) => Ok(selected_field_fiber(value, policy)?[1].clone()),
        SelectedScalar2::Polynomial(value) => value.value(),
        SelectedScalar2::RecursiveProjective(value) => {
            value.validate_policy(policy).map_err(field::FieldError::Context)?;
            if let Some(value) = value.projective_scalar() {
                let field = Field::from_recursive(value.numerator.field());
                let numerator = field.import_recursive(&value.numerator)?;
                let denominator = field.import_recursive(&value.denominator)?;
                field::decided(numerator.divide(&denominator, policy)?)
            } else {
                let native = field::curve(value.promoted_bezier_parameter_complete(policy))?;
                selected_field_bezier(&native, policy)
            }
        }
    }
}

pub(crate) fn selected_field_query(query: &PointFormSource2, policy: &CurveContext) -> field::Result<Value> {
    let pulled = field::curve(point_form_source(&query.source, &query.numerator, &query.denominator, policy))?;
    if let CurvePointData2::Polynomial(point) = &pulled.source.0 {
        return point.field_query(&pulled.numerator, &pulled.denominator, policy);
    }
    let value = field::available(field::curve(super::rational_form::recursive_rational_value(
        &pulled.source, &pulled.numerator, &pulled.denominator, policy,
    ))?)?;
    let field = Field::from_recursive(value.numerator.field());
    field::decided(field.import_recursive(&value.numerator)?.divide(&field.import_recursive(&value.denominator)?, policy)?)
}
''')
edit('crates/hypercurve/src/bezier_offset.rs','mod rational_form;','mod rational_form;\nmod polynomial_field;\npub(crate) use polynomial_field::*;')
edit('crates/hypercurve/src/bezier_offset/rational_form.rs','fn recursive_rational_value(','pub(super) fn recursive_rational_value(')
put('crates/hypercurve/src/selected_query_scalar.rs', '''//! A scalar query retains its correlated point and checked field enclosure.

use std::{cmp::Ordering, sync::Arc};
use hypersolve::{BivariatePolynomial, RealInterval};
use hypersolve::bivariate_arithmetic::{bivariate_add, bivariate_scale, bivariate_subtract};
use crate::bezier_offset::PointFormSource2;
use crate::selected_field::{self as field, Enclosure, Value};
use crate::selected_scalar::SelectedScalar2;
use crate::{Classification, CurveContext, CurveResult, Real, UncertaintyReason};

#[derive(Clone)]
pub(crate) struct SelectedQueryScalar2 {
    source: Arc<PointFormSource2>,
    enclosure: Enclosure,
    complement: bool,
    bounds: RealInterval,
}

impl std::fmt::Debug for SelectedQueryScalar2 {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("SelectedQueryScalar2").field("bounds", &self.bounds).field("complement", &self.complement).finish_non_exhaustive()
    }
}

impl PartialEq for SelectedQueryScalar2 {
    fn eq(&self, other: &Self) -> bool {
        self.complement == other.complement && Arc::ptr_eq(&self.source, &other.source)
    }
}

impl SelectedQueryScalar2 {
    pub(crate) fn new(source: PointFormSource2, value: Value, policy: &CurveContext) -> field::Result<Self> {
        let enclosure = field::decided(value.enclosed(policy)?)?;
        Ok(Self { source: Arc::new(source), bounds: enclosure.interval().clone(), enclosure, complement: false })
    }

    pub(crate) fn value(&self) -> field::Result<Value> {
        let value = self.enclosure.value();
        Ok(if self.complement { value.field().constant(Real::one())?.subtract(value)? } else { value.clone() })
    }

    pub(crate) fn query(&self) -> PointFormSource2 {
        let mut query = self.source.as_ref().clone();
        if self.complement {
            query.numerator = bivariate_subtract(&query.denominator, &query.numerator);
        }
        query
    }

    pub(crate) fn polynomial_sign(&self, coefficients: &[Real], policy: &CurveContext) -> CurveResult<Classification<hyperreal::RealSign>> {
        field::finish(|| field::decided(field::polynomial(coefficients, &self.value()?)?.sign(policy)?))
    }

    pub(crate) fn compare(&self, other: &SelectedScalar2, policy: &CurveContext) -> CurveResult<Classification<Ordering>> {
        field::finish(|| {
            let [first, second] = field::joined(&self.value()?, &crate::bezier_offset::selected_field_scalar(other, policy)?, policy)?;
            Ok(match field::decided(first.subtract(&second)?.sign(policy)?)? {
                hyperreal::RealSign::Negative => Ordering::Less,
                hyperreal::RealSign::Zero => Ordering::Equal,
                hyperreal::RealSign::Positive => Ordering::Greater,
            })
        })
    }

    pub(crate) fn isolating_bounds(&self) -> (&Real, &Real) { (&self.bounds.lower, &self.bounds.upper) }

    pub(crate) fn unit_complement(&self) -> Self {
        Self { complement: !self.complement, bounds: RealInterval { lower: Real::one() - &self.bounds.upper, upper: Real::one() - &self.bounds.lower }, ..self.clone() }
    }

    pub(crate) fn refined(&self, steps: usize, policy: &CurveContext) -> CurveResult<Classification<Self>> {
        field::finish(|| {
            let enclosure = field::decided(self.enclosure.refined(steps, policy)?)?;
            let bounds = enclosure.interval().clone();
            let value = Self { source: Arc::clone(&self.source), enclosure, bounds, complement: false };
            Ok(if self.complement { value.unit_complement() } else { value })
        })
    }

    pub(crate) fn affine_image_unbounded(&self, scale: &Real, offset: &Real, policy: &CurveContext) -> CurveResult<Classification<Self>> {
        self.projective_image_unbounded(&[offset.clone(), scale.clone()], &[Real::one(), Real::zero()], policy)
    }

    pub(crate) fn projective_image_unbounded(&self, numerator: &[Real; 2], denominator: &[Real; 2], policy: &CurveContext) -> CurveResult<Classification<Self>> {
        field::finish(|| {
            let value = self.value()?;
            let image = field::decided(field::polynomial(numerator, &value)?.divide(&field::polynomial(denominator, &value)?, policy)?)?;
            let query = self.query();
            let map = |coefficients: &[Real; 2]| bivariate_add(&bivariate_scale(query.denominator.clone(), &coefficients[0]), &bivariate_scale(query.numerator.clone(), &coefficients[1]));
            // Keep the original query denominator as a guard even if the chart
            // moves it to the numerator or the image is identically constant.
            let guard = &query.denominator;
            let source = PointFormSource2::new(query.source.clone(),
                hypersolve::bivariate_arithmetic::bivariate_multiply(&map(numerator), guard),
                hypersolve::bivariate_arithmetic::bivariate_multiply(&map(denominator), guard));
            Self::new(source, image, policy)
        })
    }

    pub(crate) fn promoted_bezier_parameter_complete(&self, _policy: &CurveContext) -> CurveResult<Classification<crate::BezierParameter2>> {
        Ok(if self.bounds.lower == self.bounds.upper {
            Classification::Decided(crate::BezierParameter2::Exact(self.bounds.lower.clone()))
        } else { Classification::Uncertain(UncertaintyReason::Unsupported) })
    }

    /// Evaluates a rational curve in this query's original joint point field.
    pub(crate) fn rational_point(&self, curve: &crate::RationalBezier2, policy: &CurveContext) -> crate::ExactCurveResult<crate::CurvePoint2> {
        let basis = curve.homogeneous_power_basis().map_err(|cause| crate::ExactCurveError::invalid_unattributed(crate::CurveOperation2::Evaluation, cause))?;
        let query = self.query();
        let chart = crate::RationalMap2::new([query.numerator.clone(), BivariatePolynomial::new(vec![vec![Real::zero()]])], query.denominator.clone());
        let pullback = |coefficients: &[Real]| chart.pullback(
            &BivariatePolynomial::new(coefficients.iter().map(|c| vec![c.clone()]).collect()),
            &BivariatePolynomial::new(basis.weight.iter().map(|c| vec![c.clone()]).collect()));
        let Some((x, xw)) = pullback(&basis.x_numerator) else { return Err(crate::ExactCurveError::blocked(crate::CurveOperation2::Evaluation, crate::CurveFamily2::RationalBezier, UncertaintyReason::Unsupported)); };
        let Some((y, yw)) = pullback(&basis.y_numerator) else { return Err(crate::ExactCurveError::blocked(crate::CurveOperation2::Evaluation, crate::CurveFamily2::RationalBezier, UncertaintyReason::Unsupported)); };
        use hypersolve::bivariate_arithmetic::bivariate_multiply as mul;
        let guard = &query.denominator;
        query.source.rational_image_with_policy(&crate::RationalMap2::new(
            [mul(&mul(&x, &yw), guard), mul(&mul(&y, &xw), guard)], mul(&mul(&xw, &yw), guard)), policy)
    }
}
''')
# Scalar dispatch keeps native fast paths unchanged.
p=w/'crates/hypercurve/src/selected_scalar.rs';s=p.read_text();s=s.replace('    Bezier(BezierParameter2),','    Bezier(BezierParameter2),\n    Polynomial(crate::selected_query_scalar::SelectedQueryScalar2),',1)
s=s.replace('            (Self::Bezier(first), Self::Bezier(second)) => first == second,','            (Self::Bezier(first), Self::Bezier(second)) => first == second,\n            (Self::Polynomial(first), Self::Polynomial(second)) => first == second,',1)
s=s.replace('Self::SelectedFiber(_) | Self::RecursiveProjective(_) => None','Self::Polynomial(_) | Self::SelectedFiber(_) | Self::RecursiveProjective(_) => None',1)
s=s.replace('            Self::RecursiveProjective(parameter) => parameter.polynomial_sign(coefficients, policy),','            Self::RecursiveProjective(parameter) => parameter.polynomial_sign(coefficients, policy),\n            Self::Polynomial(parameter) => parameter.polynomial_sign(coefficients, policy),',1)
needle='''        match (self, other) {
            (Self::Bezier(first), Self::Bezier(second)) => {
                first.cmp_by_refinement_with_policy(second, policy)'''
s=s.replace(needle,'''        match (self, other) {
            (Self::Polynomial(first), second) => first.compare(second, policy),
            (first, Self::Polynomial(second)) => Ok(second.compare(first, policy)?.map(Ordering::reverse)),
            (Self::Bezier(first), Self::Bezier(second)) => {
                first.cmp_by_refinement_with_policy(second, policy)''',1)
s=s.replace('            Self::Bezier(parameter) => Self::Bezier(parameter.unit_complement()),','            Self::Bezier(parameter) => Self::Bezier(parameter.unit_complement()),\n            Self::Polynomial(parameter) => Self::Polynomial(parameter.unit_complement()),',1)
s=s.replace('            Self::SelectedFiber(parameter) => parameter.isolating_bounds(),','            Self::SelectedFiber(parameter) => parameter.isolating_bounds(),\n            Self::Polynomial(parameter) => parameter.isolating_bounds(),',1)
s=s.replace('''        match self {
            Self::Bezier(parameter) => Ok(Classification::Decided(Self::Bezier(''','''        match self {
            Self::Polynomial(parameter) => Ok(parameter.refined(refinement_steps, policy)?.map(Self::Polynomial)),
            Self::Bezier(parameter) => Ok(Classification::Decided(Self::Bezier(''',1)
s=s.replace('''        match self {
            Self::Bezier(parameter) => Ok(parameter
                .affine_image_unbounded''','''        match self {
            Self::Polynomial(parameter) => Ok(parameter.affine_image_unbounded(scale, offset, policy)?.map(Self::Polynomial)),
            Self::Bezier(parameter) => Ok(parameter
                .affine_image_unbounded''',1)
s=s.replace('''        match self {
            Self::Bezier(parameter) => Ok(parameter
                .projective_image_unbounded''','''        match self {
            Self::Polynomial(parameter) => Ok(parameter.projective_image_unbounded(numerator, denominator, policy)?.map(Self::Polynomial)),
            Self::Bezier(parameter) => Ok(parameter
                .projective_image_unbounded''',1)
s=s.replace('            Self::Bezier(parameter) => Ok(Classification::Decided(parameter.clone())),','            Self::Bezier(parameter) => Ok(Classification::Decided(parameter.clone())),\n            Self::Polynomial(parameter) => parameter.promoted_bezier_parameter_complete(policy),',1)
p.write_text(s)
edit('crates/hypercurve/src/bezier_split.rs','''    pub(crate) fn from_selected_fiber(parameter:''','''    pub(crate) fn from_polynomial_query(parameter: crate::selected_query_scalar::SelectedQueryScalar2) -> Self {
        Self::from_selected_scalar(SelectedScalar2::Polynomial(parameter))
    }

    pub(crate) fn as_polynomial_query(&self) -> Option<&crate::selected_query_scalar::SelectedQueryScalar2> {
        match &self.data {
            CurveParameterData2::Scalar(SelectedScalar2::Polynomial(parameter)) => Some(parameter),
            _ => None,
        }
    }

    pub(crate) fn from_selected_fiber(parameter:''')
edit('crates/hypercurve/src/bezier_split.rs','SelectedScalar2::SelectedFiber(_) | SelectedScalar2::RecursiveProjective(_)','SelectedScalar2::Polynomial(_) | SelectedScalar2::SelectedFiber(_) | SelectedScalar2::RecursiveProjective(_)')
edit('crates/hypercurve/src/curve_evaluation.rs','''    validate_rational_point(source, parameter, family, policy)?;
    if let Some(parameter) = parameter.as_bezier_parameter()''','''    validate_rational_point(source, parameter, family, policy)?;
    if let Some(parameter) = parameter.as_polynomial_query() {
        return parameter.rational_point(source, policy);
    }
    if let Some(parameter) = parameter.as_bezier_parameter()''')
p=w/'crates/hypercurve/src/polynomial_point.rs';s=p.read_text()
s=s.replace('''    base: BezierParameter2,
    fiber: BezierAlgebraicSelectedFiberParameter2,
    maps:''','''    authority: PolynomialPointAuthority2,
    maps:''',1)
pos=s.index('impl PolynomialPoint2 {')
s=s[:pos]+'''#[derive(Clone, Debug, PartialEq)]
enum PolynomialPointAuthority2 {
    Fiber { base: BezierParameter2, fiber: BezierAlgebraicSelectedFiberParameter2 },
    Queries(std::sync::Arc<JointQueries2>),
}

mod joint;
use joint::JointQueries2;

'''+s[pos:]
s=s.replace('''            (7, std::ptr::from_ref(self.fiber.root()).cast())''','''            match &self.authority {
                PolynomialPointAuthority2::Fiber { fiber, .. } => (7, std::ptr::from_ref(fiber.root()).cast()),
                PolynomialPointAuthority2::Queries(queries) => (11, std::sync::Arc::as_ptr(queries).cast()),
            }''',1)
s=s.replace('''        if self.maps.is_empty() {
            return self.fiber.predicate_sign(polynomial, policy);
        }''','''        let PolynomialPointAuthority2::Fiber { fiber, .. } = &self.authority else {
            return crate::selected_field::finish(|| {
                let one = BivariatePolynomial::new(vec![vec![Real::one()]]);
                crate::selected_field::decided(self.field_query(polynomial, &one, policy)?.sign(policy)?)
            });
        };
        if self.maps.is_empty() {
            return fiber.predicate_sign(polynomial, policy);
        }''',1)
s=s.replace('self.fiber.predicate_sign','fiber.predicate_sign')
s=s.replace('''        if self.maps.is_empty() {
            return Ok(self
                .fiber
                .rational_image_in_retained_field''','''        let PolynomialPointAuthority2::Fiber { fiber, .. } = &self.authority else {
            return self.joint_parameter(numerator, denominator, policy);
        };
        if self.maps.is_empty() {
            return Ok(fiber
                .rational_image_in_retained_field''',1)
s=s.replace('''        Ok(self
            .fiber
            .rational_image_in_retained_field(&numerator, &denominator, policy)?''','''        Ok(fiber
            .rational_image_in_retained_field(&numerator, &denominator, policy)?''',1)
s=s.replace('''                    base: base.clone(),
                    fiber,''','''                    authority: PolynomialPointAuthority2::Fiber { base: base.clone(), fiber },''',1)
s=s.replace('''        crate::CurvePointDefinition2::PolynomialFiber {
            equation: self.fiber.defining_fiber().0.clone(),
            parameter: self.base.clone(),
            root: self.fiber.root().clone(),
        }''','''        match &self.authority {
            PolynomialPointAuthority2::Fiber { base, fiber } => crate::CurvePointDefinition2::PolynomialFiber {
                equation: fiber.defining_fiber().0.clone(), parameter: base.clone(), root: fiber.root().clone(),
            },
            PolynomialPointAuthority2::Queries(queries) => queries.definition(),
        }''',1)
s=s.replace('''        if self.maps.is_empty() {
            return Ok(Classification::Decided(self.source_coordinate(axis)));
        }''','''        if self.maps.is_empty() && matches!(self.authority, PolynomialPointAuthority2::Fiber { .. }) {
            return Ok(Classification::Decided(self.source_coordinate(axis)));
        }''',1)
s=s.replace('''        match axis {
            Axis2::X => self.base.clone().into(),
            Axis2::Y => CurveParameter2::from_selected_fiber(self.fiber.clone()),
        }''','''        let PolynomialPointAuthority2::Fiber { base, fiber } = &self.authority else { unreachable!("native fiber coordinate") };
        match axis {
            Axis2::X => base.clone().into(),
            Axis2::Y => CurveParameter2::from_selected_fiber(fiber.clone()),
        }''',1)
s=s.replace('''        if !self.maps.is_empty() {
            return self.rational_parameter(''','''        if !self.maps.is_empty() || matches!(self.authority, PolynomialPointAuthority2::Queries(_)) {
            return self.rational_parameter(''',1)
s=s.replace('''        if let BezierParameter2::Exact(base) = &self.base {''','''        let PolynomialPointAuthority2::Fiber { base, fiber } = &self.authority else { unreachable!("native fiber affine form") };
        if let BezierParameter2::Exact(base) = base {''',1)
s=s.replace('''        Ok(self
            .fiber
            .rational_image_in_retained_field(''','''        Ok(fiber
            .rational_image_in_retained_field(''',1)
s=s.replace('''        let base = self.base.clone().refined_isolating_interval(steps, policy);''','''        let PolynomialPointAuthority2::Fiber { base, fiber } = &self.authority else {
            return self.joint_bounds(steps, policy);
        };
        let base = base.clone().refined_isolating_interval(steps, policy);''',1)
s=s.replace('let fiber = match self.fiber.refined(steps, policy)', 'let fiber = match fiber.refined(steps, policy)',1)
assert 'self.fiber' not in s and 'self.base' not in s
p.write_text(s)
put('crates/hypercurve/src/polynomial_point/joint.rs', '''//! Joint query points preserve sources as well as their common scalar field.

use super::*;
use crate::bezier_offset::PointFormSource2;
use crate::selected_field::{self as field, Value};
use std::sync::Arc;

pub(super) struct JointQueries2 {
    sources: [PointFormSource2; 2],
    values: [Value; 2],
}

impl std::fmt::Debug for JointQueries2 {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        // Shared operand definitions must not expand into diagnostic trees.
        f.debug_struct("JointQueries2").finish_non_exhaustive()
    }
}

impl PartialEq for JointQueries2 {
    fn eq(&self, other: &Self) -> bool { std::ptr::eq(self, other) }
}

impl JointQueries2 {
    pub(super) fn definition(&self) -> crate::CurvePointDefinition2 {
        crate::CurvePointDefinition2::RationalQueryPair {
            sources: self.sources.each_ref().map(|query| query.source.clone()),
            numerators: self.sources.each_ref().map(|query| query.numerator.clone()),
            denominators: self.sources.each_ref().map(|query| query.denominator.clone()),
        }
    }
}

impl PolynomialPoint2 {
    pub(crate) fn from_queries(sources: [PointFormSource2; 2], policy: &CurveContext) -> CurveResult<Classification<CurvePoint2>> {
        field::finish(|| {
            let first = crate::bezier_offset::selected_field_query(&sources[0], policy)?;
            let second = crate::bezier_offset::selected_field_query(&sources[1], policy)?;
            let values = field::joined(&first, &second, policy)?;
            Ok(CurvePoint2(CurvePointData2::Polynomial(Arc::new(Self {
                authority: PolynomialPointAuthority2::Queries(Arc::new(JointQueries2 { sources, values })),
                maps: Vec::new(),
            }))))
        })
    }

    pub(crate) fn field_query(&self, numerator: &BivariatePolynomial, denominator: &BivariatePolynomial, policy: &CurveContext) -> field::Result<Value> {
        let (numerator, denominator) = field::available(self.pullback(numerator, denominator))?;
        let native;
        let values = match &self.authority {
            PolynomialPointAuthority2::Fiber { fiber, .. } => {
                native = crate::bezier_offset::selected_field_fiber(fiber, policy)?;
                &native
            }
            PolynomialPointAuthority2::Queries(queries) => &queries.values,
        };
        field::query([&numerator, &denominator], values, policy)
    }

    pub(super) fn joint_parameter(&self, numerator: &BivariatePolynomial, denominator: &BivariatePolynomial, policy: &CurveContext) -> CurveResult<Classification<CurveParameter2>> {
        field::finish(|| {
            let value = self.field_query(numerator, denominator, policy)?;
            let query = PointFormSource2::new(CurvePoint2(CurvePointData2::Polynomial(Arc::new(self.clone()))), numerator.clone(), denominator.clone());
            Ok(CurveParameter2::from_polynomial_query(crate::selected_query_scalar::SelectedQueryScalar2::new(query, value, policy)?))
        })
    }

    pub(super) fn joint_bounds(&self, steps: usize, policy: &CurveContext) -> Classification<Aabb2> {
        let result = field::finish(|| {
            let coordinate = |axis| match axis {
                Axis2::X => BivariatePolynomial::new(vec![vec![Real::zero()], vec![Real::one()]]),
                Axis2::Y => BivariatePolynomial::new(vec![vec![Real::zero(), Real::one()]]),
            };
            let one = BivariatePolynomial::new(vec![vec![Real::one()]]);
            let x = field::bounds(&self.field_query(&coordinate(Axis2::X), &one, policy)?, steps, policy)?;
            let y = field::bounds(&self.field_query(&coordinate(Axis2::Y), &one, policy)?, steps, policy)?;
            Ok(Aabb2::new_unchecked(Point2::new(x.lower, y.lower), Point2::new(x.upper, y.upper)))
        });
        result.unwrap_or(Classification::Uncertain(UncertaintyReason::Predicate))
    }
}
''')
# Retain original unpulled forms in the new common point so replay keeps map guards.
edit('crates/hypercurve/src/bezier_offset/rational_form.rs','''    for form in [&mut first, &mut second] {''','''    let original = [first.clone(), second.clone()];
    for form in [&mut first, &mut second] {''')
edit('crates/hypercurve/src/bezier_offset/rational_form.rs','''    Ok(match first.source.same_point(&second.source, policy) {''','''    if first.source.shares_storage(&second.source) || first.source == second.source {
        return Ok(Classification::Decided([first, second]));
    }
    match crate::polynomial_point::PolynomialPoint2::from_queries(original, policy)? {
        Classification::Decided(source) => {
            let one = BivariatePolynomial::new(vec![vec![Real::one()]]);
            return Ok(Classification::Decided([
                PointFormSource2::new(source.clone(), BivariatePolynomial::new(vec![vec![Real::zero()], vec![Real::one()]]), one.clone()),
                PointFormSource2::new(source, BivariatePolynomial::new(vec![vec![Real::zero(), Real::one()]]), one),
            ]));
        }
        Classification::Uncertain(UncertaintyReason::Unsupported) => {},
        Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
    }
    Ok(match first.source.same_point(&second.source, policy) {''')
edit('crates/hypercurve/src/curve_point/definition.rs','''    /// A rational plane image with its original denominator guard.
    RationalImage''','''    /// Two rational queries, each retaining its original point and pole guard.
    /// Replay joins their selected fields; it never projects independent coordinates.
    RationalQueryPair {
        sources: [CurvePoint2; 2],
        numerators: [hypersolve::BivariatePolynomial; 2],
        denominators: [hypersolve::BivariatePolynomial; 2],
    },
    /// A rational plane image with its original denominator guard.
    RationalImage''')
edit('crates/hypercurve/src/curve_point/definition.rs','''            Self::Coordinates(point) => Ok(point.into()),''','''            Self::Coordinates(point) => Ok(point.into()),
            Self::RationalQueryPair { sources, numerators, denominators } => {
                let mut queries = Vec::with_capacity(2);
                for ((source, numerator), denominator) in sources.into_iter().zip(numerators).zip(denominators) {
                    let source = if sources_checked { source } else { source.definition()?.into_point()? };
                    queries.push(crate::bezier_offset::PointFormSource2::new(source, numerator, denominator));
                }
                ExactCurveError::decided(CurveOperation2::Construction,
                    crate::polynomial_point::PolynomialPoint2::from_queries(queries.try_into().expect("two queries"), policy)
                        .map_err(|cause| ExactCurveError::invalid_unattributed(CurveOperation2::Construction, cause))?)
            },''')
# Native graph extension: older records remain byte-compatible.
edit('crates/hypercurve/src/svg/exact/graph/points.rs','pub(super) const CHORD_UNIT_TANGENT: u8 = 25;','pub(super) const CHORD_UNIT_TANGENT: u8 = 25;\npub(super) const RATIONAL_QUERY_PAIR: u8 = 26;')
edit('crates/hypercurve/src/svg/exact/graph/points.rs','''                            CurvePointDefinition2::RationalImage { source, .. }''','''                            CurvePointDefinition2::RationalQueryPair { sources, .. } => sources.to_vec(),
                            CurvePointDefinition2::RationalImage { source, .. }''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs','''                CurvePointDefinition2::RationalImage { source, map } => {''','''                CurvePointDefinition2::RationalQueryPair { sources, numerators, denominators } => {
                    let sources = sources.each_ref().map(|source| self.point_index(source)).into_iter().collect::<SvgResult<Vec<_>>>()?;
                    depth = next_depth(sources.iter().map(|source| self.point_depths[*source as usize]).max().unwrap_or(0), self.max_point_depth)?;
                    let index = self.begin(RATIONAL_QUERY_PAIR)?;
                    for ((source, numerator), denominator) in sources.into_iter().zip(numerators).zip(denominators) {
                        self.writer.write_u32(source)?;
                        self.polynomial(&numerator)?;
                        self.polynomial(&denominator)?;
                    }
                    index
                }
                CurvePointDefinition2::RationalImage { source, map } => {''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs','''        RATIONAL_IMAGE => {''','''        RATIONAL_QUERY_PAIR => {
            let mut sources = Vec::with_capacity(2);
            let mut numerators = Vec::with_capacity(2);
            let mut denominators = Vec::with_capacity(2);
            for _ in 0..2 {
                let index = reader.read_len()?;
                sources.push(point_reference(definitions, index)?.clone());
                depth = depth.max(next_depth(point_depths[index], max_point_depth)?);
                numerators.push(read_polynomial(reader)?);
                denominators.push(read_polynomial(reader)?);
            }
            CurvePointDefinition2::RationalQueryPair {
                sources: sources.try_into().expect("two sources"),
                numerators: numerators.try_into().expect("two numerators"),
                denominators: denominators.try_into().expect("two denominators"),
            }
        }
        RATIONAL_IMAGE => {''')
print('Implemented selected point/query field adapters in isolated checkout.')
