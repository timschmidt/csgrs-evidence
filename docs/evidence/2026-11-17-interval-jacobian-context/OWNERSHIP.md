# Required phase-7 Jacobian body review

Read all136 original lines at557a349f9, EvaluationContext/evaluate_residuals
in eval.rs, and the solver loop that constructs context_from_problem before
symbolic and finite-difference attempts. Six declarations have dispositions:

| Declaration | Role and disposition |
| --- | --- |
| FiniteDifferenceConfig | Solver proposal options, category4. Exact step value, converted visibly to a lossy f64 estimate; not an interval or radius. |
| FiniteDifferenceConfig::default | Category4 default proposal step. Exact binary value of1e-6; no tolerance or enclosure claim. |
| finite_difference_jacobian | Category4 solver symbol/active-row proposal adapter. Fix candidate-context inconsistency in this owner. No general interval kernel to move. |
| symbolic_jacobian | Category4 public numerical Jacobian wrapper. Delegates unchanged to the sparsity-aware implementation. |
| symbolic_jacobian_with_analysis | Category4 cached structural-dependency adapter. Borrow analysis/sparsity without changing exact expression authority. |
| symbolic_jacobian_with_sparsity | Category4 expression derivative and active-row adapter, with explicit lossy conversion. Structural zeros and row indexing stay solver-owned. |

No declaration stores an interval or implements generic interval arithmetic.
A RealBall substitution would change the proposal semantics. This review
completes this named file's body classification, not all solver call sites.

The primary solver currently reconstructs context from the same problem each
iteration, so its ordinary synchronized path is a critical unchanged control.
Public callers can supply an independently rebound EvaluationContext; two
current-revision witnesses reproduce the resulting wrong forward differences.
The minimum repair reads the binding before the existing perturbation. Missing
used symbols still fail at baseline evaluation. Unused missing symbols retain
the model fallback, so existing valid dimensions and zero columns are preserved.
Context and model remain unchanged. No predicate ordering or new policy is added.

Open issues outside this narrowly identified change: zero/underflowed step
validation, filtered missing f64 residual estimates and independently checking
signed inequality derivative conventions. These are review questions/known
surface limits, not claims of corrected or certified support. No universal
Jacobian correctness, work bound or release qualification follows from this audit.
