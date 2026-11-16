# FOC pointwise order-image delegation

Stage 90, Phase 9. Full fifteen-phase goal active; previous turn produced a
current sqrt runtime rejection and verified restoration. Preserve all 89 frozen
stages and 45 accounts. CSGRS 7166cfdc4, firmware 2d68e82, Interface 32a59de;
initial repositories/branches/status/ahead-behind recorded separately, all clean.

Hyperinterval owns exact fixed closed-set min/max images. FOC owns nonempty
Q2.30 coordinates, common-mode injection, PWM meaning, limit checks and explicit
failures. P1/P3/P6/P19/P27/P31-P33/P35-P39. Current private interval_min/max in
alumina-foc/src/lib.rs still duplicate endpoint arithmetic; their sole caller
space_vector_modulate computes nested max first, nested min second, then common
mode, centered phases and duties. Retain every call/check and error order.

Domain: all safe nonempty Q30 intervals with i32 endpoints, including singletons,
full-range, overlapping/disjoint and near-boundary sets; modulation's existing
positive-limit, intermediate overflow and final range conditions remain exact.
These are pointwise images of independent interval members, not intersection
or hull. No approximation, tolerance, saturation or lost coordinate provenance.
Use existing Q30Interval::fixed/from_fixed and shared min_image/max_image; no
new local arithmetic helper or unchecked construction. Preserve public fields,
const API, layout, no_std, no allocation and existing scalar output types.

Missing witnesses: independent reduced-grid point enumeration through the actual
private helpers; unchanged complete public modulation outputs/errors, including
generated intervals and extreme ingress; both firmware Rust1.88 and Hyper-stack Rust1.95
cost/size checks, then relevant Xtensa whole-image/stack evidence before any
production retention. A favorable host result alone does not qualify MCU
cycles, stack, HIL or flash fit. Do not assume duplicate validation optimizes
away. Screen completed native consumer cost before expensive board qualification.

Fixed program baseline c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb already records
firmware 2d68e82; current Hyperinterval src/Cargo.toml are identical to that
baseline. All existing cumulative accounts remain intact. Native existing
artifacts use +4096 bytes AND1% file/allocated-section incremental, +16384 AND2%
cumulative; code +1024 AND0.5% incremental, +4096 AND1% cumulative. New test
witness growth is scoped only to the FOC unit-test executable: +32768 bytes AND4%
file and +16384 AND4% code, same cumulative caps. This pays for independent
closed-set enumeration and application composition assertions, not production
source reduction. No other cap changes. Firmware gets no positive size allowance
in this experiment: incremental and cumulative positive growth caps are zero.
Unresolved baseline 4MiB fit remains a release blocker, not accepted headroom.
Whole images/layout/section costs must be measured if a candidate reaches that
gate. No flash, arm, capability change, hardware commit, push or publication.
