use csgrs::{curve, GeometryContext, GeometryOutcome, Real, TriangleMesh};
use csgrs::errors::ValidationError;
use hypercurve::{CircularArc2, Contour2, CurveRegion2, Point2, Segment2};
use hyperlattice::Point3;
use hyperlimit::{PredicateOutcome, PredicatePolicy};

fn r(n:i64)->Real { Real::from(n) }
fn equal(a:&Real,b:&Real)->bool {
    matches!(hyperlimit::compare_reals(a,b,PredicatePolicy::STRICT),PredicateOutcome::Decided{value:std::cmp::Ordering::Equal,..})
}
fn circle()->Contour2 {
    let center=Point2::from_values(10,0);
    let a=Point2::from_values(11,0); let b=Point2::from_values(9,0);
    Contour2::try_new(vec![
        Segment2::Arc(CircularArc2::try_from_center(a.clone(),b.clone(),center.clone(),false).unwrap()),
        Segment2::Arc(CircularArc2::try_from_center(b,a,center,false).unwrap()),
    ]).unwrap()
}
fn main() {
    let tiny=(Real::one()/r(2).powi(80.into()).unwrap()).unwrap();
    for (name,origin,width) in [
        ("third",r(1),(r(1)/r(3)).unwrap()),
        ("sqrt2",r(1),r(2).sqrt().unwrap()),
        ("tiny",r(1),tiny),
        ("large-third",r(2).powi(70.into()).unwrap(),(r(1)/r(3)).unwrap()),
    ] {
        let right=&origin+&width;
        let ring=Contour2::from_real_ring(&[
            [origin.clone(),r(2)],[right.clone(),r(2)],
            [right.clone(),r(3)],[origin.clone(),r(3)],[origin.clone(),r(2)],
        ]).unwrap();
        for mixed in [false,true] {
            let mut materials=vec![ring.clone()];if mixed {materials.push(circle());}
            let profile=CurveRegion2::try_from_native_contours(materials,Vec::new()).unwrap();
            for operation in ["triangulate","extrude","twist-zero","sweep","revolve"] {
                let result:Result<GeometryOutcome<TriangleMesh>,ValidationError>=match operation {
                    "triangulate"=>curve::try_triangulate(&profile,&GeometryContext::STRICT),
                    "extrude"=>curve::try_extrude(&profile,r(2),&GeometryContext::STRICT),
                    "twist-zero"=>curve::extrude_twisted(&profile,r(2),r(0),[r(1),r(1)],1,&GeometryContext::STRICT),
                    "sweep"=>curve::try_sweep(&profile,&[Point3::origin(),Point3::new(r(0),r(0),r(2))],&GeometryContext::STRICT),
                    _=>curve::revolve(&profile,r(360),4,&GeometryContext::STRICT),
                };
                let row=match result {
                    Ok(out)=>serde_json::json!({"case":name,"mixed":mixed,"operation":operation,"outcome":"success","certainty":format!("{:?}",out.certainty),"preserved_exact_vertex":out.value.positions.iter().any(|p|equal(&p.x,&right)&&equal(&p.y,&r(2))&&equal(&p.z,&r(0))),"triangles":out.value.triangles.len(),"sampled":out.value.construction_evidence().source_sampled(),"projected":out.value.construction_evidence().coordinates_projected()}),
                    Err(error)=>serde_json::json!({"case":name,"mixed":mixed,"operation":operation,"outcome":format!("{:?}",error.kind()),"error":error.to_string()}),
                };
                println!("{row}");
            }
        }
    }
}
