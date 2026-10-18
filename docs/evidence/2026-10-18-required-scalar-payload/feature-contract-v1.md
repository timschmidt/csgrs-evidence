# Circuit test feature declarations

Owner: Hypercircuit test configuration, P35/P37. The interchange-only target
imports geometry-only APIs despite its geometry tests already being gated.
This compile failure is reproduced on committed scalar source in a separate
target, before editing the consumer test. Scalar production is not its cause.

Gate only those imports and the helper used solely by the geometry tests.
Every test body, fixture, policy, assertion and existing test gate stays
byte-identical. Two interchange tests must run without geometry; all four
geometry tests and all five all-feature tests remain executable, including
the original DRC/CAM assertions in the all-feature build.

Rerun the full scalar qualification and affected consumer qualification
after this final edit; retain the original failed command and the independent
baseline reproduction. Use the same source/dependency pins and resource
ceilings. No optimization or performance claim.
