# Development attempts and retained failures

All original logs and source patches remain in the raw archive. Only final-source
passes qualify the retained implementation; earlier failures are not erased.

- `baseline-missing-capability` reproduces both original full and selected cap
  failures on base 5d2e9d45a: `UnsupportedRevolutionProfile`. Neither failure is
  counted as a fast successful baseline.
- `first-implementation` used a private projected-curve field. The implementation
  now uses the existing accessor and checks the source parameter map orientation.
- `implementation-02` admitted the full cap but failed on the unchanged selected
  cap. `selected-diagnostic-03` retained temporary diagnostics showing that
  geometric chord parameters were not a certified surface scalar chart. The
  correction requests Hypercurve's `scalar_chart`, preserving endpoint fields.
  No diagnostic prints remain and no hard profile was simplified.
- `composition-05` passed six groups before a malformed-archive fixture indexed a
  shell as an object instead of the schema's face-ID array. The fixture now
  removes the actual face; all four rejection checks and subsequent recovery
  remain. `test-authoring-correction.json` records this change.
- `strict-clippy-07` rejected a test module placed before implementation items.
  Moving it to the end fixed the lint without suppressing it.
- `focus-final-07` passed all nine BRep groups; the new STEP negative test guessed
  an unsupported curve would be diagnosed first. The existing writer checks
  surfaces first and reports `UnsupportedSurface(Revolution)` with face/body
  attribution. The test now checks that actual boundary and verifies recovery.
  No IO production code was changed and no STEP capability was added.
- `strict-clippy-all` found the original acceptance fixture loaded twice through
  shared support modules. The original module is shared and the IO helper takes
  its input explicitly. No warning suppression or weaker test was introduced.
  The concurrent initial full-suite run was interrupted (exit 130); its partial
  log is retained and is not included in completed-test counts.
- Final `*-02` tests, strict lint, docs, fuzz-target compilation and formatting
  qualify the corrected source. External consumers, archives and measurements
  have separate source hashes and logs. Any later failure in those checks must
  be reviewed before this record is packaged.
