# Embedded interval migration qualification

Plan Phases 2 and 9 require target code size, stack and cycle evidence, with
no silent hot-path regression. Previous host and WASM measurements do not
satisfy these target gates. Baseline firmware bdee397 predates the clock/Q30/
servo arithmetic migration; candidate 558df6d contains all three. Core source
is pinned by BASELINE.json and the retained source commits. Existing staged
extraction and pending Interface work must remain untouched.

Owner: unchanged portable fixed/integer kernels and domain consumers, linked
into each existing board composition root. Relevant P5/P6/P27/P31–P33 and the
plan's priority/performance contract. This stage initially changes no production
code. Missing acceptance witnesses: complete same-toolchain Xtensa release
image section sizes and emitted stack information for affected consumers.
Preserve the existing exact outcome/protocol contract and all board admission.

No serial fixture or probe runner is visible on this host. Compile/emulator
results must not be reported as measured physical cycles or HIL completion.
Compiler stack frames are not runtime high-water marks, whole-call-graph stack
bounds, interrupt nesting or vendor-task measurements. Toolchain and artifact
identities, excluded/unavailable gates, and any failures remain explicit.

Use the repository's existing xtask board builds on isolated clean revisions.
Pin matching compiler/linker versions for both builds; do not infer a migration
regression from historical images built with another toolchain. Do not flash,
arm or alter board safety flags as part of compile qualification.

Reproduced build finding on both bdee397 and 558df6d: main calls
ServiceResources::write_diagnostic_boot_marker unconditionally, but only the
TinyBee board's service owner implements and owns the configured diagnostic
UART. MKS FOC retains unconfigured UART tokens, and T-Deck/Pager have distinct
service resources. Owning layer is the board composition root, P6/P28–P33.
Fix the call's feature domain to the two TinyBee compositions that supply it;
do not fabricate no-op methods or configure unrelated hardware. Missing
acceptance witness is the five-board release build matrix. Apply the identical
fix to baseline and candidate for a normalized arithmetic comparison, and
preserve the original compile failures. This is not an arithmetic regression.
