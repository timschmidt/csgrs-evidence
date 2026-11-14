//! Automatic frame proposals composed with independent QR and trajectory proofs.
use super::{
    CoordinateEvolution, CoordinateEvolutionStatus, CoordinateField, CoordinateFieldError,
    CoordinateFieldTransition, CoordinateTransport, CoordinateTransportError, QrCoordinateField,
    QrFieldError,
};
use crate::field::{
    EnclosedVectorField, EnclosureBudget, EnclosurePolicy, FieldError,
    evolution::{EvolutionFailure, EvolutionOptions, EvolutionRequest, copy_state},
};
use hyperinterval::{DyadicInterval, IntervalError, SignSet};
use hyperlattice_interval::{BoxN, IntervalLatticeError, IntervalMatrix};
use hyperreal::Real;
use hypersolve::expression_program::ExpressionError;
use std::{cmp::Ordering, fmt};

/// Explicit finite window search contract; native step controls apply per window.
#[derive(Clone, Debug)]
pub struct QrEvolutionOptions {
    /// Positive singleton dyadic duration, capped by the exact remaining horizon.
    pub window: DyadicInterval,
    /// Maximum complete windows; zero permits only empty or identity requests.
    pub maximum_windows: usize,
    /// Existing native search controls within each selected frame.
    pub native: EvolutionOptions,
}
impl Default for QrEvolutionOptions {
    fn default() -> Self {
        Self {
            window: DyadicInterval::point(1.into(), -4).expect("finite duration"),
            maximum_windows: 256,
            native: EvolutionOptions::default(),
        }
    }
}

/// A selection, construction, transport or original native failure.
#[derive(Clone, Debug)]
pub enum QrEvolutionFailure {
    /// Window duration is not a positive singleton.
    InvalidWindow,
    /// The configured number of complete windows was reached before the horizon.
    WindowLimit {
        /// Configured maximum.
        limit: usize,
    },
    /// Original time, native existence search, resource or cancellation failure.
    Native(EvolutionFailure),
    /// Original QR rank, undecided predicate, reconstruction or resource failure.
    Qr(QrFieldError),
    /// Original direct chart transport failure.
    Transport(CoordinateTransportError),
    /// Original source-coordinate materialization failure.
    Coordinate(CoordinateFieldError),
}
impl fmt::Display for QrEvolutionFailure {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "QR evolution: {self:?}")
    }
}
impl std::error::Error for QrEvolutionFailure {
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        match self {
            Self::Native(e) => Some(e),
            Self::Qr(e) => Some(e),
            Self::Transport(e) => Some(e),
            Self::Coordinate(e) => Some(e),
            _ => None,
        }
    }
}
impl From<EvolutionFailure> for QrEvolutionFailure {
    fn from(e: EvolutionFailure) -> Self { Self::Native(e) }
}
impl From<FieldError> for QrEvolutionFailure {
    fn from(e: FieldError) -> Self { Self::Native(e.into()) }
}
impl From<ExpressionError> for QrEvolutionFailure {
    fn from(e: ExpressionError) -> Self { Self::Native(e.into()) }
}
impl From<IntervalError> for QrEvolutionFailure {
    fn from(e: IntervalError) -> Self { Self::Native(e.into()) }
}
impl From<IntervalLatticeError> for QrEvolutionFailure {
    fn from(e: IntervalLatticeError) -> Self { Self::Native(e.into()) }
}

/// Whole-request outcome; no partial prefix is returned as a completed horizon.
#[derive(Clone, Debug)]
pub enum QrEvolutionStatus {
    /// Every frame, transport, native step and source projection completed.
    Completed,
    /// Zero-duration identity; no ODE existence claim.
    Identity,
    /// Validated empty initial product.
    Empty,
    /// Only the explicitly exposed completed-window prefix is certified.
    Stopped(QrEvolutionFailure),
}

/// Replayable frame proposal, not an ODE or variational-flow certificate.
///
/// For the incoming chart x=c+A*y and midpoint m of its initial box, form
/// M=midpoint(J(t,m)), B=A*(I+h*M), origin=c+A*m. Entries of M are exact rational
/// midpoints of certified Jacobian enclosures; they need not equal the derivative.
/// The subsequent QR algorithm independently verifies the exact proposed B.
#[derive(Clone, Debug)]
pub struct QrFrameSelection<const N: usize> {
    chart: CoordinateField<N>,
    time: DyadicInterval,
    duration: DyadicInterval,
    initial: BoxN<DyadicInterval, N>,
    midpoint: BoxN<DyadicInterval, N>,
    jacobian: IntervalMatrix<DyadicInterval, N, N>,
    basis: Vec<Vec<Real>>,
    origin: Vec<Real>,
}
impl<const N: usize> QrFrameSelection<N> {
    /// Original incoming chart and its retained field identity.
    pub fn chart(&self) -> &CoordinateField<N> { &self.chart }
    /// Exact start of the proposed window.
    pub fn time(&self) -> &DyadicInterval { &self.time }
    /// Exact horizon-capped duration used only to propose the frame.
    pub fn duration(&self) -> &DyadicInterval { &self.duration }
    /// Incoming native enclosure in this chart.
    pub fn initial(&self) -> &BoxN<DyadicInterval, N> { &self.initial }
    /// Exact midpoint used for the Jacobian query.
    pub fn midpoint(&self) -> &BoxN<DyadicInterval, N> { &self.midpoint }
    /// Certified local Jacobian enclosure; midpoint selection does not preserve it as a set.
    pub fn jacobian(&self) -> &IntervalMatrix<DyadicInterval, N, N> { &self.jacobian }
    /// Exact proposed source-coordinate basis, later checked by QR.
    pub fn basis(&self) -> &[Vec<Real>] { &self.basis }
    /// Exact recentered source-coordinate origin.
    pub fn origin(&self) -> &[Real] { &self.origin }
}

/// One staged window attempt, retaining every successfully constructed relation.
/// A missing later stage records an interrupted attempt, never successful geometry.
#[derive(Clone, Debug)]
pub struct QrEvolutionWindow<const N: usize> {
    selection: QrFrameSelection<N>,
    frame: Option<QrCoordinateField<N>>,
    transition: Option<CoordinateFieldTransition<N>>,
    transport: Option<CoordinateTransport<N>>,
    evolution: Option<CoordinateEvolution<N>>,
}
impl<const N: usize> QrEvolutionWindow<N> {
    /// Exact inputs and proposal construction data.
    pub fn selection(&self) -> &QrFrameSelection<N> { &self.selection }
    /// Certified QR and inverse, if construction succeeded.
    pub fn frame(&self) -> Option<&QrCoordinateField<N>> { self.frame.as_ref() }
    /// Certified exact relation between incoming and proposed charts.
    pub fn transition(&self) -> Option<&CoordinateFieldTransition<N>> { self.transition.as_ref() }
    /// Retained outer projection of the exact transported input.
    pub fn transport(&self) -> Option<&CoordinateTransport<N>> { self.transport.as_ref() }
    /// Native attempts and source projections, including any explicitly stopped prefix.
    pub fn evolution(&self) -> Option<&CoordinateEvolution<N>> { self.evolution.as_ref() }
}

/// Source-bound whole-horizon run with explicit staged and completed-window prefixes.
///
/// Replay the original chart definition, request, options and policy. Serialized
/// flags/enclosures are not proof. New native boxes are outer projections of exact
/// chart images; dependency loss and interval wrapping remain explicit. No exact
/// reachable-set equality, optimal frame, width improvement or speedup is promised.
/// Shared budgets cover nested native work and aggregate retained record counts;
/// exact scalar refinement/payload, retained transformed graphs, vector capacity,
/// heap bytes and within-scalar cancellation retain their existing exclusions.
#[derive(Clone, Debug)]
pub struct QrEvolution<const N: usize> {
    chart: CoordinateField<N>,
    request: EvolutionRequest<N>,
    options: QrEvolutionOptions,
    policy: EnclosurePolicy,
    windows: Vec<QrEvolutionWindow<N>>,
    completed: usize,
    initial_projection: Option<BoxN<DyadicInterval, N>>,
    status: QrEvolutionStatus,
}
impl<const N: usize> QrEvolution<N> {
    /// Original exact source-bound chart.
    pub fn chart(&self) -> &CoordinateField<N> { &self.chart }
    /// Original input set and time horizon.
    pub fn request(&self) -> &EvolutionRequest<N> { &self.request }
    /// Immutable finite selection and native-search configuration.
    pub fn options(&self) -> &QrEvolutionOptions { &self.options }
    /// Shared enclosure policy used throughout the run.
    pub fn policy(&self) -> EnclosurePolicy { self.policy }
    /// All frame attempts, including the final staged failure if present.
    pub fn windows(&self) -> &[QrEvolutionWindow<N>] { &self.windows }
    /// Windows whose native proofs and source materialization were published completely.
    pub fn completed_windows(&self) -> &[QrEvolutionWindow<N>] { &self.windows[..self.completed] }
    /// Whole-horizon status, separate from the completed prefix.
    pub fn status(&self) -> &QrEvolutionStatus { &self.status }
    /// Time reached by complete windows; a stopped native sub-prefix is separately inspectable.
    pub fn reached_time(&self) -> &DyadicInterval {
        if matches!(self.status, QrEvolutionStatus::Empty) { return &self.request.end; }
        self.completed_windows().last().map_or(&self.request.start, |w| {
            w.evolution.as_ref().expect("completed window").native().reached_time()
        })
    }
    /// Source-coordinate outer enclosure after the complete-window prefix.
    /// Absent when validation or initial projection did not complete.
    pub fn prefix_source_end_enclosure(&self) -> Option<&BoxN<DyadicInterval, N>> {
        self.completed_windows().last().map_or(self.initial_projection.as_ref(), |w| {
            w.evolution.as_ref().expect("completed window").source_end_enclosure()
        })
    }
    /// Endpoint only after whole-request success, never after a stopped run.
    pub fn source_end_enclosure(&self) -> Option<&BoxN<DyadicInterval, N>> {
        if matches!(self.status, QrEvolutionStatus::Stopped(_)) { None }
        else { self.prefix_source_end_enclosure() }
    }

    fn run(&mut self, budget: &mut EnclosureBudget) -> Result<QrEvolutionStatus, QrEvolutionFailure> {
        budget.graph.charge(2)?;
        if !self.request.start.is_singleton() || !self.request.end.is_singleton() {
            return Err(EvolutionFailure::NonPointTime.into());
        }
        let order = self.request.start.compare_singleton(&self.request.end, &mut budget.arithmetic)?;
        if order == Ordering::Greater { return Err(EvolutionFailure::ReversedTime.into()); }
        if !self.options.window.is_singleton() || self.options.window.signs() != SignSet::Positive {
            return Err(QrEvolutionFailure::InvalidWindow);
        }
        if let Some(cap) = &self.options.native.maximum_step {
            if !cap.is_singleton() || cap.signs() != SignSet::Positive {
                return Err(EvolutionFailure::InvalidMaximumStep.into());
            }
        }
        let projected = self.chart.source_enclosure(&self.request.initial, budget)
            .map_err(QrEvolutionFailure::Coordinate)?;
        budget.graph.charge(1)?;
        self.initial_projection = Some(projected);
        if self.request.initial.is_empty() { return Ok(QrEvolutionStatus::Empty); }
        if order == Ordering::Equal { return Ok(QrEvolutionStatus::Identity); }
        loop {
            budget.graph.charge(0)?;
            if self.completed == self.options.maximum_windows {
                return Err(QrEvolutionFailure::WindowLimit { limit: self.options.maximum_windows });
            }
            let time = self.reached_time().checked_pow(1, &mut budget.arithmetic)?;
            let remaining = self.request.end.sub(&time, &mut budget.arithmetic)?;
            let duration = remaining.min_image(&self.options.window, &mut budget.arithmetic)?;
            let end = time.add(&duration, &mut budget.arithmetic)?;
            if time.compare_singleton(&end, &mut budget.arithmetic)? != Ordering::Less {
                return Err(EvolutionFailure::NonProgress.into());
            }
            self.check_records(1, budget)?;
            let (chart, initial) = if let Some(last) = self.completed_windows().last() {
                (last.frame.as_ref().expect("complete frame").chart().clone(),
                 copy_state(last.evolution.as_ref().expect("complete window").native()
                     .end_enclosure().expect("completed native endpoint"), budget)?)
            } else { (self.chart.clone(), copy_state(&self.request.initial, budget)?) };
            let selection = select_frame(chart, time, duration, initial, budget)?;
            budget.graph.charge(1)?;
            self.windows.push(QrEvolutionWindow {
                selection, frame: None, transition: None, transport: None, evolution: None,
            });
            let window = self.windows.last_mut().expect("published proposal");
            window.run(end, self.options.native.clone(), budget)?;
            self.check_records(0, budget)?;
            budget.graph.charge(1)?;
            self.completed += 1;
            if self.reached_time().compare_singleton(&self.request.end, &mut budget.arithmetic)? == Ordering::Equal {
                budget.graph.charge(0)?;
                return Ok(QrEvolutionStatus::Completed);
            }
        }
    }
    fn check_records(&self, extra: usize, budget: &mut EnclosureBudget) -> Result<(), QrEvolutionFailure> {
        let count = self.windows.len().checked_add(extra).ok_or(ExpressionError::SizeExhausted)?;
        let square = N.checked_mul(N).ok_or(ExpressionError::SizeExhausted)?;
        let per = square.checked_mul(3).and_then(|v| v.checked_add(N.checked_mul(6)?))
            .and_then(|v| v.checked_add(5)).ok_or(ExpressionError::SizeExhausted)?;
        let retained = count.checked_mul(per).ok_or(ExpressionError::SizeExhausted)?;
        let mut native = 0usize;
        for w in &self.windows {
            if let Some(e) = &w.evolution {
                native = native.checked_add(e.native().attempts().len())
                    .and_then(|v| v.checked_add(e.native().segments().len()))
                    .ok_or(ExpressionError::SizeExhausted)?;
            }
        }
        budget.graph.charge(self.windows.len())?;
        budget.graph.check_entries(&[retained, native])?;
        Ok(())
    }
}
impl<const N: usize> CoordinateField<N> {
    /// Integrate finite windows in automatically proposed, independently certified QR frames.
    ///
    /// Each window recomputes a Jacobian-midpoint Euler basis and exact recentering,
    /// certifies QR, directly transports the current native endpoint, and invokes
    /// existing native integration. Singular or undecided frame proposals stop with
    /// their original diagnostic; there is no silent identity-frame fallback.
    /// This opt-in strategy can be slower or wider than fixed-chart integration.
    pub fn integrate_qr(&self, request: EvolutionRequest<N>, options: QrEvolutionOptions,
        budget: &mut EnclosureBudget) -> QrEvolution<N> {
        let mut result = QrEvolution {
            chart: self.clone(), request, options, policy: budget.policy(), windows: Vec::new(),
            completed: 0, initial_projection: None, status: QrEvolutionStatus::Identity,
        };
        result.status = match result.run(budget) {
            Ok(status) => status,
            Err(error) => QrEvolutionStatus::Stopped(error),
        };
        result
    }
}
impl<const N: usize> QrEvolutionWindow<N> {
    fn run(&mut self, end: DyadicInterval, options: EvolutionOptions,
        budget: &mut EnclosureBudget) -> Result<(), QrEvolutionFailure> {
        let s = &self.selection;
        budget.graph.charge(N.checked_mul(N).and_then(|v| v.checked_add(N))
            .ok_or(ExpressionError::SizeExhausted)?)?;
        self.frame = Some(s.chart.original_field().in_qr_coordinates(
            s.basis.clone(), s.origin.clone(), budget).map_err(QrEvolutionFailure::Qr)?);
        let frame = self.frame.as_ref().expect("certified frame");
        self.transition = Some(s.chart.transition_to(frame.chart(), budget)
            .map_err(QrEvolutionFailure::Transport)?);
        self.transport = Some(self.transition.as_ref().expect("certified relation")
            .enclose(copy_state(&s.initial, budget)?, budget).map_err(QrEvolutionFailure::Transport)?);
        let request = EvolutionRequest {
            start: s.time.checked_pow(1, &mut budget.arithmetic)?, end,
            initial: copy_state(self.transport.as_ref().expect("certified transport").enclosure(), budget)?,
        };
        let native = frame.chart().transformed_field().integrate_displacement(request, options, budget);
        self.evolution = Some(CoordinateEvolution::from_native(frame.chart(), native, budget));
        match self.evolution.as_ref().expect("native attempt").status() {
            CoordinateEvolutionStatus::Completed => Ok(()),
            CoordinateEvolutionStatus::Stopped(e) => Err(QrEvolutionFailure::Native(e.clone())),
            CoordinateEvolutionStatus::TransportFailed(e) => Err(QrEvolutionFailure::Coordinate(e.clone())),
            // Positive duration and nonempty transported inputs exclude these cases.
            CoordinateEvolutionStatus::Identity | CoordinateEvolutionStatus::Empty =>
                Err(EvolutionFailure::NonProgress.into()),
        }
    }
}

fn midpoint_real(value: &DyadicInterval, budget: &mut EnclosureBudget) -> Result<Real, QrEvolutionFailure> {
    let point = value.midpoint(&mut budget.arithmetic)?;
    let (lower, _) = point.to_rational(&mut budget.arithmetic)?.into_bounds().expect("nonempty midpoint");
    Ok(Real::from(lower))
}
fn select_frame<const N: usize>(chart: CoordinateField<N>, time: DyadicInterval,
    duration: DyadicInterval, initial: BoxN<DyadicInterval, N>, budget: &mut EnclosureBudget)
    -> Result<QrFrameSelection<N>, QrEvolutionFailure> {
    let square = N.checked_mul(N).ok_or(ExpressionError::SizeExhausted)?;
    let cubic = square.checked_mul(N).ok_or(ExpressionError::SizeExhausted)?;
    budget.graph.check_entries(&[square, square, square, N, N, N])?;
    budget.graph.charge(N)?;
    let mut midpoints = Vec::with_capacity(N);
    for lane in initial.lanes().expect("nonempty initial product") {
        midpoints.push(lane.midpoint(&mut budget.arithmetic)?);
    }
    let midpoint = BoxN::new(midpoints.try_into().expect("fixed dimension"))?;
    let jacobian = chart.transformed_field().jacobian(&time, &midpoint, budget)?;
    budget.graph.charge(square)?;
    let h = midpoint_real(&duration, budget)?;
    let mut local = Vec::with_capacity(N);
    for (i, row) in jacobian.rows().expect("nonempty Jacobian").iter().enumerate() {
        let mut values = Vec::with_capacity(N);
        for (j, value) in row.iter().enumerate() {
            values.push(Real::from(u8::from(i == j)) + h.clone() * midpoint_real(value, budget)?);
        }
        local.push(values);
    }
    budget.graph.charge(N)?;
    let mut center = Vec::with_capacity(N);
    for lane in midpoint.lanes().expect("nonempty midpoint") {
        center.push(midpoint_real(lane, budget)?);
    }
    // These exact proposal sums do not implement QR or certify a flow map.
    // Existing QR and transition kernels independently establish usable geometry.
    budget.graph.charge(cubic.checked_add(square).ok_or(ExpressionError::SizeExhausted)?)?;
    let change = chart.transformation().change();
    let mut basis = Vec::with_capacity(N);
    let mut origin = Vec::with_capacity(N);
    for (i, a) in change.to_source.iter().enumerate() {
        let mut row = Vec::with_capacity(N);
        for j in 0..N {
            row.push(a.iter().zip(&local).fold(Real::zero(), |sum, (a, b)| sum + a * &b[j]));
        }
        basis.push(row);
        origin.push(a.iter().zip(&center).fold(change.origin[i].clone(), |sum, (a, c)| sum + a * c));
    }
    budget.graph.charge(1)?;
    Ok(QrFrameSelection { chart, time, duration, initial, midpoint, jacobian, basis, origin })
}
