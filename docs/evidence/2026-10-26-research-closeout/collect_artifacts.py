from pathlib import Path
import hashlib,json,shutil,subprocess,time
raw=Path(__file__).resolve().parent
admission=json.loads((raw/'validation-admission.json').read_text())
assert admission['all_required_checks_passed'] and admission['workflow_steps_covered']==129
root=Path('/tmp/csgrs-research-closeout-checkout')
release=Path('/tmp/csgrs-research-release-checkout')
build=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/research-closeout-builds')
release_build=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/research-closeout-release')
dest=raw/'artifacts';assert not dest.exists();dest.mkdir()
def sha(path):
    h=hashlib.sha256()
    with path.open('rb') as f:
        while data:=f.read(1<<20):h.update(data)
    return h.hexdigest()
def manifest(path):
    return {str(f.relative_to(path)):{'bytes':f.stat().st_size,'sha256':sha(f)} for f in sorted(path.rglob('*')) if f.is_file() and not f.is_symlink()}
reports=[]
for path in sorted((root/'target').glob('hyperspatial-*')):
    if path.is_dir() and (path.name.startswith('hyperspatial-directed') or path.name=='hyperspatial-asan'):
        output=dest/'hyperspatial'/path.name;shutil.copytree(path,output)
        reports.append({'kind':'directed-or-sanitizer','source':str(path),'destination':str(output.relative_to(raw)),'files':manifest(output)})
artifacts=root/'crates/hyperspatial/fuzz/artifacts'
if artifacts.exists():
    output=dest/'hyperspatial/fuzz-artifacts';shutil.copytree(artifacts,output)
    reports.append({'kind':'fuzz-failure-artifacts','source':str(artifacts),'files':manifest(output)})
for crate in ['hypersolve','hyperspatial','hypertri']:
    source=build/f'1.99.1-{crate}-coverage';assert source.is_dir()
    output=dest/'coverage'/crate;output.mkdir(parents=True)
    for f in source.rglob('*'):
        if not f.is_file() or f.is_symlink():continue
        relative=f.relative_to(source)
        if any(part in ['debug','release','html'] for part in relative.parts):continue
        if f.suffix in ['.json','.txt','.profdata','.profraw']:
            target=output/relative;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(f,target)
    objects=[]
    object_list=source/'test-objects.txt'
    candidates=[Path(x) for x in object_list.read_text().splitlines()] if object_list.exists() else list((source/'debug/deps').glob('*'))
    for f in sorted(set(candidates)):
        if not f.is_file() or f.is_symlink():continue
        with f.open('rb') as inp:magic=inp.read(4)
        if magic==b'\x7fELF':objects.append({'path':str(f),'bytes':f.stat().st_size,'sha256':sha(f)})
    (output/'compiled-object-digests.json').write_text(json.dumps({'scope':'Rebuildable instrumented objects; commands, compiler, source hashes, merged profiles and available raw profiles are retained.','objects':objects},indent=2)+'\n')
    reports.append({'kind':'coverage','source':str(source),'files':manifest(output)})
packages=[]
for version in ['1.99.1','1.95.0']:
    directory=release_build/f'{version}-normal/release-check/package'
    archives=sorted(directory.glob('*.crate'));assert len(archives)==18,(version,len(archives))
    packages.extend({'toolchain':version,'name':f.name,'bytes':f.stat().st_size,'sha256':sha(f)} for f in archives)
(dest/'release-packages.json').write_text(json.dumps(packages,indent=2)+'\n')
for checkout,label in [(root,'frozen-kernel-checkout'),(release,'final-code-checkout')]:
    for crate in ['hypercurve','hypermesh','hypertri']:
        directory=checkout/f'crates/{crate}/examples/{crate}_ui/dist'
        if directory.is_dir():reports.append({'kind':'wasm-demo-build','checkout':label,'crate':crate,'files':manifest(directory),'retention':'Generated binary bundle digests retained; rebuild with the recorded Trunk command.'})
record={'collected_ns':time.time_ns(),'reports':reports,'release_packages':packages}
(raw/'artifact-manifest.json').write_text(json.dumps(record,indent=2)+'\n')
print('Collected directed/sanitizer, coverage, package and WASM build evidence.')
