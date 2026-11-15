# Current Interface browser and simulator qualification

This stage addresses a missing Phase 8/14 execution witness, P6/P8/P9/P19/P27/P31–P37. It does not accept the pending dynamics extraction, the eight-path Interface migration, their performance gates, or the complete plan.

## Reproduced and repaired defect

The current release worker emitted schema 15 while the maintained harness hardcoded 13. `clock-loopback-qualified.json` preserves the failed strict mismatch. Interface commit `73cc71b1bc426cafca0ee829e2fbc40961a45054` introduces one explicit harness version for all six commands and the strict receive comparison, adds a client-owned source alignment regression, and updates the current schema documentation. It does not adopt the worker's advertised version, relax protocol validation, change scenario deadlines, or change production Rust behavior. The source commit is integrated locally with the pending Interface patch byte-identical.

## Build and scope

The release bundle was built from Interface b4a15bd plus its recorded pending patch, CSGRS e232d00 plus 41 staged paths, and firmware b9ecf8d. The harness correction was applied after building; its Rust addition is cfg(test) only. Rust 1.95.0, Trunk 0.21.14 and matching cached wasm-bindgen 0.2.122 were used. The first packaging attempt compiled successfully but failed because offline Trunk did not search its cached CLI before refusing a missing PATH executable. The retry prepended that exact cached CLI. WASM validation and all six gzip/Brotli round trips passed. Bundle identities, commands, logs, source and pending patch identities are retained.

Chromium 155.0.8059.39 used headless SwiftShader, loopback HTTP and isolated profiles. Simulator actors used the two declared test identities and +37/-41 ppm drift. They are test-only actors, not physical devices. Initial DNS isolation also blocked loopback and was corrected before application tests; failed setup outputs remain. Initial browser background GCM attempts occurred before application loading and prompted DNS isolation. `browser-environment.md` records automation and instrumentation limitations.

## Terminal browser witnesses

- Clock qualification passed with the existing capability/configuration/visual checks.
- Network-attended cached execution reached complete in 531 snapshots, 127,264 canonical bytes per participant, with no failure observations. Driver wall time was 72.351 s including native fixture generation.
- Fresh-worker reattachment on those same actors reached retained_complete in seven snapshots. Both exact local start cycles match the earlier terminal; the unavailable original UI epoch remains absent. Driver wall time was 11.307 s including fixture generation.
- Fresh actors configured to drop both job-confirm responses reached complete in 531 snapshots. The harness observed exactly two confirming failures and recovery, retaining increasing participant confirmation progress. Driver wall time was 63.598 s including fixture generation. These are actual dropped-response observations, not an artificial success substitution.

Only these four maintained browser cases were run. No full fault/repeat/autonomous/hardware matrix is claimed. Successful browser transport does not by itself prove the compiler's mathematics.

## Actual UI and native file replay

The actual CAD/CAM application rendered its machine configuration, exact-source summary, diagnostic path, and ready worker with zero connected MCUs. The retained screenshot shows 2,453 exact samples, 2,452 canonical segments, 246 cache blocks, two partitions and 32,080 replayed rising edges. These labels are observed UI output, not independent proofs of those counts. No window error or unhandled rejection was observed through startup and file replay. The persistent CDP startup observers recorded no exception; CDP exception collection ended after their startup screenshots.

The browser exported a 2,064-byte ALMCFG06 configuration and 476-byte ALMEVD03 evidence file. A fresh browser process/profile imported and transactionally replayed configuration, then verified the evidence against current exact reconstruction. A 475-byte truncated evidence import was rejected with canonical evidence digest differed and an unchanged-workspace report. Subsequent exports are byte-identical to both original files. The canonical files, digests and terminal screenshots are retained. This tests actual browser file handling and fresh-process reconstruction of this fixture; deterministic bytes are not treated as a universal semantic equality proof or native/browser compiler parity campaign.

## Measurements and checks

The first UI process observed the Trunk event at 2,747.2 ms and two subsequent animation frames at 3,141.2 ms; screenshot observation completed at 6.378 s. The replay process reached the frame marker at 3,205.9 ms. These are two observations with warm host caches, not a statistical performance claim. The first page recorded long tasks of 2,666 and 245 ms. Its main-realm WASM memory buffer was 19,988,480 bytes; after file replay the second process used 23,789,568 bytes. These values are buffer capacity, not live allocation or peak heap. The first rendered page's CDP JS used heap was 1,948,392 bytes, excluding dedicated-worker heaps.

Seven CDP-reported browser processes had summed PSS 375,753 KiB at the first blank-page observation and 621,815 KiB at rendered UI; the separate replay process cohort ended at 598,684 KiB. Shared-host snapshots, software rendering and process churn constrain comparison. PSS is proportionally apportioned resident memory; summed RSS double-counts shared pages. Neither value is peak memory or a portable platform requirement.

Full client tests/doctests passed (87 unit plus three integration, zero ignored); strict all-feature/all-target Clippy, workspace formatting and diff checks passed. The integrated source-alignment regression passed. Repository retention budget and pending-patch checks passed. All 52 prior frozen evidence stages remain unchanged. Four owned service process groups were stopped after terminal evidence, checking PID start times before signaling. No pre-push/full-platform/HIL qualification, push or publication occurred. The broader active goal remains incomplete.
