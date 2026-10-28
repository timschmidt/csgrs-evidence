
    #[test]
    fn selected_circle_derivative_bounds_diagnostic() {
        let (center, point) = selected_center_and_point();
        let curve = crate::Curve2::from_retained_fragment(
            crate::BezierSplitFragment2::AlgebraicCuspSemicircle(
                BezierAlgebraicCuspSemicircleFragment2::full(
                    circle(center, &CurveContext::STRICT),
                    &CurveContext::STRICT,
                ),
            ),
        );
        let crate::CurvePointLocations2::Locations(locations) = curve.point_locations(&point).unwrap() else {
            panic!("one selected location");
        };
        let parameter = locations[0].parameter().unwrap();
        let vector = curve.derivative_at(&parameter).unwrap().coordinate_image().unwrap();
        let mut bounded = false;
        for steps in [0, 2, 4, 8, 16, 32, 64, 128] {
            let started = std::time::Instant::now();
            let bounds = crate::bezier_offset::algebraic_chord_endpoint_local_bounds_refined(
                &vector, steps, &CurveContext::STRICT,
            );
            eprintln!("local derivative point bounds steps={steps}, decided={}, elapsed={:?}", bounds.is_decided(), started.elapsed());
            if bounds.is_decided() {
                bounded = true;
                break;
            }
        }
        assert!(bounded, "an original finite derivative point needs a local enclosure");
    }
