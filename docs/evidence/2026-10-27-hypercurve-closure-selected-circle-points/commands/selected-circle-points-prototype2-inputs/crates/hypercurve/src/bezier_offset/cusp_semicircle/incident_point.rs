//! Angular queries retain a certified point in its original joint field.

use std::cmp::Ordering;

use super::*;

impl BezierAlgebraicCuspSemicircle2 {
    pub(super) fn represented_frame_unit_normal(&self) -> CurveResult<Option<(Real, Real)>> {
        Ok(match self.data.frame.chord_normal() {
            Some(frame) => frame
                .anchor
                .certified_unit_tangent()
                .or_else(|| {
                    frame
                        .anchor
                        .certified_axis_direction()
                        .map(BezierAlgebraicChordAxisDirection2::unit_tangent)
                })
                .map(|(x, y)| (-y, x)),
            None => self.data.frame.represented_unit_normal()?,
        })
    }

    /// The caller has already proved circle incidence. The signed tangent
    /// projection selects the closed half chart; a zero projection is a
    /// diameter endpoint and retains the original chart's canonical ownership.
    pub(super) fn selected_incident_point_parameter(
        &self,
        point: &CurvePoint2,
        center: &CurvePoint2,
        (normal_x, normal_y): (&Real, &Real),
        policy: &CurveContext,
    ) -> CurveResult<Classification<(BezierAlgebraicCuspSemicircleParameter2, bool)>> {
        let radius_sign = match real_sign(self.radial_distance(), policy) {
            Some(RealSign::Positive) => Ordering::Greater,
            Some(RealSign::Negative) => Ordering::Less,
            _ => return Ok(Classification::Uncertain(UncertaintyReason::RealSign)),
        };
        let tangent = match common_point_linear_order(
            point,
            center,
            &(-self.turn_sign() * normal_y),
            &(self.turn_sign() * normal_x),
            policy,
        )? {
            Classification::Decided(order) => order,
            Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
        };
        if tangent == Ordering::Equal {
            let normal = match common_point_linear_order(point, center, normal_x, normal_y, policy)?
            {
                Classification::Decided(Ordering::Equal) => {
                    return Err(CurveError::InvalidCurveParameter);
                }
                Classification::Decided(order) => order,
                Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
            };
            return Ok(Classification::Decided((
                BezierAlgebraicCuspSemicircleParameter2::Exact(if normal == radius_sign {
                    Real::zero()
                } else {
                    Real::one()
                }),
                false,
            )));
        }

        let complementary = tangent != radius_sign;
        let semicircle = if complementary {
            self.complementary_half()
        } else {
            self.clone()
        };
        let policy = policy
            .retained_object_policy_with_dependencies(semicircle.data.frame.evidence_policy());
        Ok(Classification::Decided((
            BezierAlgebraicCuspSemicircleParameter2::Mapped(Arc::new(
                BezierAlgebraicCuspSemicircleMappedParameterData2::IncidentPoint {
                    semicircle,
                    point: point.clone(),
                    policy,
                },
            )),
            complementary,
        )))
    }
}

impl BezierAlgebraicCuspSemicircleMappedParameterData2 {
    pub(super) fn incident_point_order_to_real(
        &self,
        parameter: &Real,
        policy: &CurveContext,
    ) -> CurveResult<Classification<Ordering>> {
        let Self::IncidentPoint {
            semicircle, point, ..
        } = self
        else {
            return Ok(Classification::Uncertain(UncertaintyReason::Unsupported));
        };
        // This carrier contains only interior parameters. The ordinary
        // rational chart's formula is used only within its closed domain.
        for (boundary, outside, order) in [
            (Real::zero(), Ordering::Less, Ordering::Greater),
            (Real::one(), Ordering::Greater, Ordering::Less),
        ] {
            match compare_reals(parameter, &boundary, policy) {
                Some(value) if value == outside || value == Ordering::Equal => {
                    return Ok(Classification::Decided(order));
                }
                Some(_) => {}
                None => return Ok(Classification::Uncertain(UncertaintyReason::Ordering)),
            }
        }
        let Some((normal_x, normal_y)) = semicircle.represented_frame_unit_normal()? else {
            return Ok(Classification::Uncertain(UncertaintyReason::Unsupported));
        };
        let center = match semicircle.center_point_evidence(policy)? {
            Classification::Decided(center) => center,
            Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
        };
        // For n=(P-C).N and b=turn*cross(N,P-C), the sign of
        // r*((1-2v)*b-2v(1-v)*n) orders the selected angle against v.
        // Both angles are interior to one half, so no antipodal zero is lost.
        let tangent = (Real::one() - Real::from(2_i8) * parameter) * semicircle.turn_sign();
        let normal = Real::from(2_i8) * parameter * (Real::one() - parameter);
        let order = common_point_linear_order(
            point,
            &center,
            &(-&tangent * &normal_y - &normal * &normal_x),
            &(&tangent * &normal_x - &normal * &normal_y),
            policy,
        )?;
        Ok(match real_sign(semicircle.radial_distance(), policy) {
            Some(RealSign::Positive) => order,
            Some(RealSign::Negative) => order.map(Ordering::reverse),
            _ => Classification::Uncertain(UncertaintyReason::RealSign),
        })
    }
}

impl BezierAlgebraicCuspSemicircleParameter2 {
    pub(super) fn incident_points_order(
        &self,
        other: &Self,
        policy: &CurveContext,
    ) -> CurveResult<Option<Classification<Ordering>>> {
        let (Self::Mapped(first), Self::Mapped(second)) = (self, other) else {
            return Ok(None);
        };
        if !matches!(
            first.as_ref(),
            BezierAlgebraicCuspSemicircleMappedParameterData2::IncidentPoint { .. }
        ) && !matches!(
            second.as_ref(),
            BezierAlgebraicCuspSemicircleMappedParameterData2::IncidentPoint { .. }
        ) {
            return Ok(None);
        }
        let circle = first.semicircle_carrier();
        if circle != second.semicircle_carrier() {
            return Ok(None);
        }
        let (Some(first), Some(second), Some((x, y))) = (
            first.retained_point_evidence(),
            second.retained_point_evidence(),
            circle.represented_frame_unit_normal()?,
        ) else {
            return Ok(None);
        };
        // cos(theta) strictly decreases on a selected closed half. The center
        // cancels from this comparison, including independently replayed
        // definitions of the same point and arbitrarily close distinct cuts.
        let order = common_point_linear_order(first, second, &x, &y, policy)?;
        Ok(Some(match real_sign(circle.radial_distance(), policy) {
            Some(RealSign::Positive) => order.map(Ordering::reverse),
            Some(RealSign::Negative) => order,
            _ => Classification::Uncertain(UncertaintyReason::RealSign),
        }))
    }
}
