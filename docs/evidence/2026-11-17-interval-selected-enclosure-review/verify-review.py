from pathlib import Path
import csv,hashlib,io,json,runpy,subprocess
s=Path(__file__).parent;root=Path('/mnt/development/csgrs');review=json.loads((s/'source-review.json').read_text());path='crates/hypersolve/src/selected_polynomial_field/bounds.rs'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()==review['base']
for row in review['files']:assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256'],row['path']
ns=runpy.run_path(str(root/'scripts/interval_inventory.py'));source=(root/path).read_text();declarations=[dict(symbol=m['name'],kind=m['kind'],line=str(source.count('\n',0,m.start())+1),visibility=(m['visibility'] or 'private').strip()) for m in ns['DECLARATION'].finditer(source)]
assert declarations==review['declarations'] and len(declarations)==9
before=list(csv.DictReader(io.StringIO((s/'inventory-before.tsv').read_text()),delimiter='\t'));after=list(csv.DictReader(io.StringIO((root/'interval-inventory.tsv').read_text()),delimiter='\t'))
def target(row):return row['repository']=='csgrs' and row['path']==path
assert len(before)==1578 and len(after)==1585
assert [r for r in before if not target(r)]==[r for r in after if not target(r)]
selected=[r for r in after if target(r)];assert [{k:r[k] for k in ['symbol','kind','line','visibility']} for r in selected]==declarations
assert all(set(r)==set(ns['FIELDS']) and all(r.values()) for r in selected)
assert (root/'interval-inventory.tsv').read_bytes()==(s/'inventory-after.tsv').read_bytes()
allowed={'interval-inventory.tsv','INTERVAL_REFACTOR_PROGRESS.md','docs/research/selected-enclosure-ownership-review.md','docs/evidence-archive.tsv'}
changed=set(subprocess.check_output(['git','diff','--name-only','HEAD'],cwd=root,text=True).splitlines());untracked=set(subprocess.check_output(['git','ls-files','--others','--exclude-standard'],cwd=root,text=True).splitlines());assert (changed|untracked)<=allowed,(changed,untracked)
prior=json.loads((s.parent/'solver-combined-admission/proposed-account-audit.json').read_text())
for name,digest in prior['ledger_hashes'].items():assert hashlib.sha256((root/'docs/research'/name).read_bytes()).hexdigest()==digest
assert json.loads((root/'docs/research/interval-memory-accounts.json').read_text())['accounts']==[]
print('PASS: 9 declaration mappings, 1576 other rows unchanged, 12 source hashes preserved, no production/account change; inventory remains partial')
