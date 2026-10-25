from pathlib import Path
import json, os, hashlib, shutil, subprocess, time, gzip

raw=Path('/tmp/csgrs-research-2026-10-25/r28')
primary=sorted(path for path in raw.glob('primary-validation-*') if path.is_dir())[-1]
assert json.loads((primary/'completion.json').read_text())=={'failed':None,'sources_unchanged':True}
repo=Path('/tmp/csgrs-evidence-research-2026-10-25')
assert subprocess.check_output(['git','status','--porcelain'],cwd=repo,text=True)==''
assert subprocess.check_output(['git','branch','--show-current'],cwd=repo,text=True).strip()=='research-2026-10-25'
parent=subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip()
record='docs/evidence/2026-10-25-research-r28'
dest=repo/record
assert not dest.exists()
dest.mkdir(parents=True)
excluded=[]
compressed=[]
def digest(path):
    sha=hashlib.sha256()
    with path.open('rb') as f:
        while data:=f.read(1<<20):sha.update(data)
    return sha.hexdigest()
for directory,dirs,files in os.walk(raw):
    directory=Path(directory)
    for name in list(dirs):
        if name.startswith('target') or name in ['.git','.ccache']:
            relative=str((directory/name).relative_to(raw))
            excluded.append({'path':relative,'kind':'directory','reason':'rebuildable compiler target/cache; source, commands and binary digests retained'})
            dirs.remove(name)
    for name in files:
        path=directory/name;relative=path.relative_to(raw)
        if path.is_symlink():
            target=dest/relative;target.parent.mkdir(parents=True,exist_ok=True);target.symlink_to(os.readlink(path));continue
        with path.open('rb') as f:magic=f.read(8)
        if magic.startswith((b'\x7fELF',b'\x00asm',b'!<arch>\n')) or path.suffix=='.crate':
            excluded.append({'path':str(relative),'kind':'compiled binary or third-party archive','bytes':path.stat().st_size,'sha256':digest(path)})
            continue
        target=dest/relative;target.parent.mkdir(parents=True,exist_ok=True)
        if path.suffix == '.stderr' and path.stat().st_size > 8*1024*1024:
            target=target.with_suffix(target.suffix+'.gz')
            with path.open('rb') as inp, target.open('wb') as out:
                with gzip.GzipFile(filename='',mode='wb',fileobj=out,mtime=0,compresslevel=9) as zipped:shutil.copyfileobj(inp,zipped)
            original=digest(path);decompressed=hashlib.sha256()
            with gzip.open(target,'rb') as inp:
                while data:=inp.read(1<<20):decompressed.update(data)
            assert decompressed.hexdigest()==original
            compressed.append({'original_path':str(relative),'archive_path':str(target.relative_to(dest)),'original_bytes':path.stat().st_size,'original_sha256':original,'gzip_bytes':target.stat().st_size,'gzip_sha256':digest(target),'round_trip_verified':True})
        else:shutil.copy2(path,target)
(dest/'COMPRESSED-LOGS.json').write_text(json.dumps(compressed,indent=2)+'\n')
(dest/'ARCHIVE-EXCLUSIONS.json').write_text(json.dumps(excluded,indent=2)+'\n')
(dest/'archive-driver.py').write_bytes(Path(__file__).read_bytes())
subprocess.run(['git','add','--sparse','--',record],cwd=repo,check=True)
subprocess.run(['git','commit','-q','-m','Archive rejected R28 circle-fit shortcut and retained contract tests'],cwd=repo,check=True)
commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip()
changed=subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r',parent,commit],cwd=repo,text=True).splitlines()
assert changed and all(n.startswith(record+'/') for n in changed)
assert subprocess.check_output(['git','status','--porcelain'],cwd=repo,text=True)==''
meta={'record':record,'parent':parent,'commit':commit,'raw_source':str(raw),'excluded':excluded,'compressed':compressed,
      'historical_records_unchanged':True,'files_added':len(changed),'published':False,'primary_validation':str(primary)}
(raw.parent/'r28-archive.json').write_text(json.dumps(meta,indent=2)+'\n')
print(json.dumps({k:v for k,v in meta.items() if k!='excluded'},indent=2))
