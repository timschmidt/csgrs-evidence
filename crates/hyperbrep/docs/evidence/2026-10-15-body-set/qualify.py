"""Scoped post-edit qualification; source-bound logs, not whole-stack admission."""
import hashlib, json, os, platform, shutil, subprocess, time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[5]
OUT=Path(__file__).resolve().parent
ENV=os.environ | {"PATH":"/home/tim/.cargo/bin:"+os.environ["PATH"],"CARGO_HOME":"/tmp/hyperbrep-review-cargo","CARGO_TARGET_DIR":"/tmp/hyperbrep-review-target"}
WASM=Path("/tmp/hyperbrep-body-set-wasm-probe")

def hashes():
    paths=[ROOT/"Cargo.lock",ROOT/"Cargo.toml",ROOT/"properties.md",ROOT/"docs/admission.md",ROOT/"AGENTS.md"]
    for name in ["hyperbrep","hyperbrep-io"]:
        base=ROOT/"crates"/name
        paths.extend([base/"Cargo.toml",*base.glob("src/**/*.rs"),*base.glob("tests/**/*.rs"),*base.glob("benches/*.rs"),*base.glob("examples/*.rs")])
    paths.extend((ROOT/"crates/hyperbrep/fuzz").glob("fuzz_targets/*.rs"))
    return {str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(paths)}

def main():
    (WASM/"src").mkdir(parents=True,exist_ok=True)
    for source,destination in [("Cargo.toml","Cargo.toml"),("lib.rs","src/lib.rs"),("run.py","run.py")]:
        shutil.copyfile(OUT/"wasm-probe"/source,WASM/destination)
    original=hashes()
    (OUT/"environment.json").write_text(json.dumps(dict(revision=subprocess.check_output(["git","rev-parse","HEAD"],cwd=ROOT,text=True).strip(),platform=platform.platform(),affinity=sorted(os.sched_getaffinity(0)),rustc=subprocess.check_output(["rustc","-Vv"],env=ENV,text=True),source_sha256=original,limits="External timeouts; no internal whole-operation work or heap-byte bound claimed"),indent=2)+"\n")
    core=["-p","hyperbrep","-p","hyperbrep-io"]
    common=["--offline","--locked"]
    commands=[
        ("debug",["cargo","test",*common,*core,"--all-features"],{},900),
        ("release",["cargo","test",*common,*core,"--release","--all-features"],{},900),
        ("minimal",["cargo","test",*common,*core,"--release","--no-default-features"],{},900),
        ("clippy",["cargo","clippy",*common,*core,"--all-targets","--all-features","--","-D","warnings"],{},900),
        ("clippy-minimal",["cargo","clippy",*common,*core,"--all-targets","--no-default-features","--","-D","warnings"],{},900),
        ("rustdoc",["cargo","doc",*common,*core,"--all-features","--no-deps"],{"RUSTDOCFLAGS":"-D warnings"},900),
        ("fuzz-check",["cargo","check",*common,"--manifest-path","crates/hyperbrep/fuzz/Cargo.toml","--bins"],{},900),
        ("wasm-lock",["cargo","generate-lockfile","--offline","--manifest-path",str(WASM/"Cargo.toml")],{},300),
        ("wasm-build",["cargo","build",*common,"--manifest-path",str(WASM/"Cargo.toml"),"--target","wasm32-unknown-unknown","--release"],{},900),
        ("wasm-runtime",["python3",str(WASM/"run.py")],{},300),
        ("fmt",["cargo","fmt","--all","--","--check"],{},300),
        ("diff-check",["git","diff","--check"],{},300),
    ]
    rows=[]
    for label,command,extra,seconds in commands:
        start=time.monotonic(); print("running",label,flush=True)
        with (OUT/(label+".log")).open("w") as log:
            result=subprocess.run(["timeout","--signal=TERM","--kill-after=30s",str(seconds)+"s",*command],cwd=ROOT,env=ENV|extra,stdout=log,stderr=subprocess.STDOUT)
        rows.append(dict(label=label,command=command,environment=extra,timeout_seconds=seconds,seconds=time.monotonic()-start,exit_code=result.returncode,log=label+".log"))
        (OUT/"commands.json").write_text(json.dumps(rows,indent=2)+"\n")
        assert hashes()==original,"source changed during qualification"
        print(label,"exit",result.returncode,flush=True)
    if (WASM/"Cargo.lock").exists(): shutil.copyfile(WASM/"Cargo.lock",OUT/"wasm-probe/Cargo.lock")
    print(json.dumps(dict(passed=sum(row["exit_code"]==0 for row in rows),failed=[row["label"] for row in rows if row["exit_code"]])),flush=True)

if __name__=="__main__": main()
