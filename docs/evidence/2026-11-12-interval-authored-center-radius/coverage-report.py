from pathlib import Path
import subprocess,json
out=Path('/tmp/interval-refactor/authored-center-radius')
sysroot=Path(subprocess.check_output(['rustc','+1.95.0','--print','sysroot'],text=True).strip());llvm=sysroot/'lib/rustlib/x86_64-unknown-linux-gnu/bin'
objects=[]
log=out/'focused-06.log'
for line in log.read_text().splitlines():
 try:row=json.loads(line)
 except json.JSONDecodeError:continue
 if row.get('reason')=='compiler-artifact' and row.get('executable') and row.get('target',{}).get('kind')==['test']:objects.append(row['executable'])
assert len(objects)==3,objects
prof=Path('/tmp/interval-refactor/authored-center-radius-profiles/final.profdata')
# These processes began after the final coverage log was created. Exclude the
# earlier run rather than relying on merging changed test-harness profiles.
# Use the earlier focused test log's completion as an unambiguous cutoff;
# coverage begins after five other final commands and all initial profiles.
raw=[p for p in prof.parent.glob('*.profraw') if p.stat().st_mtime>(out/'focused-00.log').stat().st_mtime]
assert raw
subprocess.run([str(llvm/'llvm-profdata'),'merge','-sparse','-num-threads=1',*map(str,raw),'-o',str(prof)],check=True)
cmd=[str(llvm/'llvm-cov'),'export','-format=text','-num-threads=1','-instr-profile',str(prof),objects[0]]
for obj in objects[1:]:cmd+=['-object',obj]
cmd+=['/mnt/development/csgrs/crates/hyperlattice-interval/src/centered.rs']
result=subprocess.run(cmd,capture_output=True,text=True,check=True);data=json.loads(result.stdout)
for d in data['data']:
 d['functions']=[f for f in d['functions'] if any(name.endswith('/hyperlattice-interval/src/centered.rs') for name in f['filenames'])]
(out/'coverage-centered.json').write_text(json.dumps(data,separators=(',',':'))+'\n')
summary=[dict(filename=f['filename'],summary=f['summary']) for d in data['data'] for f in d['files']]
(out/'coverage-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(out/'coverage-command.json').write_text(json.dumps(dict(command=cmd,objects=objects,raw_profiles=list(map(str,raw))),indent=2)+'\n')
print(json.dumps(summary))
