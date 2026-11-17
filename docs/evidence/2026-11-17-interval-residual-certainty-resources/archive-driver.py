from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,tarfile,time

stage=Path('/tmp/interval-refactor/residual-certainty-admission')
evidence=Path('/mnt/development/csgrs-evidence')
record='docs/evidence/2026-11-17-interval-residual-certainty-resources'
out=evidence/record
temporary=Path('/dev/shm/interval-residual-resource-snapshot.tar.gz')
watcher,parent=3416600,1621335
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
def digest(path):
 h=hashlib.sha256()
 with Path(path).open('rb') as f:
  for chunk in iter(lambda:f.read(1024*1024),b''):h.update(chunk)
 return h.hexdigest()
def save(path,data):Path(path).write_text(json.dumps(data,indent=2)+'\n')
assert json.loads((stage/'record-verification.json').read_text())['all_record_checks_pass']
assert not subprocess.check_output(['git','-C',str(evidence),'status','--porcelain=v1'],text=True).strip()
previous=subprocess.check_output(['git','-C',str(evidence),'rev-parse','HEAD'],text=True).strip()
assert previous=='ae36f8d84f038d5789b690e41b0615c5929b7ca5'
assert not out.exists() and not temporary.exists()
assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='S'
os.kill(watcher,signal.SIGSTOP);assert state(watcher,'45823480')=='T'
started=time.monotonic()
save('/tmp/interval-refactor/residual-resource-archive-hold.json',dict(time=time.time(),watcher=watcher,parent=parent,budget_seconds=3600))
try:
 files={str(Path('stage')/p.relative_to(stage)):p for p in stage.rglob('*') if p.is_file()}
 artifacts={}
 for prefix in ['resource','lifetime']:
  for r in json.loads((stage/(prefix+'-builds.json')).read_text()):
   p=Path(r['binary']['path']);assert digest(p)==r['binary']['sha256'];artifacts['artifacts/'+p.name]=p
 files.update(artifacts)
 entries=[]
 for i,(name,p) in enumerate(sorted(files.items())):
  assert not p.is_symlink() and time.monotonic()-started<3600
  entries.append(dict(path=name,bytes=p.stat().st_size,sha256=digest(p),executable=bool(p.stat().st_mode & 0o111)))
  if i%10000==0:print('hashed',i,flush=True)
 with temporary.open('wb') as raw,gzip.GzipFile(filename='',fileobj=raw,mode='wb',compresslevel=1,mtime=0) as gz,tarfile.open(fileobj=gz,mode='w|',format=tarfile.PAX_FORMAT) as archive:
  for i,r in enumerate(entries):
   assert time.monotonic()-started<3600
   p=files[r['path']];assert p.stat().st_size==r['bytes']
   info=tarfile.TarInfo(r['path']);info.size=r['bytes'];info.mode=0o755 if r['executable'] else 0o644
   with p.open('rb') as f:archive.addfile(info,f)
   if i%10000==0:print('archived',i,flush=True)
 assert temporary.stat().st_size<512*1024**2
 assert shutil.disk_usage(evidence).free-2*temporary.stat().st_size>20*1024**3
 expected={r['path']:r for r in entries};count=0
 with tarfile.open(temporary,'r|gz') as archive:
  for member in archive:
   r=expected[member.name];assert member.isfile() and member.size==r['bytes'];h=hashlib.sha256()
   f=archive.extractfile(member)
   for chunk in iter(lambda:f.read(1024*1024),b''):h.update(chunk)
   assert h.hexdigest()==r['sha256'];count+=1
   if count%10000==0:print('verified',count,flush=True)
 assert count==len(entries)
 # No stage edits may be silently sealed while verification is running.
 for name,p in files.items():assert digest(p)==expected[name]['sha256']
 out.mkdir(parents=True)
 parts=[]
 with temporary.open('rb') as stream:
  while chunk:=stream.read(32*1024**2):
   name=f'snapshot.tar.gz.part{len(parts):03d}';(out/name).write_bytes(chunk)
   parts.append(dict(path=name,bytes=len(chunk),sha256=hashlib.sha256(chunk).hexdigest()))
 manifest=json.dumps(dict(entries=entries),sort_keys=True,separators=(',',':')).encode()
 (out/'snapshot-manifest.json.gz').write_bytes(gzip.compress(manifest,compresslevel=1,mtime=0))
 (out/'archive-driver.py').write_bytes(Path(__file__).read_bytes())
 for name in ['ADMISSION.md','LIFETIME-PROTOCOL.md','MEMORY-RECONSIDERATION.md','record-verification.json','stack-proposal-summary.json']:
  shutil.copyfile(stage/name,out/name)
 (out/'README.md').write_text('''# Residual-certainty finite resource qualification

Unaccepted candidate aad7409a5928e309812d9a5cc361d46313685266, current
4192d8c726d3333a31cb7eddc30cc0d464d61411 and fixed
c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb. No source or account admission.

This snapshot retains the complete mutable admission stage at capture time,
including protocols, harness sources, failures, controls, original and repeated
measurements, analyzers and all fourteen final native instrumented binaries.
It is a finite snapshot; later work in the live stage is not covered.

Concatenate snapshot.tar.gz.partNNN in lexical order to reconstruct the gzip
archive. snapshot-manifest.json.gz lists each contained path, byte size and
SHA-256. The archive driver verifies every member and unchanged source file
before writing the parts. snapshot-verification.json binds all part hashes.
No third-party caches are included. Raw diagnostic lifetime logs use gzip;
their uncompressed report/trace comparisons precede compact numeric records.

See MEMORY-RECONSIDERATION.md for the narrow unadopted stack proposal and open
allocation failures. Runtime, consumer capacity, packaging, portability and
shared composition remain separate gates. Original failures are preserved.
No push or admission is claimed.
''')
 result=dict(record=record,previous_revision=previous,files=count,uncompressed_bytes=sum(r['bytes'] for r in entries),gzip_bytes=temporary.stat().st_size,gzip_sha256=digest(temporary),parts=parts,manifest_sha256=digest(out/'snapshot-manifest.json.gz'),all_member_hashes_verified=True,source_files_unchanged=True,admitted=False,seconds=time.monotonic()-started)
 save(out/'snapshot-verification.json',result)
 save('/tmp/interval-refactor/residual-resource-snapshot.json',result)
 print(json.dumps({k:v for k,v in result.items() if k!='parts'},indent=2),flush=True)
except BaseException as e:
 save('/tmp/interval-refactor/residual-resource-archive-failure.json',dict(error=repr(e),seconds=time.monotonic()-started));raise
finally:
 assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='T'
 os.kill(watcher,signal.SIGCONT)
 save('/tmp/interval-refactor/residual-resource-archive-hold-released.json',dict(time=time.time(),watcher=watcher,seconds=time.monotonic()-started))
