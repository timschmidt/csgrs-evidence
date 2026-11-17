from pathlib import Path
import csv,hashlib,io,json,runpy,subprocess,sys
s=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).parent
config=json.loads((s/'review-config.json').read_text());root=Path(config['repository']);review=json.loads((s/'source-review.json').read_text());change=json.loads((s/'inventory-change.json').read_text());path=review['module']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()==review['base']
for row in review['files']:assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256'],row['path']
ns=runpy.run_path(str(root/'scripts/interval_inventory.py'));source=(root/path).read_text();declarations=[dict(symbol=m['name'],kind=m['kind'],line=str(source.count('\n',0,m.start())+1),visibility=(m['visibility'] or 'private').strip()) for m in ns['DECLARATION'].finditer(source)]
assert declarations==review['declarations']
before=list(csv.DictReader(io.StringIO((s/'inventory-before.tsv').read_text()),delimiter='\t'));after=list(csv.DictReader(io.StringIO((root/'interval-inventory.tsv').read_text()),delimiter='\t'))
def target(row):return row['repository']=='csgrs' and row['path']==path
assert len(before)==change['before_rows'] and len(after)==change['after_rows']
old_other=[r for r in before if not target(r)];assert old_other==[r for r in after if not target(r)] and len(old_other)==change['unchanged_other_rows']
selected=[r for r in after if target(r)];assert [{k:r[k] for k in ['symbol','kind','line','visibility']} for r in selected]==declarations
assert all(set(r)==set(ns['FIELDS']) and all(r.values()) for r in selected)
assert len(selected)==change['updated']+change['added']
assert (root/'interval-inventory.tsv').read_bytes()==(s/'inventory-after.tsv').read_bytes()
assert hashlib.sha256((s/'inventory-before.tsv').read_bytes()).hexdigest()==change['before_sha256']
assert hashlib.sha256((s/'inventory-after.tsv').read_bytes()).hexdigest()==change['after_sha256']
changed=set(subprocess.check_output(['git','diff','--name-only','HEAD'],cwd=root,text=True).splitlines());untracked=set(subprocess.check_output(['git','ls-files','--others','--exclude-standard'],cwd=root,text=True).splitlines());assert (changed|untracked)<=set(config['allowed_changes'])
for name,digest in config['accepted_ledger_hashes'].items():assert hashlib.sha256((root/'docs/research'/name).read_bytes()).hexdigest()==digest
print(f"PASS: {len(declarations)} declarations, {len(old_other)} other rows preserved, {len(review['files'])} source hashes, unchanged accepted ledgers; inventory remains partial")
