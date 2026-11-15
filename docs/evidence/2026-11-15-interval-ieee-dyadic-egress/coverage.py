from pathlib import Path
import os,json,subprocess,time
s=Path(__file__).parent;root=Path('/mnt/development/csgrs-ieee-egress');out=s/'coverage'
env=os.environ|{'CARGO_BUILD_JOBS':'12','CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/ieee-egress-coverage','RUSTFLAGS':'-C instrument-coverage','LLVM_PROFILE_FILE':str(out/'%p-%m.profraw')}
cmd=['cargo','+stable','test','--locked','-p','hyperinterval','--all-features','--test','dyadic_float_egress','--test','float','--message-format=json']
t=time.monotonic()
with (out/'test.jsonl').open('w') as stdout,(out/'test.stderr.log').open('w') as stderr:p=subprocess.run(cmd,cwd=root,env=env,stdout=stdout,stderr=stderr)
assert p.returncode==0
artifacts=[]
for line in (out/'test.jsonl').read_text().splitlines():
 try:row=json.loads(line)
 except ValueError:continue
 if row.get('reason')=='compiler-artifact' and row.get('executable'):artifacts.append(row['executable'])
sysroot=subprocess.check_output(['rustc','+stable','--print','sysroot'],text=True).strip();llvm=Path(sysroot)/'lib/rustlib/x86_64-unknown-linux-gnu/bin'
profiles=sorted(out.glob('*.profraw'));assert profiles and len(artifacts)==2
merge=[str(llvm/'llvm-profdata'),'merge','-sparse',*[str(x) for x in profiles],'-o',str(out/'merged.profdata')];subprocess.run(merge,check=True)
report=[str(llvm/'llvm-cov'),'export','-format=text','-instr-profile='+str(out/'merged.profdata')]
for a in artifacts:report+=['-object',a]
report += [str(root/'crates/hyperinterval/src/ieee/dyadic.rs')]
p=subprocess.run(report,capture_output=True,text=True,check=True);(out/'export.json').write_text(p.stdout);(out/'export.stderr.log').write_text(p.stderr)
result=json.loads(p.stdout);summaries=[{'file':f['filename'],'summary':f['summary']} for d in result['data'] for f in d['files']]
(s/'coverage-results.json').write_text(json.dumps({'commands':[cmd,merge,report],'seconds':time.monotonic()-t,'summaries':summaries,'scope':'New private conversion module; not whole-owner coverage'},indent=2)+'\n');print(json.dumps(summaries),flush=True)
