printf '%s  %s\n' 'dc5e86b407ce5d5134f584f6a970baf772240be1da6fc2502fe2f6902e97db11' '/mnt/development/.interval-refactor-build/coordinated-ci/stable/release/deps/hyperdrc-1844e5fbe37d2531' | sha256sum --check
TIMEFORMAT='elapsed %R user %U system %S seconds'
time /mnt/development/.interval-refactor-build/coordinated-ci/stable/release/deps/hyperdrc-1844e5fbe37d2531 --exact zz_complex_project_performance_tests::kicad_board_completes_smoke_check_suite --test-threads=1 --nocapture
