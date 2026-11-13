use hyperinterval::{DomainCoverage, DyadicBudget, DyadicInterval, IntervalError, RangeEnclosure};
use hyperreal::Real;

use super::{
    BinaryOperation, ExpressionBudget, ExpressionError, ExpressionProgram, ProgramArithmetic,
    UnaryOperation,
};

impl ExpressionProgram {
    /// Enclose every output over the Cartesian product of the input intervals.
    ///
    /// Success certifies that each reached operation covers its whole operand
    /// enclosure. Partial-domain images are refused, including when dependency
    /// overestimation prevents a proof for otherwise valid exact inputs. Original
    /// domain guards remain active under zero factors or zero powers. An empty
    /// input product maps to canonical empty outputs after binding/graph checks;
    /// zero input dimensions instead form the nonempty unit product.
    ///
    /// The exact owned definition stays authoritative. Graph traversal uses
    /// `graph_budget`; interval arithmetic uses the separate `arithmetic_budget`.
    /// `precision` is spacing for rounded native operations and constant
    /// enclosures, not a final-width guarantee. Exact sums/products keep their
    /// native grids. Hyperreal constant enclosure refinement is outside both
    /// budgets' total-work accounting; this API is not a wholly bounded field
    /// evaluator. Graph cancellation cannot interrupt that scalar refinement or
    /// a native interval operation. No interval result is retained between calls.
    pub fn eval_dyadic(
        &self,
        values: &[DyadicInterval],
        precision: i32,
        graph_budget: &mut ExpressionBudget,
        arithmetic_budget: &mut DyadicBudget,
    ) -> Result<Vec<DyadicInterval>, ExpressionError> {
        graph_budget.charge(0)?;
        let source = &self.definition;
        if values.len() != source.variables.len() {
            return Err(ExpressionError::BindingCount {
                expected: source.variables.len(),
                actual: values.len(),
            });
        }
        graph_budget.entries(&[
            source.variables.len(),
            source.nodes.len(),
            source.outputs.len(),
        ])?;
        graph_budget.charge(values.len())?;
        if values.iter().any(DyadicInterval::is_empty) {
            graph_budget.charge(source.outputs.len())?;
            let outputs = vec![DyadicInterval::empty(); source.outputs.len()];
            graph_budget.charge(0)?;
            return Ok(outputs);
        }
        self.evaluate(
            values,
            graph_budget,
            &mut DyadicArithmetic {
                precision,
                budget: arithmetic_budget,
            },
        )
    }
}

struct DyadicArithmetic<'a> {
    precision: i32,
    budget: &'a mut DyadicBudget,
}

enum DyadicFailure {
    Native(IntervalError),
    DomainNotCertified,
}

impl From<IntervalError> for DyadicFailure {
    fn from(error: IntervalError) -> Self {
        Self::Native(error)
    }
}

fn complete<T>(image: RangeEnclosure<T>) -> Result<T, DyadicFailure> {
    if image.domain == DomainCoverage::Complete {
        Ok(image.range)
    } else {
        Err(DyadicFailure::DomainNotCertified)
    }
}

impl ProgramArithmetic for DyadicArithmetic<'_> {
    type Value = DyadicInterval;
    type CopyError = IntervalError;
    type OperationError = DyadicFailure;

    fn copy_error(node: usize, source: IntervalError) -> ExpressionError {
        ExpressionError::Enclosure { node, source }
    }
    fn operation_error(node: usize, error: DyadicFailure) -> ExpressionError {
        match error {
            DyadicFailure::Native(source) => ExpressionError::Enclosure { node, source },
            DyadicFailure::DomainNotCertified => ExpressionError::DomainNotCertified { node },
        }
    }
    fn constant(&mut self, value: &Real) -> Result<Self::Value, IntervalError> {
        DyadicInterval::from_real(value, self.precision, self.budget)
    }
    fn copy(&mut self, value: &Self::Value) -> Result<Self::Value, IntervalError> {
        // Native exponent one copies on the original grid and charges its
        // mantissas. Calling Clone here would escape arithmetic accounting.
        value.checked_pow(1, self.budget)
    }
    fn unary(
        &mut self,
        operation: UnaryOperation,
        value: Self::Value,
    ) -> Result<Self::Value, DyadicFailure> {
        let p = self.precision;
        let b = &mut *self.budget;
        match operation {
            UnaryOperation::Neg => Ok(value.neg(b)?),
            UnaryOperation::PowI(exponent) => {
                // Hyperinterval's set power deliberately defines x^0 at zero;
                // the original Expr/Real grammar does not. Do not erase it.
                if exponent == 0 && value.signs().contains_zero() {
                    return Err(if value.is_singleton() {
                        IntervalError::EmptyDomain.into()
                    } else {
                        DyadicFailure::DomainNotCertified
                    });
                }
                let image = value.pow_rational(&exponent.into(), &1.into(), p, b)?;
                Ok(complete(image)?.hull(b)?.finite_range(b)?)
            }
            UnaryOperation::Sqrt => complete(value.sqrt(p, b)?),
            UnaryOperation::Sin => complete(value.sin(p, b)?),
            UnaryOperation::Cos => complete(value.cos(p, b)?),
            UnaryOperation::Ln | UnaryOperation::Log10 => {
                let range = complete(value.log(p, b)?)?.finite_range(b)?;
                if operation == UnaryOperation::Log10 {
                    // Keep the constant denominator positive even when the
                    // requested output grid is coarser than log(10).
                    let ten = DyadicInterval::point(10.into(), 0)?;
                    let denominator = complete(ten.log(p.min(0), b)?)?.finite_range(b)?;
                    Ok(range.div(&denominator, p, b)?)
                } else {
                    Ok(range)
                }
            }
            UnaryOperation::Asin => complete(value.asin(p, b)?),
            UnaryOperation::Acos => complete(value.acos(p, b)?),
            UnaryOperation::Acosh => complete(value.acosh(p, b)?),
            UnaryOperation::Atanh => Ok(complete(value.atanh(p, b)?)?.finite_range(b)?),
        }
    }
    fn binary(
        &mut self,
        operation: BinaryOperation,
        left: Self::Value,
        right: Self::Value,
    ) -> Result<Self::Value, DyadicFailure> {
        Ok(match operation {
            BinaryOperation::Add => left.add(&right, self.budget)?,
            BinaryOperation::Sub => left.sub(&right, self.budget)?,
            BinaryOperation::Mul => left.mul(&right, self.budget)?,
            BinaryOperation::Div => left.div(&right, self.precision, self.budget)?,
        })
    }
}
