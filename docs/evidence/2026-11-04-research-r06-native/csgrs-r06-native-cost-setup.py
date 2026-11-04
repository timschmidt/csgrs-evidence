from pathlib import Path
import shutil
prefix='/tmp/csgrs-r06-native-cost'
for variant in ['baseline','candidate']:
 p=Path(f'{prefix}-{variant}');(p/'src').mkdir(parents=True,exist_ok=True)
 root='/tmp/csgrs-r06-native-baseline' if variant=='baseline' else '/home/tim/Documents/GitHub/workspace/csgrs'
 manifest=Path('/tmp/csgrs-r06-cost-candidate/Cargo.toml').read_text().replace('name="csgrs-r06-cost"',f'name="csgrs-r06-native-cost-{variant}"').replace('/home/tim/Documents/GitHub/workspace/csgrs',root)
 (p/'Cargo.toml').write_text(manifest)
 shutil.copyfile('/tmp/csgrs-r06-cost-candidate/Cargo.lock',p/'Cargo.lock')
 (p/'src/main.rs').write_text(Path('/tmp/csgrs-r06-cost-main.rs').read_text().replace('/tmp/csgrs-r06-cost-cases.rs','/tmp/csgrs-r06-native-cost-cases.rs'))
s=Path('/tmp/csgrs-r06-cost-cases.rs').read_text()
a=s.index('   let error=PolynomialCurveSet2::from_topology');b=s.index('\n  }\n  #[cfg(not',a)
s=s[:a]+'''   let set=PolynomialCurveSet2::from_topology(t.clone(),Default::default()).unwrap();
   for curve in set.curves() {
    let branch=curve.polynomial_branch().unwrap(); assert!(branch.certifies_polynomial_identity(&c.equation));
    let sample:hypercurve::CurveParameter2=branch.topology().slabs()[branch.slab_index()].sample().clone().into();
    let point=curve.point_at(&sample).unwrap();
    assert!(point.rational_form(c.equation.clone(),p(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap().is_eq());
    assert!(matches!(curve.point_locations(&point).unwrap(),hypercurve::CurvePointLocations2::Locations(locations) if locations.len()==1));
    let (left,right)=curve.split_at(sample).unwrap();
    assert!(left.end().coincides_with(&right.start()).unwrap());
    black_box_curve(left.reversed().unwrap()); black_box_curve(right);
   }
   row["curve_admission"]=json!({"status":"exact_success","curves":set.curves().len(),"isolated":set.isolated_points().len()});
   return Receipt{row,_topology:t,_set:Some(set),_doc:None,_replay:None};'''+s[b:]
s+='\nfn black_box_curve(curve:hypercurve::Curve2){std::hint::black_box(curve);}\n'
Path('/tmp/csgrs-r06-native-cost-cases.rs').write_text(s)
