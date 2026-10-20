use hyperbrep::*;
use hyperbrep::boolean::{BooleanOperation, FacePairRelation, FacePairTrim};

fn p(x: i32, y: i32, z: i32) -> Point3 { Point3::new(x.into(), y.into(), z.into()) }
fn main() {
    let slab = std::env::args().nth(1).unwrap_or_else(|| "interior".into());
    let delta: Real = "1e-12".parse().unwrap();
    let (low, high) = match slab.as_str() {
        "cover" => ((-20).into(), 20.into()),
        "tiny_upper_gap" => ((-20).into(), Real::from(6)-&delta),
        "tiny_lower_gap" => (delta.clone(), 20.into()),
        "interior" => (2.into(), 4.into()),
        "touch" => (6.into(), 20.into()),
        "disjoint" => (Real::from(6)+delta, 20.into()),
        _ => panic!("unknown slab"),
    };
    let source = builder::cylinder(5.into(), 6.into()).unwrap();
    let tool = builder::cuboid(Point3::new(0.into(), (-20).into(), low),
        Point3::new(20.into(), 20.into(), high)).unwrap();
    let graph = boolean::intersection_graph(source.bodies().next().unwrap(), tool.bodies().next().unwrap()).unwrap();
    println!("slab={slab} pairs={} unsupported={} unresolved={}",graph.candidate_pairs(),graph.unsupported_pairs(),graph.unresolved_trim_pairs());
    for pair in graph.intersections() {
        let relation = match pair.relation() {
            FacePairRelation::Unsupported => "unsupported",
            FacePairRelation::Exact(SurfaceSurfaceIntersection::Line(_)) => "line",
            FacePairRelation::Exact(SurfaceSurfaceIntersection::Lines(_)) => "lines",
            FacePairRelation::Exact(SurfaceSurfaceIntersection::Curve(_)) => "curve",
            FacePairRelation::Exact(SurfaceSurfaceIntersection::Curves(_)) => "curves",
            FacePairRelation::Exact(SurfaceSurfaceIntersection::Coincident) => "coincident",
            _ => "other",
        };
        let trim = match pair.trim() {
            FacePairTrim::NotAvailable => "unavailable".to_owned(),
            FacePairTrim::CompleteCarrier => "carrier".to_owned(),
            FacePairTrim::NoContact => "no_contact".to_owned(),
            FacePairTrim::NoCurveInterior => "no_curve_interior".to_owned(),
            FacePairTrim::CurveFragments(curves) => format!("bare_curves:{}",curves.len()),
            FacePairTrim::SurfaceCurveFragments(curves) => format!("retained_curves:{}",curves.len()),
            FacePairTrim::CoincidentFaces{first_traces,second_traces} => format!("coincident:{}/{}",first_traces.len(),second_traces.len()),
            FacePairTrim::Unresolved(reason) => format!("unresolved:{reason:?}"),
            _ => "other".to_owned(),
        };
        println!("pair={}/{} kinds={:?}/{:?} relation={relation} trim={trim}",
            pair.first_face().index(),pair.second_face().index(),
            pair.first_face().surface().kind(),pair.second_face().surface().kind());
    }
    println!("partition_first={:?}",graph.partition_first_faces().map(|p|p.model().counts()));
    println!("partition_second={:?}",graph.partition_second_faces().map(|p|p.model().counts()));
    println!("select_first={:?}",graph.select_first_faces(BooleanOperation::Difference).map(|s|s.faces().len()));
    println!("select_second={:?}",graph.select_second_faces(BooleanOperation::Difference).map(|s|s.faces().len()));
    match boolean::difference(&source,&tool) {
        Err(error) => println!("difference={error:?}"),
        Ok(result) => {
            println!("difference_bodies={}",result.len());
            for body in result.bodies() {
                println!("volume={:?}",body.volume());
                for point in [p(-1,0,3),p(1,0,3),p(1,0,1),p(1,0,5)] {
                    println!("point={point:?} location={:?}",body.classify_point(&point));
                }
            }
            let json=result.model().to_json().unwrap();
            println!("replay={:?}",RawModel::from_json(&json,&ArchiveLimits::default()).unwrap().validate().map(|m|m.counts()));
        }
    }
}
