from pathlib import Path
import hashlib,json,os,random,re,struct,subprocess,time
p=Path(__file__).parent
repo=Path('/mnt/development/csgrs-interval-fuzz-current')
bins=Path('/mnt/development/.interval-refactor-build/interval-fuzz-current/x86_64-unknown-linux-gnu/release')
workflow=(repo/'.github/workflows/hyperinterval.yml').read_text()
shapes={'constructors':('i',4),'fixed_arithmetic':('i',4),'dyadic_arithmetic':('h',7),'primitive_proposals':('Q',4),'strict_float':('Q',3),'rational_powers':('h',5),'square_roots':('h',5),'primitive_roots':('Q',2),'exponential':('h',4),'logarithm':('h',4),'arctangent':('h',4),'trigonometry':('h',4),'split_division':('h',8),'fractional_power':('h',6),'tangent':('h',4)}
results=[]
for line in workflow.splitlines():
 match=re.search(r'cargo \+nightly fuzz run (\w+).* -- (.*)',line)
 if not match: continue
 name,flags=match.groups();assert name in shapes
 corpus=p/'corpus'/name;corpus.mkdir(parents=True,exist_ok=False)
 artifacts=p/'artifacts'/name;artifacts.mkdir(parents=True,exist_ok=False)
 fmt,n=shapes[name];rng=random.Random(20261114)
 if fmt=='Q':
  seeds=[[v]*n for v in [0,1,0x0010000000000000,0x3ff0000000000000,0x4000000000000000,0x7fefffffffffffff,0x7ff0000000000000,0x7ff8000000000000,0x8000000000000000,0xffffffffffffffff]]
  seeds += [[rng.getrandbits(64) for _ in range(n)] for _ in range(24)]
 else:
  bits=16 if fmt=='h' else 32;seeds=[[v]*n for v in [-(1<<(bits-1)),-17,-1,0,1,17,(1<<(bits-1))-1]]
  seeds += [[rng.randrange(-(1<<(bits-1)),1<<(bits-1)) for _ in range(n)] for _ in range(25)]
 for i,seed in enumerate(seeds): (corpus/f'seed-{i:02d}').write_bytes(struct.pack('<'+fmt*n,*seed))
 if name=='constructors':
  for i,data in enumerate([b'null',b'{}',b'{"Empty":null}',b'{"lower":0,"upper":1}',b'{"lower":1,"upper":0}']): (corpus/f'json-{i}').write_bytes(data)
 binary=bins/name;data=binary.read_bytes();limit=int(re.search(r'-max_total_time=(\d+)',flags)[1])
 cmd=[str(binary),str(corpus),*flags.split(),'-timeout=30','-rss_limit_mb=2048','-detect_leaks=1',f'-artifact_prefix={artifacts}/']
 meta={'target':name,'command':cmd,'build_features':'all (rational enabled for every target)','binary_sha256':hashlib.sha256(data).hexdigest(),'binary_bytes':len(data),'initial_seed_count':len(list(corpus.iterdir())),'outer_timeout_seconds':limit+60}
 t=time.monotonic()
 with (p/(name+'.log')).open('w') as out:
  try:
   run=subprocess.run(cmd,cwd=repo/'crates/hyperinterval',env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1',RUST_BACKTRACE='1'),stdout=out,stderr=subprocess.STDOUT,timeout=limit+60);meta['returncode']=run.returncode
  except subprocess.TimeoutExpired:meta['returncode']='enforced outer timeout'
 meta['seconds']=time.monotonic()-t;meta['final_corpus_count']=len(list(corpus.iterdir()));meta['artifact_count']=len(list(artifacts.iterdir()));results.append(meta);(p/'campaign-results.json').write_text(json.dumps(results,indent=2)+'\n');print(name,meta['returncode'],round(meta['seconds'],2),flush=True)
 # Preserve independent results for every target, even if one fails.
assert len(results)==15
print('all targets reached a recorded terminal state',flush=True)
