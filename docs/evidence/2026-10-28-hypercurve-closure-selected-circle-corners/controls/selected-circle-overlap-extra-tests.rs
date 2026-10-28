
#[test]
fn selected_circle_shared_center_rotated_frames_keep_partial_overlap() {
    use hypercurve::CurveOverlapOrientation2;
    let first = circle_path().curves()[0].clone();
    let second = circle_path_with_anchor(1, true, -4, 3).curves()[0].clone();
    let expected = [
        translate(&center(), q(-4, 5), q(3, 5)),
        translate(&center(), q(3, 5), q(4, 5)),
    ];
    for reverse_first in [false, true] {
        for reverse_second in [false, true] {
            let first = if reverse_first { first.reversed().unwrap() } else { first.clone() };
            let second = if reverse_second { second.reversed().unwrap() } else { second.clone() };
            let result = first.intersect_curve(&second).unwrap();
            assert!(result.blockers().is_empty(), "{:?}", result.blockers());
            assert!(result.contacts().is_empty());
            assert_eq!(result.overlaps().len(), 1);
            let overlap = &result.overlaps()[0];
            assert_eq!(overlap.orientation(), if reverse_first ^ reverse_second {
                CurveOverlapOrientation2::Reversed
            } else { CurveOverlapOrientation2::Same });
            assert!(overlap.includes_start() && overlap.includes_end());
            for (curve, range) in [(&first, overlap.first_range()), (&second, overlap.second_range())] {
                let mut found = [false, false];
                for parameter in [range.start(), range.end()] {
                    let point = curve.point_at(parameter).unwrap();
                    let index = expected.iter().position(|p| point.coincides_with(p).unwrap()).unwrap();
                    assert!(!found[index]);
                    found[index] = true;
                }
                assert_eq!(found, [true, true]);
                // Public overlap bounds follow paired traversal; restriction
                // explicitly requires ascending source-chart bounds.
                let range = match range.start().compare(range.end()).unwrap() {
                    Ordering::Less => range.clone(),
                    Ordering::Greater => hypercurve::CurveParameterRange2::try_new(
                        range.end().clone(), range.start().clone(),
                    ).unwrap(),
                    Ordering::Equal => panic!("a quarter-circle overlap has positive extent"),
                };
                let restricted = curve.restrict_source(range).unwrap();
                let path = hypercurve::CurvePath2::try_new(vec![restricted.clone()]).unwrap();
                let text = angular_svg(path);
                let replay = import_svg_document(&text).unwrap();
                assert_eq!(export_svg_document(&replay).unwrap(), text);
                assert!(replay.paths()[0].start().coincides_with(&restricted.start()).unwrap());
                assert!(replay.paths()[0].end().coincides_with(&restricted.end()).unwrap());

            }
        }
    }
    let concentric = circle_path_with_anchor(2, true, -4, 3).curves()[0].clone();
    let result = first.intersect_curve(&concentric).unwrap();
    assert!(result.blockers().is_empty(), "{:?}", result.blockers());
    assert!(result.contacts().is_empty() && result.overlaps().is_empty());
}
