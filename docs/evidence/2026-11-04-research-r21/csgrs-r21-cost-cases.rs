use hyperbrep::*;

fn q(a: i64, b: i64) -> Real { (Real::from(a)/Real::from(b)).unwrap() }
fn p(x: Real,y: Real,z: Real)->Point3 { Point3::new(x,y,z) }
fn polygon(width: i64)->Vec<Point2> { [(0,0),(width,0),(width,width),(0,width)].map(|(x,y)| Point2::new(x.into(),y.into())).to_vec() }

pub struct Case { pub name: &'static str, outer: Vec<Point2>, holes: Vec<Vec<Point2>>, path: Curve3, frame: Option<RationalBezierSweepFrame>, box_chain: bool }
pub fn cases()->Vec<Case> {
    let rows = [
        ("affine-lateral",vec![(0.into(),0.into()),(0.into(),q(1,2)),(1.into(),1.into())]),
        ("monotone-lateral",vec![(0.into(),0.into()),(0.into(),q(1,4)),(1.into(),1.into())]),
        ("elevated-straight",vec![(0.into(),0.into()),(0.into(),q(1,3)),(0.into(),q(2,3)),(0.into(),1.into())]),
        ("strict-sturm",vec![(0.into(),0.into()),(0.into(),q(13,50)),(0.into(),q(1,50)),(0.into(),q(7,25))]),
        ("monotone-hole",vec![(0.into(),0.into()),(0.into(),q(1,4)),(1.into(),1.into())]),
        ("moving-taper",vec![(0.into(),0.into()),(0.into(),q(1,2)),(0.into(),1.into())]),
        ("backtracking-rejection",vec![(0.into(),0.into()),(0.into(),1.into()),(0.into(),q(1,2))]),
        ("cuboid-cut-reunion",vec![(0.into(),0.into()),(0.into(),1.into())]),
        ("stationary-quadratic",vec![(0.into(),0.into()),(0.into(),0.into()),(0.into(),1.into())]),
        ("stationary-cubic",vec![(0.into(),0.into()),(0.into(),1.into()),(0.into(),0.into()),(0.into(),1.into())]),
        ("stationary-fifth",vec![(0.into(),0.into()),(0.into(),1.into()),(0.into(),0.into()),(0.into(),1.into()),(0.into(),0.into()),(0.into(),1.into())]),
        ("stationary-rational",vec![(0.into(),0.into()),(0.into(),0.into()),(0.into(),1.into())]),
        ("stationary-hole",vec![(0.into(),0.into()),(0.into(),1.into()),(0.into(),0.into()),(0.into(),1.into())]),
    ];
    rows.into_iter().map(|(name, row)| {
        let origins=row.into_iter().map(|(x,z)|p(x,0.into(),z)).collect::<Vec<_>>();
        let weights=if name=="stationary-rational" { vec![2.into(),3.into(),5.into()] } else { vec![Real::one();origins.len()] };
        let frame=if name=="moving-taper" { Some(RationalBezierSweepFrame::try_new(origins.clone(),vec![Vector3::x(),Vector3::from_xyz(q(3,2),0.into(),0.into()),Vector3::from_xyz(2.into(),0.into(),0.into())],vec![Vector3::y();3],weights.clone()).unwrap()) } else { None };
        let hole=name.ends_with("hole");
        Case { name,outer:polygon(if hole {4} else {1}),holes:if hole {vec![vec![Point2::new(1.into(),1.into()),Point2::new(3.into(),1.into()),Point2::new(3.into(),3.into()),Point2::new(1.into(),3.into())]]}else{vec![]},path:Curve3::rational_bezier(origins,weights).unwrap(),frame,box_chain:name=="cuboid-cut-reunion" }
    }).collect()
}

pub struct Receipt { pub row: serde_json::Value, _set: Option<BodySet>, _replay: Option<Model> }
pub fn run(case:&Case)->Receipt {
    let set=if case.box_chain {
        let cube=builder::cuboid(Point3::origin(),p(1.into(),1.into(),1.into())).unwrap();
        let slab=builder::cuboid(p((-1).into(),(-1).into(),q(1,4)),p(2.into(),2.into(),q(3,4))).unwrap();
        boolean::intersection(&cube,&slab).and_then(|middle|boolean::difference(&cube,&slab).and_then(|ends|boolean::union(&middle,&ends))).map_err(|error|format!("{error:?}"))
    } else if let Some(frame)=&case.frame {
        builder::sweep_moving_frame(&case.outer,frame.clone()).map_err(|error|format!("{error:?}"))
    } else {
        builder::sweep_curve_region(&case.outer,&case.holes,Vector3::x(),Vector3::y(),case.path.clone()).map_err(|error|format!("{error:?}"))
    };
    match set {
        Err(error)=>Receipt {row:serde_json::json!({"case":case.name,"error":error}),_set:None,_replay:None},
        Ok(set)=>{
            let volume=set.bodies().fold(Real::zero(),|sum,body|sum+body.volume().unwrap());
            let query=p(q(1,2),q(1,2),q(1,2));
            let locations=set.bodies().map(|body|format!("{:?}",body.classify_point(&query).unwrap())).collect::<Vec<_>>();
            let json=set.model().to_json().unwrap();
            let replay=RawModel::from_json(&json,&ArchiveLimits::default()).unwrap().validate().unwrap();
            assert_eq!(replay.to_json().unwrap(),json);
            Receipt {row:serde_json::json!({"case":case.name,"archive":json,"volume":volume.exact_rational_normal_form().unwrap().to_string(),"locations":locations}),_set:Some(set),_replay:Some(replay)}
        }
    }
}
