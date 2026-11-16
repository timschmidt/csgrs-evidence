from pathlib import Path
import subprocess,json,hashlib,shutil,re,sys
s=Path(__file__).parent;label=sys.argv[1];art=Path('/mnt/development/.interval-refactor-build/current-widening/artifacts')
rows=[]
for original in re.findall(r'(?:Executable|Running) [^\n]+ \(([^)\n]+)\)',(s/(label+'-unit-release.log')).read_text()):
 p=Path(original);dest=art/(label+'-'+p.name);shutil.copy2(p,dest)
 raw=subprocess.check_output(['size','-A',str(dest)],text=True)
 (s/(label+'-'+p.name+'-sections.txt')).write_text(raw)
 rows.append({'name':p.name,'path':str(dest),'file_bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'sections':{parts[0]:int(parts[1]) for line in raw.splitlines() if len(parts:=line.split())==3 and parts[0].startswith('.')}})
assert len(rows)==2
(s/(label+'-unit-artifacts.json')).write_text(json.dumps(rows,indent=2)+'\n');print([(r['name'],r['file_bytes']) for r in rows])
