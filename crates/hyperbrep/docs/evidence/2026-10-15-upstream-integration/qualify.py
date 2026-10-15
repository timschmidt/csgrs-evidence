"""Requalify the merged source; retain failures and external timeouts explicitly."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent
ENV = os.environ | {
    "PATH": "/home/tim/.cargo/bin:" + os.environ["PATH"],
    "CARGO_HOME": "/tmp/hyperbrep-review-cargo",
    "CARGO_TARGET_DIR": "/tmp/hyperbrep-review-target",
}
CARGO = ["cargo", "test", "--offline", "--locked"]
CORE = ["-p", "hyperbrep", "-p", "hyperbrep-io"]
WASM = Path("/tmp/hyperbrep-upstream-wasm-probe")
FIXTURE = OUT.parent / "2026-10-15-step-advanced/wasm-probe"
COMMANDS = [
    ("brep-debug", CARGO + CORE + ["--all-features"], {}, 900),
    ("brep-release", CARGO + CORE + ["--release", "--all-features"], {}, 900),
    ("brep-minimal", CARGO + CORE + ["--release", "--no-default-features"], {}, 900),
    ("root-acceptance", CARGO + ["-p", "csgrs", "--release", "--no-default-features", "--features", "curve", "--no-fail-fast"]
     + sum((["--test", name] for name in ["empty_composition", "primitive_failures", "transform_failures", "bounds_failures", "curve_constructor_failures", "planar_operation_failures", "sampled_profile_failures", "rounded_rectangle_fidelity", "slice_projection_contract", "strict_drilled_workflows"]), []), {}, 1800),
    ("foundations", CARGO + ["--release", "-p", "hyperreal", "-p", "hyperlimit", "-p", "hypersolve", "--all-features"], {}, 1800),
    ("curve-release", CARGO + ["--release", "-p", "hypercurve"], {}, 3600),
    ("brep-curve-clippy", ["cargo", "clippy", "--offline", "--locked"] + CORE + ["-p", "hypercurve", "--all-targets", "--all-features", "--", "-D", "warnings"], {}, 900),
    ("brep-minimal-clippy", ["cargo", "clippy", "--offline", "--locked"] + CORE + ["--all-targets", "--no-default-features", "--", "-D", "warnings"], {}, 900),
    ("root-curve-clippy", ["cargo", "clippy", "--offline", "--locked", "-p", "csgrs", "--all-targets", "--no-default-features", "--features", "curve", "--", "-D", "warnings"], {}, 900),
    ("rustdoc", ["cargo", "doc", "--offline", "--locked"] + CORE + ["-p", "hypercurve", "--features", "hyperbrep/tessellation", "--no-deps"], {"RUSTDOCFLAGS": "-D warnings"}, 900),
    ("fuzz-check", ["cargo", "check", "--offline", "--locked", "--manifest-path", "crates/hyperbrep/fuzz/Cargo.toml", "--bins"], {}, 900),
    ("wasm-build", ["cargo", "build", "--offline", "--locked", "--manifest-path", str(WASM / "Cargo.toml"), "--target", "wasm32-unknown-unknown", "--release"], {}, 900),
    ("wasm-runtime", ["python3", str(WASM / "run.py")], {}, 300),
    ("fmt", ["cargo", "fmt", "--all", "--", "--check"], {}, 300),
    ("diff-check", ["git", "diff", "--check"], {}, 300),
]


def hashes():
    paths = [ROOT / "Cargo.toml", ROOT / "Cargo.lock"]
    for name in ["hyperbrep", "hyperbrep-io", "hyperreal", "hyperlimit", "hyperlattice", "hypersolve", "hypercurve", "hypertri", "hypermesh", "hypersdf"]:
        crate = ROOT / "crates" / name
        paths.extend([crate / "Cargo.toml", *sorted((crate / "src").rglob("*.rs")), *sorted((crate / "tests").rglob("*.rs"))])
    paths.extend(sorted((ROOT / "src").rglob("*.rs")))
    paths.extend(sorted((ROOT / "tests").rglob("*.rs")))
    return {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths if p.is_file()}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--only", nargs="+", choices=[c[0] for c in COMMANDS])
    args = parser.parse_args()
    (WASM / "src").mkdir(parents=True, exist_ok=True)
    for name in ["Cargo.toml", "Cargo.lock", "run.py"]:
        shutil.copy2(FIXTURE / name, WASM / name)
    shutil.copy2(FIXTURE / "lib.rs", WASM / "src/lib.rs")
    original = hashes()
    metadata = {
        "brep_parent": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "upstream": "7cf9d82acee6f152047eb37e5ff2e6dcece51a0d",
        "rustc": subprocess.check_output(["rustc", "-Vv"], env=ENV, text=True),
        "cargo": subprocess.check_output(["cargo", "-V"], env=ENV, text=True).strip(),
        "platform": platform.platform(),
        "cpu_affinity": sorted(os.sched_getaffinity(0)),
        "source_sha256": original,
        "scope": "Merged source before restoring unfinished closed-edge work. External timeouts are containment, not kernel resource contracts. No performance or released-package claim.",
    }
    (OUT / "environment.json").write_text(json.dumps(metadata, indent=2) + "\n")
    rows = []
    selected = [c for c in COMMANDS if not args.only or c[0] in args.only]
    label = "commands" if not args.only else "commands-" + "-".join(args.only)
    for name, command, extra, limit in selected:
        print("running", name, flush=True)
        started = time.monotonic()
        invocation = ["timeout", "--signal=TERM", "--kill-after=30s", f"{limit}s", *command]
        with (OUT / f"{name}.log").open("w") as log:
            result = subprocess.run(invocation, cwd=ROOT, env=ENV | extra, stdout=log, stderr=subprocess.STDOUT)
        row = dict(label=name, command=command, environment=extra, timeout_seconds=limit, exit_code=result.returncode, elapsed_seconds=time.monotonic()-started, log=f"{name}.log")
        rows.append(row)
        (OUT / f"{label}.json").write_text(json.dumps(rows, indent=2) + "\n")
        assert hashes() == original, "Tested source changed during qualification"
        print(name, "exit", result.returncode, flush=True)
    print(json.dumps({"commands": len(rows), "nonzero": [r["label"] for r in rows if r["exit_code"]]}), flush=True)


if __name__ == "__main__":
    main()
