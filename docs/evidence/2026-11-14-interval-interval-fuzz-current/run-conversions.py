from pathlib import Path
import json,hashlib,os,random,struct,subprocess,time
p=Path(__file__).parent;corpus=p/'corpus/conversions';corpus.mkdir();artifacts=p/'artifacts/conversions';artifacts.mkdir();r=random.Random(20261125)
seeds=[]
for ieee in [0,1,0x000fffffffffffff,0x0010000000000000,0x3fb999999999999a,0x3ff0000000000000,0x7fefffffffffffff,0x7ff0000000000000,0x7ff8000000000000,0x8000000000000000,0xffffffffffffffff]:
 for mode in [0,1,2]:seeds.append([0xffffffffffffffff,3,1,7,0,256,ieee,mode])
seeds += [[n,1,n,1,128,128,0,n] for n in [0,1,0x8000000000000000,0xffffffffffffffff]]
seeds += [[r.getrandbits(64) for _ in range(8)] for _ in range(27)]
for i,row in enumerate(seeds):(corpus/f'seed-{i:02d}').write_bytes(struct.pack('<8Q',*row))
binary=Path('/mnt/development/.interval-refactor-build/interval-fuzz-current/x86_64-unknown-linux-gnu/release/conversions');data=binary.read_bytes();cmd=[str(binary),str(corpus),'-runs=100000','-max_len=64','-max_total_time=30','-seed=20261125','-timeout=30','-rss_limit_mb=2048','-detect_leaks=1',f'-artifact_prefix={artifacts}/'];t=time.monotonic()
with (p/'conversions.log').open('w') as out:
 try:r=subprocess.run(cmd,env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1',RUST_BACKTRACE='1'),stdout=out,stderr=subprocess.STDOUT,timeout=90);code=r.returncode
 except subprocess.TimeoutExpired:code='enforced outer timeout'
m={'command':cmd,'returncode':code,'seconds':time.monotonic()-t,'binary_bytes':len(data),'binary_sha256':hashlib.sha256(data).hexdigest(),'initial_seeds':len(seeds),'final_corpus_count':len(list(corpus.iterdir())),'artifact_count':len(list(artifacts.iterdir()))};(p/'conversions-result.json').write_text(json.dumps(m,indent=2)+'\n');print(m)
