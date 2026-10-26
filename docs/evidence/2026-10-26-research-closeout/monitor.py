from pathlib import Path
import json,time,re,collections
p=Path(__file__).resolve().parent
matrix=json.loads((p/'matrix.json').read_text())
required={s['id']:s for s in matrix['steps']+matrix['extra_clippy']}
records=[]
for d in sorted(p.glob('validation-*')):
    if not d.is_dir() or not (d/'steps.json').exists():continue
    for s in json.loads((d/'steps.json').read_text()):
        if s['id'].startswith('release-clippy-') or s['id']=='examples-extra-clippy':required[s['id']]=s
    events=[json.loads(x) for x in (d/'events.jsonl').read_text().splitlines()] if (d/'events.jsonl').exists() else []
    records.append((d,events))
passed=collections.defaultdict(list);failures=[];active=[]
for d,events in records:
    for e in events:
        if e['event']!='finish':continue
        if e['status']==0 and e['id'] in required and e['command'].strip()==required[e['id']]['command'].strip():passed[e['id']].append(d.name)
        elif e['status']!=0:failures.append((e['id'],e['status'],d.name))
    if events and events[-1]['event']=='start' and not (d/'rescheduling-checkpoint.json').exists():
        e=events[-1];log=d/(e['id']+'.log')
        with log.open('rb') as f:
            f.seek(max(0,log.stat().st_size-1500));tail=f.read().decode(errors='replace')
        tail=re.sub(r'\x1b\[[0-9;]*[A-Za-z]','',tail)
        lines=[x for x in tail.splitlines() if x.strip()]
        active.append({'record':d.name,'step':e['id'],'minutes':round((time.time()-e['started_epoch'])/60,1),'tail':lines[-1][-180:] if lines else ''})
workflow={x['id'] for x in matrix['steps']};lint=set(required)-workflow
print(json.dumps({'workflow_steps_passed':len(workflow&set(passed)),'workflow_steps_required':len(workflow),'strict_lint_steps_passed':len(lint&set(passed)),'strict_lint_steps_required':len(lint),'active':active,'failed_steps_without_later_success':[f for f in failures if f[0] not in passed],'missing_steps':[x for x in required if x not in passed]},indent=2))
