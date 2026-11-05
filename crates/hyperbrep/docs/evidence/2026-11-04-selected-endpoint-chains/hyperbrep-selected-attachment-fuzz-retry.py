from pathlib import Path
import subprocess,json,hashlib,time,os
prefix='/tmp/hyperbrep-selected-attachment-final3'
s=json.loads(Path(prefix+'-source.json').read_text())
fuzz=Path('crates/hyperbrep/fuzz')
for p in [fuzz/'Cargo.toml',fuzz/'Cargo.lock',*sorted((fuzz/'fuzz_targets').glob('*.rs'))]:
 s[str(p)]=hashlib.sha256(p.read_bytes()).hexdigest()
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==v for p,v in s.items())
cmd=['cargo','check','--offline','--locked','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins']
log=Path(prefix+'-fuzz-retry.log');start=time.time()
with log.open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=dict(os.environ,CCACHE_DISABLE='1'))
unchanged=all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==v for p,v in s.items())
row={'name':'fuzz-check','environment':{'CCACHE_DISABLE':'1'},'command':cmd,'status':r.returncode,'seconds':time.time()-start,'source_unchanged':unchanged,'fingerprints':s,'log':str(log),'scope':'Compilation of all three native fuzz consumers; no fuzz execution, sanitizer or coverage claim.'}
Path(prefix+'-fuzz-retry-validation.json').write_text(json.dumps(row,indent=2)+'\n')
print(r.returncode,unchanged)
assert r.returncode==0 and unchanged
