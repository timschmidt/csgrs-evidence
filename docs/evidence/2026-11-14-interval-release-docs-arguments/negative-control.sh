set -euo pipefail
cargo_command=(cargo +1.95.0)
target=/mnt/development/.interval-refactor-build/release-docs-arguments/negative
overlay=()
crates=(docs-args-negative-fixture)
echo "== documenting each crate with its docs.rs configuration"
"${cargo_command[@]}" metadata --locked --no-deps --format-version 1 | python3 -c '
import json, sys
crates = set(sys.argv[1:])
for package in json.load(sys.stdin)["packages"]:
    if package["name"] not in crates:
        continue
    docs = ((package.get("metadata") or {}).get("docs") or {}).get("rs") or {}
    args = ["-p", package["name"]]
    if docs.get("all-features"):
        args.append("--all-features")
    if docs.get("no-default-features"):
        args.append("--no-default-features")
    if docs.get("features"):
        args += ["--features", ",".join(docs["features"])]
    print(" ".join(args))
' "${crates[@]}" | while read -r -a doc_args; do
  RUSTDOCFLAGS="-D warnings" CARGO_TARGET_DIR="${target}" "${cargo_command[@]}" doc --locked \
    --no-deps "${overlay[@]}" "${doc_args[@]}"
done

