from pathlib import Path
import subprocess,tarfile,json,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/.interval-refactor-build/interval-release-feature-workspace');(r/'packages').mkdir(parents=True,exist_ok=True);archives=Path('/mnt/development/.interval-refactor-build/interval-release-reproduce/target/package');names=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve','hyperdynamics'];rows=[];paths={}
for name in names:
 p,=archives.glob(name+'-[0-9]*.crate')
 with tarfile.open(p) as t:t.extractall(r/'packages',filter='data')
 paths[name]='packages/'+p.name[:-6];rows.append(dict(name=name,archive=str(p),sha256=hashlib.sha256(p.read_bytes()).hexdigest()))
manifest='[workspace]\nresolver="3"\nmembers='+json.dumps(list(paths.values()))+'\n[patch.crates-io]\n'+''.join(name+'={path='+json.dumps(path)+'}\n' for name,path in paths.items());(r/'Cargo.toml').write_text(manifest);shutil.copy2('/mnt/development/csgrs-interval-release-clean/Cargo.lock',r/'Cargo.lock');(s/'feature-workspace.toml').write_text(manifest);(s/'feature-workspace-archives.json').write_text(json.dumps(rows,indent=2)+'\n');print(r)
