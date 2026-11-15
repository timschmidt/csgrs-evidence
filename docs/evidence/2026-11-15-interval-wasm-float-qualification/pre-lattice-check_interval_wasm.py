#!/usr/bin/env python3
"""Execute exact IEEE interval oracles in a real WebAssembly runtime.

Requires Python, Node with WebAssembly BigInt support, the selected Rust WASM
target, and Binaryen's wasm-dis. All generated artifacts stay in --output.
"""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--toolchain", default="stable")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    client = root / "crates/hyperinterval/conformance/wasm-float"
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    env = os.environ | {"CARGO_TARGET_DIR": str(output / "target"), "CARGO_TERM_COLOR": "never"}
    commands = []

    def run(name, command):
        start = time.monotonic()
        with (output / f"{name}.log").open("w") as log:
            result = subprocess.run(command, cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT, timeout=900)
        commands.append({"name": name, "command": command, "exit_code": result.returncode, "seconds": time.monotonic() - start})
        (output / "commands.json").write_text(json.dumps(commands, indent=2) + "\n")
        if result.returncode:
            raise SystemExit(f"{name} failed; see {output / (name + '.log')}")

    run("compiler", ["rustc", f"+{args.toolchain}", "-vV"])
    run("oracle", ["python3", str(client / "oracle.py"), str(output / "corpus.json")])
    run("build", ["cargo", f"+{args.toolchain}", "build", "--locked", "--release", "--manifest-path", str(client / "Cargo.toml"), "--target", "wasm32-unknown-unknown"])
    binary = output / "interval_float.wasm"
    shutil.copyfile(output / "target/wasm32-unknown-unknown/release/interval_float_wasm_conformance.wasm", binary)
    run("execute", ["node", str(client / "check.mjs"), str(binary), str(output / "corpus.json")])
    run("disassemble", ["wasm-dis", str(binary), "-o", str(output / "module.wat")])
    assembly = (output / "module.wat").read_text()
    floating = sorted(set(re.findall(r"\b(?:f32|f64|i32|i64)\.[a-z][a-z0-9_]*", assembly)))
    forbidden = [op for op in floating if (
        op.startswith(("f32.", "f64.")) and op not in {"f32.reinterpret_i32", "f64.reinterpret_i64"}
    ) or "_f32" in op and op != "i32.reinterpret_f32" or "_f64" in op and op != "i64.reinterpret_f64"]
    if forbidden or "memory.grow" in assembly or "(import " in assembly:
        raise SystemExit(f"Unexpected arithmetic, allocation/import path: {forbidden}")
    run("dependencies", ["cargo", f"+{args.toolchain}", "tree", "--locked", "--manifest-path", str(client / "Cargo.toml"), "--edges", "normal", "--prefix", "none"])
    dependencies = (output / "dependencies.log").read_text().splitlines()
    if len(dependencies) != 2 or not any(line.startswith("hyperinterval ") for line in dependencies):
        raise SystemExit(f"Unexpected dependency closure: {dependencies}")
    report = json.loads((output / "execute.log").read_text())
    report.update({"toolchain": args.toolchain, "binary_bytes": binary.stat().st_size,
                   "binary_sha256": hashlib.sha256(binary.read_bytes()).hexdigest(),
                   "corpus_sha256": hashlib.sha256((output / "corpus.json").read_bytes()).hexdigest(),
                   "floating_arithmetic": forbidden, "memory_grow": False,
                   "no_allocator_consumer": True, "dependencies": dependencies})
    (output / "report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"WASM {args.toolchain}: {report['cases']} exact cases passed; {report['binary_bytes']} bytes; no floating arithmetic or allocator")


if __name__ == "__main__":
    main()
