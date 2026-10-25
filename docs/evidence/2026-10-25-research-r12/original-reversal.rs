pub(super) fn exact_offset_spans_form_reversal(
    previous: &ExactOffsetSpan2,
    next: &ExactOffsetSpan2,
    policy: &CurveContext,
) -> CurveResult<Classification<bool>> {
    let Some((previous_tangent, next_tangent)) = previous
        .end_tangent
        .as_ref()
        .zip(next.start_tangent.as_ref())
    else {
        return Ok(Classification::Decided(false));
    };
    match curve_tangent_cross_sign(previous_tangent, next_tangent, policy) {
        Classification::Decided(RealSign::Positive | RealSign::Negative) => {
            Ok(Classification::Decided(false))
        }
        Classification::Decided(RealSign::Zero) => Ok(curve_tangents_are_opposite(
            previous_tangent,
            next_tangent,
            policy,
        )),
        Classification::Uncertain(reason) => Ok(Classification::Uncertain(reason)),
    }
}
