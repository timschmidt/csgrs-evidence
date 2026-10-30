from pathlib import Path
import hashlib,json,os,shutil,subprocess,time
p=Path(__file__).resolve().parent;r=p.parent;u=r.parents[1];build=u/'target/research-closeout-builds';source=json.loads((p/'publication-source.json').read_text())['head']
matrix=json.loads((p/'matrix.json').read_text());planned={s['id']:s for s in matrix['steps'] if '-coverage-selected-queries' in s['target_group'] or s['id'].startswith('rust-release-')};assert len(planned)==5
previous=p/'completed-build-cleanup.json'
if previous.exists():
 receipt=json.loads(previous.read_text());assert receipt['source_revision']==source
 rows=receipt['completed'];assert all(v['completed'] for v in rows)
 done={v['command_id'] for v in rows}
else:rows=[];done=set()
allowed_builds={build,u/'target/research-closeout-selected-query-release-retry'}

def save():
 (p/'completed-build-cleanup.json').write_text(json.dumps({'source_revision':source,'reason':'Only generated Cargo debug buffers belonging to successfully completed command groups are removed. Source snapshots, commands, logs, package archives, captured consumer sources, coverage reports and profile digests remain available to the final evidence archive. No validation command or outcome is replaced.','completed':rows,'pending':sorted(set(planned)-done),'epoch':time.time()},indent=2)+'\n')

def active(paths):
 found=[]
 for e in Path('/proc').iterdir():
  if not e.name.isdecimal() or int(e.name)==os.getpid():continue
  try:
   cwd=str((e/'cwd').resolve());exe=str((e/'exe').resolve());env=(e/'environ').read_bytes().decode(errors='replace')
   if any(cwd==str(q) or cwd.startswith(str(q)+'/') or exe.startswith(str(q)+'/') or str(q) in env for q in paths):found.append(int(e.name));continue
   for f in (e/'fd').iterdir():
    try:target=os.readlink(f)
    except (FileNotFoundError,PermissionError):continue
    if any(target.startswith(str(q)+'/') for q in paths):found.append(int(e.name));break
  except (FileNotFoundError,PermissionError,ProcessLookupError):pass
 return found

save()
while done!=set(planned):
 candidates={}
 for journal in p.glob('validation-*/events.jsonl'):
  for line in journal.read_text().splitlines():
   try:v=json.loads(line)
   except json.JSONDecodeError:continue
   if v.get('event')=='finish' and v['id'] in planned and v['status']==0:candidates[v['id']]=(v,journal)
 for label,(event,journal) in candidates.items():
  if label in done:continue
  target=Path(event['target_dir']);assert target.parent in allowed_builds
  if label.startswith('rust-release-'):
   paths=[target/'release-check/debug',target/'release-check/consumer/debug']
   assert (journal.parent/'temporary-consumers').is_dir()
  else:
   assert target.name.endswith('-coverage-selected-queries')
   crate=label.split('-coverage-',1)[0]
   # The existing shell coverage runners emit text/object manifests; the
   # spatial Python runner emits JSON. Require each runner's actual receipts.
   reports=[target/'coverage.json'] if crate=='hyperspatial' else [target/'coverage.txt',target/'test-objects.txt']
   reports.append(target/(crate+'.profdata'))
   assert all(q.is_file() and q.stat().st_size for q in reports)
   paths=[target/'debug']
  paths=[q for q in paths if q.exists()];assert paths and all(q.is_dir() and not q.is_symlink() for q in paths)
  if active([target]):continue
  sizes=[{'path':str(q),'bytes':int(subprocess.check_output(['du','-sb',str(q)],text=True).split()[0]),'entries':sorted(f.name for f in q.iterdir())} for q in paths]
  row={'command_id':label,'successful_event':event,'journal':str(journal),'paths':sizes,'active_references':[],'free_bytes_before':shutil.disk_usage(u).free,'completed':False};
  if not label.startswith('rust-release-'):row['verified_reports']=[{'path':str(q),'bytes':q.stat().st_size,'sha256':hashlib.sha256(q.read_bytes()).hexdigest()} for q in reports]
  rows.append(row);save()
  for q in paths:shutil.rmtree(q)
  row.update(completed=True,free_bytes_after=shutil.disk_usage(u).free,epoch=time.time());done.add(label);save();print({'completed':label,'removed_bytes':sum(v['bytes'] for v in sizes),'free_bytes':row['free_bytes_after']},flush=True)
 if done!=set(planned):
  for mode in ['normal','directed']:
   f=p/(mode+'-phases.json')
   if f.exists() and any(v['exit_code'] for v in json.loads(f.read_text())):raise SystemExit('Validation failed; no further cleanup or closeout')
  time.sleep(15)
(p/'cache-cleanup-complete.json').write_text(json.dumps({'source_revision':source,'groups':len(done),'completed':True,'epoch':time.time()},indent=2)+'\n')
