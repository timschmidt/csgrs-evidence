# Preserved adverse observations

- The unchanged Cartesian endpoint API loses reversible-shear correlation.
  The original expected [-3/2,3/2] x bound remains a separate acceptance test.
- Initial new-code Clippy reported three needless-range-loop findings; they were
  corrected before qualification without changing predicate/decision order.
- Switching final range materialization to the native vector owner changed the
  diagnostic wrapper to Field(Lattice(Scalar(WorkExhausted))). The new assertion
  was corrected to that exact existing error path; it was not broadened.
- An expanded replay test initially lacked the EnclosedVectorField trait import.
  The corrected import and raw compile failure are retained.
- The initial allocation probe's blanket zero-retention assertion failed at
  104 bytes in the constant control. It now records before/after output,
  preparation and source lifetimes and asserts no post-first-workload growth.
  Cold shear/noise retains 312 bytes; warm shear/noise retains 208. This is not
  claimed to prove precise attribution, zero residual storage or leak freedom.
- An extra blank line left behind by moving the README addition caused the
  first alternate-index preflight conflict. No real index or main file changed.
  Removing that unintentional line in the isolated branch preserved every
  substantive documentation byte and allowed the exact-reversal proof.
- An early combined formatter/search shell returned status 1 because its search
  had no result. Final explicit format checks pass. Read-only exploratory reads
  with guessed paths likewise are not counted as test results.

No prior production assertion, oracle, policy, fixture or acceptance threshold
was weakened. The completed-workload timing/allocation records include the
unfavorable constant case, the coarsest near-break-even shear and size increases.
