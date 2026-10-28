
fn shifted_selected_circle(distance: Real, clockwise: bool) -> hypercurve::Curve2 {
    let transform = hypercurve::Similarity2::try_from_real_affine(
        Real::one(), Real::zero(), Real::zero(), Real::one(),
        &distance * q(3, 5), &distance * q(4, 5),
    ).unwrap();
    circle_path_in_frame(1, clockwise).curves()[0].transform_similarity(&transform).unwrap()
}

#[test]
fn selected_circle_shared_center_pair_contacts_preserve_exact_points_and_cross_signs() {
    use hypercurve::RealSign;
    let root = Real::from(3).sqrt().unwrap();
    let upper = translate(&center(), q(3, 10) - &root*q(2, 5), q(2, 5) + &root*q(3, 10));
    let lower = translate(&center(), q(3, 10) + &root*q(2, 5), q(2, 5) - &root*q(3, 10));
    for reverse_first in [false, true] {
        for reverse_second in [false, true] {
            let first = circle_path().curves()[0].clone();
            let second = shifted_selected_circle(Real::one(), false);
            let first = if reverse_first { first.reversed().unwrap() } else { first };
            let second = if reverse_second { second.reversed().unwrap() } else { second };
            let result = first.intersect_curve(&second).unwrap();
            assert!(result.blockers().is_empty(), "{:?}", result.blockers());
            assert!(result.overlaps().is_empty());
            assert_eq!(result.contacts().len(), 2);
            for contact in result.contacts() {
                let at_upper = contact.point().coincides_with(&upper).unwrap();
                assert!(at_upper || contact.point().coincides_with(&lower).unwrap());
                assert!(contact.is_certified_transverse());
                // CW J-negated first tangent and CCW second tangent give
                // cross(T1,T2)=-cross(P-C1,P-C2): negative at +N.
                let positive = !at_upper ^ reverse_first ^ reverse_second;
                assert_eq!(contact.tangent_cross_sign(), Some(if positive { RealSign::Positive } else { RealSign::Negative }));
                assert_circle_chord_contact_parameters(&first, &second, contact);
            }
        }
    }
}

#[test]
fn selected_circle_shared_center_pair_contacts_keep_tangency_halves_and_separation() {
    use hypercurve::RealSign;
    let first = circle_path().curves()[0].clone();
    let second = shifted_selected_circle(Real::from(2), false);
    let expected = translate(&center(), q(3, 5), q(4, 5));
    for (first, second) in [(&first, &second), (&second, &first)] {
        let result = first.intersect_curve(second).unwrap();
        assert!(result.blockers().is_empty(), "{:?}", result.blockers());
        assert!(result.overlaps().is_empty());
        assert_eq!(result.contacts().len(), 1);
        let contact = &result.contacts()[0];
        assert!(!contact.is_certified_transverse());
        assert_eq!(contact.tangent_cross_sign(), Some(RealSign::Zero));
        assert!(contact.point().coincides_with(&expected).unwrap());
        assert_circle_chord_contact_parameters(first, second, contact);
    }
    let tiny = (Real::one()/Real::from(1_u128 << 80)).unwrap();
    for second in [shifted_selected_circle(Real::from(2)+tiny, false), shifted_selected_circle(Real::one(), true)] {
        let result = first.intersect_curve(&second).unwrap();
        assert!(result.blockers().is_empty(), "{:?}", result.blockers());
        assert!(result.contacts().is_empty());
        assert!(result.overlaps().is_empty());
    }
}

#[test]
fn selected_circle_shared_center_nonincident_chords_keep_roots_and_clipping() {
    use hypercurve::{Curve2, RealSign};
    let first = circle_path().curves()[0].clone();
    let root = Real::from(3).sqrt().unwrap();
    let upper = translate(&center(), q(3, 10)-&root*q(2, 5), q(2, 5)+&root*q(3, 10));
    let lower = translate(&center(), q(3, 10)+&root*q(2, 5), q(2, 5)-&root*q(3, 10));
    let at = |n: i32| translate(&center(), q(3,10)+q(-4*n,5), q(2,5)+q(3*n,5));
    for (lo, expected_count) in [(-2,2),(0,1)] {
        let second = Curve2::try_line(at(lo),at(2)).unwrap();
        for reverse in [false,true] {
            let second = if reverse { second.reversed().unwrap() } else {second.clone()};
            let result=first.intersect_curve(&second).unwrap();
            assert!(result.blockers().is_empty(), "{:?}",result.blockers());
            assert!(result.overlaps().is_empty());
            assert_eq!(result.contacts().len(),expected_count);
            for contact in result.contacts() {
                let at_upper=contact.point().coincides_with(&upper).unwrap();
                assert!(at_upper || (lo<0 && contact.point().coincides_with(&lower).unwrap()));
                assert!(contact.is_certified_transverse());
                assert_eq!(contact.tangent_cross_sign(),Some(if at_upper ^ reverse {RealSign::Positive}else{RealSign::Negative}));
                assert_circle_chord_contact_parameters(&first,&second,contact);
            }
        }
    }
}

#[test]
fn selected_circle_shared_center_nonincident_chords_keep_tangency_and_small_gaps() {
    use hypercurve::{Curve2,RealSign};
    let first=circle_path().curves()[0].clone();
    let tiny=(Real::one()/Real::from(1_u128<<80)).unwrap();
    for (distance,expected_count) in [(Real::one(),1),(Real::one()+tiny,0)] {
        let at=|n:i32|translate(&center(),&distance*q(3,5)+q(-4*n,5),&distance*q(4,5)+q(3*n,5));
        let second=Curve2::try_line(at(-2),at(2)).unwrap();
        let result=first.intersect_curve(&second).unwrap();
        assert!(result.blockers().is_empty(),"{:?}",result.blockers());
        assert!(result.overlaps().is_empty());
        assert_eq!(result.contacts().len(),expected_count);
        if let Some(contact)=result.contacts().first() {
            assert_eq!(contact.tangent_cross_sign(),Some(RealSign::Zero));
            assert!(!contact.is_certified_transverse());
            assert!(contact.point().coincides_with(&translate(&center(),q(3,5),q(4,5))).unwrap());
            assert_circle_chord_contact_parameters(&first,&second,contact);
        }
    }
}

#[test]
fn selected_circle_shared_center_generated_endpoint_queries_keep_the_original_field() {
    let center = center();
    let coordinate = |point: &CurvePoint2, axis| {
        point.rational_form(
            if axis == 0 { polynomial(&[&[0], &[1]]) } else { polynomial(&[&[0, 1]]) },
            polynomial(&[&[1]]),
        ).unwrap()
    };
    for radius in [-1, 1] {
        let circle = circle_path_in_frame(radius, true).curves()[0].clone();
        for (point, direction) in [(circle.start(), radius), (circle.end(), -radius)] {
            assert!(point.coordinates().is_none());
            for (axis, expected) in [(0, q(-4*direction, 5)), (1, q(3*direction, 5))] {
                let form = coordinate(&point, axis);
                assert!(form.source().coincides_with(&point).unwrap());
                let difference = form.subtract(&coordinate(&center, axis)).unwrap();
                assert_eq!(difference.compare_to_real(&expected).unwrap(), Ordering::Equal);
                assert_eq!(difference.bounds().unwrap(), (expected.clone(), expected));
            }
            assert!(point.rational_form(polynomial(&[&[1]]), polynomial(&[&[0]])).is_err());
        }
    }
}
