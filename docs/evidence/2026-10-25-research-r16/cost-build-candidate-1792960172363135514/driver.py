from pathlib import Path
import hashlib,json,os,signal,subprocess,sys,time
raw=Path(__file__).resolve().parent;variant=sys.argv[1]
assert variant in ['baseline','candidate']
root=Path('/tmp/csgrs-r16-trace' if variant=='baseline' else '/tmp/csgrs-r16-candidate')
record=raw/('cost-build-'+variant+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();prefix=str(root);env.update(CARGO_TARGET_DIR=prefix+'-target',CCACHE_DIR=prefix+'-ccache',CCACHE_TEMPDIR=prefix+'-ccache/tmp',CARGO_BUILD_JOBS='2',PROPTEST_RNG_SEED='20261025')
def run(name,cmd,timeout):
 start=time.monotonic()
 with (record/(name+'.stdout')).open('w') as out,(record/(name+'.stderr')).open('w') as err:
  p=subprocess.Popen(cmd,cwd=root,env=env,stdout=out,stderr=err,start_new_session=True)
  try:status=p.wait(timeout=timeout)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
 with (record/'commands.jsonl').open('a') as f:f.write(json.dumps({'name':name,'cmd':cmd,'status':status,'seconds':time.monotonic()-start,'timeout_seconds':timeout})+'\n')
 print(variant,name,status,flush=True);return status
assert run('fmt',['cargo','fmt','--all'],120)==0
names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
names=[n for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])]
inventory=lambda:{n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names}
before=inventory();(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
for name in ['tests.rs','research_cost.rs']:(record/name).write_bytes((root/'crates/hypercurve/src/bezier_offset/fiber_sign'/name).read_bytes())
assert run('build',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--lib','--no-run','--message-format=json'],1800)==0
binaries=[]
for line in (record/'build.stdout').read_text().splitlines():
 try:r=json.loads(line)
 except json.JSONDecodeError:continue
 if r.get('reason')=='compiler-artifact' and r.get('executable') and r['target']['name']=='hypercurve':binaries.append(Path(r['executable']))
assert len(binaries)==1
binary=record/'probe-binary';binary.write_bytes(binaries[0].read_bytes());binary.chmod(0o755)
after=inventory();assert before==after;(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
metadata={'variant':variant,'binary':str(binary),'bytes':binary.stat().st_size,'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'rustc':subprocess.check_output(['rustc','-Vv'],text=True),'target':env['CARGO_TARGET_DIR'],'source_manifest':str(record/'sources-before.json'),'harness_sha256':hashlib.sha256((record/'research_cost.rs').read_bytes()).hexdigest(),'mode':'System allocator, no diagnostic global allocator','sources_unchanged':True}
(record/'completion.json').write_text(json.dumps(metadata,indent=2)+'\n');(raw/('latest-cost-'+variant+'.json')).write_text(json.dumps(metadata,indent=2)+'\n')
print('COST BUILD COMPLETE',record,flush=True)
