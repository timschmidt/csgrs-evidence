//! Checked native definitions for a selected circle and its angular contacts.

use super::*;

pub(crate) struct CircleChordNormalDefinition2 {
    pub(crate) center: CurvePoint2,
    pub(crate) anchor: BezierAlgebraicChord2,
    pub(crate) radial_distance: Real,
    pub(crate) clockwise: bool,
}

pub(crate) enum CircleParameterDefinition2 {
    Exact(Real),
    ChordNormal {
        chord: BezierAlgebraicChord2,
        point: CurvePoint2,
        radial_distance: Real,
    },
}

impl BezierAlgebraicCuspSemicircle2 {
    pub(crate) fn replay_storage_key(&self) -> *const () {
        Arc::as_ptr(&self.data).cast()
    }

    pub(crate) fn native_chord_normal_definition(&self) -> Option<CircleChordNormalDefinition2> {
        let frame = self.data.frame.chord_normal()?;
        CurveContext::STRICT
            .accepts_retained_policy(frame.policy)
            .then(|| CircleChordNormalDefinition2 {
                center: frame.center.clone(),
                anchor: frame.anchor.clone(),
                radial_distance: self.data.radial_distance.clone(),
                clockwise: self.data.clockwise,
            })
    }

    pub(crate) fn replay_chord_normal_definition(
        definition: CircleChordNormalDefinition2,
        policy: &CurveContext,
    ) -> CurveResult<Classification<Self>> {
        match Self::from_retained_center_and_chord_normal(
            definition.center,
            definition.anchor,
            definition.radial_distance,
            definition.clockwise,
            policy,
        )? {
            Classification::Decided(Some(circle)) => Ok(Classification::Decided(circle)),
            Classification::Decided(None) => Err(CurveError::InvalidCurveParameter),
            Classification::Uncertain(reason) => Ok(Classification::Uncertain(reason)),
        }
    }

    pub(crate) fn native_parameter_definition(
        &self,
        parameter: &BezierAlgebraicCuspSemicircleParameter2,
    ) -> Option<CircleParameterDefinition2> {
        match parameter {
            BezierAlgebraicCuspSemicircleParameter2::Exact(value) => {
                Some(CircleParameterDefinition2::Exact(value.clone()))
            }
            BezierAlgebraicCuspSemicircleParameter2::Mapped(parameter) => {
                let BezierAlgebraicCuspSemicircleMappedParameterData2::SelectedChordNormalContact {
                    semicircle,
                    anchor_tangent: BezierSelectedChordNormalAnchor2::RetainedChord(anchor),
                    chord,
                    radial_product_sign,
                    point,
                    policy,
                } = parameter.as_ref()
                else {
                    return None;
                };
                let frame = self.data.frame.chord_normal()?;
                if semicircle != self
                    || anchor != &frame.anchor
                    || !CurveContext::STRICT.accepts_retained_policy(*policy)
                {
                    return None;
                }
                let radial_distance = match radial_product_sign {
                    RealSign::Positive => self.radial_distance().clone(),
                    RealSign::Negative => -self.radial_distance().clone(),
                    RealSign::Zero => return None,
                };
                Some(CircleParameterDefinition2::ChordNormal {
                    chord: chord.clone(),
                    point: point.clone(),
                    radial_distance,
                })
            }
        }
    }

    pub(crate) fn replay_parameter_definition(
        &self,
        definition: CircleParameterDefinition2,
        policy: &CurveContext,
    ) -> CurveResult<Classification<BezierAlgebraicCuspSemicircleParameter2>> {
        match definition {
            CircleParameterDefinition2::Exact(value) => {
                let parameter = BezierAlgebraicCuspSemicircleParameter2::Exact(value);
                for (boundary, invalid) in [
                    (Real::zero(), std::cmp::Ordering::Less),
                    (Real::one(), std::cmp::Ordering::Greater),
                ] {
                    match parameter.order_to_real(&boundary, policy)? {
                        Classification::Decided(order) if order == invalid => {
                            return Err(CurveError::InvalidBezierRange);
                        }
                        Classification::Uncertain(reason) => {
                            return Ok(Classification::Uncertain(reason));
                        }
                        Classification::Decided(_) => {}
                    }
                }
                Ok(Classification::Decided(parameter))
            }
            CircleParameterDefinition2::ChordNormal {
                chord,
                point,
                radial_distance,
            } => {
                let Some(frame) = self.data.frame.chord_normal() else {
                    return Err(CurveError::InvalidCurveParameter);
                };
                // The original displacement, radius and selected-half checks
                // must run again. No serialized incidence flag is trusted.
                self.certified_chord_normal_contact_parameter(
                    BezierSelectedChordNormalAnchor2::RetainedChord(frame.anchor.clone()),
                    chord,
                    point,
                    radial_distance,
                    false,
                    policy,
                )
            }
        }
    }
}

impl BezierAlgebraicCuspSemicircleParameter2 {
    pub(crate) fn replay_storage_key(&self) -> Option<*const ()> {
        match self {
            Self::Exact(_) => None,
            Self::Mapped(parameter) => Some(Arc::as_ptr(parameter).cast()),
        }
    }
}
