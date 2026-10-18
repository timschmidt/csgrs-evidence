# Circle-envelope feasibility result

The current scalar implementation plus the isolated exact importer still fails
the original native resource contract when retained-circle bounds are tried first.
The candidate is not admitted. Main production source is unchanged.

Both baseline and candidate pass all 11 support tests, including two new exact
containment controls. The candidate also passes all 75 native ingress and
aggregation tests. No policy, fixture, range/pole check or original limit changed.

Original gates:

- copper-neck: exit 101; complex project copper neck regression fixture took 183.749997851s.
- full-board: exit 101; complex project KiCad smoke suite took 446.624547486s of worker time.
- gerber: exit 0; no failing assertion.

These are complete feasibility checks, not a matched speedup measurement.
The full-board smoke tests completion and resources; it is not an independent
proof of the intended geometry. Complete report equivalence, allocation cost
and broad standalone-kernel acceptance were not established here.

The exact-circle construction facts prove the conservative bounds tested here.
A wider envelope can increase downstream work; the current results do not
justify advancing this candidate or the still-unadmitted exact importer.

The archive retains the tested overlays, unchanged regression sources, command
records, raw output, resource telemetry and helpers. Executed binaries and
build artifacts are hashed at their physical paths. The prior artifact history
is inherited without claiming to have recovered or reaudited missing files.

Next, reproduce the separate scalar sign-publication finding. Hypervoxel remains
out of scope. This checkpoint makes no release or full-plan completion claim.
