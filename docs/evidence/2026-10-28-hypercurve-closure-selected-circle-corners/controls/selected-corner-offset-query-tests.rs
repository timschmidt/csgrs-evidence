
#[test]
fn selected_corner_offset_queries_retain_mapped_endpoint_domains() {
    use hypercurve::{CurveCornerMode2, FillRule, OffsetCornerStyle2, RegionPointLocation};
    let path = selected_corner_half_disk().chamfer_vertex_by_setbacks(
        1, q(1, 4), q(1, 4), CurveCornerMode2::TrimOnly,
    ).unwrap().into_solutions().pop().unwrap();
    let region = CurveRegion2::try_from_boundary_paths(&[path], FillRule::NonZero).unwrap();
    let grown = region.offset(q(1, 16), &OffsetCornerStyle2::Round).unwrap();
    for (scale, expected) in [
        (q(1, 4), RegionPointLocation::Inside),
        (q(17, 16), RegionPointLocation::Boundary),
        (Real::from(2), RegionPointLocation::Outside),
    ] {
        let point = translate(&center(), &scale*q(3, 5), &scale*q(4, 5));
        assert_eq!(grown.classify_point(&point).unwrap(), expected);
    }
}
