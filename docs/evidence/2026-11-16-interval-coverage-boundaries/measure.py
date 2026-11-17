from pathlib import Path
import subprocess,json,os,sys,time,hashlib
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);label=sys.argv[1];out=s/label;out.mkdir();target=Path('/mnt/development/.interval-refactor-build/interval-coverage-review');profiles=target/('profiles-'+label);profiles.mkdir(parents=True)
head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();diff=subprocess.check_output(['git','diff','--binary'],cwd=r);(out/'source.patch').write_bytes(diff)
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'8','CARGO_NET_OFFLINE':'true','RUSTFLAGS':'-C instrument-coverage -C metadata=interval_coverage_review','LLVM_PROFILE_FILE':str(profiles/'interval-%p-%m.profraw'),'RUST_TEST_THREADS':'8'}
cmd=['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--lib','--tests','--message-format=json'];start=time.time()
with (out/'tests.log').open('w') as log:
 try:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800).returncode
 except subprocess.TimeoutExpired:code=124
record={'command':cmd,'source':head,'patch_sha256':hashlib.sha256(diff).hexdigest(),'exit_code':code,'elapsed':time.time()-start,'environment':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','RUSTFLAGS','LLVM_PROFILE_FILE','RUST_TEST_THREADS']}};(out/'test-command.json').write_text(json.dumps(record,indent=2)+'\n');assert code==0,record
objects=[]
for line in (out/'tests.log').read_text().splitlines():
 try:d=json.loads(line)
 except json.JSONDecodeError:continue
 if d.get('reason')=='compiler-artifact' and d.get('executable') and d['profile']['test']:objects.append(d['executable'])
objects=sorted(set(objects));assert objects
llvm=Path(subprocess.check_output(['rustc','+1.95.0','--print','sysroot'],text=True).strip())/'lib/rustlib/x86_64-unknown-linux-gnu/bin';profdata=target/(label+'.profdata');raw=sorted(profiles.glob('*.profraw'));assert raw
merge=[str(llvm/'llvm-profdata'),'merge','-sparse',*[str(p) for p in raw],'-o',str(profdata)];p=subprocess.run(merge,capture_output=True,text=True);(out/'merge.log').write_text(p.stdout+p.stderr);assert p.returncode==0
sources=subprocess.check_output(['git','ls-files','crates/hyperinterval/src'],cwd=r,text=True).splitlines();sources=[str(r/p) for p in sources if p.endswith('.rs') and not p.endswith('_tests.rs')]
base=[str(llvm/'llvm-cov'),objects[0]];object_args=[]
for obj in objects[1:]:object_args+=['--object',obj]
for mode in ['export','show','report']:
 command=[base[0],mode,base[1],*object_args,'--instr-profile='+str(profdata),*sources]
 if mode=='show':command+=['--show-instantiations=false','--show-line-counts-or-regions']
 dest=out/('export.json' if mode=='export' else mode+'.txt')
 with dest.open('w') as log:p=subprocess.run(command,stdout=log,stderr=subprocess.PIPE,text=True)
 (out/(mode+'.stderr')).write_text(p.stderr);assert p.returncode==0
(out/'coverage-command.json').write_text(json.dumps({'objects':[{'path':p,'sha256':hashlib.sha256(Path(p).read_bytes()).hexdigest()} for p in objects],'profile_count':len(raw),'merge_command':merge,'source_files':sources,'scope':'Rust1.95 x86_64 all-feature lib/integration tests. Production source paths explicitly selected; separate *_tests.rs files excluded. Branch instrumentation not enabled. LLVM metrics are configuration-specific, not universal conformance or 100% plan completion.'},indent=2)+'\n')
print(label,'coverage complete',len(objects),'objects',len(raw),'profiles',flush=True)
