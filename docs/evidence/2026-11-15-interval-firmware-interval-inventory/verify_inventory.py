from pathlib import Path
import csv,json,hashlib,re,subprocess,io
s=Path(__file__).parent;repo=Path('/mnt/development/interval-profile-static/csgrs');fw=Path('/mnt/development/interval-profile-static/alumina-firmware');claim=json.loads((s/'clock-inventory.json').read_text());p='crates/alumina-clock/src/lib.rs'
source=subprocess.check_output(['git','-C',str(fw),'show',claim['firmware_commit']+':'+p]);assert hashlib.sha256(source).hexdigest()==claim['source_sha256'];lines=source.decode().splitlines()
current=list(csv.DictReader((repo/'interval-inventory.tsv').open(),delimiter='\t'));baseline=list(csv.DictReader(io.StringIO(subprocess.check_output(['git','-C',str(repo),'show','ac1cbfbf6dd04585ef48c2b93e9023844dda3007:interval-inventory.tsv'],text=True)),delimiter='\t'))
is_clock=lambda r:r['repository']=='alumina-firmware' and r['path']==p
assert [r for r in current if not is_clock(r)]==[r for r in baseline if not is_clock(r)]
rows=[r for r in current if is_clock(r)];assert rows==claim['rows'];assert len(rows)==13
for r in rows:
 line=lines[int(r['line'])-1].strip();assert re.match(r'(?:pub(?:\([^)]*\))?\s+)?'+r['kind']+r'\s+'+r['symbol']+r'\b',line),(r['symbol'],line)
 assert all(r[k] for k in r);assert not any('requires ' in v or 'not yet audited' in v for v in r.values())
assert len([r for r in current if r['repository']=='alumina-firmware' and not is_clock(r)])==50
print(json.dumps({'clock_rows':len(rows),'total_rows':len(current),'untouched_original_rows':len(baseline)-2,'remaining_original_firmware_rows':50,'firmware_commit':claim['firmware_commit'],'source_sha256':claim['source_sha256'],'declaration_locators_match':True,'scope':'mechanical consistency only; body-review scope is documented separately'}))
