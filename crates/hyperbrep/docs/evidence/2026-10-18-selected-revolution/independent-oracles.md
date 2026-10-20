# Independent oracles and finite coverage

The shared fixture starts with quadratic Bezier controls (0,0), (2,2), (4,0).
Its midpoint is (2,1), and its tangent is horizontal. Its unit left parallel
therefore has midpoint (2,2). Adding three to the radial coordinate gives radius
five and height two. Rotation about Z at 0 and pi/2 must produce (5,0,2) and
(0,5,2), independently of the implemented surface evaluator.

Reflection and scale `diag(-2,2,2)` followed by translation (7,-3,5) sends these
two points to (-3,-3,9) and (7,7,9). The transformed surface reverses its angular
chart. Source reversal likewise retains the profile's documented chart. These
exact expectations are checked before and after selected splits and cold replay.

For axis a=(0,3/5,4/5) through C=(7,-2,5), choose radial unit vector X. The
midpoint is C+2a+5X. Since a cross X=(0,4/5,-3/5), rotations at -pi/2, 0 and
pi/2 are (7,-24/5,48/5), (12,-4/5,33/5), (7,16/5,18/5). Tests assert all three
exact rows on the oblique-axis patch.

For the authored radius-five orbit at height two, derivatives at pi/2 are
(-5,0,0), (0,-5,0), (5,0,0), (0,5,0) through orders one to four. Reversal changes
the first derivative sign. Its full-orbit box is [-5,-5,2] to [5,5,2]. For a
selected height and radius exactly 1/10^12, a quarter turn has x=0 and y=1/10^12,
which remains strictly greater than zero.

The nonlinear profile shifted radially by -2 crosses the axis at t=1/2 while
its endpoints are off-axis. A separate polynomial profile r=(2t-1)^2,z=t touches
the axis tangentially at t=1/2. Both are rejected. These independently known
interior zeros test the complete contact proof rather than endpoint sampling.

The selected endpoint is the isolated root of 2t^3-1 in (3/4,7/8); a later split
uses the root of 3t^3-1 in (2/3,3/4). Assertions require the unavailable scalar
view and the Rotation representation tag. Typed archive corruptions, count
limits, exhausted-work recovery, topology incidence and repeatable bytes are
separate assertions. Replay/wrapper agreement alone is not an independent
geometry oracle. These finite cases and the construction argument do not prove
all inputs, general surface regularity, embedding or closed-solid validity.
