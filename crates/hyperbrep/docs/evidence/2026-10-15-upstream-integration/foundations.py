"""Run each foundation separately, retaining the earlier setup failures."""
import sys
import qualify

qualify.OUT = qualify.OUT / "tools-ready"
qualify.OUT.mkdir(exist_ok=True)
extra = {
    "PATH": "/tmp/hyperbrep-upstream-tools/usr/bin:" + qualify.ENV["PATH"],
    "GMP_MPFR_SYS_CACHE": "/tmp/hyperbrep-upstream-tools/gmp-cache",
}
# Separate invocations avoid colliding example executable names across crates.
# Every package retains its full all-feature test and doctest selection.
qualify.COMMANDS = [
    (name, qualify.CARGO + ["--release", "-p", name, "--all-features"], extra, 1800)
    for name in ["hyperreal", "hyperlimit", "hypersolve"]
]
sys.argv = [sys.argv[0]]
qualify.main()
