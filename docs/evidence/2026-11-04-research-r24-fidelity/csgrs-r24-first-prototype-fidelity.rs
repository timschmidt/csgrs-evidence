//! Source fidelity follows the existing immutable parameter lineage.
use super::*;

/// What a retained parallel-construction receipt proves about its output.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum CurveParallelFidelityMetric2 {
    /// The image is the exact selected normal parallel. This does not assert
    /// that an arbitrary native reparameterization is the source parameter.
    ExactImage,
    /// Euclidean distance to the exact normal parallel at the corresponding
    /// source parameter, throughout the certified source span.
    SameParameterEuclidean,
}

#[derive(Debug)]
pub(crate) struct ParallelFidelitySource2 {
    pub(crate) curve: Curve2,
    pub(crate) index: usize,
    pub(crate) distance: Real,
}

#[derive(Debug)]
pub(crate) struct ParallelFidelityReceipt2 {
    pub(crate) source: Arc<ParallelFidelitySource2>,
    pub(crate) source_range: ParamRange,
    pub(crate) metric: CurveParallelFidelityMetric2,
    pub(crate) error_bound: Real,
    pub(crate) verification_leaf_count: usize,
}

/// Bound source-fidelity evidence for one immutable output curve.
///
/// The source range names the original construction span, before subsequent
/// exact restrictions. Its bound remains valid on every retained restriction.
/// Similarities scale the Euclidean bound; reflection keeps the original
/// signed distance and transports its reference image through the stored map.
/// This is separate from numerical certainty of the current operation.
#[derive(Clone, Copy, Debug)]
pub struct CurveParallelFidelity2<'a> {
    curve: &'a Curve2,
    receipt: &'a ParallelFidelityReceipt2,
    transform: Option<&'a Similarity2>,
}

impl CurveParallelFidelity2<'_> {
    /// Authored operand, including any preceding source-fidelity evidence.
    pub fn source_curve(&self) -> &Curve2 { &self.receipt.source.curve }
    /// Operand index in the path that performed this construction.
    pub fn source_curve_index(&self) -> usize { self.receipt.source.index }
    /// Signed left distance in the original operand's coordinate frame.
    pub fn source_distance(&self) -> &Real { &self.receipt.source.distance }
    /// Original inclusive source span certified by this construction.
    pub fn construction_source_range(&self) -> &ParamRange { &self.receipt.source_range }
    /// Exact image or a pointwise Euclidean approximation claim.
    pub fn metric(&self) -> CurveParallelFidelityMetric2 { self.receipt.metric }
    /// Proved Euclidean bound in the current image frame.
    pub fn error_bound(&self) -> Real {
        self.transform.map_or_else(|| self.receipt.error_bound.clone(),
            |map| &self.receipt.error_bound * map.scale())
    }
    /// Exact map from the construction frame to the current image, if any.
    pub fn image_transform(&self) -> Option<&Similarity2> { self.transform }
    /// Verifier leaves for the original span; restriction does not rerun it.
    pub fn verification_leaf_count(&self) -> usize { self.receipt.verification_leaf_count }

    /// Maps a retained parameter to the parameter used by the pointwise proof.
    ///
    /// `None` means the receipt proves an exact image, without asserting a
    /// same-parameter map. Invalid parameters and unavailable selected-scalar
    /// arithmetic remain typed failures, never approximate scalar projections.
    pub fn source_parameter_at(&self, parameter: &CurveParameter2) -> ExactCurveResult<Option<CurveParameter2>> {
        let policy = crate::policy::principal_context();
        let inside = CurveParameterDomain2::new(self.curve.parameter_domain(), None)
            .contains_finite_parameter(parameter, &policy)
            .map_err(|cause| ExactCurveError::invalid(CurveOperation2::Evaluation, self.curve.family(), cause))?;
        if !ExactCurveError::decided(CurveOperation2::Evaluation, inside)? {
            return Err(ExactCurveError::invalid(CurveOperation2::Evaluation, self.curve.family(), CurveError::InvalidCurveParameter));
        }
        if self.metric() == CurveParallelFidelityMetric2::ExactImage { return Ok(None); }
        let mut curve = self.curve;
        while let Some(range) = curve.source_range() { curve = &range.source; }
        let lineage = curve.data.lineage.as_ref().expect("a pointwise receipt belongs to a native lineage");
        let domain = curve.native_parameter_domain()?;
        let local_scale = ((lineage.range.end() - lineage.range.start()) / (domain.end() - domain.start()))
            .map_err(|cause| ExactCurveError::invalid(CurveOperation2::Evaluation, curve.family(), cause.into()))?;
        let span = self.construction_source_range();
        let length = span.end() - span.start();
        let offset = span.start() + (lineage.range.start() - &local_scale * domain.start()) * &length;
        parameter.affine_image(&(&local_scale * length), &offset).map(Some)
    }
}

impl Curve2 {
    /// Source fidelity retained by certified primitive-parallel construction.
    ///
    /// Cloning, exact restriction, reversal, native-span extraction and
    /// similarities retain the receipt through the parameter lineage. `None`
    /// is unrecorded fidelity, not proof of an exact relation to another source.
    /// Rebuilding from raw `geometry()` deliberately starts an unverified
    /// source model; raw geometry alone does not carry this receipt.
    pub fn parallel_fidelity(&self) -> Option<CurveParallelFidelity2<'_>> {
        let mut source = self;
        while let Some(range) = source.source_range() { source = &range.source; }
        let lineage = source.data.lineage.as_ref()?;
        Some(CurveParallelFidelity2 { curve: self, receipt: lineage.root.parallel_fidelity.as_deref()?, transform: lineage.image_transform.as_deref() })
    }

    pub(crate) fn with_parallel_fidelity(mut self, receipt: ParallelFidelityReceipt2) -> Self {
        let data = Arc::get_mut(&mut self.data).expect("new construction output has not been published");
        let lineage = data.lineage.as_mut().expect("primitive parallel output has a native chart");
        let root = Arc::get_mut(&mut lineage.root).expect("new construction owns its parameter root");
        root.parallel_fidelity = Some(Arc::new(receipt));
        self
    }
}
