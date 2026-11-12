# Authored center/radius admission

Baseline 3f9679e5174f52f2e3457834fb6b7adb2652108d. All managed trees clean.
Owner Hyperlattice Cartesian definitions; scalar sign, addition, subtraction
and hull remain Hyperinterval authority. P1-P7, P18-P20, P25-P27, P35-P37;
plan 5.1-5.2 / Phase 6. Missing witness: independently authored point centers
and nonnegative point radii cannot be retained by the current decomposition
carrier without first computing endpoint bounds, which can overflow.

Add independently authored CenteredVector/CenteredMatrix forms without changing
MidpointRadiusVector/Matrix representation, layout, semantics, or wire format.
Admitted scalar families: all six IntervalArithmetic backends. Center and radius
lanes are exact singletons in the same backend; empty or nonsingleton components
are invalid, negative radius is typed invalid, zero radius is valid. An explicit
empty constructor preserves canonical empty vs dimension-zero unit. Radius
validation uses the existing exact sign set. No endpoint arithmetic or scalar
copies at construction; retained ownership survives projection overflow.

Expose exact borrowed/owned components and an explicitly named Cartesian
projection. Projection uses existing subtraction, addition, hull in that order,
sharing the caller context; it publishes only a complete result. It does not
replace the retained exact definition. Serde replays the components and reruns
all constructor checks; no serialized validity flags. Expected independent
bounds are c-r/c+r, with outward projection into the chosen endpoint family.

Acceptance: six-backend vector/rectangular matrix corpus, empty/unit dimensions,
negative/nonpoint inputs and malformed replay, signed extrema and IEEE
subnormals/overflow, shared dyadic exhaustion and successful retry, fresh-process
replay, generated enclosures consumed by existing linear/affine/Boolean-set
operations, primitive allocation and native/Wasm costs. Projections are exact
for representable fixed/rational/dyadic sums and otherwise qualified outward
bounds or typed failures; no certified point is inferred from a nonsingleton.

No existing arithmetic/predicate body or order changes; no production consumer
migration, general heterogeneous C/R arithmetic, authored-form affine-source
integration, or whole-phase completion claim. Those requirements remain open
where needed. The full 15-phase objective is unchanged.
