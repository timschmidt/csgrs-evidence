"""Bind the integration evidence without turning known failures into passes."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import qualify

ROOT, OUT = qualify.ROOT, qualify.OUT


def read(path):
    return json.loads(path.read_text())


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    manifests = [
        OUT / "commands.json",
        OUT / "dependencies-ready/commands-root-acceptance-foundations.json",
        OUT / "tools-ready/commands.json",
        OUT / "final-source/commands.json",
        OUT / "final-source-v2/commands.json",
    ]
    runs = []
    for manifest in manifests:
        for row in read(manifest):
            log = manifest.parent / row["log"]
            text = log.read_text()
            counts = re.findall(r"test result: \w+\. (\d+) passed; (\d+) failed; (\d+) ignored;", text)
            runs.append(row | {
                "attempt": str(manifest.parent.relative_to(OUT)),
                "log": str(log.relative_to(OUT)),
                "tests": {
                    name: sum(int(count[index]) for count in counts)
                    for index, name in enumerate(["passed", "failed", "ignored"])
                } if counts else None,
            })
    initial = read(manifests[0])
    assert len(initial) == 15
    assert {r["label"] for r in initial if r["exit_code"]} == {"root-acceptance", "foundations"}
    final = read(manifests[-1])
    assert len(final) == 10 and all(r["exit_code"] == 0 for r in final)
    assert read(OUT / "final-source-v2/environment.json")["source_sha256"] == qualify.hashes()
    previous = read(OUT / "environment.json")["source_sha256"]
    assert {p for p, h in qualify.hashes().items() if previous.get(p) != h} == {"crates/hypersolve/src/residual_replay.rs", "crates/hypersolve/tests/real_representations.rs"}
    repair = read(OUT / "residual-replay-admission.json")
    assert repair["executable_code_before_test_module_unchanged"]
    assert digest(ROOT / repair["source"]) == repair["source_after_sha256"]
    representations = read(OUT / "representation-admission.json")
    assert representations["original_recipes_unchanged"]
    assert digest(ROOT / representations["source"]) == representations["source_after_sha256"]
    root_log = (OUT / "dependencies-ready/root-acceptance.log").read_text()
    failed_tests = set(re.findall(r"^test (\S+) \.\.\. FAILED$", root_log, re.M))
    expected_failures = {
        "strict_drill_16_composes_through_empty_and_complete_subtraction",
        "strict_drill_32_composes_through_empty_and_complete_subtraction",
    }
    assert failed_tests == expected_failures
    assert root_log.count('PredicateUndecided { predicate: "Real sign classification" }') == 2
    for name in ["hyperreal", "hyperlimit"]:
        assert next(r for r in read(manifests[2]) if r["label"] == name)["exit_code"] == 0
    wasm = json.loads((OUT / "final-source-v2/wasm-runtime.log").read_text())
    assert wasm["probe_groups"] == 6 and wasm["imports"] == 0
    status = read(ROOT / "crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json")
    assert len(status["work_packages"]) == 28
    assert all(w["status"] in ["open", "in-progress"] for w in status["work_packages"])
    upstream = "7cf9d82acee6f152047eb37e5ff2e6dcece51a0d"
    for path in ["AGENTS.md", "properties.md", "docs/admission.md"]:
        assert (ROOT / path).read_bytes() == subprocess.check_output(["git", "show", f"{upstream}:{path}"], cwd=ROOT)
    ledger = read(ROOT / "docs/properties-status.json")
    del ledger["current_work"]["hyperbrep"]
    assert ledger == json.loads(subprocess.check_output(["git", "show", f"{upstream}:docs/properties-status.json"], cwd=ROOT))
    assert read(OUT / "preserved-work-verification.json")["files_verified"] == 63
    summary = {
        "scope": "Local source integration with explicit inherited workflow failures; not whole-stack runtime, pre-push or release admission.",
        "upstream": upstream,
        "runs": runs,
        "known_unresolved_workflows": sorted(expected_failures),
        "workflow_outcome": "undecided during empty accumulation; initial drills and independent semantic/topology checks pass",
        "missing_api": "Boolean front doors require SolidRef and cannot consume an empty BodySet result; compile-only reproduction retained.",
        "repaired_test": "Original quotient fixture now requires Exact under both policies; separate terminal fixture retains Unknown/Approximate/Unknown coverage.",
        "representation_corpus": "Both strict sparse APIs must complete with exact solution one for all 22 unchanged positive certificate recipes; the 22x22 ordered-pair matrix is retained.",
        "wasm": wasm,
        "open_work_package_gates": 28,
        "unclaimed": ["Whole-stack runtime admission", "Full pre-push matrix", "MSRV", "All bindings", "Released external package", "New sanitizer/fuzz campaign", "Performance improvement"],
        "evidence_format": "Imported raw whitespace findings retained unchanged; see upstream-raw-whitespace.json.",
        "preserved_candidate": "All 63 saved files remain byte-identical in the recorded Git stash; candidate admission requires fresh qualification on the integrated dependencies.",
        "counts": "Configuration counts overlap; no combined unique-test total is claimed.",
    }
    (OUT / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    docs = [ROOT / "crates/hyperbrep/README.md", *[ROOT / "crates/hyperbrep/docs" / name for name in ["DEVELOPMENT_PLAN.md", "ALGORITHM_RESEARCH.md", "REPOSITORY_AUDIT.md", "SUPPORT_MATRIX.md"]], OUT / "README.md"]
    links = 0
    for path in docs:
        for target in re.findall(r"\]\(([^)]+)\)", path.read_text()):
            if "://" in target or target.startswith("#"):
                continue
            target = target.split("#")[0]
            if target:
                assert (path.parent / target).resolve().exists(), (path, target)
                links += 1
    (OUT / "documentation-check.json").write_text(json.dumps({"relative_links_resolved": links, "work_packages": 28, "all_work_package_gates_open": True, "upstream_normative_documents_unchanged": True, "upstream_property_ledger_preserved": True, "files": {str(p.relative_to(ROOT)): digest(p) for p in docs}}, indent=2) + "\n")
    files = [p for p in OUT.rglob("*") if p.is_file() and "__pycache__" not in p.parts and p.name not in ["manifest.json", "verification.json"]]
    files.extend(docs[:-1])
    files.extend(ROOT / p for p in ["AGENTS.md", "properties.md", "docs/admission.md", "docs/properties-status.json", "crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json", "crates/hypersolve/src/residual_replay.rs", "crates/hypersolve/tests/real_representations.rs", "Cargo.toml", "Cargo.lock"])
    manifest = {str(p.relative_to(ROOT)): {"bytes": p.stat().st_size, "sha256": digest(p)} for p in sorted(set(files))}
    (OUT / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    for path, row in manifest.items():
        assert (ROOT / path).stat().st_size == row["bytes"] and digest(ROOT / path) == row["sha256"]
    (OUT / "verification.json").write_text(json.dumps({"artifacts_verified": len(manifest), "relative_links_resolved": links, "final_commands_passed": len(final), "known_unresolved_workflows": sorted(expected_failures), "all_work_package_gates_open": True}, indent=2) + "\n")
    print(json.dumps({"artifacts": len(manifest), "links": links, "final_checks": len(final), "known_workflow_failures": len(expected_failures)}))


if __name__ == "__main__":
    main()
