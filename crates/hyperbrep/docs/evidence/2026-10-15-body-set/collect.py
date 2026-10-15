"""Check result scope and artifact integrity without closing unfinished gates."""
import hashlib, json, re, subprocess
from pathlib import Path
import qualify
ROOT,OUT=qualify.ROOT,qualify.OUT

def read(p): return json.loads(p.read_text())
def digest(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    commands=read(OUT/"commands.json")
    assert len(commands)==12 and all(r["exit_code"]==0 for r in commands)
    source=qualify.hashes()
    assert source==read(OUT/"environment.json")["source_sha256"]
    performance=read(OUT/"performance.json")
    assert performance["source_sha256"]==source
    controls=read(OUT/"controls/results.json")
    assert len(controls)==6 and all(r["exit_code"]==101 and r["restored"] for r in controls)
    for row in controls:
        assert "test result: FAILED" in (OUT/"controls"/(row["label"]+".log")).read_text()
    wasm=read(OUT/"wasm-runtime.log"); assert wasm["groups"]==9 and wasm["imports"]==0
    counts={}
    for row in commands:
        matches=re.findall(r"test result: \w+\. (\d+) passed; (\d+) failed; (\d+) ignored;",(OUT/row["log"]).read_text())
        if matches:
            counts[row["label"]]={name:sum(int(m[i]) for m in matches) for i,name in enumerate(["passed","failed","ignored"])}
    assert counts["debug"]["passed"]==counts["release"]["passed"]==383,counts
    assert counts["minimal"]["passed"]==375,counts
    prior=read(OUT/"initial-qualification/commands.json")
    assert [r["label"] for r in prior if r["exit_code"]]==["fuzz-check"]
    assert (OUT/"self-identity-before.log").read_text().count("FacePartitionUnsupported")==3
    assert "expected `SolidRef" in (OUT/"missing-api.log").read_text()
    ledger=read(ROOT/"crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json")
    assert len(ledger["work_packages"])==28 and all(w["status"] in ["open","in-progress"] for w in ledger["work_packages"])
    previous=read(OUT.parent/"2026-10-15-upstream-integration/integration.json")
    stash=previous["preserved_work"]["stash"]
    # The full stash hash is recorded in both the preserved candidate and Git.
    actual=subprocess.check_output(["git","stash","list","--format=%H"],cwd=ROOT,text=True).splitlines()
    if isinstance(stash,dict):
        assert any(value in actual for value in stash.values() if isinstance(value,str)),stash
    else: assert stash in actual,(stash,actual)
    native={name:"certified completion" for name in ["empty identities and continued cuts","disconnected accumulation, split and reconstruction","overlapping and duplicate selection union/intersection/difference/XOR","subset extraction without resurrected bodies","holes, cavities and symbolic translations","selected algebraic endpoint transfer/replay/split","exact gap under ambient approximate policy","curved-sweep same-selection identities"]}
    summary=dict(scope="Native BodySet API and finite composition increment, not general BREP closure or release admission",baseline_revision="b47ad211f12ab24183485cebe041190658111a5e",commands=commands,counts=counts,count_note="Configuration counts overlap; not a sum of unique tests",workflows=native,expected_typed_failures={"tangent-sphere union after a successful prefix":"unsupported, atomic failure","forged archive endpoint":"invalid input at validation","invalid private selection paired with empty":"invalid reference before identity"},initial_failures_retained=["SolidRef operand compiler mismatch","three curved-sweep self identities returned FacePartitionUnsupported","fuzz Model callers failed to compile after API migration"],controls=len(controls),wasm=wasm,performance=performance["rows"],open_work_package_gates=28,unclaimed=["General analytic/spline closure","Shared multi-root arrangements","Durable Boolean boundary provenance/receipts","Total operation work/memory/cancellation bounds","New sanitizer/fuzz campaign","Formal verification or complete coverage","Installed package, MSRV or all bindings","Full pre-push or whole-stack acceptance","Cold/peak-memory/cross-library performance"],inherited_failures="Two root 16/32-segment strict drill compositions remain as recorded by upstream integration; root path unchanged and not re-run in this increment",preserved_candidate=stash)
    (OUT/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    docs=[ROOT/"crates/hyperbrep/README.md",*[ROOT/"crates/hyperbrep/docs"/name for name in ["DEVELOPMENT_PLAN.md","ARCHITECTURE.md","SUPPORT_MATRIX.md"]],OUT/"README.md",OUT/"admission.md"]
    links=0
    for p in docs:
        for target in re.findall(r"\]\(([^)]+)\)",p.read_text()):
            if "://" in target or target.startswith("#"): continue
            path=target.split("#")[0]
            if path: assert (p.parent/path).resolve().exists(),(p,target)
            links+=1
    files=[p for p in OUT.rglob("*") if p.is_file() and "__pycache__" not in p.parts and p.name not in ["manifest.json","verification.json"]]
    files+=docs+[ROOT/p for p in source]+[ROOT/"docs/properties-status.json",ROOT/"crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json"]
    manifest={str(p.relative_to(ROOT)):dict(bytes=p.stat().st_size,sha256=digest(p)) for p in sorted(set(files))}
    (OUT/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    for p,row in manifest.items(): assert digest(ROOT/p)==row["sha256"]
    verification=dict(artifacts_verified=len(manifest),relative_links_resolved=links,final_commands_passed=len(commands),runtime_controls_detected=len(controls),work_package_gates_still_open=28,scope=summary["scope"])
    (OUT/"verification.json").write_text(json.dumps(verification,indent=2)+"\n")
    print(json.dumps(verification))

if __name__=="__main__": main()
