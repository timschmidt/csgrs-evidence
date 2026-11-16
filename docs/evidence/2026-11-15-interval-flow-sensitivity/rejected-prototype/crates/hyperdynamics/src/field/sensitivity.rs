//! Initial-state derivatives enclosed from existing C1/Picard evidence.
//!
//! For a segment of duration `h`, its certified Jacobian box `A` bounds every
//! factor in the time-ordered Peano–Baker series. Independent interval products
//! `(h*A)^k/k!` enclose its terms; no commutativity is assumed. If the certified
//! contraction bound is `q < 1`, the omitted norm after order `p` is bounded by
//! `q^(p+1)/(p+1)!/(1-q)`. Outward native arithmetic also encloses rounding.
//! Hulling each nonconstant term with zero covers all intermediate durations.
//! Local transition matrices multiply prior global sensitivities on the left.
//!
//! Matrices are Cartesian outer enclosures, not exact reachable derivative sets.
//! A source's stopped prefix remains a prefix. Reports are never deserialized as
//! certificates: replay the field, evolution request/options and these options.
use super::{evolution::*, *};

/// Finite expansion effort, separate from precision and shared resource limits.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
pub struct SensitivityOptions {
    /// Maximum nonconstant terms per segment. Zero retains identity plus a
    /// certified tail. An exactly zero interval product terminates the series.
    pub terms: usize,
}
impl Default for SensitivityOptions {
    fn default() -> Self {
        Self { terms: 8 }
    }
}

/// Source rejection or failure to finish this separate sensitivity derivation.
#[derive(Clone, Debug)]
pub enum SensitivityError {
    /// No certified positive-duration source prefix exists after a stopped request.
    Source(EvolutionFailure),
    /// Shared structural, native arithmetic or cancellation failure.
    Field(FieldError),
}
impl fmt::Display for SensitivityError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "flow sensitivity: {self:?}")
    }
}
impl std::error::Error for SensitivityError {
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        match self {
            Self::Source(e) => Some(e),
            Self::Field(e) => Some(e),
        }
    }
}

/// Evidence for the corresponding indexed certified source segment.
#[derive(Clone, Debug)]
pub struct SensitivityStep<const N: usize> {
    terms: Vec<IntervalMatrix<DyadicInterval, N, N>>,
    tail: DyadicInterval,
    local_end: IntervalMatrix<DyadicInterval, N, N>,
    local_tube: IntervalMatrix<DyadicInterval, N, N>,
    global_end: IntervalMatrix<DyadicInterval, N, N>,
    global_tube: IntervalMatrix<DyadicInterval, N, N>,
}
impl<const N: usize> SensitivityStep<N> {
    /// Ordered term enclosures, starting with identity and including a terminal
    /// zero product when one was proved. These need not be point matrices.
    pub fn terms(&self) -> &[IntervalMatrix<DyadicInterval, N, N>] { &self.terms }
    /// Nonnegative interval from zero to an upper bound on the omitted norm.
    pub fn tail_norm_bound(&self) -> &DyadicInterval { &self.tail }
    /// Endpoint derivative with respect to this segment's initial state.
    pub fn local_end(&self) -> &IntervalMatrix<DyadicInterval, N, N> { &self.local_end }
    /// Whole-segment derivative with respect to this segment's initial state.
    pub fn local_tube(&self) -> &IntervalMatrix<DyadicInterval, N, N> { &self.local_tube }
    /// Endpoint derivative with respect to the original request's initial state.
    pub fn global_end(&self) -> &IntervalMatrix<DyadicInterval, N, N> { &self.global_end }
    /// Whole-segment derivative with respect to the original initial state.
    pub fn global_tube(&self) -> &IntervalMatrix<DyadicInterval, N, N> { &self.global_tube }
}

/// Immutable sensitivity evidence sharing its authoritative evolution report.
#[derive(Clone, Debug)]
pub struct FlowSensitivity<const N: usize> {
    source: Arc<EvolutionReport<N>>,
    options: SensitivityOptions,
    policy: EnclosurePolicy,
    initial: IntervalMatrix<DyadicInterval, N, N>,
    steps: Vec<SensitivityStep<N>>,
}
impl<const N: usize> FlowSensitivity<N> {
    /// Shared source, including original policy, attempts, guards and Jacobians.
    pub fn source(&self) -> &Arc<EvolutionReport<N>> { &self.source }
    /// Recorded series effort.
    pub fn options(&self) -> SensitivityOptions { self.options }
    /// Policy used for this derivation, distinct from the source's policy.
    pub fn policy(&self) -> EnclosurePolicy { self.policy }
    /// Original horizon status; a stopped prefix is never promoted to completion.
    pub fn status(&self) -> &EvolutionStatus { self.source.status() }
    /// Exact end time of the certified source prefix or successful empty request.
    pub fn reached_time(&self) -> &DyadicInterval { self.source.reached_time() }
    /// Evidence in the same order as the source's certified segments.
    pub fn steps(&self) -> &[SensitivityStep<N>] { &self.steps }
    /// Last positive-duration prefix derivative, without a full-horizon claim.
    pub fn prefix_end_matrix(&self) -> Option<&IntervalMatrix<DyadicInterval, N, N>> {
        self.steps.last().map(|s| &s.global_end)
    }
    /// Full-horizon derivative enclosure only after source completion. Empty
    /// input yields the empty matrix set. Identity makes no ODE existence claim.
    pub fn end_matrix(&self) -> Option<&IntervalMatrix<DyadicInterval, N, N>> {
        match self.status() {
            EvolutionStatus::Completed => self.prefix_end_matrix(),
            EvolutionStatus::Empty | EvolutionStatus::Identity => Some(&self.initial),
            EvolutionStatus::Stopped(_) => None,
        }
    }
}

impl<const N: usize> EvolutionReport<N> {
    /// Enclose the initial-state derivative across every certified source segment.
    ///
    /// Reuses source C1/Jacobian evidence without evaluating the source again.
    /// A stopped source with no certified segment is an error. A stopped source
    /// with a prefix retains that status and has no full-horizon endpoint.
    /// Any failure in this derivation returns an error without partial output;
    /// retaining another source `Arc` permits a larger-budget retry.
    ///
    /// Counts new retained matrix entries, term/step records and tail scalars,
    /// plus a conservative scratch allowance of twelve matrices and 32 scalars.
    /// Source storage is shared and excluded. Work charges include matrix cell
    /// operations and native arithmetic under the same budget. These are logical
    /// entries, not heap-byte reservations: scalar payload copies, allocator
    /// capacity, stack storage and single-operation cancellation retain the
    /// exclusions of `EnclosureBudget`. Cancellation is polled between stages
    /// and immediately before publication; it cannot interrupt a matrix product.
    pub fn sensitivity(
        self: Arc<Self>,
        options: SensitivityOptions,
        budget: &mut EnclosureBudget,
    ) -> Result<FlowSensitivity<N>, SensitivityError> {
        if let EvolutionStatus::Stopped(reason) = self.status()
            && self.segments().len() == 0
        {
            return Err(SensitivityError::Source(reason.clone()));
        }
        derive(self, options, budget).map_err(SensitivityError::Field)
    }
}

fn derive<const N: usize>(
    source: Arc<EvolutionReport<N>>,
    options: SensitivityOptions,
    budget: &mut EnclosureBudget,
) -> Result<FlowSensitivity<N>, FieldError> {
    let cells = N.checked_mul(N).ok_or(ExpressionError::SizeExhausted)?;
    let scratch = cells.checked_mul(12).and_then(|n| n.checked_add(32))
        .ok_or(ExpressionError::SizeExhausted)?;
    let mut retained = 0;
    retain(budget, &mut retained, cells.checked_add(1).ok_or(ExpressionError::SizeExhausted)?, scratch)?;
    let zero = DyadicInterval::point(0.into(), 0)?;
    let one = DyadicInterval::point(1.into(), 0)?;
    let identity = IntervalMatrix::new(core::array::from_fn(|r| core::array::from_fn(|c| {
        if r == c { one.clone() } else { zero.clone() }
    })))?;
    let initial = if matches!(source.status(), EvolutionStatus::Empty) {
        IntervalMatrix::empty()?
    } else { identity.clone() };
    let mut result = FlowSensitivity { source, options, policy: budget.policy(), initial, steps: Vec::new() };
    let zero_matrix = IntervalMatrix::new(core::array::from_fn(|_| core::array::from_fn(|_| zero.clone())))?;
    let precision = budget.policy.precision;
    let product_work = cells.checked_mul(N).ok_or(ExpressionError::SizeExhausted)?;
    let term_storage = cells.checked_add(1).ok_or(ExpressionError::SizeExhausted)?;
    let step_storage = cells.checked_mul(4).and_then(|n| n.checked_add(2)).ok_or(ExpressionError::SizeExhausted)?;
    for source_step in result.source.segments() {
        retain(budget, &mut retained, step_storage, scratch)?;
        retain(budget, &mut retained, term_storage, scratch)?;
        let evidence = source_step.evidence();
        let q = evidence.contraction().expect("certified contraction");
        let b = evidence.jacobian().expect("certified Jacobian")
            .scale(evidence.duration().expect("certified duration"), &mut budget.arithmetic)?;
        let mut terms = vec![identity.clone()];
        let mut endpoint = identity.clone();
        let mut tube = identity.clone();
        let mut alpha = one.clone();
        let mut vanished = N == 0;
        for k in 1..=options.terms {
            if vanished { break; }
            retain(budget, &mut retained, term_storage, scratch)?;
            budget.graph.charge(product_work)?;
            let divisor = DyadicInterval::point(k.into(), 0)?;
            let reciprocal = divisor.reciprocal(precision, &mut budget.arithmetic)?;
            let term = b.mul_matrix(terms.last().expect("identity"), &mut budget.arithmetic)?
                .scale(&reciprocal, &mut budget.arithmetic)?;
            vanished = term.rows().expect("nonempty product").iter().flatten()
                .all(|entry| entry.signs() == hyperinterval::SignSet::Zero);
            budget.graph.charge(cells.checked_mul(3).ok_or(ExpressionError::SizeExhausted)?)?;
            endpoint = endpoint.add(&term, &mut budget.arithmetic)?;
            tube = tube.add(&term.hull(&zero_matrix, &mut budget.arithmetic)?, &mut budget.arithmetic)?;
            alpha = alpha.mul(q, &mut budget.arithmetic)?.div(&divisor, precision, &mut budget.arithmetic)?;
            terms.push(term);
        }
        budget.graph.charge(cells)?;
        let tail = if vanished { zero.clone() } else {
            // terms.len() is p+1, including identity. Subtract q exactly before
            // division; coarse rounding must not fabricate a zero denominator.
            let next = DyadicInterval::point(terms.len().into(), 0)?;
            alpha.mul(q, &mut budget.arithmetic)?
                .div(&next, precision, &mut budget.arithmetic)?
                .div(&one.sub(q, &mut budget.arithmetic)?, precision, &mut budget.arithmetic)?
                .hull(&zero, &mut budget.arithmetic)?
        };
        let radius = tail.neg(&mut budget.arithmetic)?.hull(&tail, &mut budget.arithmetic)?;
        let error = IntervalMatrix::new(core::array::from_fn(|_| core::array::from_fn(|_| radius.clone())))?;
        let local_end = endpoint.add(&error, &mut budget.arithmetic)?;
        let local_tube = tube.add(&error, &mut budget.arithmetic)?;
        let previous = result.steps.last().map_or(&result.initial, |s| &s.global_end);
        budget.graph.charge(product_work.checked_mul(2).ok_or(ExpressionError::SizeExhausted)?)?;
        let global_end = local_end.mul_matrix(previous, &mut budget.arithmetic)?;
        let global_tube = local_tube.mul_matrix(previous, &mut budget.arithmetic)?;
        budget.graph.charge(1)?;
        result.steps.push(SensitivityStep { terms, tail, local_end, local_tube, global_end, global_tube });
    }
    budget.graph.charge(0)?;
    Ok(result)
}

fn retain(budget: &mut EnclosureBudget, retained: &mut usize, additional: usize, scratch: usize) -> Result<(), FieldError> {
    let count = retained.checked_add(additional).ok_or(ExpressionError::SizeExhausted)?;
    budget.graph.check_entries(&[count, scratch])?;
    budget.graph.charge(additional)?;
    *retained = count;
    Ok(())
}
