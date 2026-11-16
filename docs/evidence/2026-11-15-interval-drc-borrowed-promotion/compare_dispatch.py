from pathlib import Path
import subprocess,json,hashlib,time
s=Path(__file__).parent;r=Path("/mnt/development/interval-profile-static/csgrs/crates/hypercurve")
rows=[]
for label in ["baseline","candidate"]:
 info=json.loads((s/f"{label}-benches-binaries.json").read_text())["dispatch_trace"]
 binary=Path(info["path"]);assert hashlib.sha256(binary.read_bytes()).hexdigest()==info["sha256"]
 command=[str(binary)];start=time.monotonic()
 with (s/f"{label}-dispatch.log").open("w") as out:
  p=subprocess.run(command,cwd=r,stdout=out,stderr=subprocess.STDOUT,timeout=600)
 row={"label":label,"command":command,"cwd":str(r),"binary_sha256":info["sha256"],"exit_code":p.returncode,"seconds":time.monotonic()-start,"policy":"STRICT (unchanged benchmark)","claim":"dispatch comparison; elapsed time is not benchmark evidence"}
 rows.append(row);(s/f"{label}-dispatch.json").write_text(json.dumps(row,indent=2)+"\n");print(json.dumps(row),flush=True)
 assert p.returncode==0
same=(s/"baseline-dispatch.log").read_bytes()==(s/"candidate-dispatch.log").read_bytes()
(s/"dispatch-comparison.json").write_text(json.dumps({"rows":rows,"stdout_and_stderr_identical":same,"normalization":"none"},indent=2)+"\n")
assert same
