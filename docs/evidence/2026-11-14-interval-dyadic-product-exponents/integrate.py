from pathlib import Path
import subprocess,json,os,hashlib
s=Path('/tmp/interval-refactor/dyadic-product-exponents');r=Path('/mnt/development/csgrs-dyadic-product-exponents');m=Path('/mnt/development/csgrs')
b=json.loads((s/'BASELINE.json').read_text())
checks=json.loads((s/'checks.json').read_text());assert len(checks)==9 and all(x['returncode']==0 for x in checks)
def git(cwd,*a,**kw):return subprocess.check_output(['git','-C',str(cwd),*a],**kw)
assert git(m,'rev-parse','HEAD').decode().strip()==b['csgrs']['head']
assert hashlib.sha256(git(m,'diff','--cached','--binary')).hexdigest()==b['csgrs']['staged_sha256']
assert not git(m,'diff','--binary')
paths=['crates/hyperinterval/src/dyadic.rs','crates/hyperinterval/tests/dyadic.rs','crates/hyperinterval/tests/dyadic_product_exponents.rs','crates/hyperinterval/CHANGELOG.md','crates/hypersolve/tests/expression_interval.rs','crates/hyperlattice-interval/tests/dyadic_product_exponents.rs','docs/MIGRATIONS.md']
subprocess.run(['git','add','--',*paths],cwd=r,check=True)
assert set(git(r,'diff','--cached','--name-only').decode().splitlines())==set(paths)
subprocess.run(['git','commit','-m','Normalize representable dyadic product exponents with budgeted growth'],cwd=r,check=True)
source=git(r,'rev-parse','HEAD').decode().strip();assert not git(r,'status','--porcelain')
patch=git(r,'diff','--binary',b['csgrs']['head'],source);(s/'source.patch').write_bytes(patch)
# Expected combined index: new source plus the exact original pending patch.
index=s.parent/'dyadic-product-expected-index';assert not index.exists()
env=os.environ|{'GIT_INDEX_FILE':str(index)}
subprocess.run(['git','read-tree',source],cwd=m,env=env,check=True)
subprocess.run(['git','apply','--cached',str(s/'pending.patch')],cwd=m,env=env,check=True)
expected=git(m,'write-tree',env=env).decode().strip()
# Apply only the qualified source; then prove its inverse recovers the old index.
subprocess.run(['git','apply','--index',str(s/'source.patch')],cwd=m,check=True)
actual=git(m,'write-tree').decode().strip();assert actual==expected
subprocess.run(['git','apply','--cached','--reverse',str(s/'source.patch')],cwd=m,env=env,check=True)
restored=git(m,'write-tree',env=env).decode().strip();assert restored==(s/'pending-tree.txt').read_text().strip()
subprocess.run(['git','update-ref','HEAD',source,b['csgrs']['head']],cwd=m,check=True)
assert git(m,'status','--porcelain').decode()==b['csgrs']['status']
assert not git(m,'diff','--binary')
newpatch=git(m,'diff','--cached','--binary');(s/'preserved-pending.patch').write_bytes(newpatch)
def content(p):return b'\n'.join(line for line in p.splitlines() if not line.startswith(b'index '))
assert content(newpatch)==content((s/'pending.patch').read_bytes())
(s/'SOURCE.json').write_text(json.dumps({'commit':source,'parent':b['csgrs']['head'],'paths':paths},indent=2)+'\n')
(s/'integration-proof.json').write_text(json.dumps({'source_commit':source,'expected_combined_tree':expected,'actual_combined_tree':actual,'inverse_source_restored_original_pending_tree':restored,'pending_patch_changed_only_blob_ids':True,'preserved_pending_sha256':hashlib.sha256(newpatch).hexdigest(),'pending_paths':41},indent=2)+'\n')
print('qualified source integrated; all pending content preserved, including migration overlap')
