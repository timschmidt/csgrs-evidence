# Exact QR construction and chart use

For a square basis M, process columns in the authored order. At column j, start
v=M_j. For each earlier normalized column q_i, set R_ij=q_i^T*v and replace
v by v-R_ij*q_i. Decide s_j=v^T*v under STRICT. A proved zero is a dependent
column; an unknown decision remains unknown. For proved positive s_j, take the
principal exact square root R_jj=sqrt(s_j) and set q_j=v/R_jj. Lower R entries
are exact zero. No coefficient is rounded, thresholded or dropped.

Inductively in exact arithmetic, the existing columns are orthonormal, the new
residual is orthogonal to them, and M_j=sum_{i<j} q_i*R_ij+v. Thus the normalized
column has unit norm, R has positive diagonal, and Q*R=M. The implementation does
not promote this argument from approximate observations: the existing coordinate
admission separately checks every entry of Q-transpose*Q-I under STRICT, and the
new reconstruction pass checks every Q*R-M residual under STRICT before publishing
success. Original norm and residual decisions, exact M and R, and the admitted Q
chart remain inspectable. No allocation identity or serialized success flag is
part of mathematical equality or replay admission.

The square inverse identity proves that Q-transpose is Q's inverse. Hence a field
x'=F(t,x) in coordinates x=c+Q*y becomes y'=Q-transpose*F(t,c+Q*y). Time and the
ordered state interpretation stay explicit. The existing source-bound coordinate
program preserves all original source operations and guards. Only its already
validated transformed executable is handed to the existing field constructor;
there is no second inverse checker or differential kernel in the adapter.

Orthogonal matrices need not preserve orientation. The principal positive diagonal
fixes the unpivoted QR sign convention and leaves the basis determinant's sign in
Q. Dependent matrices do not yield a partial or default-identity frame. General
Real decisions can remain unknown; no universal decision procedure for arbitrary
computable-real expressions is implied.

Native dyadic evaluation still encloses coefficients such as 3/5 outward. Exact
QR and exact transformed equations therefore do not imply singleton native images
or exact equality at a tight Picard candidate boundary. The corpus checks exact
point equations separately, retains the rejected tight candidate, and checks
containment with a finite native-width bound before using a widened proposal.
This is certified enclosure of the exact model, not replacement of the model by
rounded chart coefficients.

The rotated test uses Q=[[3/5,-4/5],[4/5,3/5]] and
M=[[-7/25,24/25],[24/25,7/25]]=Q*diag(1,-1)*Q-transpose. The original Cartesian
infinity norm is 31/25; in QR coordinates it is 1 (enclosed outward natively).
At duration 7/8 and the same singleton zero initial set, the original Picard
contraction bound exceeds one, while the QR bound is strictly below one. Exact
zero is the independent solution; no altered initial-set geometry explains this
case. A second constant-flow case retains the potentially unfavorable overhead
of QR on a flow that requires no frame improvement. Both full-horizon benchmark
paths retain complete native attempts and original-coordinate projections.

Structural work and stage entry reservations are explicit and shared; there is
no unbounded retry loop. The underlying exact Real arithmetic/refinement,
predicate internals, scalar payload lifecycle, total heap and within-scalar
cancellation exclusions remain those of the original coordinate authority.
Preparation's native dyadic-work count can be zero while exact scalar arithmetic
is substantial. Controlled exhaustion tests resource handling, not decomposition
completion. Automatic basis selection, a whole-horizon adaptive QR/Lohner scheme,
independent-noise retention and universal wrapping reduction remain open.
