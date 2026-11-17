from pathlib import Path
import gzip,hashlib,json,shutil,subprocess,time
s=Path('/tmp/interval-refactor/failed-constraint-ownership');p=Path('/tmp/interval-refactor/residual-certainty-admission')
e=Path('/mnt/development/csgrs-evidence');record='docs/evidence/2026-11-17-interval-failed-constraint-ownership';dest=e/record
def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def save(path,value):Path(path).write_text(json.dumps(value,indent=2)+'\n')
completion=json.loads((p/'portable-build-completion.json').read_text());assert completion['exit_code']==0
summary=json.loads((p/'portable-summary.json').read_text());assert summary['controls']==completion['controls']
assert (p/'portable-build-hold-released.json').exists()
assert not subprocess.check_output(['git','-C',str(e),'status','--porcelain=v1'],text=True).strip()
previous=subprocess.check_output(['git','-C',str(e),'rev-parse','HEAD'],text=True).strip();assert previous=='d62cded53e3df97f5c77ada6a040df93cda848c0'
assert not dest.exists()
out=s/'portable-completion';out.mkdir(exist_ok=False);origins=[]
files=[f for f in p.iterdir() if f.is_file() and f.name.startswith('portable-')]
files += [p/name for name in ['build-portable.py','analyze-portable.py','PORTABLE-PROTOCOL.md','artifact_sizes.py','corpus.json']]
files += [f for f in (p/'portable').iterdir() if f.is_file()]
for row in json.loads((p/'portable-builds.json').read_text()):
 f=Path(row['artifact']['path']);assert sha(f)==row['artifact']['sha256'];files.append(f)
for f in files:
 relative=Path('source')/f.name if f.parent==p/'portable' else Path('artifacts')/f.name if 'residual-certainty-artifacts' in f.parts else Path(f.name)
 output=out/relative;output.parent.mkdir(parents=True,exist_ok=True)
 data=f.read_bytes()
 if f.suffix=='.jsonl':
  output=output.with_name(output.name+'.gz');output.write_bytes(gzip.compress(data,compresslevel=1,mtime=0));assert gzip.decompress(output.read_bytes())==data
 else:shutil.copy2(f,output)
 origins.append(dict(source=str(f),source_bytes=len(data),source_sha256=hashlib.sha256(data).hexdigest(),destination=str(output.relative_to(out)),stored_sha256=sha(output),gzip_encoded=f.suffix=='.jsonl'))
save(out/'origins.json',origins)
# Completed primitive resource evidence remains in its existing archive.
# Do not recopy its 100k-process stage or relabel its measurements.
(s/'README.md').write_text('''# Failed-constraint ownership and finite portable consumers

Review baseline 21aa18c8804ee6a9865e4c7edf68dc71b39a9446; unaccepted
residual-certainty candidate aad7409a5928e309812d9a5cc361d46313685266.
All 826 diagnostic-module lines and 33 declarations are reviewed; 1,611 old
inventory rows remain byte-identical and the resulting 1,644 rows remain partial.

sources contains the reviewed module and mapped dependencies/callers/tests.
prior-candidate-qualification preserves earlier owner logs with attribution;
those are not new test execution or proof of whole-primary-source equivalence.
portable-pilot preserves the completed pilot and its then-live builder snapshot.
portable-completion supersedes that snapshot for campaign status and retains
the complete final native/WASM matrix, sources, final artifacts, full outputs,
lint, size analysis and source/destination hashes. JSONL files are losslessly
gzip encoded where origins.json says so. No failed cap is dropped.

The earlier resource snapshot is independently retained at evidence commit
d62cded53e3df97f5c77ada6a040df93cda848c0. It is not rewritten by this record.
Memory allowances, runtime, owning-crate/public-package and shared-composition
admission remain separate. No production source or accepted account changes.
The live residual admission stage remains mutable beyond this finite capture.
''')
shutil.copy2(Path(__file__),s/'archive-driver.py')
manifest=[]
for f in sorted(s.rglob('*')):
 if f.is_file():manifest.append(dict(path=str(f.relative_to(s)),bytes=f.stat().st_size,sha256=sha(f)))
shutil.copytree(s,dest)
for row in manifest:
 f=dest/row['path'];assert f.stat().st_size==row['bytes'] and sha(f)==row['sha256']
save('/tmp/interval-refactor/failed-constraint-ownership-archive-prepared.json',dict(record=record,previous_revision=previous,files=len(manifest),bytes=sum(x['bytes'] for x in manifest),files_verified=manifest,source_stage_frozen=True,live_portable_stage_remains_mutable=True,created=time.time()))
print(json.dumps(dict(record=record,files=len(manifest),bytes=sum(x['bytes'] for x in manifest),all_files_verified=True),indent=2))
