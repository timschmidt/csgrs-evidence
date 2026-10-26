from pathlib import Path
import json, hashlib, re
root=Path(__file__).resolve().parent
matrix=json.loads((root/'matrix.json').read_text())
expected={s['id']:s for s in matrix['steps']}
expected.update({s['id']:s for s in json.loads((root/'validation-lint-1793010765215444885/steps.json').read_text())})
passed={};failures=[]
for record in sorted(root.glob('validation-*')):
    if not (record/'events.jsonl').exists():continue
    for line in (record/'events.jsonl').read_text().splitlines():
        row=json.loads(line)
        if row['event']!='finish':continue
        row['record']=record.name
        if row['status']==0:
            if row['id'] not in passed or row['started_epoch']>passed[row['id']]['started_epoch']:
                passed[row['id']]=row
        else:failures.append(row)
standalone=root/'standalone-hypercurve.json'
if standalone.exists():
    entry=json.loads(standalone.read_text())
    log=Path(entry['log'])
    assert hashlib.sha256(log.read_bytes()).hexdigest()==entry['log_sha256']
    assert entry['status']==0 and entry['passed']==2639 and entry['failed']==0
    passed[entry['id']]=entry
report={'required_workflow_steps':len(matrix['steps']),'required_strict_clippy':len(expected)-len(matrix['steps']),
        'passed':len(set(expected)&set(passed)),
        'missing':[expected[k] for k in sorted(set(expected)-set(passed))],
        'successful_attempts':{k:passed[k] for k in sorted(set(expected)&set(passed))},
        'unsuccessful_attempts':failures,
        'execution_complete':set(expected)<=set(passed)}
(root/'coverage-report.json').write_text(json.dumps(report,indent=2)+'\n')
print({k:report[k] for k in ['required_workflow_steps','required_strict_clippy','passed','execution_complete']})
print('Missing:',', '.join(s['id'] for s in report['missing']))
