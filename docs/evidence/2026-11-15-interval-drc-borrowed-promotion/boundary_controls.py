from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess, os, json, time, hashlib, shutil, re
s=Path(__file__).parent
b=s/'boundary-controls'; b.mkdir(exist_ok=False)
r=Path('/mnt/development/interval-promotion-boundaries/csgrs')
dest=Path('/mnt/development/.interval-refactor-build/drc-borrowed-promotion/boundary-controls')
env=os.environ|{'CARGO_BUILD_JOBS':'12','CARGO_NET_OFFLINE':'true','RUSTUP_TOOLCHAIN':'stable'}
patch=(s/'candidate-with-witness.patch').read_bytes()
paths=['crates/hypercurve/src/arc_bezier.rs','crates/hypercurve/src/rational_bezier_general.rs']
test='crates/hypercurve/src/rational_bezier_general/borrowed_promotion_tests.rs'
def git(*args,input=None):return subprocess.check_output(['git','-C',str(r),*args],input=input)
def save(name,row):(b/name).write_text(json.dumps(row,indent=2)+'\n')
assert git('rev-parse','HEAD').decode().strip()=='54e6337fe42ea4ac92f5585cde27349e1f7ad79c'
assert not git('status','--porcelain')
save('inputs.json',{'source_parent':git('rev-parse','HEAD').decode().strip(),'cwd':str(r),'candidate_patch_sha256':hashlib.sha256(patch).hexdigest(),'compiler':subprocess.check_output(['rustc','+stable','-Vv'],text=True),'purpose':'paired boundary and successive builds in an independent checkout while the original owner suite keeps stable source; no benchmark timings overlap builds'})
original=(r/'crates/hypercurve/benches/dispatch_trace.rs').read_text()
assert original.count('let policy = PredicatePolicy::STRICT;')==1
harness=b/'approx_dispatch.rs'
harness.write_text(original.replace('#[path = "../tests/support/mod.rs"]',f'#[path = "{r}/crates/hypercurve/tests/support/mod.rs"]').replace('let policy = PredicatePolicy::STRICT;','let policy = PredicatePolicy::APPROXIMATE_512;'))
def run(label,name,command,runenv):
 tag=f'{label}-{name}'; start=time.monotonic()
 row={'label':label,'name':name,'command':command,'cwd':str(r),'env_overrides':{k:runenv[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','RUSTUP_TOOLCHAIN']},'source_status':git('status','--porcelain').decode()}
 save(tag+'-started.json',row)
 with (b/(tag+'.jsonl')).open('w') as out,(b/(tag+'.log')).open('w') as err:result=subprocess.run(command,cwd=r,env=runenv,stdout=out,stderr=err)
 row.update(exit_code=result.returncode,seconds=time.monotonic()-start);save(tag+'.json',row);print(json.dumps(row),flush=True);assert result.returncode==0
 return b/(tag+'.jsonl')
def copy_binary(source,output):
 output.parent.mkdir(parents=True,exist_ok=True);assert not output.exists();shutil.copy2(source,output)
 return {'path':str(output),'bytes':output.stat().st_size,'sha256':hashlib.sha256(output.read_bytes()).hexdigest()}
def native(label):
 local=env|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/drc-boundary-native'}
 artifacts=run(label,'dispatch-build',['cargo','+stable','bench','--locked','-p','hypercurve','--all-features','--bench','dispatch_trace','--no-run','--message-format=json'],local)
 libraries={}; strict=None
 for line in artifacts.read_text().splitlines():
  try:row=json.loads(line)
  except ValueError:continue
  if row.get('reason')!='compiler-artifact':continue
  if row['target']['name']=='dispatch_trace' and row.get('executable'):strict=Path(row['executable'])
  if row['target']['name'] in ['hypercurve','hyperreal'] and row['target']['kind']==['lib']:
   for file in row['filenames']:
    if file.endswith('.rlib'):libraries[row['target']['name']]=Path(file)
 assert strict and len(libraries)==2
 info=copy_binary(strict,dest/label/'dispatch-strict');save(label+'-strict-binary.json',info)
 run(label,'strict-dispatch',[info['path']],local)
 approximate=dest/label/'dispatch-approximate'
 command=['rustc','+stable','--edition=2024','-C','opt-level=3','--cfg','feature="triangulation"','-L',f"dependency={libraries['hypercurve'].parent}"]
 for name,path in sorted(libraries.items()):command.extend(['--extern',f'{name}={path}'])
 command.extend([str(harness),'-o',str(approximate)])
 save(label+'-approx-libraries.json',{n:{'path':str(p),'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for n,p in libraries.items()})
 run(label,'approx-compile',command,local)
 save(label+'-approx-binary.json',{'path':str(approximate),'bytes':approximate.stat().st_size,'sha256':hashlib.sha256(approximate.read_bytes()).hexdigest()})
 run(label,'approx-dispatch',[str(approximate)],local)
 output=dest/label/'successive';assert not output.exists()
 run(label,'successive-build',['python3','scripts/successive-operations.py','build','--output',str(output),'--features','curve,stl-io,obj-io'],local)
 binary=output/'successive_operations';assert binary.is_file()
 sections=subprocess.check_output(['size','-A',str(binary)],text=True);(b/(label+'-successive-sections.txt')).write_text(sections)
 symbols=subprocess.check_output(['nm','-S','--defined-only',str(binary)],text=True);addresses={}
 for line in symbols.splitlines():
  match=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tT] ',line)
  if match:
   address,size=match.groups();size=int(size,16)
   if address in addresses:assert addresses[address]==size
   addresses[address]=size
 save(label+'-successive-binary.json',{'path':str(binary),'bytes':binary.stat().st_size,'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'text_section_bytes':int(re.search(r'^\.text\s+(\d+)',sections,re.M)[1]),'named_text_bytes':sum(addresses.values()),'named_unique_addresses':len(addresses)})
def wasm(label):
 local=env|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/drc-borrowed-supplemental'}
 run(label,'wasm-build',['cargo','+stable','build','--locked','--release','--manifest-path','crates/hypercurve/examples/hypercurve_ui/Cargo.toml','--target','wasm32-unknown-unknown','--message-format=json'],local)
 info=copy_binary(Path(local['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/hypercurve_ui.wasm',dest/label/'hypercurve_ui.wasm');save(label+'-wasm-binary.json',info)
status={'success':False,'source_worktree':str(r),'evidence_directory':str(b)}
try:
 for label in ['baseline','candidate']:
  if label=='candidate':git('apply','-',input=patch)
  with ThreadPoolExecutor(max_workers=2) as pool:
   futures=[pool.submit(native,label),pool.submit(wasm,label)]
   for future in futures:future.result()
 for policy in ['strict','approx']:
  for extension in ['jsonl','log']:
   assert (b/f'baseline-{policy}-dispatch.{extension}').read_bytes()==(b/f'candidate-{policy}-dispatch.{extension}').read_bytes(),(policy,extension)
 baseline=json.loads((b/'baseline-wasm-binary.json').read_text());candidate=json.loads((b/'candidate-wasm-binary.json').read_text())
 status.update(success=True,strict_and_approximate_dispatch_identical=True,wasm_delta_bytes=candidate['bytes']-baseline['bytes'])
 a=json.loads((b/'baseline-successive-binary.json').read_text());c=json.loads((b/'candidate-successive-binary.json').read_text());status['successive_size_delta']={k:c[k]-a[k] for k in ['bytes','text_section_bytes','named_text_bytes']}
finally:
 if git('diff','--binary'):
  git('restore','--source=HEAD','--worktree','--',*paths)
 if (r/test).exists():(r/test).unlink()
 assert not git('status','--porcelain')
 status['control_worktree_restored_clean']=True
 (s/'boundary-controls-complete.json').write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps(status),flush=True)
