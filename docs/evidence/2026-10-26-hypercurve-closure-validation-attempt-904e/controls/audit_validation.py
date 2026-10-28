from pathlib import Path
import argparse, hashlib, json, subprocess, time
root=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--require-complete',action='store_true');args=parser.parse_args()
head='904e5408e128a4f4b35ed0ce028f176023d7eadd'
checkout=root/'normal'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==head
matrix=json.loads((root/'matrix.json').read_text())
expected={s['id']:s for s in matrix['steps']}
lint_records=sorted(root.glob('validation-lint-*/steps.json'))
assert lint_records
lint=json.loads(lint_records[-1].read_text())
for path in lint_records: assert json.loads(path.read_text())==lint
expected.update({s['id']:s for s in lint})
assert len(matrix['steps'])==129 and len(lint)==196 and len(expected)==325
tracked=subprocess.check_output(['git','ls-files'],cwd=checkout,text=True).splitlines()
sources={n:hashlib.sha256((checkout/n).read_bytes()).hexdigest() for n in tracked if (checkout/n).is_file()}
latest={}; unsuccessful=[]
for record in sorted(root.glob('validation-*')):
 events=record/'events.jsonl'
 if not events.exists(): continue
 for line in events.read_text().splitlines():
  row=json.loads(line)
  if row['event']!='finish': continue
  row['record']=record.name
  if row['status']!=0: unsuccessful.append(row)
  if row['id'] not in latest or row['started_epoch']>latest[row['id']]['started_epoch']:latest[row['id']]=row
passed={k:v for k,v in latest.items() if k in expected and v['status']==0}
attribution={}; pending=set()
for label,attempt in passed.items():
 record=root/attempt['record']
 steps={s['id']:s for s in json.loads((record/'steps.json').read_text())}
 assert steps[label]['command']==expected[label]['command'],label
 if not (record/'summary.json').exists(): pending.add(record.name); continue
 summary=json.loads((record/'summary.json').read_text())
 assert summary['head']==head and not summary['source_changes'],record
 before=json.loads((record/'sources-before.json').read_text());after=json.loads((record/'sources-after.json').read_text())
 assert before==after==sources,record
 log=record/(label+'.log');assert log.is_file()
 attribution[label]={'head':head,'record':record.name,'mode':'same complete tracked source revision; fresh execution','log_sha256':hashlib.sha256(log.read_bytes()).hexdigest()}
result={'source_revision':head,'recorded_epoch':time.time(),'required_workflow_steps':129,'required_strict_clippy_groups':196,'completed_successfully':len(passed),'execution_complete':set(expected)<=set(passed),'source_attribution_complete':len(attribution)==325,'pending_record_closeout':sorted(pending),'missing':[k for k in expected if k not in passed],'attribution':attribution,'successful_attempts':passed,'unsuccessful_attempts_retained':unsuccessful,'historical_results_reused':0,'counting':'Command groups; cargo-hack groups expand to additional feature combinations. The raw command and cargo audit logs retain their executions.'}
(root/'validation-status.json').write_text(json.dumps(result,indent=2)+'\n')
print({k:result[k] for k in ['source_revision','completed_successfully','execution_complete','source_attribution_complete','pending_record_closeout']})
if args.require_complete:assert result['execution_complete'] and result['source_attribution_complete'] and not pending
