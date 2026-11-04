//! Bivariate elimination over a retained exact ordered coefficient field.
//!
//! Coefficients never pass through independent scalar coordinates. The shared
//! pivot-free determinant uses only ring operations and rational scalings.
//! A zero resultant is candidate component evidence, not a selected real arc.
use std::cmp::Ordering;

use hyperreal::Real;

use crate::bareiss::{DeterminantArithmetic, pivot_free_determinant_with};
use crate::{CurveResultantParameter, OrderedFieldPolynomialContext};

/// Failure before a complete exact elimination polynomial is available.
#[derive(Debug)]
pub enum OrderedFieldResultantError<E> {
    /// The caller's arithmetic, embedding or exact-sign authority declined.
    Context(E),
    /// Checked dimensions or a fallible temporary allocation were unavailable.
    /// This is not a configured degree limit or a geometric zero.
    StorageUnavailable,
    /// The shared work scope declined an admission or observed cancellation.
    /// Its receipt distinguishes the reached limit from cancellation.
    BudgetExhausted,
}

type Result<T, E> = std::result::Result<T, OrderedFieldResultantError<E>>;

fn check<E>() -> Result<(), E> {
    if crate::work_budget::exhaustion().is_some() {
        Err(OrderedFieldResultantError::BudgetExhausted)
    } else {
        Ok(())
    }
}

fn reserve<T, E>(size: usize) -> Result<Vec<T>, E> {
    let mut values = Vec::new();
    values
        .try_reserve_exact(size)
        .map_err(|_| OrderedFieldResultantError::StorageUnavailable)?;
    Ok(values)
}

fn trim<C, F: OrderedFieldPolynomialContext<C>>(
    values: &mut Vec<C>,
    field: &mut F,
) -> Result<(), F::Error> {
    while let Some(value) = values.last() {
        check()?;
        if field
            .sign(value)
            .map_err(OrderedFieldResultantError::Context)?
            != Ordering::Equal
        {
            break;
        }
        values.pop();
    }
    Ok(())
}

/// Ascending eliminated powers, whose entries are retained-axis polynomials.
fn oriented<C: Clone, F: OrderedFieldPolynomialContext<C>>(
    input: &[Vec<C>],
    retained: CurveResultantParameter,
    field: &mut F,
) -> Result<Vec<Vec<C>>, F::Error> {
    let outer = match retained {
        CurveResultantParameter::First => input.iter().map(Vec::len).max().unwrap_or(0),
        CurveResultantParameter::Second => input.len(),
    };
    let inner = match retained {
        CurveResultantParameter::First => input.len(),
        CurveResultantParameter::Second => input.iter().map(Vec::len).max().unwrap_or(0),
    };
    let mut result = reserve(outer)?;
    for j in 0..outer {
        check()?;
        let mut polynomial = reserve(inner)?;
        for i in 0..inner {
            let value = match retained {
                CurveResultantParameter::First => input.get(i).and_then(|row| row.get(j)),
                CurveResultantParameter::Second => input.get(j).and_then(|row| row.get(i)),
            };
            polynomial.push(
                match value {
                    // Validate/align every coefficient, including authored zeros.
                    Some(value) => field.scale(value, &Real::one()),
                    None => field.constant(&Real::zero()),
                }
                .map_err(OrderedFieldResultantError::Context)?,
            );
        }
        trim(&mut polynomial, field)?;
        result.push(polynomial);
    }
    while result.last().is_some_and(Vec::is_empty) {
        result.pop();
    }
    Ok(result)
}

struct PolynomialArithmetic<'a, F>(&'a mut F);
impl<C: Clone, F: OrderedFieldPolynomialContext<C>> DeterminantArithmetic<Vec<C>>
    for PolynomialArithmetic<'_, F>
{
    type Error = OrderedFieldResultantError<F::Error>;
    fn constant(&mut self, value: &Real) -> Result<Vec<C>, F::Error> {
        check()?;
        if value.definitely_zero() {
            Ok(Vec::new())
        } else {
            Ok(vec![
                self.0
                    .constant(value)
                    .map_err(OrderedFieldResultantError::Context)?,
            ])
        }
    }
    fn add(&mut self, a: &Vec<C>, b: &Vec<C>) -> Result<Vec<C>, F::Error> {
        check()?;
        let mut result = reserve(a.len().max(b.len()))?;
        for i in 0..a.len().max(b.len()) {
            result.push(match (a.get(i), b.get(i)) {
                (Some(a), Some(b)) => self
                    .0
                    .add(a, b)
                    .map_err(OrderedFieldResultantError::Context)?,
                (Some(value), None) | (None, Some(value)) => value.clone(),
                (None, None) => unreachable!("one polynomial has this coefficient"),
            });
        }
        Ok(result)
    }
    fn multiply(&mut self, a: &Vec<C>, b: &Vec<C>) -> Result<Vec<C>, F::Error> {
        check()?;
        if a.is_empty() || b.is_empty() {
            return Ok(Vec::new());
        }
        let size = a
            .len()
            .checked_add(b.len() - 1)
            .ok_or(OrderedFieldResultantError::StorageUnavailable)?;
        let mut result = reserve(size)?;
        result.resize_with(size, || None);
        for (i, a) in a.iter().enumerate() {
            check()?;
            for (j, b) in b.iter().enumerate() {
                let value = self
                    .0
                    .multiply(a, b)
                    .map_err(OrderedFieldResultantError::Context)?;
                result[i + j] = Some(match result[i + j].take() {
                    Some(old) => self
                        .0
                        .add(&old, &value)
                        .map_err(OrderedFieldResultantError::Context)?,
                    None => value,
                });
            }
        }
        result
            .into_iter()
            .map(|value| {
                value.map_or_else(
                    || {
                        self.0
                            .constant(&Real::zero())
                            .map_err(OrderedFieldResultantError::Context)
                    },
                    Ok,
                )
            })
            .collect()
    }
    fn scale(&mut self, value: &Vec<C>, scale: &Real) -> Result<Vec<C>, F::Error> {
        check()?;
        value
            .iter()
            .map(|value| {
                self.0
                    .scale(value, scale)
                    .map_err(OrderedFieldResultantError::Context)
            })
            .collect()
    }
    fn negate(&mut self, value: Vec<C>) -> Result<Vec<C>, F::Error> {
        self.scale(&value, &Real::from(-1))
    }
}

/// Exact resultant of two bivariate polynomials over the caller's field.
///
/// Inputs are ascending `[first_power][second_power]` coefficient grids; missing
/// entries are zero. The output is ascending in `retained`, with its exact
/// magnitude, including original coefficient scales. A zero input returns
/// `[0]`; two nonzero eliminated-degree-zero inputs return `[1]`. A zero
/// resultant does not prove a real common component or exclude isolated events.
/// Consumers must retain and validate the original equations and selections.
///
/// The shared Sylvester/Faddeev-LeVerrier construction has no finite degree or
/// coefficient-field-degree prerequisite and makes no pivot decisions. Every
/// coefficient is checked through the supplied exact context. No primitive
/// element, independent coordinate projection or approximation is introduced.
///
/// One shared promotion unit admits the call. Cancellation is checked between
/// polynomial operations and multiplication rows, including coefficient scans.
/// This does not bound one field operation, coefficient growth, total work,
/// heap, or elapsed time. Checked storage failure and actual budget exhaustion
/// remain distinct; neither publishes a partial elimination polynomial.
pub fn ordered_field_resultant_bivariate<C: Clone, F: OrderedFieldPolynomialContext<C>>(
    first: &[Vec<C>],
    second: &[Vec<C>],
    retained: CurveResultantParameter,
    field: &mut F,
) -> Result<Vec<C>, F::Error> {
    crate::work_budget::consume(crate::work_budget::WorkKind::AlgebraicPromotion, 1)
        .map_err(|_| OrderedFieldResultantError::BudgetExhausted)?;
    let first = oriented(first, retained, field)?;
    let second = oriented(second, retained, field)?;
    if first.is_empty() || second.is_empty() {
        return Ok(vec![
            field
                .constant(&Real::zero())
                .map_err(OrderedFieldResultantError::Context)?,
        ]);
    }
    let (m, n) = (first.len() - 1, second.len() - 1);
    let dimension = m
        .checked_add(n)
        .ok_or(OrderedFieldResultantError::StorageUnavailable)?;
    dimension
        .checked_mul(dimension)
        .ok_or(OrderedFieldResultantError::StorageUnavailable)?;
    let mut matrix = reserve(dimension)?;
    for row in 0..dimension {
        check()?;
        let mut entries = reserve(dimension)?;
        entries.resize_with(dimension, Vec::new);
        let (equation, shift) = if row < n {
            (&first, row)
        } else {
            (&second, row - n)
        };
        for (degree, coefficient) in equation.iter().rev().enumerate() {
            entries[shift + degree] = coefficient.clone();
        }
        matrix.push(entries);
    }
    let mut result = pivot_free_determinant_with(&matrix, &mut PolynomialArithmetic(field))?;
    trim(&mut result, field)?;
    if result.is_empty() {
        result.push(
            field
                .constant(&Real::zero())
                .map_err(OrderedFieldResultantError::Context)?,
        );
    }
    check()?;
    Ok(result)
}
