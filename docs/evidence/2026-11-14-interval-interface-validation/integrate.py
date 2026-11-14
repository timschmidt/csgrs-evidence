from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/alumina-interface-validation');main=Path('/mnt/development/alumina-interface');base=json.loads((s/'BASELINE.json').read_text())['alumina-interface']
paths=['Trunk.toml','crates/alumina-interface-client/src/network.rs','crates/alumina-interface-client/src/worker.rs','crates/alumina-interface-client/tests/validation_contracts.rs','docs/CLIENT-MIGRATIONS.md','src/browser_worker.rs','src/lib.rs']
def git(root,*args):return subprocess.check_output(['git',*args],cwd=root)
assert all(x['returncode']==0 for x in json.loads((s/'final-qualification.json').read_text()))
assert (s/'production-validation.json').exists() and (s/'timing-summary.json').exists()
assert git(r,'rev-parse','HEAD').decode().strip()==base['head']
pending=git(main,'diff','--binary');assert pending==(s/'interface-pending.patch').read_bytes();assert not git(main,'diff','--cached','--binary');assert git(main,'rev-parse','HEAD').decode().strip()==base['head']
git(r,'diff','--check');git(r,'add','--',*paths);git(r,'commit','--only','-m','Restore strict client and browser validation and compressed release assets','--',*paths)
revision=git(r,'rev-parse','HEAD').decode().strip();patch=git(r,'diff','--binary',base['head'],revision);(s/'candidate.patch').write_bytes(patch)
assert sorted(git(r,'diff','--name-only',base['head'],revision).decode().splitlines())==sorted(paths)
assert git(r,'diff','--binary')==pending and not git(r,'diff','--cached','--binary')
(s/'SOURCE.json').write_text(json.dumps(dict(base_commit=base['head'],source_commit=revision,paths=paths,patch_sha256=hashlib.sha256(patch).hexdigest()),indent=2)+'\n')
subprocess.run(['git','apply','--index',str(s/'candidate.patch')],cwd=main,check=True)
assert git(main,'write-tree').strip()==git(r,'rev-parse',revision+'^{tree}').strip()
ref=git(main,'symbolic-ref','HEAD').decode().strip();git(main,'update-ref',ref,revision,base['head'])
assert not git(main,'diff','--cached','--binary') and git(main,'diff','--binary')==pending
(s/'INTEGRATION.json').write_text(json.dumps(dict(base_commit=base['head'],source_commit=revision,branch=ref,main_index_clean=True,inherited_eight_paths_byte_identical=True,inherited_sha256=hashlib.sha256(pending).hexdigest()),indent=2)+'\n');print(revision)
