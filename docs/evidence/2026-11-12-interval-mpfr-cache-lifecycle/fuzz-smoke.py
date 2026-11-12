import hashlib,json,os,random,struct,subprocess,time
from pathlib import Path
root=Path(__file__).parent
bins=Path("/tmp/interval-refactor/fuzz-target/x86_64-unknown-linux-gnu/release")
shapes={"arctangent":("h",4),"exponential":("h",4),"fractional_power":("h",6),"logarithm":("h",4),"primitive_roots":("Q",2),"square_roots":("h",5),"strict_float":("Q",3),"tangent":("h",4),"trigonometry":("h",4)}
rng=random.Random(20261112);results=[]
for name,(fmt,count) in shapes.items():
 corpus=root/"fuzz-corpus"/name;corpus.mkdir(parents=True,exist_ok=False)
 artifacts=root/"fuzz-artifacts"/name;artifacts.mkdir(parents=True,exist_ok=False)
 if fmt=="h":
  seeds=[[v]*count for v in [-32768,-16,-1,0,1,16,32767]]
  seeds += [[rng.randrange(-32768,32768) for _ in range(count)] for _ in range(25)]
 else:
  seeds=[[v]*count for v in [0,1,0x3ff0000000000000,0x4000000000000000,0x7fefffffffffffff,0x8000000000000000,0xffffffffffffffff]]
  seeds += [[rng.getrandbits(64) for _ in range(count)] for _ in range(25)]
 for index,seed in enumerate(seeds): (corpus/f"seed-{index:02d}").write_bytes(struct.pack("<"+fmt*count,*seed))
 binary=bins/name;data=binary.read_bytes()
 args=[str(binary),str(corpus),"-runs=128","-seed=20261112","-timeout=10","-rss_limit_mb=2048","-detect_leaks=1",f"-max_len={struct.calcsize('<'+fmt*count)}",f"-artifact_prefix={artifacts}/"]
 start=time.monotonic()
 with (root/f"fuzz-{name}.log").open("w") as out:
  try:r=subprocess.run(args,env=os.environ|{"ASAN_OPTIONS":"detect_leaks=1"},stdout=out,stderr=subprocess.STDOUT,timeout=180);code=r.returncode
  except subprocess.TimeoutExpired:code="outer_timeout_180_seconds"
 results.append({"target":name,"command":args,"exit_code":code,"elapsed_seconds":time.monotonic()-start,"initial_seeds":32,"binary_bytes":len(data),"binary_sha256":hashlib.sha256(data).hexdigest()})
 (root/"fuzz-smoke.json").write_text(json.dumps(results,indent=2)+"\n")
 print(name,code,flush=True)
 if code:raise SystemExit(1)
