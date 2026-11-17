# Public WASM cancellation witness

Use the original 1,800-second campaign remainder; no deadline reset. Build
identical small cdylib witnesses against the extracted baseline package and
isolated candidate. Cases cover uncancelled success, cancellation inside an
uninstrumented callback, and a pre-cancelled callback. Assert the precise typed
Cancellation fields and zero usage inside Rust, then prove scope cleanup and
fresh-token retry. Baseline case zero must pass and cases one/two must trap;
the native witness supplies the failure explanation. All candidate cases must
pass. Require zero WASM imports and a fresh instance per case.

Rust 1.95, locked offline, original release profile and six jobs. Each build is
bounded to 600 seconds or the original remaining allowance, whichever is less;
each Node invocation to 20 seconds. Preserve both modules, commands and failures.
No production ABI, total-resource or timing claim follows from this witness.
