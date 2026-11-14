# Review follow-up before retention

The running full-owner executable was built from isolated sourceb84d2107e.
Do not mutate source while its sequential validation driver may compile later
steps; inspect the live driver/session and wait for its terminal state first.

Two explicit review obligations remain before final qualification:

1. Clarify the public C1/regularity wording: continuous differentiability does
   not assert a nonzero tangent, immersion or injectivity. Add a constant/stationary
   native-source witness if the existing native constructor admits that source.
2. Exercise an interior homogeneous zero weight explicitly. For quadratic controls
   (X,Y,W)=(0,0,1),(1,1,0),(2,0,1), the weight is(1-t)^2+t^2>0. At t=1/2 the
   independent point is(2,1) and tangent(4,0). Preparation must retain this source
   without affine projection of its zero-weight control. The whole Horner interval
   may fail to prove the denominator sign; do not call that an actual pole.

The preserved degree65 fixture already checks exact output at precision-128,
coarse outward enclosure[0,2^-64] at precision-64, and a fine→coarse→fine retry.
The denominator fixture now checks the original Enclosure{ContainsZero} cause,
not a renamed DomainNotCertified error. Both original failed expectations/logs
remain. No production kernel or acceptance gate was changed to make them pass.

After source/test/documentation review, run affected checks on the final source.
Current validation.py runs full owner library tests, actual example test/run,
strict Clippy, docs/doctests, disabled-feature check, formatting and release bench
build. It has not yet run stable, dispatch-trace/SVG composition, downstream,
WASM, packaging or performance probes. The external cost probe is prepared but
unexecuted. Its common input is a native curve with a warm basis cache; all new
expression/derivative preparation, sixteen reports, native box projection and
native broad-phase calls are included. Do not label it a cold native-source
construction benchmark or a universal speedup.
