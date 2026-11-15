import json,pathlib,re
stage=pathlib.Path(__file__).resolve().parent
records=json.loads((stage/'results.json').read_text())
for extra in ['hyperbrep-io-tests-result.json','hypersolve-coverage-result.json','hypersolve-coverage-retry-result.json']:
 p=stage/extra
 if p.exists():
  r=json.loads(p.read_text());r['name']=extra.removesuffix('-result.json');records.append(r)
summary=[]
for r in records:
 log=stage/(r['name']+'.log')
 text=log.read_text(errors='replace')
 rows=[dict(zip(['passed','failed','ignored','measured','filtered'],map(int,m))) for m in re.findall(r'test result: \w+\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out;',text)]
 summary.append(dict(name=r['name'],exit_code=r['exit_code'],deadline_reached=r['deadline_reached'],elapsed_seconds=r['elapsed_seconds'],harness_summaries=len(rows),test_totals={k:sum(row[k] for row in rows) for k in ['passed','failed','ignored','measured','filtered']},warning_lines=[line for line in text.splitlines() if line.startswith('warning:')]))
(stage/'command-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
for r in summary:print(r['name'],r['exit_code'],r['harness_summaries'],r['test_totals'])
