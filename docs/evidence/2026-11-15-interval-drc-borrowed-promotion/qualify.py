from pathlib import Path
import subprocess,json,os,time,hashlib
s=Path(__file__).parent;r=Path("/mnt/development/interval-profile-static/csgrs")
env=os.environ|{"CARGO_TARGET_DIR":"/mnt/development/.interval-refactor-build/drc-current-admission","CARGO_BUILD_JOBS":"16","CARGO_NET_OFFLINE":"true"}
expected=(s/"candidate-tracked.patch").read_bytes()
assert subprocess.check_output(["git","diff","--binary"],cwd=r)==expected
checks=[("format",["cargo","+stable","fmt","--all","--","--check"]),("owner-clippy",["cargo","+stable","clippy","--locked","-p","hypercurve","--all-targets","--all-features","--","-D","warnings"]),("owner-tests",["cargo","+stable","test","--release","--locked","-p","hypercurve","--all-features","--no-fail-fast","--","--test-threads=2"])]
rows=[]
for name,command in checks:
 row={"name":name,"command":command,"cwd":str(r),"env_overrides":{k:env[k] for k in ["CARGO_TARGET_DIR","CARGO_BUILD_JOBS","CARGO_NET_OFFLINE"]},"source_patch_sha256":hashlib.sha256(expected).hexdigest(),"external_timeout_seconds":7200}
 (s/"qualification-phase.json").write_text(json.dumps(row,indent=2)+"\n");start=time.monotonic()
 with (s/(name+".log")).open("w") as out:
  try:p=subprocess.run(command,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=7200);row["exit_code"]=p.returncode
  except subprocess.TimeoutExpired:row["exit_code"]=124;row["external_timeout"]=True
 row["seconds"]=time.monotonic()-start;rows.append(row)
 (s/(name+".json")).write_text(json.dumps(row,indent=2)+"\n");print(json.dumps(row),flush=True)
 assert subprocess.check_output(["git","diff","--binary"],cwd=r)==expected
(s/"qualification.json").write_text(json.dumps(rows,indent=2)+"\n")
raise SystemExit(int(any(x["exit_code"]!=0 for x in rows)))
