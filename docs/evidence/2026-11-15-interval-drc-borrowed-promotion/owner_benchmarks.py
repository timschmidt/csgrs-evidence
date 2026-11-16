from pathlib import Path
import subprocess,json,os,time,hashlib,platform,resource
s=Path(__file__).parent;r=Path("/mnt/development/interval-profile-static/csgrs/crates/hypercurve")
while not (s/"qualification.json").exists() or not (s/"supplemental-builds.json").exists() or not (s/"boundary-controls-complete.json").exists() or not (s/"downstream-tests.json").exists():time.sleep(2)
qualification=json.loads((s/"qualification.json").read_text());assert all(x["exit_code"]==0 for x in qualification),qualification
assert all(x["exit_code"]==0 for x in json.loads((s/"supplemental-builds.json").read_text()))
boundary=json.loads((s/"boundary-controls-complete.json").read_text());assert boundary["success"],boundary
assert boundary["wasm_delta_bytes"]<=0,boundary
assert json.loads((s/"downstream-tests.json").read_text())["exit_code"]==0


assert json.loads((s/"fixed-report-equality.json").read_text())["all_report_bytes_identical"]
infos={label:json.loads((s/f"{label}-benches-binaries.json").read_text()) for label in ["baseline","candidate"]}
assert sorted(infos["baseline"])==sorted(infos["candidate"])
env={k:v for k,v in os.environ.items() if not k.startswith("HYPERCURVE_")}
host={"platform":platform.platform(),"affinity":sorted(os.sched_getaffinity(0)),"lscpu":subprocess.check_output(["lscpu"],text=True),"environment_overrides":"all HYPERCURVE_* variables removed to run declared defaults","external_timeout_seconds_per_executable":900,"round":0,"order":"alternate baseline/candidate order by sorted benchmark index","scope":"full declared benchmark executables at default inputs; first paired pass, not by itself a statistical nonregression claim"}
(s/"owner-benchmark-host.json").write_text(json.dumps(host,indent=2)+"\n")
rows=[]
for index,name in enumerate(sorted(infos["baseline"])):
 for label in (["baseline","candidate"] if index%2==0 else ["candidate","baseline"]):
  info=infos[label][name];binary=Path(info["path"]);assert hashlib.sha256(binary.read_bytes()).hexdigest()==info["sha256"]
  tag=f"owner-benchmark-0-{name}-{label}";command=[str(binary)]
  row={"target":name,"label":label,"round":0,"command":command,"cwd":str(r),"binary_sha256":info["sha256"],"external_timeout_seconds":900}
  (s/"owner-benchmark-phase.json").write_text(json.dumps(row,indent=2)+"\n");start=time.monotonic();before=resource.getrusage(resource.RUSAGE_CHILDREN)
  with (s/(tag+".log")).open("w") as out:
   try:result=subprocess.run(command,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=900);row["exit_code"]=result.returncode
   except subprocess.TimeoutExpired:row["exit_code"]=124;row["external_timeout"]=True
  after=resource.getrusage(resource.RUSAGE_CHILDREN);row["wall_seconds"]=time.monotonic()-start;row["children_cpu_seconds"]=after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime
  row["log_sha256"]=hashlib.sha256((s/(tag+".log")).read_bytes()).hexdigest();rows.append(row)
  (s/(tag+".json")).write_text(json.dumps(row,indent=2)+"\n");(s/"owner-benchmarks-round0-progress.json").write_text(json.dumps(rows,indent=2)+"\n");print(json.dumps(row),flush=True)
(s/"owner-benchmarks-round0.json").write_text(json.dumps(rows,indent=2)+"\n")
raise SystemExit(int(any(x["exit_code"]!=0 for x in rows)))
