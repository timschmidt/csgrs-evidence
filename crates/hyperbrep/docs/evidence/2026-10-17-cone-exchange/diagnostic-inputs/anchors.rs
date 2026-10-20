use hyperbrep::{Point2, Point3, Real, builder};

fn point(label: &str, p: &Point3) {
    println!("{label}: {:?}", [&p.x, &p.y, &p.z].map(|v| v.exact_rational_normal_form()));
}
fn main() {
    let body = builder::cone_frustum(5.into(), 2.into(), 7.into()).unwrap();
    for face in body.model().faces() {
        let surface = face.surface();
        let Some(cone) = surface.conical_geometry() else { continue };
        point("apex", cone.apex);
        for wire in face.outer().into_iter().chain(face.inner()) {
            for edge_use in wire.edge_uses() {
                let pc = edge_use.pcurve();
                for t in [pc.domain_start().unwrap(), pc.domain_end().unwrap()] {
                    let im = pc.point_at(&t).unwrap();
                    let uv = im.coordinates().unwrap();
                    let uv = Point2::new(Real::zero(), uv.y().clone());
                    point("canonical", &surface.point_at(&uv).unwrap());
                    point("axis point", &(cone.apex.clone() + cone.axis.clone() * (&uv.y * cone.semi_angle.clone().cos())));
                    let v = surface.partials_at(&uv).unwrap().v().clone();
                    println!("velocity ratios: {:?}", (0..3).map(|i| (&v[i] / &v[0]).unwrap().exact_rational_normal_form()).collect::<Vec<_>>());
                    point("owned start", edge_use.edge().start().point().try_coordinates().unwrap());
                    point("owned end", edge_use.edge().end().point().try_coordinates().unwrap());
                }
            }
        }
    }
}
