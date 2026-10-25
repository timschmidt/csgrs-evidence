    #[test]
    fn r23_rational_travel_envelope_uses_the_exact_active_image() {
        use hypercurve::RationalBezier2;
        let source=Curve2::from(RationalBezier2::try_new(
            [(0,0),(1,3),(2,3),(3,0)].map(|(x,y)|CurvePoint2::from_values(x,y)).to_vec(),
            [1,2,2,1].map(Real::from).to_vec()).unwrap());
        let (a,b)=source.split_at(Real::from(Rational::fraction(1,2).unwrap()).into()).unwrap();
        let (c,d)=source.split_at(Real::from(Rational::fraction(1,3).unwrap()).into()).unwrap();
        let paths=[
            ("native",CurvePath2::try_new(vec![source.clone()]).unwrap()),
            ("reversed",CurvePath2::try_new(vec![source.reversed().unwrap()]).unwrap()),
            ("halves",CurvePath2::try_new(vec![a,b]).unwrap()),
            ("thirds",CurvePath2::try_new(vec![c,d]).unwrap())];
        drop(source);
        // Independently y=18u/(1+3u), 0<=u=t(1-t)<=1/4, hence max=18/7 mm.
        let limits=[("loose",wire_rational(7,2500),true),
                    ("tangent",wire_rational(9,3500),true),
                    ("above",wire_rational(18001,7000000),true),
                    ("below",wire_rational(17999,7000000),false),
                    ("outside",wire_rational(1,500),false)];
        let mut completed=0;
        for (representation,path) in paths {
            for (name,maximum,contained) in limits {
                let mut records=machine_records();
                for record in &mut records {
                    if let ConfigurationRecord::Scalar(scalar)=record
                        && scalar.instance==1 && scalar.fact==ScalarFact::AxisPositionMaximumMetres {
                        scalar.value=maximum;
                    }
                }
                let result=CertifiedTravelEnvelope2::certify(&path,&profile_from(&records).unwrap());
                match result {
                    Ok(_)=>{assert!(contained,"false travel admission {representation}/{name}");completed+=1;println!("R23 consumer {representation}/{name} admitted");}
                    Err(MotionScheduleError::TravelEnvelopeExceeded{axis:1,boundary:TravelBoundary::Maximum})=>{
                        assert!(!contained,"false travel rejection {representation}/{name}");completed+=1;println!("R23 consumer {representation}/{name} exact escape");
                    }
                    Err(error)=>println!("R23 consumer {representation}/{name} {error:?}"),
                }
            }
        }
        assert_eq!(completed,20,"all exact travel queries must complete");
    }

