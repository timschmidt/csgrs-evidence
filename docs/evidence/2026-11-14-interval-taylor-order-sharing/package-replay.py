from pathlib import Path
import subprocess,json,re,hashlib,os,time,shutil
s=Path(__file__).parent;b=Path('/mnt/development/.interval-refactor-build/taylor-order-sharing-packages');p=b/'consumer';r=Path('/mnt/development/csgrs-taylor-order-sharing')
assert (s/'package-driver.exit').read_text().strip()=='0'
manifest=(p/'Cargo.toml').read_text().replace('features=["taylor-flow"]','features=["taylor-flow","taylor-evolution","serde","dispatch-trace"]');manifest=manifest.replace('[patch.crates-io]','serde_json="=1.0.149"\n[patch.crates-io]');(p/'Cargo.toml').write_text(manifest);(s/'packaged-replay-Cargo.toml').write_text(manifest)
source=(r/'crates/hyperdynamics/tests/field_taylor_orders.rs').read_text();tests=source.split('#[path = "../examples/taylor_orders.rs"]')[0];tests=re.sub(r'^#!?\[cfg\(feature = "[^"]+"\)\]\n','',tests,flags=re.M)
assert tests.count('#[test]')==9
(p/'tests').mkdir();(p/'tests/orders.rs').write_text(tests);(s/'packaged-replay.rs').write_text(tests)
(s/'packaged-replay-source.json').write_text(json.dumps(dict(original_test_sha256=hashlib.sha256(source.encode()).hexdigest(),external_test_sha256=hashlib.sha256(tests.encode()).hexdigest(),transformation='enable all nine cfg-gated test bodies; exclude example test already executed from archive; no assertion changes'),indent=2)+'\n')
env=os.environ|{'CARGO_HOME':str(b/'cargo-home'),'CARGO_TARGET_DIR':str(b/'target'),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'};rows=[]
for name,cmd in [('lock',['cargo','+1.95.0','generate-lockfile','--offline']),('test',['cargo','+1.95.0','test','--locked','--test','orders']),('clippy',['cargo','+1.95.0','clippy','--locked','--all-targets','--','-D','warnings'])]:
 start=time.monotonic()
 with (s/f'packaged-replay-{name}.log').open('wb') as out:result=subprocess.run(cmd,cwd=p,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start));(s/'packaged-replay-commands.json').write_text(json.dumps(rows,indent=2)+'\n');assert result.returncode==0,name
shutil.copyfile(p/'Cargo.lock',s/'packaged-replay-Cargo.lock')
print('nine archive-only tests passed, including three fresh process replays')
