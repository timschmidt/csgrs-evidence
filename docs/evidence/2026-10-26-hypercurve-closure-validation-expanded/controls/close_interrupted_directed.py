from pathlib import Path
import hashlib,json,os,shutil,signal,subprocess,time
root=Path(__file__).resolve().parent
checkout=root/'directed'
record=root/'validation-workflow-1793074579255570998'
assert not (record/'summary.json').exists()
rows=[json.loads(line) for line in (record/'events.jsonl').read_text().splitlines()]
started=next(row for row in rows if row['event']=='start' and row['id']=='hyperspatial-directed-0-14')
assert not any(row['event']=='finish' and row['id']==started['id'] for row in rows)
processes={}
for p in Path('/proc').iterdir():
 if not p.name.isdigit():continue
 try:
  args=[a.decode(errors='replace') for a in (p/'cmdline').read_bytes().split(b'\0') if a]
  stat=(p/'stat').read_text().split(') ',1)[1].split()
  processes[int(p.name)]={'parent':int(stat[1]),'start':stat[19],'args':args,'cwd':str((p/'cwd').resolve())}
 except OSError:continue
roots=[pid for pid,v in processes.items() if v['cwd']==str(checkout) and v['args'][:2]==['python3','crates/hyperspatial/scripts/fuzz-smoke.py']]
assert len(roots)==1,roots
owned=set(roots)
while True:
 updated=owned|{pid for pid,v in processes.items() if v['parent'] in owned}
 if updated==owned:break
 owned=updated
assert all(processes[pid]['cwd'].startswith(str(checkout)) for pid in owned)
for pid in sorted(owned,reverse=True):
 try:os.kill(pid,signal.SIGTERM)
 except ProcessLookupError:pass
time.sleep(3)
for pid in owned:
 try:
  stat=(Path('/proc')/str(pid)/'stat').read_text().split(') ',1)[1].split()
  if stat[19]==processes[pid]['start'] and stat[0]!='Z':os.kill(pid,signal.SIGKILL)
 except (OSError,ProcessLookupError):pass
time.sleep(1)
for pid in owned:
 try:
  stat=(Path('/proc')/str(pid)/'stat').read_text().split(') ',1)[1].split()
  assert stat[19]!=processes[pid]['start'] or stat[0]=='Z',(pid,stat[0])
 except OSError:pass
preserved=root/'interrupted-directed-campaigns'
preserved.mkdir(exist_ok=False)
for name in ['hyperspatial-asan']:
 source=checkout/'target'/name
 shutil.copytree(source,preserved/name)
# A retry starts from the original selected seeds, not the partially mutated corpus.
shutil.rmtree(checkout/'target/hyperspatial-asan')
source=checkout/'crates/hyperspatial/fuzz/artifacts'
if source.exists():shutil.copytree(source,preserved/'fuzz-artifacts')
before=json.loads((record/'sources-before.json').read_text())
after={n:hashlib.sha256((checkout/n).read_bytes()).hexdigest() for n in subprocess.check_output(['git','ls-files'],cwd=checkout,text=True).splitlines() if (checkout/n).is_file()}
assert before==after
assert not subprocess.check_output(['git','status','--porcelain'],cwd=checkout,text=True)
(row:={**started,'event':'finish','status':143,'elapsed_seconds':time.time()-started['started_epoch'],'interruption':'Launcher session 15239 returned SIGTERM. Its orphaned campaign children were stopped by the task before retry; no sanitizer or Rust assertion failure was reported by the completed campaigns.'})
with (record/'events.jsonl').open('a') as out:out.write(json.dumps(row)+'\n')
results=[{k:v for k,v in r.items() if k!='event'} for r in rows if r['event']=='finish']+[{k:v for k,v in row.items() if k!='event'}]
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
steps=json.loads((record/'steps.json').read_text())
summary={'record':str(record),'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip(),'phase':'workflow','selection':'^hyperspatial-directed-','planned':len(steps),'completed':len(results),'results':results,'source_changes':[],'all_passed':False,'recovered_closeout':True,'partial_campaigns_preserved':str(preserved),'stopped_owned_pids':sorted(owned)}
(record/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(root/'directed-interruption.json').write_text(json.dumps(summary,indent=2)+'\n')
print('Preserved interrupted sanitizer attempt; closed original record with 12 successes and one interrupted group. Retry required.',flush=True)
