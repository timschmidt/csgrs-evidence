from pathlib import Path
import subprocess,os,json,time,hashlib
s=Path(__file__).parent;r=Path("/mnt/development/interval-profile-static/csgrs");dest=Path("/mnt/development/.interval-refactor-build/drc-borrowed-promotion/successive")
env=os.environ|{"CARGO_TARGET_DIR":"/mnt/development/.interval-refactor-build/drc-current-admission","CARGO_BUILD_JOBS":"16","CARGO_NET_OFFLINE":"true","RUSTUP_TOOLCHAIN":"stable"}
def git(*args,input=None):return subprocess.check_output(["git","-C",str(r),*args],input=input)
assert all(x["exit_code"]==0 for x in json.loads((s/"qualification.json").read_text()))
assert (s/"owner-benchmarks-round0.json").exists(),"Do not compile during owner benchmark timings"
patch=(s/"candidate-tracked.patch").read_bytes();assert git("diff","--binary")==patch
paths=["crates/hypercurve/src/arc_bezier.rs","crates/hypercurve/src/rational_bezier_general.rs"]
testpath=r/"crates/hypercurve/src/rational_bezier_general/borrowed_promotion_tests.rs";testbytes=testpath.read_bytes()
assert git("ls-files","--others","--exclude-standard").decode().splitlines()==[str(testpath.relative_to(r))]
rows=[]
def build(label):
 output=dest/label;assert not output.exists()
 command=["python3","scripts/successive-operations.py","build","--output",str(output),"--features","curve,stl-io,obj-io"]
 row={"label":label,"command":command,"cwd":str(r),"env_overrides":{k:env[k] for k in ["CARGO_TARGET_DIR","CARGO_BUILD_JOBS","CARGO_NET_OFFLINE","RUSTUP_TOOLCHAIN"]},"tracked_patch_sha256":hashlib.sha256(git("diff","--binary")).hexdigest(),"untracked":git("ls-files","--others","--exclude-standard").decode().splitlines()}
 (s/"successive-build-phase.json").write_text(json.dumps(row,indent=2)+"\n");start=time.monotonic()
 with (s/f"{label}-successive-build.log").open("w") as out:result=subprocess.run(command,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 row["exit_code"]=result.returncode;row["seconds"]=time.monotonic()-start
 (s/f"{label}-successive-build.json").write_text(json.dumps(row,indent=2)+"\n");rows.append(row);print(json.dumps(row),flush=True);assert result.returncode==0
try:
 build("candidate")
 git("restore","--source=HEAD","--worktree","--",*paths);testpath.unlink();assert not git("status","--porcelain")
 command=["cargo","+stable","bench","--locked","-p","hypercurve","--all-features","--bench","dispatch_trace","--no-run","--message-format=json"]
 start=time.monotonic()
 with (s/"baseline-approx-owner-build.jsonl").open("w") as out,(s/"baseline-approx-owner-build.log").open("w") as err:result=subprocess.run(command,cwd=r,env=env,stdout=out,stderr=err)
 (s/"baseline-approx-owner-build.json").write_text(json.dumps({"command":command,"cwd":str(r),"env_overrides":{k:env[k] for k in ["CARGO_TARGET_DIR","CARGO_BUILD_JOBS","CARGO_NET_OFFLINE","RUSTUP_TOOLCHAIN"]},"exit_code":result.returncode,"seconds":time.monotonic()-start,"source_clean":not bool(git("status","--porcelain"))},indent=2)+"\n");assert result.returncode==0
 subprocess.run(["python3",str(s/"compile_approx_dispatch.py"),"baseline",str(s/"baseline-approx-owner-build.jsonl")],cwd=r,env=env,check=True)
 same=(s/"baseline-approx-dispatch.log").read_bytes()==(s/"candidate-approx-dispatch.log").read_bytes()
 (s/"approx-dispatch-comparison.json").write_text(json.dumps({"full_transcript_identical":same,"normalization":"none","policy":"APPROXIMATE_512"},indent=2)+"\n");assert same
 wasm_env=env|{"CARGO_TARGET_DIR":"/mnt/development/.interval-refactor-build/drc-borrowed-supplemental"}
 command=["cargo","+stable","build","--locked","--release","--manifest-path","crates/hypercurve/examples/hypercurve_ui/Cargo.toml","--target","wasm32-unknown-unknown","--message-format=json"]
 start=time.monotonic()
 with (s/"baseline-wasm-ui.jsonl").open("w") as out,(s/"baseline-wasm-ui.log").open("w") as err:result=subprocess.run(command,cwd=r,env=wasm_env,stdout=out,stderr=err)
 (s/"baseline-wasm-ui.json").write_text(json.dumps({"command":command,"cwd":str(r),"env_overrides":{k:wasm_env[k] for k in ["CARGO_TARGET_DIR","CARGO_BUILD_JOBS","CARGO_NET_OFFLINE","RUSTUP_TOOLCHAIN"]},"exit_code":result.returncode,"seconds":time.monotonic()-start,"source_clean":not bool(git("status","--porcelain"))},indent=2)+"\n");assert result.returncode==0
 wasm=Path(wasm_env["CARGO_TARGET_DIR"])/"wasm32-unknown-unknown/release/hypercurve_ui.wasm";assert wasm.is_file()
 output=Path("/mnt/development/.interval-refactor-build/drc-borrowed-promotion/baseline/hypercurve_ui.wasm");assert not output.exists();output.write_bytes(wasm.read_bytes())
 wasm_info={"path":str(output),"bytes":output.stat().st_size,"sha256":hashlib.sha256(output.read_bytes()).hexdigest()}
 (s/"baseline-wasm-binary.json").write_text(json.dumps(wasm_info,indent=2)+"\n")
 candidate=json.loads((s/"candidate-wasm-binary.json").read_text())
 (s/"wasm-size-comparison.json").write_text(json.dumps({"baseline":wasm_info,"candidate":candidate,"delta_bytes":candidate["bytes"]-wasm_info["bytes"]},indent=2)+"\n")
 build("baseline")
finally:
 if not git("diff","--binary"):git("apply","-",input=patch)
 if not testpath.exists():testpath.write_bytes(testbytes)
 assert git("diff","--binary")==patch and testpath.read_bytes()==testbytes
 (s/"successive-build-restoration.json").write_text(json.dumps({"candidate_restored":True,"tracked_patch_sha256":hashlib.sha256(patch).hexdigest(),"test_sha256":hashlib.sha256(testbytes).hexdigest()},indent=2)+"\n")
(s/"successive-builds.json").write_text(json.dumps(rows,indent=2)+"\n")
