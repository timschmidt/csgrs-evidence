# Noise enclosure argument and scope

Assume the retained Taylor certificate proves f(x)=P(x)+r(x), with r(x) in R,
throughout its admitted domain. Its exact affine output map is g=A f+b. Grouping
common centered monomials gives g(x)=c+sum_j C_j m_j(x)+A r(x). Hypersolve already
owns and certifies this grouping, original regularity, exact coefficients and R.

For each monomial compute M_j containing m_j(x) using the existing interval power
and product helpers. Select S by descending max_i width(enclose(C_ij*M_j)), with
original canonical term index breaking equal-bound ties. The score is an upper
bound on full-domain contribution variation, not an exact gradient or an optimal
noise-selection claim. Exact dyadic comparisons choose among certified bounds.

For omitted columns define E_i as the sum of all enclose(C_ij*M_j), j not in S.
Then g belongs to c+sum_(j in S) C_j eta_j + A rho + e, where eta_j in M_j,
rho in R and e_i in E_i. Treating these parameters independently gives a valid
outer set, even though the actual monomials and residual functions are correlated.
The exact original function, domain, coefficient and residual associations stay
in the shared source; no outer set is silently adopted as that function.

For a query Q g+d, combine Qc+d, Q C_j and Q A exactly before projecting eta/rho.
Project E through Q separately. Thus a duplicated original residual cancels when
its exact composed weight is zero. Distinct original residual coordinates do not
merge merely because their interval bounds match. Dropped monomial correlations
may be lost; this is the explicit capacity/width tradeoff. Finally intersect with
a separate affine projection of the source's certified Cartesian range. Both
sets contain the queried values, so their intersection remains a certificate.
An unexpectedly empty intersection is an explicit inconsistency, not success.

The source's empty flag distinguishes empty sets from zero-dimensional units.
Map shape validation and cancellation run before empty shortcuts. No model/query
is published after a failed graph/native charge; all input certificates are
immutable. Construction records all dropped term indices and both omission-only
and full projected residual bounds. Proof objects have no Deserialize path;
replay the original Taylor source/request, affine map and capacity.

Structural admission conservatively counts candidates, selected indices/columns,
omitted indices, both residual vectors and input shifts. Selection is bounded
O(T*K); contribution construction additionally visits every relevant coefficient
and monomial. Query work includes retained columns and original residual weights.
Graph budgets are not instruction or heap-byte limits. Exact Real scalar payload,
refinement and in-scalar cancellation remain inherited exclusions. Original shared
source storage is retained, so a bounded noise-column count is not a total-memory
bound. Explicit clones remain caller-owned work.

This is reusable field-image enclosure structure. It does not propagate fresh
noise through ODE steps, implement stochastic independence, promise optimal
wrapping control, or establish global trajectory sensitivity. Full flow-noise
propagation and the remaining plan requirements stay open.
