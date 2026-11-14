from pathlib import Path
import hashlib,json,os,shutil,subprocess,sys,time,tomllib
s=Path(__file__).parent;root=Path('/mnt/development/csgrs-dynamics-current-cost');name=sys.argv[1]
art=Path('/mnt/development/.interval-refactor-build/dynamics-current-cost-artifacts');art.mkdir(exist_ok=True)
target=Path('/mnt/development/.interval-refactor-build/dynamics-current-cost-observer')
cmd=['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(s/'owner-probe/Cargo.toml'),'--target-dir',str(target)];start=time.monotonic()
with (s/f'observer-{name}-build.log').open('w') as log:r=subprocess.run(cmd,env=dict(os.environ,CARGO_BUILD_JOBS='4'),stdout=log,stderr=subprocess.STDOUT)
row=dict(variant=name,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start)
if r.returncode==0:
    source=target/'release/dynamics-owner-probe';dest=art/f'observer-{name}';shutil.copy2(source,dest)
    row.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
    lock=(s/'owner-probe/Cargo.lock').read_bytes();(s/f'observer-{name}-Cargo.lock').write_bytes(lock)
    row['external_versions']=sorted((x['name'],x['version'],x.get('source'),x.get('checksum')) for x in tomllib.loads(lock.decode())['package'] if x.get('source'))
    with (s/f'observer-{name}.log').open('w') as log:
        run=subprocess.run([str(dest)],stdout=log,stderr=subprocess.STDOUT,timeout=180)
    row['observation_returncode']=run.returncode
(s/f'observer-{name}-build.json').write_text(json.dumps(row,indent=2)+'\n')
print(name,row,flush=True);assert r.returncode==0 and row['observation_returncode']==0
