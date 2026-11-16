# Current firmware image qualification

Owner: Alumina firmware composition and distribution; Hyperinterval integer/fixed consumers. Properties P6, P31-P34 and Phase 9 final-image/resource acceptance.

Missing witness: full five-board final release images after the clock accepted-sample publication repair. Current source revisions are pinned in sources.json. Input domain: the five existing board feature configurations with the unchanged embedded web assets and configured release profile. This campaign measures final image packaging and explicit headroom, not arithmetic correctness, runtime stack, MCU cycles or HIL.

Reproduce the existing two 4 MiB failures without changing capacities, features, assets or partition policy. All board flash_regions arrays are presently empty: packaging uses espflash 4.7.0 default partitions and cannot establish board-declared partition/reserve qualification. Retain exact generated partition data where packaging succeeds. No new functionality or size exception is admitted by this measurement; existing 54 size accounts remain unchanged. Do not use historical images as current headroom.

Use installed Espressif Rust/GCC/LLVM pinned in toolchain.txt, cargo --locked, original release settings and xtask board artifact preservation. Capture command, times, exit status, source/lock hashes and artifact hashes. Builds are bounded to 1800 seconds each, at most 4 compiler jobs; no performance sampling or flashing. Packaging failures remain failures. A prospective 64 KiB free-app reserve may be reported separately, but is not a board contract and cannot close the missing board declaration.
