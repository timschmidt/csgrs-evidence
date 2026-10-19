# Implementation attempts

- Initial target: 8c88793eb38c5d95661062ce716339b5b7652dc9. The new selected
  revolution fixture failed with UnrepresentableParameter after its first
  authored test typo (nonexistent Real::frac_pi_2) was corrected to exact pi/2.
  The original represented-profile revolution unit test passed unchanged.
- The first rotation-carrier check found a private helper re-export. The helper
  remains internal; no public transform API was added to satisfy a test.
- The first builder compilation found missing imports and a nonexistent local
  is_zero helper. The existing strict comparison API now performs that check.
- The first composition test tried to call private Curve3::transformed. Its
  assertion now exercises the public Model transform and the same exact orbit
  point relationship. No geometry, policy or assertion was dropped.
- Six shared groups passed before the common face admission investigation.
  Bypassing the convenience constructor admitted a profile crossing the axis;
  the failing unit regression and its entire model diagnostic are retained.
  Face admission now requires the complete axis-clearance proof.
- A retained full-period orbit initially failed with UnsupportedClosedEdge.
  Its nonzero-radius/unit-axis proof and exact period now admit the same shared
  endpoint topology. The output is split, reflected and cold-replayed.
- Strict Clippy found a needless borrow after the axis-proof helper extraction.
  The borrow was corrected without a lint suppression. Final focused tests
  include derivatives through order four, reversed traversal, archive metadata
  limits before scalar decoding and explicit nonsimilarity rejection.

Every command has an exact source snapshot and a retained result/log in
results.json. Test counts and source-path consumers do not waive release gates.

- The copied prior patch recipe already used the candidate worktree root. Initial remapping duplicated that prefix for the candidate and pointed the nominal baseline patch recipe at candidate source. The candidate failed before compilation; the first baseline patch result is excluded from baseline evidence. Longest-prefix remapping corrects both paths; both patch consumers are requalified. Original manifests, records and the mis-scoped binary hash are retained. Other recipe paths were audited.
