# Independent geometric checks

The quadratic controls (0,0), (2,2), (4,0) give P(t)=(4t,4t-4t²).
At t=1/2 its tangent points along positive x, so the left parallel at distance
one is (2,2). Lifting into XY and sweeping by D=(1,2,3) gives (1,0,-3) at
v=-1 and (4,6,6) at v=2. The authored affine map has linear rows
(-2,1,0), (0,3,1), (0,0,2) and translation (5,-2,7), giving (3,-5,1)
and (3,22,19). These expected coordinates are constants in the fixture;
they are not obtained by evaluating a second wrapper of the same surface.

The clipped parabola region x²≤y≤2 has area 8√2/3 by direct integration.
Its rectangular hole has area 1/8. The plane frame vectors (2,0,1) and (1,3,0)
have cross product (-3,1,6), giving area scale √46. The reflected/sheared frame
has vectors (-4,1,2), (1,9,0) and cross product (-18,2,-37), giving √1697.
With origin (5,-2,7), the original plane obeys 3x-y-6z=-25. Its transformed
origin is (-7,-1,21), giving -18x+2y-37z=-653. Fixture assertions compare
these exact areas and linear forms under strict authority after construction,
reversal, supported transforms and replay.

These finite identities test geometric fidelity independently of archive byte
identity and topology validation. They do not establish arbitrary profile
injectivity, general surface embedding, arbitrary Boolean semantics or complete
formal verification of executable code.
