"""Independent rational integration and point expectations for the cone corpus."""
from fractions import Fraction as F
import hashlib
import json
import sys
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
support = ROOT / 'crates/hyperbrep/tests/support/cone_continuation.rs'
text = support.read_text()
assert 'builder::cone_frustum(5.into(), 2.into(), 6.into())' in text
assert 'builder::cuboid(p(0, -20, -20), p(20, 20, 20))' in text
assert 'builder::cuboid(p(-20, -20, 1), p(20, 20, 20))' in text
assert 'for cycle in 0..2' in text
radius = lambda z: F(5)-z/2
integral_r = lambda z: 5*z-z*z/4
integral_r2 = lambda z: 25*z-F(5,2)*z*z+z*z*z/12
expected = {
    'Whole': (F(78), F(29), F(21), F(0)),
    'Positive': (F(39), F(29,2), F(21,2), F(42)),
    'Negative': (F(39), F(29,2), F(21,2), F(42)),
    'Band': (F(665,24), F(97,8), F(65,8), F(65,2)),
    'Lower': (F(271,24), F(181,8), F(19,8), F(19,2)),
}
records = []
delta = F(1,10**12)
c,s = F(3,5),F(4,5)
assert c*c+s*s == 1
for part, values in expected.items():
    lo,hi = (F(1),F(6)) if part == 'Band' else (F(0),F(1)) if part == 'Lower' else (F(0),F(6))
    fraction = F(1) if part == 'Whole' else F(1,2)
    radial_integral = integral_r(hi)-integral_r(lo)
    actual = (fraction*(integral_r2(hi)-integral_r2(lo)),
              fraction*(radius(lo)**2+radius(hi)**2), fraction*radial_integral,
              F(0) if part == 'Whole' else 2*radial_integral)
    assert actual == values
    z = (lo+hi)/2
    r = radius(z)
    positive = 'Outside' if part == 'Negative' else 'Inside'
    negative = 'Inside' if part in ['Whole','Negative'] else 'Outside'
    seam = 'Inside' if part == 'Whole' else 'Boundary'
    cap = 'Outside' if part == 'Negative' else 'Boundary'
    probes = [
        ((1,0,z),positive), ((-1,0,z),negative), ((0,1,z),seam),
        ((delta,1,z),positive), ((-delta,1,z),negative),
        ((r-delta,0,z),positive), ((r,0,z),cap), ((r+delta,0,z),'Outside'),
        ((-r+delta,0,z),negative), ((-r-delta,0,z),'Outside'),
        ((1,0,lo-delta),'Outside'), ((1,0,lo),cap), ((1,0,lo+delta),positive),
        ((1,0,hi-delta),positive), ((1,0,hi),cap), ((1,0,hi+delta),'Outside'),
    ]
    points = []
    for (x,y,z), outcome in probes:
        x,y,z = F(x),F(y),F(z)
        wx,wy = c*x-s*y, s*x+c*y
        assert c*wx+s*wy == x and -s*wx+c*wy == y
        assert wx*wx+wy*wy == x*x+y*y
        side = -x if part == 'Negative' else x
        rho2 = x*x+y*y
        if not lo <= z <= hi or rho2 > radius(z)**2 or (part != 'Whole' and side < 0):
            result = 'Outside'
        elif z in [lo,hi] or rho2 == radius(z)**2 or (part != 'Whole' and side == 0):
            result = 'Boundary'
        else:
            result = 'Inside'
        assert result == outcome, (part,x,y,z,result,outcome)
        points.append(dict(world=[str(wx),str(wy),str(z)], expected=result))
    records.append(dict(part=part, z_interval=[str(lo),str(hi)], volume_pi=str(actual[0]),
        cap_area_pi=str(actual[1]), lateral_area_pi_sqrt5=str(actual[2]), cut_area=str(actual[3]), points=points))
result = dict(passed=True, rows=records, command=['python3',str(Path(__file__).relative_to(ROOT))], python=sys.version,
    fixture=str(support.relative_to(ROOT)), fixture_sha256=hashlib.sha256(support.read_bytes()).hexdigest(),
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    derivation='r(z)=5-z/2; integrate pi*r(z)^2 over the axial interval and angular fraction. The lateral metric is sqrt(5)/2, so its full-turn area is pi*sqrt(5)*integral(r). A half adds the planar diameter cut 2*integral(r); cap areas are the angular fraction of pi*r^2. Rational rotation preserves squared radius and maps the cut normal back to x.',
    scope='Independent Fraction recomputation of five analytic measures and 80 finite point expectations used by the source-bound native tests. It does not invoke the geometry kernel or prove arbitrary set equality, topology, exchange or resource closure.')
(OUT/'analytic-oracle.json').write_text(json.dumps(result,indent=2)+'\n')
print('independent analytic expectations:',len(records),'parts,',sum(len(r['points']) for r in records),'points')
