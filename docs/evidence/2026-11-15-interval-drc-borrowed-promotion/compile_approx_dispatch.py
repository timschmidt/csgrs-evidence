from pathlib import Path
import subprocess,json,sys,hashlib,time
s=Path(__file__).parent;r=Path("/mnt/development/interval-profile-static/csgrs");label=sys.argv[1];artifacts=Path(sys.argv[2]);assert label in ["baseline","candidate"]
source=r/"crates/hypercurve/benches/dispatch_trace.rs";original=source.read_text();assert original.count("let policy = PredicatePolicy::STRICT;")==1
adapted=original.replace('#[path = "../tests/support/mod.rs"]',f'#[path = "{r}/crates/hypercurve/tests/support/mod.rs"]').replace("let policy = PredicatePolicy::STRICT;","let policy = PredicatePolicy::APPROXIMATE_512;")
harness=s/"approx_dispatch.rs"
if harness.exists():assert harness.read_text()==adapted
else:harness.write_text(adapted)
libraries={}
for line in artifacts.read_text().splitlines():
 try:row=json.loads(line)
 except ValueError:continue
 if row.get("reason")!="compiler-artifact" or row["target"]["kind"]!=["lib"] or row["target"]["name"] not in ["hypercurve","hyperreal"]:continue
 for file in row["filenames"]:
  if file.endswith(".rlib"):libraries[row["target"]["name"]]=Path(file)
assert sorted(libraries)==["hypercurve","hyperreal"]
output=Path("/mnt/development/.interval-refactor-build/drc-borrowed-promotion")/label/"approx-dispatch";assert not output.exists()
command=["rustc","+stable","--edition=2024","-C","opt-level=3","--cfg",'feature="triangulation"',"-L",f"dependency={libraries['hypercurve'].parent}"]
for name,path in sorted(libraries.items()):command.extend(["--extern",f"{name}={path}"])
command.extend([str(harness),"-o",str(output)])
row={"label":label,"command":command,"cwd":str(r),"artifacts":str(artifacts),"libraries":{n:{"path":str(p),"sha256":hashlib.sha256(p.read_bytes()).hexdigest()} for n,p in libraries.items()},"source_sha256":hashlib.sha256(source.read_bytes()).hexdigest(),"harness_sha256":hashlib.sha256(harness.read_bytes()).hexdigest(),"changes":"same complete dispatch corpus, policy changed to APPROXIMATE_512 and support path made absolute","source_status":subprocess.check_output(["git","status","--porcelain"],cwd=r,text=True)}
start=time.monotonic()
with (s/f"{label}-approx-dispatch-build.log").open("w") as log:result=subprocess.run(command,cwd=r,stdout=log,stderr=subprocess.STDOUT)
row["exit_code"]=result.returncode;row["seconds"]=time.monotonic()-start
(s/f"{label}-approx-dispatch-build.json").write_text(json.dumps(row,indent=2)+"\n");assert result.returncode==0
with (s/f"{label}-approx-dispatch.log").open("w") as log:result=subprocess.run([str(output)],cwd=r/"crates/hypercurve",stdout=log,stderr=subprocess.STDOUT,timeout=600)
row={"label":label,"command":[str(output)],"binary_sha256":hashlib.sha256(output.read_bytes()).hexdigest(),"exit_code":result.returncode,"log_sha256":hashlib.sha256((s/f"{label}-approx-dispatch.log").read_bytes()).hexdigest(),"policy":"APPROXIMATE_512","claim":"dispatch comparison only, no timing claim"}
(s/f"{label}-approx-dispatch.json").write_text(json.dumps(row,indent=2)+"\n");print(json.dumps(row));assert result.returncode==0
