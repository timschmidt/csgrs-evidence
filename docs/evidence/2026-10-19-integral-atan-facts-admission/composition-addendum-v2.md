# E95 composition follow-up, before further implementation

The unchanged new unit acceptance test fails on candidate v1: 836 scalar
unit tests pass and the half-pi composition test returns Unknown. The retained
120-query diagnostic reproduces four undecided candidate facts, precisely
sin/cos squared for pi/2 - atan(-1), cold and angle-warmed. The unchanged
parent leaves all 120 facts undecided. Candidate v1 already resolves the
direct import domain; its original focused results and failed full-suite
attempt remain retained.

Owner: the same native inverse-trig argument and composition machinery.
Keep the original exact identities and cold-cache assertion. The existing
pi/atan linear-form reader can identify signed half-pi minus atan without
requiring the argument sign to match the half-pi sign. Preserve the existing
signed helper's narrower contract by delegating to that shared reader and
retaining its sign check. Let the native sin/cos algebraic consumer reuse
the general half-pi relation, swapping its existing sine/cosine pair and
applying the exact orientation. Do not use another approximate reduction or
duplicate root formulas. Test both orientations and signed denominators.

For orientation s in {-1,+1}, sin(s*pi/2-atan(a))=s/sqrt(1+a^2)
and cos(s*pi/2-atan(a))=s*a/sqrt(1+a^2). This preserves values, source
graphs and the documented derived-representation migration. The original
four public quarter-pi observation cases remain separately tracked.

Repeat the entire final-source focused and Cargo/downstream matrix after
editing, including all original tests. Add the unchanged 120-query diagnostic
as a candidate replay requiring exact zero for every squared identity.
Retain failed helpers, outputs and source versions. Use a new build upper
directory above the preserved first attempt. The prepared 17-row ordinary
and 96-row native cost workloads and all resource limits remain unchanged;
only source/library bindings will advance to candidate v2. No performance
measurement has started.
