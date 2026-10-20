# Retained unsuccessful attempts

Every attempt remains in attempts.json with its exact command, source snapshot,
elapsed time and exit status. A nonzero process status in an expected-rejection
control is distinct from a qualification failure.

| Log | Exit | Source unchanged | Interpretation |
| --- | --- | --- | --- |
| [baseline-probe-1.log](baseline-probe-1.log) | 101 | True | Initial unavailable-network dependency attempt. |
| [baseline-probe-offline-1.log](baseline-probe-offline-1.log) | 101 | False | Diagnostic consumer API error; Cargo created its lockfile during this attempt. No production edit. Source epoch is explicitly marked changed. |
| [baseline-acceptance-1.log](baseline-acceptance-1.log) | 101 | True | Reproduced missing native quintic measurement-independent admission. |
| [candidate-acceptance-1.log](candidate-acceptance-1.log) | 101 | True | Internal caller still used the replaced volume helper; corrected before qualification. |
| [expanded-acceptance-1.log](expanded-acceptance-1.log) | 101 | True | Test expected the wrong persistence wrapper; precise Build/InwardSolidShell cause retained. |
| [full-new-acceptance-1.log](full-new-acceptance-1.log) | 101 | True | Quintic STEP revealed native plane containment gap; later attempts corrected reversed normalized-weight expectations and Parameter typing. All raw compiler/assertion output retained. |
| [baseline-high-degree-incidence-1.log](baseline-high-degree-incidence-1.log) | 101 | True | Contained cubic reproduces missing native higher-degree plane-numerator proof. |
| [full-new-acceptance-2.log](full-new-acceptance-2.log) | 101 | True | Quintic STEP revealed native plane containment gap; later attempts corrected reversed normalized-weight expectations and Parameter typing. All raw compiler/assertion output retained. |
| [full-new-acceptance-3.log](full-new-acceptance-3.log) | 101 | True | Quintic STEP revealed native plane containment gap; later attempts corrected reversed normalized-weight expectations and Parameter typing. All raw compiler/assertion output retained. |
| [baseline-path-front-doors-1.log](baseline-path-front-doors-1.log) | 101 | True | Two expanded groups reproduce path normalization requiring area; other three pass. |
| [minimal-clippy-2.log](minimal-clippy-2.log) | 101 | True | ENOSPC during final qualification; same command later passed with incremental compilation disabled. |
| [native-release-2.log](native-release-2.log) | 101 | True | ENOSPC during final qualification; same command later passed with incremental compilation disabled. |
| [native-minimal-2.log](native-minimal-2.log) | 101 | True | ENOSPC during final qualification; same command later passed with incremental compilation disabled. |
| [old-path-Round-reverse-false-1.log](old-path-Round-reverse-false-1.log) | 101 | True | Expected original round-path UnsupportedMeasurement control; same outcome as retained baseline. |
| [old-path-Round-reverse-true-1.log](old-path-Round-reverse-true-1.log) | 101 | True | Expected original round-path UnsupportedMeasurement control; same outcome as retained baseline. |

See [storage recovery](storage-recovery.json), [initial qualification](qualification-initial.json)
and [final qualification](qualification-driver.json). Successful earlier-source checks do not
replace the final-source qualification. The final three recovery commands use exactly
the same policies, features, fixtures and assertions; CARGO_INCREMENTAL=0 changes
compiler cache storage, not the accepted geometry contract.
