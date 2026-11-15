# DRC smoke-fixture qualification

Use the source parent in initial-state.json for the baseline. baseline.py records
its complete build, original test binary, tracked archive hashes and CPU-gate
failure. To reproduce the original negative witnesses, insert fixture_tests.rs
inside app::tests before layer_pairs_defaults_to_unique_pairs, leaving the
original extract_complex_project_zip unchanged; format and execute the command
in missing-fixture-witnesses.json. Both regressions fail on the original helper.

The retained source is identified by source-integration.json; source.patch includes
the final helper, all child modes, documentation and workflow changes. qualify.py
and per-command JSON/log files identify the final local checks. The KiCad smoke
still fails its original CPU gate. Command durations are not performance gains.
The integrated main-tree checks also include the separately pending extraction;
that patch is preserved and is not accepted by this stage.

run.py fixes the external Cargo target, 16 build jobs and offline dependency use.
environment.json and source-audit.json record compiler, host and tools. The fixture
archives are tracked source inputs; their hashes remain in fixtures.json. Original
and repaired test binaries are external under the recorded paths/hashes, not in
this archive. Before replay, adjust only isolated source/build destinations and
retain the original fixture bytes, policies, tests and 120-second threshold.

No production implementation, geometry, predicate order or original smoke body
changed. This record proves the scoped test-helper qualification repair, not
completion of the interval refactor or the full repository CI matrix.
