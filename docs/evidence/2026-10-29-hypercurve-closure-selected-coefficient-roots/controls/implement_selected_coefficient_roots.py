"""Private implementation after the recorded missing acceptance witness."""
from pathlib import Path
import json
import subprocess

r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-coefficient-roots'
baseline = json.loads((c / 'selected-coefficient-roots-baseline2/complete.json').read_text())
assert baseline['missing_acceptance_reproduced']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=w, text=True).strip() == baseline['source']['revision']
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=w, text=True)


def edit(name, before, after):
    path = w / name
    text = path.read_text()
    assert text.count(before) == 1, (name, text.count(before))
    path.write_text(text.replace(before, after, 1))


edit('crates/hypersolve/src/selected_polynomial_field.rs',
     '    /// Adjoins the unique distinct root in the supplied open interval.',
     '''    /// Evaluates ascending coefficients at an exact represented scalar.
    /// Coefficients must belong to this field or an admitted ancestor. The
    /// existing field arithmetic retains their selections and denominator
    /// proofs; this operation makes no root-selection or nonzero claim.
    pub fn evaluate_polynomial(
        &self,
        coefficients: &[SelectedPolynomialValue],
        point: &Real,
    ) -> ArithmeticResult<SelectedPolynomialValue> {
        self.lift(&evaluate(coefficients, point, self)?)
    }

    /// Adjoins the unique distinct root in the supplied open interval.''')
edit('crates/hypercurve/src/polynomial_point.rs', 'mod selected_fiber;',
     'mod selected_fiber;\nmod selected_root;')
path = w / 'crates/hypercurve/src/polynomial_point/selected_root.rs'
assert not path.exists()
path.write_text('''//! Selected roots retain every coefficient's original point query.

use super::*;
use crate::bezier_offset::PointFormSource2;
use crate::selected_field::{self as field, FieldError, Value};
use crate::{CurvePointDefinition2, CurvePointRationalForm2};

fn coefficient_values(
    coefficients: &[CurvePointRationalForm2],
    policy: &CurveContext,
) -> field::Result<Vec<Value>> {
    let mut values: Vec<Value> = Vec::new();
    for coefficient in coefficients {
        // Even a zero or trailing coefficient retains its original pole guard.
        let value = crate::bezier_offset::selected_field_query(
            &PointFormSource2::new(
                coefficient.source().clone(),
                coefficient.numerator().clone(),
                coefficient.denominator().clone(),
            ),
            policy,
        )?;
        if let Some(first) = values.first() {
            let join = field::decided(first.field().joined_with(value.field(), policy)?)?;
            values = values.iter().map(|value| join.embed(value)).collect::<Result<_, _>>()?;
            values.push(join.embed(&value)?);
        } else {
            values.push(value);
        }
    }
    if values.is_empty() {
        return Err(FieldError::ZeroPolynomial);
    }
    Ok(values)
}

fn selected_root(
    coefficients: Vec<Value>,
    root: &IsolatedRootInterval,
    policy: &CurveContext,
) -> field::Result<Value> {
    let parent = coefficients[0].field().clone();
    let Some(exact) = &root.exact_root else {
        let selected = field::decided(parent.select(
            coefficients, root.lower.clone(), root.upper.clone(), policy,
        )?)?;
        return Ok(selected.generator()?);
    };
    for boundary in [&root.lower, &root.upper] {
        match crate::classify::compare_reals(boundary, exact, policy) {
            Some(Ordering::Equal) => {}
            Some(_) => return Err(FieldError::InvalidSelector),
            None => return Err(FieldError::Uncertain(UncertaintyReason::Ordering)),
        }
    }
    let mut nonzero = false;
    for coefficient in &coefficients {
        nonzero |= field::decided(coefficient.sign(policy)?)? != hyperreal::RealSign::Zero;
    }
    if !nonzero {
        return Err(FieldError::ZeroPolynomial);
    }
    if field::decided(parent.evaluate_polynomial(&coefficients, exact)?.sign(policy)?)?
        != hyperreal::RealSign::Zero
    {
        return Err(FieldError::NoRoot);
    }
    Ok(parent.constant(exact.clone())?)
}

impl PolynomialPoint2 {
    pub(crate) fn from_selected_root(
        coefficients: Vec<CurvePointRationalForm2>,
        root: IsolatedRootInterval,
        policy: &CurveContext,
    ) -> ExactCurveResult<CurvePoint2> {
        let strict = policy.strict_counterpart();
        let result = field::finish(|| {
            let value = selected_root(coefficient_values(&coefficients, &strict)?, &root, &strict)?;
            let zero = value.field().constant(Real::zero())?;
            Ok(Self::from_joint_values(
                CurvePointDefinition2::SelectedPolynomialRoot {
                    coefficients,
                    root: IsolatedRootInterval { distinct_root_count: 1, ..root },
                },
                [value, zero],
            ))
        });
        ExactCurveError::decided(CurveOperation2::Construction, result.map_err(|cause| {
            ExactCurveError::invalid(
                CurveOperation2::Construction, crate::CurveFamily2::ImplicitPolynomial, cause,
            )
        })?)
    }
}
''')
edit('crates/hypercurve/src/curve_point/definition.rs',
     '    /// Two rational queries, each retaining its original point and pole guard.',
     '''    /// The point `(root, 0)` for a polynomial with ascending coefficients
    /// supplied as retained rational point queries. Independent coefficient
    /// fields are joined without projecting coordinates. Every original source
    /// and denominator remains authoritative, including zero coefficients.
    /// A nonexact selector must contain exactly one distinct root in its open
    /// interval; an exact root must equal both bounds and satisfy a nonzero
    /// equation. Replay ignores the supplied root-count flag.
    SelectedPolynomialRoot {
        coefficients: Vec<crate::CurvePointRationalForm2>,
        root: hypersolve::IsolatedRootInterval,
    },
    /// Two rational queries, each retaining its original point and pole guard.''')
edit('crates/hypercurve/src/curve_point/definition.rs',
     '            Self::Coordinates(point) => Ok(point.into()),',
     '''            Self::Coordinates(point) => Ok(point.into()),
            Self::SelectedPolynomialRoot { coefficients, root } => {
                crate::polynomial_point::PolynomialPoint2::from_selected_root(
                    coefficients, root, policy,
                )
            }''')

edit('crates/hypercurve/src/svg/exact/graph/points.rs',
     'pub(super) const QUERY_PARAMETER: u8 = 27;',
     'pub(super) const QUERY_PARAMETER: u8 = 27;\npub(super) const SELECTED_POLYNOMIAL_ROOT: u8 = 28;')
edit('crates/hypercurve/src/svg/exact/graph/points.rs',
     '                            CurvePointDefinition2::RationalQueryPair { sources, .. } => {',
     '''                            CurvePointDefinition2::SelectedPolynomialRoot { coefficients, .. } => {
                                coefficients.iter().map(|coefficient| coefficient.source().clone()).collect()
                            }
                            CurvePointDefinition2::RationalQueryPair { sources, .. } => {''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs',
     '                CurvePointDefinition2::RationalQueryPair {\n',
     '''                CurvePointDefinition2::SelectedPolynomialRoot { coefficients, root } => {
                    let sources = coefficients.iter()
                        .map(|coefficient| self.point_index(coefficient.source()))
                        .collect::<SvgResult<Vec<_>>>()?;
                    depth = next_depth(sources.iter()
                        .map(|source| self.point_depths[*source as usize]).max().unwrap_or(0),
                        self.max_point_depth)?;
                    let index = self.begin(SELECTED_POLYNOMIAL_ROOT)?;
                    self.writer.write_len(coefficients.len())?;
                    for (coefficient, source) in coefficients.iter().zip(sources) {
                        self.writer.write_u32(source)?;
                        self.polynomial(coefficient.numerator())?;
                        self.polynomial(coefficient.denominator())?;
                    }
                    self.writer.write_real(&root.lower)?;
                    self.writer.write_real(&root.upper)?;
                    self.writer.write_bool(root.exact_root.is_some())?;
                    if let Some(exact) = root.exact_root { self.writer.write_real(&exact)?; }
                    index
                }
                CurvePointDefinition2::RationalQueryPair {
''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs',
     '        RATIONAL_QUERY_PAIR => {',
     '''        SELECTED_POLYNOMIAL_ROOT => {
            let count = reader.read_len()?;
            let mut coefficients = Vec::new();
            for _ in 0..count {
                let index = reader.read_len()?;
                let source = point_reference(definitions, index)?;
                depth = depth.max(next_depth(point_depths[index], max_point_depth)?);
                let numerator = read_polynomial(reader)?;
                let denominator = read_polynomial(reader)?;
                coefficients.push(source.rational_form(numerator, denominator).map_err(SvgError::Exact)?);
            }
            let lower = reader.read_real()?;
            let upper = reader.read_real()?;
            let exact_root = if reader.read_bool()? { Some(reader.read_real()?) } else { None };
            CurvePointDefinition2::SelectedPolynomialRoot {
                coefficients,
                root: hypersolve::IsolatedRootInterval {
                    lower, upper, exact_root, distinct_root_count: 1,
                },
            }
        }
        RATIONAL_QUERY_PAIR => {''')
edit('crates/hypercurve/src/svg/exact/graph.rs',
     '            | points::RATIONAL_QUERY_PAIR',
     '            | points::SELECTED_POLYNOMIAL_ROOT\n            | points::RATIONAL_QUERY_PAIR')

edit('crates/hyperbrep/src/persistence/planar_points.rs',
     '#[derive(Clone, Debug, Deserialize, Serialize)]\npub(super) enum RawPlanarPoint {',
     '''#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub(super) struct RawPlanarQuery {
    source: RawPlanarPoint,
    numerator: Vec<Vec<Real>>,
    denominator: Vec<Vec<Real>>,
}

#[derive(Clone, Debug, Deserialize, Serialize)]
pub(super) enum RawPlanarPoint {''')
edit('crates/hyperbrep/src/persistence/planar_points.rs',
     '    Coordinates([Real; 2]),',
     '''    Coordinates([Real; 2]),
    SelectedPolynomialRoot {
        coefficients: Vec<RawPlanarQuery>,
        interval: [Real; 2],
        exact_root: Option<Real>,
    },''')
edit('crates/hyperbrep/src/persistence/planar_points.rs',
     '            CurvePointDefinition2::PolynomialFiber {',
     '''            CurvePointDefinition2::SelectedPolynomialRoot { coefficients, root } => {
                let coefficients = coefficients.iter().map(|coefficient| {
                    Ok(RawPlanarQuery {
                        source: self.planar_point(coefficient.source())?,
                        numerator: coefficient.numerator().coefficients.clone(),
                        denominator: coefficient.denominator().coefficients.clone(),
                    })
                }).collect::<Result<_, PersistenceError>>()?;
                RawPlanarPoint::SelectedPolynomialRoot {
                    coefficients, interval: [root.lower, root.upper], exact_root: root.exact_root,
                }
            }
            CurvePointDefinition2::PolynomialFiber {''')
edit('crates/hyperbrep/src/persistence/planar_points.rs',
     '            RawPlanarPoint::PolynomialFiber {\n',
     '''            RawPlanarPoint::SelectedPolynomialRoot {
                coefficients, interval: [lower, upper], exact_root,
            } => {
                let coefficients = coefficients.into_iter().map(|coefficient| {
                    self.planar_point(coefficient.source)?.rational_form(
                        hypersolve::BivariatePolynomial::new(coefficient.numerator),
                        hypersolve::BivariatePolynomial::new(coefficient.denominator),
                    ).map_err(GeometryError::from).map_err(PersistenceError::from)
                }).collect::<Result<_, _>>()?;
                CurvePointDefinition2::SelectedPolynomialRoot {
                    coefficients,
                    root: hypersolve::IsolatedRootInterval {
                        lower, upper, exact_root, distinct_root_count: 1,
                    },
                }
            }
            RawPlanarPoint::PolynomialFiber {
''')
edit('crates/hyperbrep/src/persistence/admission/shapes.rs',
     '#[derive(Deserialize)]\npub(super) enum PlanarPoint {',
     '''#[derive(Deserialize)]
pub(super) struct PlanarQuery {
    source: PlanarPoint,
    numerator: Rows,
    denominator: Rows,
}

#[derive(Deserialize)]
pub(super) enum PlanarPoint {''')
edit('crates/hyperbrep/src/persistence/admission/shapes.rs',
     '    Coordinates(IgnoredAny),\n    PolynomialFiber {',
     '''    Coordinates(IgnoredAny),
    SelectedPolynomialRoot { coefficients: Vec<PlanarQuery> },
    PolynomialFiber {''')
edit('crates/hyperbrep/src/persistence/admission/shapes.rs',
     '            Self::Coordinates(_) => Ok(()),\n            Self::PolynomialFiber { equation } => {',
     '''            Self::Coordinates(_) => Ok(()),
            Self::SelectedPolynomialRoot { coefficients } => {
                budget.degree(coefficients.len().saturating_sub(1))?;
                budget.geometry(coefficients.len())?;
                for coefficient in coefficients {
                    budget.record()?;
                    coefficient.source.admit(budget)?;
                    for polynomial in [coefficient.numerator, coefficient.denominator] {
                        budget.degree(polynomial.rows.saturating_sub(1))?;
                        budget.degree(polynomial.columns.saturating_sub(1))?;
                        budget.geometry(polynomial.entries())?;
                    }
                }
                Ok(())
            }
            Self::PolynomialFiber { equation } => {''')

test = w / 'crates/hypercurve/tests/selected_coefficient_roots.rs'
assert not test.exists()
helpers = (w / 'crates/hypercurve/tests/polynomial_query_fibers.rs').read_text().split('#[test]', 1)[0]
test.write_text(helpers + (c / 'selected-coefficient-roots-tests.rs').read_text())
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=w, check=True)
subprocess.run(['git', 'diff', '--check'], cwd=w, check=True)
print(subprocess.check_output(['git', 'status', '--short'], cwd=w, text=True))
