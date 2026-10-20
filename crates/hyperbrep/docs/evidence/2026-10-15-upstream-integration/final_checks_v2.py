"""Qualify the final residual-replay tests/docs and their BREP consumer."""
import sys
import qualify

qualify.OUT = qualify.OUT / "final-source-v2"
qualify.OUT.mkdir(exist_ok=True)
extra = {
    "PATH": "/tmp/hyperbrep-upstream-tools/usr/bin:" + qualify.ENV["PATH"],
    "GMP_MPFR_SYS_CACHE": "/tmp/hyperbrep-upstream-tools/gmp-cache",
}
qualify.COMMANDS = [
    ("residual-focused", qualify.CARGO + ["--release", "-p", "hypersolve", "--all-features", "--lib", "residual_replay::tests"], extra, 900),
    ("solver-default", qualify.CARGO + ["--release", "-p", "hypersolve"], extra, 1800),
    ("solver-all-features", qualify.CARGO + ["--release", "-p", "hypersolve", "--all-features"], extra, 1800),
    ("solver-clippy", ["cargo", "clippy", "--offline", "--locked", "-p", "hypersolve", "--all-targets", "--all-features", "--", "-D", "warnings"], extra, 900),
    ("solver-rustdoc", ["cargo", "doc", "--offline", "--locked", "-p", "hypersolve", "--all-features", "--no-deps"], extra | {"RUSTDOCFLAGS": "-D warnings"}, 900),
    ("brep-debug", qualify.CARGO + qualify.CORE + ["--all-features"], {}, 900),
    ("wasm-build", ["cargo", "build", "--offline", "--locked", "--manifest-path", str(qualify.WASM / "Cargo.toml"), "--target", "wasm32-unknown-unknown", "--release"], {}, 900),
    ("wasm-runtime", ["python3", str(qualify.WASM / "run.py")], {}, 300),
    ("fmt", ["cargo", "fmt", "--all", "--", "--check"], {}, 300),
    ("diff-check", ["git", "diff", "--check"], {}, 300),
]
sys.argv = [sys.argv[0]]
qualify.main()
