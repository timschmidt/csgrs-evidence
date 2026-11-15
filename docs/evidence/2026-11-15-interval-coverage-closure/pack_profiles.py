from pathlib import Path
import gzip,hashlib,json,tarfile,io
s=Path(__file__).parent;records=[]
for label in ['baseline','candidate']:
 out=s/label;profiles=sorted(out.glob('*.profraw'))
 if profiles:
  archive=out/'raw-profiles.tar.gz'
  assert not archive.exists()
  with archive.open('wb') as file,gzip.GzipFile(fileobj=file,mode='wb',filename='',mtime=0) as zipped,tarfile.open(fileobj=zipped,mode='w|') as tar:
   for p in profiles:
    data=p.read_bytes();info=tarfile.TarInfo(p.name);info.size=len(data);info.mode=0o644;info.mtime=0;tar.addfile(info,io.BytesIO(data))
  with tarfile.open(archive,'r:gz') as tar:
   for p in profiles:
    data=p.read_bytes();assert tar.extractfile(p.name).read()==data;records.append({'path':str(p.relative_to(s)),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'archive':str(archive.relative_to(s))});p.unlink()
 for p in sorted(out.iterdir()):
  if p.is_file() and p.suffix not in ['gz'] and (p.stat().st_size>1_000_000 or p.suffix=='.profdata'):
   data=p.read_bytes();dest=p.with_name(p.name+'.gz');assert not dest.exists();dest.write_bytes(gzip.compress(data,compresslevel=9,mtime=0));assert gzip.decompress(dest.read_bytes())==data;records.append({'path':str(p.relative_to(s)),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'archive':str(dest.relative_to(s))});p.unlink()
(s/'compressed-artifacts.json').write_text(json.dumps(records,indent=2)+'\n');print('losslessly packed',len(records),'artifacts')
