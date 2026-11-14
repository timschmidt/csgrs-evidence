from pathlib import Path
import subprocess,os,json,copy,shutil,hashlib
s=Path(__file__).parent;b=Path('/mnt/development/.interval-refactor-build/taylor-noise-packages');c=b/'consumer';env=os.environ|{'CARGO_HOME':str(b/'cargo-home'),'CARGO_TARGET_DIR':str(b/'target'),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
assert json.loads((s/'packaged-consumer-source.json').read_text())['all_seven_from_archives']
p=c/'Cargo.toml';t=p.read_text();old='hypersolve={version="0.4.0",features=["taylor-noise"]}';assert old in t;t=t.replace(old,'hypersolve={version="0.4.0",features=["taylor-noise","serde"]}\nserde_json="=1.0.149"');p.write_text(t);(s/'replay-Cargo.toml').write_text(t);(c/'src/bin').mkdir();shutil.copyfile(s/'replay.rs',c/'src/bin/replay.rs')
commands=[]
for name,cmd in [('lock',['cargo','+1.95.0','generate-lockfile','--offline']),('build',['cargo','+1.95.0','build','--locked','--bin','replay']),('clippy',['cargo','+1.95.0','clippy','--locked','--bin','replay','--','-D','warnings'])]:
 with (s/f'replay-{name}.log').open('wb') as out:p=subprocess.run(cmd,cwd=c,env=env,stdout=out,stderr=subprocess.STDOUT)
 commands.append(dict(name=name,command=cmd,returncode=p.returncode));(s/'replay-commands.json').write_text(json.dumps(commands,indent=2)+'\n');assert p.returncode==0,name
shutil.copyfile(c/'Cargo.lock',s/'replay-Cargo.lock');binary=b/'target/debug/replay';p=subprocess.run([str(binary),'--emit'],stdout=subprocess.PIPE,stderr=subprocess.PIPE);assert p.returncode==0;data=p.stdout;(s/'replay-input.json').write_bytes(data);packet=json.loads(data);rows=[];expected=None
for i in range(3):
 p=subprocess.run([str(binary)],input=data,stdout=subprocess.PIPE,stderr=subprocess.PIPE);assert p.returncode==0 and not p.stderr
 if expected is None:expected=p.stdout
 assert p.stdout==expected;rows.append(dict(case=f'fresh-{i}',returncode=p.returncode,output_sha256=hashlib.sha256(p.stdout).hexdigest()))
(s/'replay-output.json').write_bytes(expected)
for name,key in [('invalid-source-flag','InvalidOutput'),('invalid-affine','InputCount'),('invalid-row','RowWidth'),('invalid-query','InputCount')]:
 bad=copy.deepcopy(packet)
 if name=='invalid-source-flag':bad[0]['outputs']=[999999];bad[0]['certified']=True
 elif name=='invalid-affine':bad[2]['input_count']=3
 elif name=='invalid-row':bad[2]['rows'][0]['coefficients'].pop()
 else:bad[3]['input_count']=3
 payload=json.dumps(bad).encode();(s/f'replay-{name}.json').write_bytes(payload);p=subprocess.run([str(binary)],input=payload,stdout=subprocess.PIPE,stderr=subprocess.PIPE);(s/f'replay-{name}.stderr').write_bytes(p.stderr);assert p.returncode!=0 and not p.stdout and key.encode() in p.stderr,(name,p.returncode,p.stdout,p.stderr);rows.append(dict(case=name,returncode=p.returncode,expected_typed_error=key,no_success_output=True))
(s/'replay-results.json').write_text(json.dumps(dict(binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),rows=rows,all_from_packaged_sources=True),indent=2)+'\n');print('fresh-process replay and invalid source/map/query controls passed')
