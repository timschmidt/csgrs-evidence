# Source-reviewed constraints for completing the dynamics boundary

This is implementation planning, not evidence of completed support. The primary
candidate is unchanged. Review was made against ledger HEAD
99b810a567ad89162b5ffa23e074948311fadb3c plus the recorded pending candidate.

- `routing/feed.rs` still owns constant-feed, acceleration-limited and symmetric
  jerk replay, with geometry-neutral reports and constraint construction.
  `routing.rs` owns ConstantFeedTimeReport, AccelerationLimitedFeedTimeReport,
  AccelerationLimitedFeedProfileClass and the profile discriminator/equation.
  `solve.rs` owns two public scalar-only feed equation builders. Move authority
  once and preserve old paths through the coordinated migration.
- The mixed-path functions validate empty shape and process/time signs before
  lazily summing exact lengths. Keep that order and early failure. Moving all
  length queries into an eager adapter constructor would change the contract.
- The older line-only functions deliberately use `route_axis_length`. Their
  axis-aligned domain must remain explicit: substituting general Euclidean
  `MetricSpan` lengths would silently widen the old API and alter invalid-input
  behavior. A borrowed route view or another exact adapter must preserve this
  domain without copying geometry or allocating a second path merely to call
  the dynamics layer. The rejected private route adapter is not an accepted
  solution; any broader design needs new qualification in its complete context.
- `routing/lookahead.rs` checks route/span and caller vector shapes before
  boundary feeds, radii, process limits, lengths, then join classification.
  Its forward/reverse reachability and bounded component-halving sequences must
  remain intact, including repeated classifier calls and independent replay.
- `CornerLookaheadJoinReport` retains the complete `TangentJoinReport`, not just
  StraightThrough/RadiusLimitedCorner/ReversalStop. A lower join protocol must
  carry the geometry-owned receipt through the resulting report. An opaque
  classification enum alone loses required evidence and changes serialized
  application meaning. Associated receipt types are one possible design;
  documentation or a trait declaration alone does not establish correctness.
- The existing classifier calls are lazy in both the corner checker and
  lookahead planner/replay. Geometry must keep endpoint/tangent predicate
  authority; the dynamics owner must not duplicate it. Unsupported/degenerate/
  mismatched/unknown joins retain their present typed outcomes and receipts.
- Keep old report field names, values and alias paths. Direct consumers need
  exact reports with the same canonical planner transcript. Extend the frozen
  whole-report/trace witness to the entire feed/lookahead boundary under both
  policies, with independent phase/reachability expectations and mixed geometry.

Next action is a coherent domain-neutral feed/join extraction with these
acceptance witnesses, then cost qualification of that complete boundary. Do
not keep trying unrelated parser/scalar changes or compiler-policy changes to
make the existing partial extraction's binary threshold pass. The full fifteen
phase plan and every earlier incomplete obligation remain active.
