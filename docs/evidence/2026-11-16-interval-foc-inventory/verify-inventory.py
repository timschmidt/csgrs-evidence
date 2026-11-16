from pathlib import Path
import csv, hashlib, io, json, re, subprocess

stage=Path(__file__).parent
repo=Path('/mnt/development/interval-profile-static/csgrs')
firmware=repo.parent/'alumina-firmware'
revision='2d68e82b7341db7b747b20e4ad1455a4c1113a00'
def git(root,*args): return subprocess.check_output(['git','-C',str(root),*args])
def digest(data): return hashlib.sha256(data).hexdigest()
def require(condition,message):
 if not condition: raise RuntimeError(message)
def parse(data): return list(csv.DictReader(io.StringIO(data.decode()),delimiter='\t'))
before=(stage/'inventory-before.tsv').read_bytes()
after=(repo/'interval-inventory.tsv').read_bytes()
old,new=parse(before),parse(after)
def selected(row): return row['repository']=='alumina-firmware' and row['path'].startswith('crates/alumina-foc/')
old_other=[line for line,row in zip(before.splitlines(keepends=True)[1:],old) if not selected(row)]
new_other=[line for line,row in zip(after.splitlines(keepends=True)[1:],new) if not selected(row)]
require(old_other==new_other and len(old_other)==1498,'unrelated rows changed')
require(len(new)==1532 and len([r for r in new if selected(r)])==34,'row count mismatch')
require(len([r for r in new if r['repository']=='alumina-firmware' and r['review_status']=='lexical candidate; not yet audited'])==23,'remaining firmware count')
require(git(firmware,'rev-parse','HEAD').decode().strip()==revision,'firmware revision changed')
require(not git(firmware,'status','--porcelain'),'firmware not clean')
locators=json.loads((stage/'locators.json').read_text())
require(len(locators)==34,'missing locators')
for loc in locators:
 data=(firmware/loc['path']).read_bytes(); text=data.decode()
 require(digest(data)==loc['source_sha256'],'source hash changed')
 pattern=r'\b'+loc['kind']+r'\s+'+re.escape(loc['symbol'])+r'\b'
 if loc['line']==0: require(not re.search(pattern,text),'retired declaration exists')
 else: require(bool(re.search(pattern,text.splitlines()[loc['line']-1])),'wrong declaration locator')
 r=[r for r in new if r['repository']=='alumina-firmware' and r['path']==loc['path'] and r['symbol']==loc['symbol']]
 require(len(r)==1 and int(r[0]['line'])==loc['line'],'inventory locator mismatch')
removed='953ed4b7e8059288abe5146cfd68400f0961587e'
require(b'fn ratio_bounds' in git(firmware,'show',removed+'^:crates/alumina-foc/src/lib.rs'),'missing historical helper')
require(b'fn ratio_bounds' not in git(firmware,'show',removed+':crates/alumina-foc/src/lib.rs'),'removal mismatch')
prior=stage.parent/'firmware-interval-inventory'
check=json.loads((prior/'check-summary.json').read_text())
require(check['commits']['firmware']==revision,'reused validation revision mismatch')
require(not git(repo,'diff',check['commits']['csgrs'],'--','crates/hyperinterval'),'tested Hyperinterval sources changed')
log=(prior/'native-tests.log').read_text()
results=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',log)
require(len(results)==55 and sum(int(x[0]) for x in results)==602,'firmware test count mismatch')
require(all(x[1:]==('0','0') for x in results),'failed or ignored tests')
foc=log[log.index('Running unittests src/lib.rs (',log.index('alumina_foc-')-160):]
require('86 passed; 0 failed' in foc.split('Running tests/q30_contract.rs')[0],'FOC test count mismatch')
q30=log.split('Running tests/q30_contract.rs',1)[1].split('Running ',1)[0]
require('2 passed; 0 failed' in q30,'Q30 test count mismatch')
source_paths=sorted({loc['path'] for loc in locators}|{'crates/alumina-foc/tests/q30_contract.rs','crates/alumina-foc/Cargo.toml','crates/alumina-config/src/lib.rs','Cargo.toml','Cargo.lock'})
sources=[]
for path in source_paths:
 data=(firmware/path).read_bytes()
 require(data==git(firmware,'show',revision+':'+path),'source differs from tested revision')
 sources.append({'path':path,'bytes':len(data),'sha256':digest(data)})
prior_files=['native-tests.log','native-tests.json','native-clippy.json','native-format.json','check-summary.json']
reused=[]
for file in prior_files:
 data=(prior/file).read_bytes()
 if file.endswith('.json') and file!='check-summary.json': require(json.loads(data)['exit_code']==0,'prior command failure')
 reused.append({'path':file,'sha256':digest(data)})
require(subprocess.run(['git','-C',str(repo),'diff','--check'],capture_output=True).returncode==0,'whitespace check failed')
result={'firmware_commit':revision,'inventory_before_sha256':digest(before),'inventory_after_sha256':digest(after),'updated_original_rows':27,'added_rows':7,'unchanged_original_rows':1498,'live_locators':33,'retired_absent':1,'remaining_original_firmware_lexical_rows':23,'sources':sources,'reused_evidence_commit':'c390ef8e50da1f274ce5b1217f83a3e0bf4bdcac','reused_files':reused,'reused_tests':{'firmware':602,'suites':55,'foc_unit':86,'q30_contract':2},'new_runtime_tests':False,'new_performance_claim':False,'diff_check':'pass'}
(stage/'verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k not in ('sources','reused_files')}))
