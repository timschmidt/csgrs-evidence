from pathlib import Path
import subprocess,json,hashlib,shutil,sys,re
s=Path(__file__).parent;label=sys.argv[1];target=Path('/mnt/development/.interval-refactor-build/drc-borrowed-promotion');target.mkdir(exist_ok=True)
rows=[]
for line in (s/(label+'-build.jsonl')).read_text().splitlines():
 try:r=json.loads(line)
 except ValueError:continue
 if r.get('reason')=='compiler-artifact' and r.get('executable') and r['target']['name']=='hyperdrc' and r['profile']['test']:rows.append(r['executable'])
assert len(rows)==1,rows
binary=target/(label+'-hyperdrc-tests');assert not binary.exists();shutil.copy2(rows[0],binary)
symbols=subprocess.check_output(['nm','-S','--defined-only',str(binary)],text=True);(s/(label+'-symbols.txt')).write_text(symbols)
sections=subprocess.check_output(['size','-A',str(binary)],text=True);(s/(label+'-sections.txt')).write_text(sections)
addresses={}
for line in symbols.splitlines():
 m=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tT] (.*)',line)
 if m:
  address,size,name=m.groups();size=int(size,16)
  if address in addresses:assert addresses[address]==size
  addresses[address]=size
r={'path':str(binary),'bytes':binary.stat().st_size,'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'named_text_bytes':sum(addresses.values()),'named_unique_addresses':len(addresses),'text_section_bytes':int(re.search(r'^\.text\s+(\d+)',sections,re.M)[1]),'source_parent':subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip(),'source_patch_sha256':hashlib.sha256(subprocess.check_output(['git','diff','--binary'])).hexdigest()}
(s/(label+'-binary.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
