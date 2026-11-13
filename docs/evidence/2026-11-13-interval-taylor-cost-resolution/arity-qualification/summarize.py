from pathlib import Path
import json,re,hashlib,subprocess
p=Path(__file__).parent
owner=json.loads((p/'final-qualification.json').read_text());down=json.loads((p/'downstream-qualification.json').read_text())
assert len(owner)==15 and all(r['returncode']==0 for r in owner)
assert len(down)==11 and all(r['exit']==0 for r in down)
counts={}
for path in sorted(p.glob('*.log')):
 text=path.read_text();tests=sum(int(n) for n in re.findall(r'test result: ok\. (\d+) passed;',text));smokes=len(re.findall(r'^Success$',text,re.M))
 if tests or smokes:counts[path.name]={'passed_tests':tests,'criterion_smoke_successes':smokes}
def structural(path):
 rows=[]
 for line in path.read_text().splitlines():
  if not line.startswith('|'):continue
  columns=[s.strip() for s in line.split('|')[1:-1]]
  if len(columns)!=17 or not columns[1].isdigit():continue
  rows.append(columns[:10]+columns[13:])
 return rows
previous=structural(p.parent/'downstream-07.log');actual=structural(p/'downstream-07.log');assert len(actual)==200 and previous==actual
result={'owner_groups':15,'downstream_groups':11,'all_passed':True,'log_counts':counts,'successive_operations':{'rows':200,'structural_allocator_and_shown_memory_columns_identical':True,'timing_is_smoke_only':True},'source_snapshot_sha256':hashlib.sha256((p/'SOURCE_FINAL.json').read_bytes()).hexdigest()}
(p/'VALIDATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
