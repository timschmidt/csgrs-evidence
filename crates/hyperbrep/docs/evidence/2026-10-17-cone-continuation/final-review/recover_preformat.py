from pathlib import Path
from itertools import product
import hashlib,json,time
root=Path('/mnt/development/csgrs')
out=root/'crates/hyperbrep/docs/evidence/2026-10-17-cone-continuation'
relative='crates/hypercurve/src/rational_bezier_general/circle_incidence_tests.rs'
origin=out/'overlay-73fc93aa0be2810bbfa630d34f7e90073e1c145f7cc9644dd6e3d1d35aad3a21'/relative
source=origin.read_text(); expected='391d4889cd9029bf558a43c2838b63ae629bd0c5fbbb6b2a1cf952e105c0efa2'
assert hashlib.sha256(source.encode()).hexdigest()=='1db193fa1f5e7dfe624b876d961007c37b209a85ff9eb924d8a7102c3c8b27f5'
parts=[]
q='fn q(n: i32, d: i32) -> Real {\n    (Real::from(n) / Real::from(d)).unwrap()\n}'
qs=[q,'fn q(n: i32, d: i32) -> Real { (Real::from(n) / Real::from(d)).unwrap() }','fn q(n:i32,d:i32)->Real { (Real::from(n)/Real::from(d)).unwrap() }']
point='''        Point2::new(
            Real::from(5) * angle.clone().sin().unwrap(),
            Real::from(5) * angle.cos().unwrap(),
        ),'''
points=[point,'        Point2::new(Real::from(5) * angle.clone().sin().unwrap(), Real::from(5) * angle.cos().unwrap()),','        Point2::new(Real::from(5)*angle.clone().sin().unwrap(), Real::from(5)*angle.cos().unwrap()),','        Point2::new(Real::from(5)*angle.clone().sin().unwrap(),Real::from(5)*angle.cos().unwrap()),']
last='''    let crate::CurvePointLocations2::Locations(locations) =
        curve.point_locations(&query.into()).unwrap()
    else {
        panic!("finite arc");
    };'''
lasts=[last,'''    let crate::CurvePointLocations2::Locations(locations) = curve.point_locations(&query.into()).unwrap() else {
        panic!("finite arc");
    };''', '''    let crate::CurvePointLocations2::Locations(locations) = curve.point_locations(&query.into()).unwrap() else { panic!("finite arc"); };''']
angle='    let angle = q(1, 2) * (q(3, 4).atan().unwrap() - q(1, 2) * Real::pi());'
angles=[angle,'    let angle = q(1,2) * (q(3,4).atan().unwrap() - q(1,2)*Real::pi());','    let angle = q(1,2)*(q(3,4).atan().unwrap()-q(1,2)*Real::pi());','    let angle = q(1,2) * (q(3,4).atan().unwrap() - q(1,2) * Real::pi());']
count=0;start=time.monotonic()
for qv,pv,lv,av,inline,blank_use,blank_q,compact_points,trailing in product(qs,points,lasts,angles,[False,True],[False,True],[False,True],[False,True],[0,1,2]):
 data=source.replace(q,qv).replace(point,pv).replace(last,lv).replace(angle,av)
 if inline: data=data.replace('    )\n    .unwrap();','    ).unwrap();')
 if not blank_use: data=data.replace('use super::*;\n\n','use super::*;\n')
 if not blank_q: data=data.replace(qv+'\n\n',qv+'\n')
 if compact_points:
  for a,b in [('-4, 3','-4,3'),('0, 0','0,0'),('5, 0','5,0')]:data=data.replace(a,b)
 data=data.rstrip('\n')+'\n'*trailing
 count+=1
 if hashlib.sha256(data.encode()).hexdigest()==expected:
  dest=out/'overlay-recovered-preformat'/relative;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_text(data)
  record=dict(recovered=True,source=str(origin.relative_to(out)),source_sha256=hashlib.sha256(origin.read_bytes()).hexdigest(),recovered_path=str(dest.relative_to(out)),recovered_sha256=expected,variants=count,seconds=time.monotonic()-start,scope='Whitespace-only preformat recovery verified against the SHA-256 recorded before the original rejected compile/format overlap. The failed source guard and compiler diagnostics remain unchanged.')
  (out/'preformat-recovery.json').write_text(json.dumps(record,indent=2)+'\n');print(record);break
else: print('no hash match among',count,'whitespace variants')
