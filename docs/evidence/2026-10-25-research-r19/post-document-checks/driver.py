from pathlib import Path
import hashlib, json, os, subprocess, time
raw=Path(__file__).resolve().parent
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
record=raw/'post-document-checks';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
decision=json.loads((raw/'final-disposition.json').read_text());assert decision['final_checks_passed']==20
primary=json.loads((raw/'latest-primary-validation.json').read_text())
assert primary['failed'] is None and primary['sources_unchanged']
expected=json.loads((Path(primary['record'])/'sources-after.json').read_text())
assert all(hashlib.sha256((root/n).read_bytes()).hexdigest()==h for n,h in expected.items())
rows=[]
for name,command in [('fmt',['cargo','fmt','--all','--','--check']),('budget',['bash','scripts/check-repository-budget.sh']),('diff-check',['git','diff','--check'])]:
 start=time.monotonic()
 with (record/(name+'.log')).open('w') as out:
  result=subprocess.run(command,cwd=root,stdout=out,stderr=subprocess.STDOUT,timeout=300)
 rows.append({'name':name,'command':command,'status':result.returncode,'seconds':time.monotonic()-start})
 (record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
 assert result.returncode==0,(name,record)
assert all(hashlib.sha256((root/n).read_bytes()).hexdigest()==h for n,h in expected.items())
(record/'completion.json').write_text(json.dumps({'passed':True,'validated_sources_unchanged':True,'primary':primary,'commands':rows},indent=2)+'\n')
print('R19 POST-DOCUMENT CHECKS PASS',record)
