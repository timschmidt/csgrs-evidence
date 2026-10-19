# Fixture audit correction

The first audit preserved all three migrated support fixtures but rejected the
geometry unit-test module. Its whitespace-only comparison did not account for
rustfmt inserting optional trailing commas when the longer explicit API calls
wrap onto multiple lines. The corrected audit formats both the mechanically
migrated baseline and the candidate with the same recorded rustfmt, then compares
complete text. It does not drop expressions, assertions, numeric values or error
expectations. The original script and failed log are retained. No production or
test source was changed for this audit correction.
