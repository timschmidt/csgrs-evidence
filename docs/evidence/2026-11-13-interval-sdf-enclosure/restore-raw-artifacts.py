from pathlib import Path
import subprocess,json,hashlib,shutil,os
s=Path('/tmp/interval-refactor/sdf-enclosure');root=Path('/mnt/development/csgrs-sdf-enclosure');art=Path('/mnt/development/.interval-refactor-build/sdf-enclosure-artifacts')
original=json.loads((s/'builds.json').read_text());final=json.loads((s/'final-builds.json').read_text());assert hashlib.sha256((art/'final-default').read_bytes()).hexdigest()==original[1]['sha256']
notes={'cause':'GNU objcopy --dump-section without an output path rewrote the owned baseline/candidate ELF containers after their raw build hashes were recorded. Loaded-section comparisons remain separately recorded. Rebuild baseline and restore candidate from identical raw final artifact before retaining paths.','mutated_artifacts':[]}
for label in ['baseline-default','candidate-default']:
 path=art/label;notes['mutated_artifacts'].append(dict(label=label,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),bytes=path.stat().st_size));shutil.copy2(path,art/(label+'-after-objcopy'))
paths=[r['path'] for r in json.loads((s/'final-source.json').read_text())];saved={p:(root/p).read_bytes() for p in paths}
try:
 for p in paths:
  r=subprocess.run(['git','show','aede1a20b421cb240f1c3b530c6f593cc6c767a2:'+p],cwd=root,capture_output=True)
  if r.returncode==0:(root/p).write_bytes(r.stdout)
 cmd=original[0]['command']
 with (s/'baseline-raw-rebuild.jsonl').open('w') as out,(s/'baseline-raw-rebuild.log').open('w') as err:r=subprocess.run(cmd,cwd=root,env=dict(os.environ,CARGO_TARGET_DIR=original[0]['target_dir'],CARGO_BUILD_JOBS='4'),stdout=out,stderr=err)
 assert r.returncode==0
 rows=[json.loads(l) for l in (s/'baseline-raw-rebuild.jsonl').read_text().splitlines() if l.startswith('{')];executables=[r['executable'] for r in rows if r.get('reason')=='compiler-artifact' and r.get('target',{}).get('name')=='classification' and r.get('executable')];assert len(executables)==1
 data=Path(executables[0]).read_bytes();assert hashlib.sha256(data).hexdigest()==original[0]['sha256'];(art/'baseline-default').write_bytes(data)
 shutil.copy2(art/'final-default',art/'candidate-default');notes['raw_artifacts_restored_to_recorded_hashes']=True;notes['rebuild_command']=cmd
finally:
 for p,data in saved.items():(root/p).write_bytes(data)
(s/'artifact-dump-note.json').write_text(json.dumps(notes,indent=2)+'\n');print('raw artifacts restored',flush=True)
