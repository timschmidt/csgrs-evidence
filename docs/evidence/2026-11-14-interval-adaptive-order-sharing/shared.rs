//! Explicit lazy sharing of coefficient preparation between adaptive orders.
use super::*;

/// An adaptive controller that extends already-demanded coefficient prefixes.
///
/// Native search, proof validation, ascending quality tests and halving/regrowth
/// use the same algorithm as the independent controller. Only preparation changes:
/// the first demanded order is built normally and later absent orders extend its
/// exact prefix. No maximum order is prepared eagerly. Savings change cumulative
/// work cutoffs; selecting this type explicitly selects that resource behavior.
#[derive(Clone, Debug)]
pub struct SharedAdaptiveTaylorField<const N: usize> {
    controller: AdaptiveTaylorField<N>,
}
/// Adaptive history produced with lazy shared preparation, not a serialized proof.
///
/// The wrapper retains the preparation choice; the borrowed report retains the
/// source, options, budget policy, attempted proofs and any certified prefix.
/// Replay the original source/options/request through `share_preparation` to
/// reproduce this strategy. A successful prefix never becomes whole-run success.
#[derive(Clone, Debug)]
pub struct SharedAdaptiveTaylorEvolution<const N: usize> {
    report: AdaptiveTaylorEvolution<N>,
}
impl<const N: usize> AdaptiveTaylorField<N> {
    /// Select lazy coefficient-prefix sharing for subsequent integrations.
    /// The independent controller's options and algorithm remain available unchanged.
    pub fn share_preparation(self) -> SharedAdaptiveTaylorField<N> {
        SharedAdaptiveTaylorField { controller: self }
    }
}
impl<const N: usize> SharedAdaptiveTaylorField<N> {
    /// Original source and finite order/quality/search configuration.
    pub fn controller(&self) -> &AdaptiveTaylorField<N> {
        &self.controller
    }
    /// Integrate with lazy cross-order preparation under one caller-owned budget.
    /// Failed extensions publish no new program; previous programs and completed
    /// proof stages remain in the report. Domain/native failures still stop with
    /// their original typed cause rather than trying a weaker certificate.
    pub fn integrate(
        &self,
        request: EvolutionRequest<N>,
        budget: &mut EnclosureBudget,
    ) -> SharedAdaptiveTaylorEvolution<N> {
        let mut report = AdaptiveTaylorEvolution {
            controller: self.controller.clone(),
            request,
            policy: budget.policy(),
            programs: Vec::new(),
            attempts: Vec::new(),
            segments: Vec::new(),
            status: AdaptiveTaylorStatus::Identity,
        };
        report.status = match self.controller.evolve_shared(&mut report, budget) {
            Ok(status) => status,
            Err(error) => AdaptiveTaylorStatus::Stopped(error),
        };
        SharedAdaptiveTaylorEvolution { report }
    }
}
impl<const N: usize> SharedAdaptiveTaylorEvolution<N> {
    /// Borrow the full adaptive report, including stopped-prefix semantics.
    /// The outer type records shared preparation; no conversion discards it by default.
    pub fn report(&self) -> &AdaptiveTaylorEvolution<N> {
        &self.report
    }
}
