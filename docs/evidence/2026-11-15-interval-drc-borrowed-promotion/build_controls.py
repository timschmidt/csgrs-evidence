from pathlib import Path
import subprocess,json,os,time,hashlib,shutil,tomllib,re
s=Path(__file__).parent;r=Path('/mnt/development/interval-profile-static/csgrs');dest=Path('/mnt/development/.interval-refactor-build/drc-borrowed-promotion');env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/drc-current-admission','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
def git(*args,input=None):return subprocess.check_output(['git','-C',str(r),*args],input=input)
# Wait only for the previously observed timing process, with start-time binding.
pid=170341;start='32221968';proc=Path('/proc')/str(pid)
while proc.exists():
 try:fields=(proc/'stat').read_text().split()
 except FileNotFoundError:break
 if fields[21]!=start or fields[2]=='Z':break
 time.sleep(2)
timings=json.loads((s/'timings.json').read_text());assert len(timings)==6
assert all(x['exit_code']==0 or (x['exit_code']==101 and x['worker_seconds']>=120) for x in timings)
paths=['crates/hypercurve/src/arc_bezier.rs','crates/hypercurve/src/rational_bezier_general.rs'];patch=git('diff','--binary');assert patch;assert git('diff','--name-only').decode().splitlines()==paths;assert not git('diff','--cached','--binary');(s/'candidate-tracked.patch').write_bytes(patch)
head=git('rev-parse','HEAD').decode().strip();assert head=='54e6337fe42ea4ac92f5585cde27349e1f7ad79c'
expected_benches=sorted(x['name'] for x in tomllib.loads((r/'crates/hypercurve/Cargo.toml').read_text())['bench'])

def build(label,kind):
 command=['cargo','+stable']+(['build','--locked','-p','hyperdrc','--release','--bin','hyperdrc'] if kind=='cli' else ['bench','--locked','-p','hypercurve','--all-features','--benches','--no-run'])+['--message-format=json']
 name=f'{label}-{kind}';phase={'label':label,'kind':kind,'command':command,'source_patch_sha256':hashlib.sha256(git('diff','--binary')).hexdigest()};(s/'build-phase.json').write_text(json.dumps(phase,indent=2)+'\n');begin=time.monotonic()
 with (s/(name+'-build.jsonl')).open('w') as out,(s/(name+'-build.log')).open('w') as err:p=subprocess.run(command,cwd=r,env=env,stdout=out,stderr=err)
 record=phase|{'cwd':str(r),'env_overrides':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']},'exit_code':p.returncode,'seconds':time.monotonic()-begin};(s/(name+'-build.json')).write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True);assert p.returncode==0
 binaries={}
 for line in (s/(name+'-build.jsonl')).read_text().splitlines():
  try:row=json.loads(line)
  except ValueError:continue
  if row.get('reason')!='compiler-artifact' or not row.get('executable'):continue
  target=row['target'];wanted=target['kind']==(['bin'] if kind=='cli' else ['bench']) and (target['name']=='hyperdrc' if kind=='cli' else target['name'] in expected_benches)
  if not wanted:continue
  binary=dest/label/kind/target['name'];binary.parent.mkdir(parents=True,exist_ok=True);assert not binary.exists();shutil.copy2(row['executable'],binary)
  sections=subprocess.check_output(['size','-A',str(binary)],text=True);(s/(name+'-'+target['name']+'-sections.txt')).write_text(sections)
  symbols=subprocess.check_output(['nm','-S','--defined-only',str(binary)],text=True);addresses={}
  for entry in symbols.splitlines():
   match=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tT] ',entry)
   if match:
    address,size=match.groups();size=int(size,16)
    if address in addresses:assert addresses[address]==size
    addresses[address]=size
  binaries[target['name']]={'path':str(binary),'bytes':binary.stat().st_size,'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'text_section_bytes':int(re.search(r'^\.text\s+(\d+)',sections,re.M)[1]),'named_text_bytes':sum(addresses.values()),'named_unique_addresses':len(addresses)}
 assert sorted(binaries)==(['hyperdrc'] if kind=='cli' else expected_benches),(name,sorted(binaries),expected_benches)
 (s/(name+'-binaries.json')).write_text(json.dumps(binaries,indent=2)+'\n')

try:
 build('candidate','cli')
 build('candidate','benches')
 git('restore','--source=HEAD','--worktree','--',*paths);assert not git('diff','--binary')
 build('baseline','cli')
 build('baseline','benches')
finally:
 if not git('diff','--binary'):git('apply','-',input=patch)
 assert git('diff','--binary')==patch
 (s/'build-controls-restored.json').write_text(json.dumps({'candidate_tracked_patch_restored':True,'sha256':hashlib.sha256(patch).hexdigest(),'head':head},indent=2)+'\n')
print('candidate and baseline artifacts captured; candidate source restored',flush=True)
