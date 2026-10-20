# Existing seam-aligned Boolean frontier

The full original three workflows are retained in `baseline-frontier.rs.txt`.
Both source revisions reject the seam-aligned half-torus cut (axial and
longitudinal) and longitudinal half-cone cut before any scale is applied.
`baseline-cut-frontier-2.log` uses the pinned pre-change BREP source; its
registry packages exactly match a subset of the repository lockfile, recorded
in `baseline-lock-proof.json`. Attempt 1 used newer cached dependencies and is
not credited as the matched baseline. Original radii, cutter extents and all
failures remain intact. They are unresolved WP08 exact-degeneracy workflows,
not passed scaling workflows or a claim of complete Boolean support.

The scaling certificate matrix separately exercises the already admitted
central torus band and oblique longitudinal cuts from the kernel regression
domain. The original draft incorrectly assumed seam-aligned cut construction
was already supported. This is a correction of the new fixture's starting
capability assumption, not a repair of those original hard cases. Their
failure and unchanged inputs remain executable for the follow-on Boolean work.

The selected-edit draft also requested the same split parameter three times.
After the first edit it is an endpoint, so `InvalidParameterDomain` is correct.
Use three distinct certified interior parameters (1/2, 33/64, 17/32) and retain
all three scaling/edit/inverse/replay cycles; no strict policy or fixture
resolution changes.

## Final-source reproduction

`current-cut-frontier-1.log` executes the identical retained
`baseline-frontier.rs.txt` using the final workspace BREP and the locked external
probe manifest. The diagnostic reports the same three typed failures: torus
nonmanifold edges with one use (axial edge 11, longitudinal edge 18), and cone
face 8 without an interior witness. Exit zero means the diagnostic ran; none of
these cuts earns certified-completion credit. No sampling or policy change.

After the reflected-subdivision proof repair, `current-cut-frontier-2.log`
repeats the same complete inputs on the final candidate. Failure classes remain
the same. The axial torus diagnostic names edge 0 this time, rather than edge 11;
local graph diagnostic indices can vary, so the retained claim is the one-use
nonmanifold-edge failure, not stability of that index. Longitudinal torus edge
18 and cone face 8 are observed in this run. No cut is admitted as success.
