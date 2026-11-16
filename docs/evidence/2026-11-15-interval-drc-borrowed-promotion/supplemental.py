from pathlib import Path
import subprocess,json,os,time,hashlib,shutil
s=Path(__file__).parent;r=Path("/mnt/development/interval-profile-static/csgrs")
env=os.environ|{"CARGO_TARGET_DIR":"/mnt/development/.interval-refactor-build/drc-borrowed-supplemental","CARGO_BUILD_JOBS":"16","CARGO_NET_OFFLINE":"true"}
patch=(s/"candidate-tracked.patch").read_bytes();assert subprocess.check_output(["git","diff","--binary"],cwd=r)==patch
checks=[("msrv-default-promotion",["cargo","+1.95.0","test","--locked","-p","hypercurve","--release","--no-default-features","--lib","borrowed_quadratic_promotion_preserves_values_provenance_and_dispatch","--","--nocapture"]),("msrv-default-arcs",["cargo","+1.95.0","test","--locked","-p","hypercurve","--release","--no-default-features","--lib","arc_bezier::tests::","--","--test-threads=2"]),("candidate-wasm-ui",["cargo","+stable","build","--locked","--release","--manifest-path","crates/hypercurve/examples/hypercurve_ui/Cargo.toml","--target","wasm32-unknown-unknown","--message-format=json"])]
rows=[]
for name,command in checks:
 row={"name":name,"command":command,"cwd":str(r),"env_overrides":{k:env[k] for k in ["CARGO_TARGET_DIR","CARGO_BUILD_JOBS","CARGO_NET_OFFLINE"]},"source_patch_sha256":hashlib.sha256(patch).hexdigest(),"external_timeout_seconds":7200}
 (s/"supplemental-phase.json").write_text(json.dumps(row,indent=2)+"\n");start=time.monotonic()
 with (s/(name+".log")).open("w") as err,(s/(name+".jsonl")).open("w") as out:
  try:result=subprocess.run(command,cwd=r,env=env,stdout=out,stderr=err,timeout=7200);row["exit_code"]=result.returncode
  except subprocess.TimeoutExpired:row["exit_code"]=124;row["external_timeout"]=True
 row["seconds"]=time.monotonic()-start;rows.append(row);(s/(name+".json")).write_text(json.dumps(row,indent=2)+"\n");print(json.dumps(row),flush=True)
 assert subprocess.check_output(["git","diff","--binary"],cwd=r)==patch
 if name=="candidate-wasm-ui" and row["exit_code"]==0:
  wasm=Path(env["CARGO_TARGET_DIR"])/"wasm32-unknown-unknown/release/hypercurve_ui.wasm";assert wasm.is_file()
  output=Path("/mnt/development/.interval-refactor-build/drc-borrowed-promotion/candidate/hypercurve_ui.wasm");assert not output.exists();shutil.copy2(wasm,output)
  (s/"candidate-wasm-binary.json").write_text(json.dumps({"path":str(output),"bytes":output.stat().st_size,"sha256":hashlib.sha256(output.read_bytes()).hexdigest()},indent=2)+"\n")
(s/"supplemental-builds.json").write_text(json.dumps(rows,indent=2)+"\n")
raise SystemExit(int(any(x["exit_code"]!=0 for x in rows)))
