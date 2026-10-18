# Correct the stored logarithm domain

The all-feature suite rejected the first candidate: the unchanged native
log1p_domain_guard_survives_serialization regression failed. The three
logarithm variants store residual x for ln(1+x), including binary scaling.
Their real-domain boundary is x > -1. The first candidate incorrectly
required x > 0 and treated zero as invalid in the new tests.

Preserve that candidate, baseline test source and every failure. Correct
the production guard and classify zero as valid in an explicit native
residual success test. Negative residuals above -1 also remain accepted;
retain the existing full negative/large residual regression unchanged and
add public Real cases. Invalid residuals -1 and -2 require typed rejection.
This corrects the new test oracle; it does not migrate or weaken the valid
input contract. Re-run the corrected final test against the parent library
and repeat the complete affected checks after these edits.
