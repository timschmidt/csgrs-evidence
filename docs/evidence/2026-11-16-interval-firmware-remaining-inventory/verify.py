from pathlib import Path
import csv,hashlib,io,json,re,subprocess
s=Path(__file__).parent;root=Path('/mnt/development/csgrs');fw=Path('/mnt/development/alumina-firmware')
before=list(csv.DictReader(io.StringIO((s/'initial-inventory.tsv').read_text()),delimiter='\t'));now=list(csv.DictReader((root/'interval-inventory.tsv').open(),delimiter='\t'));claim=json.loads((s/'reviewed-inventory.json').read_text());records=claim['rows'];index={(r['path'],r['symbol']):r for r in records}
assert len(before)==len(now)==1532
for a,b in zip(before,now):
 if a['repository']=='alumina-firmware' and (a['path'],a['symbol']) in index:
  r=index[a['path'],a['symbol']];assert b=={k:r[k] for k in b}
  source=(fw/b['path']).read_bytes();assert hashlib.sha256(source).hexdigest()==r['source_sha256']
  assert source==(s/'source-inputs'/b['path']).read_bytes()
  lines=source.decode().splitlines();n=int(b['line']);assert re.match(r'\s*(?:pub(?:\([^)]*\))?\s+)?(?:const\s+)?'+b['kind']+r'\s+'+re.escape(b['symbol'])+r'\b',lines[n-1])
  assert ('#[test]' in '\n'.join(lines[max(0,n-5):n-1]))==r['is_test']
 else:assert a==b
assert sum(a!=b for a,b in zip(before,now))==23
assert sum(x['repository']=='alumina-firmware' for x in now)==70
assert not any(x['repository']=='alumina-firmware' and 'not yet audited' in x['review_status'] for x in now)
for rec in json.loads((s/'qualification-results.json').read_text()):assert rec['returncode']==0 and rec['patch_unchanged']
for key in ['msrv-machine-ir-oracle','current-machine-ir-oracle']:
 log=(s/(key+'.log')).read_text();assert '24 passed; 0 failed' in log and 'qualification_discrete_bounds_match_independent_recurrences ... ok' in log
assert '30 passed; 0 failed' in (s/'msrv-host-analysis.log').read_text()
owner=Path('/mnt/development/interval-firmware-inventory/alumina-firmware');assert not subprocess.check_output(['git','status','--porcelain'],cwd=owner)
assert not subprocess.check_output(['git','status','--porcelain'],cwd=fw)
assert (owner/'crates/alumina-machine-ir/src/lib.rs').read_bytes()==(s/'oracle-owner-original.rs').read_bytes()
ledger=root/'docs/research/interval-size-accounts.json';assert ledger.read_bytes()==subprocess.check_output(['git','show','HEAD:docs/research/interval-size-accounts.json'],cwd=root)
result={'reviewed_rows':23,'test_declarations':14,'owner_or_host_declarations':9,'unchanged_rows':1509,'total_firmware_rows':70,'remaining_lexical_entries_in_existing_firmware_subset':0,'firmware_revision':claim['firmware_commit'],'inventory_sha256':hashlib.sha256((root/'interval-inventory.tsv').read_bytes()).hexdigest(),'qualification_cases_per_compiler':21952,'qualification_points_per_compiler':362208,'original_machine_ir_tests_per_compiler':23,'xtask_tests':30,'size_accounts_unchanged':54,'production_source_unchanged':True,'qualification_checkout_restored':True,'scope':'mechanical locators/source/row preservation and recorded test results; not exhaustive inventory, universal closure, performance or hardware qualification'}
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
