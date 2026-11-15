from pathlib import Path
import os,json,subprocess,time,sys
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs');label=sys.argv[1];out=s/label;out.mkdir(exist_ok=False)
target=Path('/mnt/development/.interval-refactor-build/interval-coverage-closure')
env=os.environ|{'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true','CARGO_TARGET_DIR':str(target),'RUSTFLAGS':'-C instrument-coverage','LLVM_PROFILE_FILE':str(out/'%p-%m.profraw')}
cmd=['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--lib','--tests','--message-format=json']
t=time.monotonic()
with (out/'test.jsonl').open('w') as stdout,(out/'test.stderr.log').open('w') as stderr:p=subprocess.run(cmd,cwd=root,env=env,stdout=stdout,stderr=stderr)
(out/'run.json').write_text(json.dumps({'command':cmd,'cwd':str(root),'env_overrides':{k:env[k] for k in ['CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','CARGO_TARGET_DIR','RUSTFLAGS','LLVM_PROFILE_FILE']},'exit_code':p.returncode,'seconds':time.monotonic()-t},indent=2)+'\n')
assert p.returncode==0
objects=[]
for line in (out/'test.jsonl').read_text().splitlines():
 try:row=json.loads(line)
 except ValueError:continue
 if row.get('reason')=='compiler-artifact' and row.get('executable') and row.get('profile',{}).get('test'):objects.append(row['executable'])
objects=list(dict.fromkeys(objects));assert objects
llvm=Path(subprocess.check_output(['rustc','+1.95.0','--print','sysroot'],text=True).strip())/'lib/rustlib/x86_64-unknown-linux-gnu/bin'
profiles=sorted(out.glob('*.profraw'));assert profiles
merge=[str(llvm/'llvm-profdata'),'merge','-sparse',*[str(x) for x in profiles],'-o',str(out/'merged.profdata')];subprocess.run(merge,check=True)
sources=sorted(str(x) for x in (root/'crates/hyperinterval/src').rglob('*.rs'))
args=[objects[0],*sum((['-object',p] for p in objects[1:]),[]),'-instr-profile='+str(out/'merged.profdata'),'-num-threads=1',*sources]
commands=[cmd,merge]
for mode,filename in [('export','export.json'),('report','report.txt')]:
 command=[str(llvm/'llvm-cov'),mode,*args];commands.append(command)
 with (out/filename).open('w') as stream:subprocess.run(command,stdout=stream,check=True)
(out/'commands.json').write_text(json.dumps(commands,indent=2)+'\n')
print((out/'report.txt').read_text(),flush=True)
