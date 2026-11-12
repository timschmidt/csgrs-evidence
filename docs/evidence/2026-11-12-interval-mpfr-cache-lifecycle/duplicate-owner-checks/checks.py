import json,os,subprocess,time
from pathlib import Path
root=Path(__file__).parent
core="integer,fixed,dyadic,float-proposal,float-enclosure,serde"
checks=[]
def add(args,env=None): checks.append((args,env or {}))
for toolchain in ["1.88.0","1.95.0","stable"]:
 for features in ["","fixed","dyadic","float-enclosure"]:
  add(["cargo","+"+toolchain,"test","--locked","-p","hyperinterval","--no-default-features","--features",features])
 flags=["--features",core] if toolchain=="1.88.0" else ["--all-features"]
 add(["cargo","+"+toolchain,"test","--locked","-p","hyperinterval","--all-targets",*flags])
 add(["cargo","+"+toolchain,"test","--locked","-p","hyperinterval","--doc",*flags])
 add(["cargo","+"+toolchain,"clippy","--locked","-p","hyperinterval","--all-targets","--no-default-features","--","-D","warnings"])
 add(["cargo","+"+toolchain,"clippy","--locked","-p","hyperinterval","--all-targets",*flags,"--","-D","warnings"])
 add(["cargo","+"+toolchain,"doc","--locked","-p","hyperinterval","--no-deps",*flags],{"RUSTDOCFLAGS":"-D warnings"})
add(["cargo","+1.95.0","test","--locked","-p","hyperlattice-interval","--all-features"])
add(["cargo","+1.95.0","test","--locked","-p","hyperlattice","--features","interval-fixed,interval-dyadic,interval-rational,interval-float-enclosure","--test","interval_surface"])
add(["cargo","+1.95.0","test","--locked","-p","hypersolve","--features","dispatch-trace","interval_migration"])
add(["cargo","+1.95.0","test","--locked","-p","hyperinterval","--all-features","--release","--tests"])
add(["cargo","+1.95.0","check","--locked","--manifest-path","crates/hyperinterval/fuzz/Cargo.toml","--bins"])
add(["cargo","+1.95.0","check","--locked","--manifest-path","crates/hyperinterval/fuzz/Cargo.toml","--bins","--features","rational"])
add(["cargo","fmt","--all","--","--check"])
results=[]
for index,(args,extra) in enumerate(checks):
 start=time.monotonic()
 with (root/f"check-{index}.log").open("w") as out:
  r=subprocess.run(args,cwd="/mnt/development/csgrs",env=os.environ|extra,stdout=out,stderr=subprocess.STDOUT)
 row={"command":args,"env":extra,"exit_code":r.returncode,"elapsed_seconds":time.monotonic()-start,"log":f"check-{index}.log"};results.append(row)
 (root/"checks.json").write_text(json.dumps(results,indent=2)+"\n")
 print(index,r.returncode," ".join(args),flush=True)
 if r.returncode: raise SystemExit(r.returncode)
