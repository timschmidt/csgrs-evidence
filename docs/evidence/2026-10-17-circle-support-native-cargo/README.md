# Native workload and report qualification

Both baseline and cache candidate passed the three original native gates:
full-board, copper-neck and Gerber smoke checks. All six separate runs kept the
original 120-second worker-CPU and 60-second check-body wall limits. The complete
candidate HyperDRC release suite passed 1,656 tests across ten terminal groups,
with zero failures and zero ignored tests. Strict native Clippy and docs passed.
Both full fixture archives were independently verified before execution; missing
or failed extraction could not be credited as a passing workload.

Complete CLI JSON reports were generated in baseline/candidate/candidate/baseline
order at identical paths for both complete boards and the original Gerber outline
smoke input. All twelve processes completed. Full byte and parsed-report equality
held across variants and repetitions, preserving all findings, diagnostics,
coverage and provenance. The boards retained 12 and 201 findings. No report
content was normalized away. The Gerber check remains its original limited smoke
workload; it does not cover every layer in the package.

These are resource-gate and compatibility results, not an end-to-end performance
benchmark or an independent oracle for exact legacy KiCad geometry. The original
35-file bundle and exact KiCad ingress proposal remain rejected. Source, fixtures,
policies and assertions were unchanged throughout qualification. The cache
candidate remains unadmitted pending the remaining consumer and distribution
checks listed in review-v1.json.

The exact executed CLI binaries were copied and independently hashed before
broader builds reuse their open targets. Both complete ZIP fixtures are retained.
The verified raw archive includes logs, controls, reports and fixtures; binary
snapshots are physically pinned outside Git. All completed scratch roots are
included in the closure inventory. General source, registry/cache and native
build roots remain open. Historical missing paths remain 27,093 and are not
requalified by this checkpoint. Only current_work changes in the ledger; the
original repository remains unchanged and integration remains pending.
