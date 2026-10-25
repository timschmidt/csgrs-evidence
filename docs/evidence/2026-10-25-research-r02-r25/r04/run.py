from pathlib import Path
import json,subprocess,hashlib
root=Path('/tmp/csgrs-research-2026-10-25'); p=root/'r04'
info=json.loads((root/'r25-harness/final-build-v2/build.json').read_text())['build']
original=info['compiler']['command']; args=[original[0],'--edition=2024','--crate-name','mixed_profiles','-C','opt-level=3']
for i,a in enumerate(original):
 if a=='-L' and original[i+1].startswith('dependency='):args.extend([a,original[i+1]])
 if a=='--extern' and original[i+1].split('=')[0] in ['csgrs','hypercurve','hyperlattice','hyperlimit','serde_json']:args.extend([a,original[i+1]])
args += [str(p/'mixed_profiles.rs'),'-o',str(p/'mixed-probe')]
manifest={'owner':'CSGRS modeling profile bridge, Hypercurve classified profile/projection API','properties':['P1','P16','P17','P18','P25','P26'],'source_revision':'3cca6a894858c8b98497a3cfe81cff5e17e1a7f2','production_patch':'R01 mesh milestone; R04 unchanged','compiler':info['compiler'],'command':args,'contract':'exact straight-component authored vertex survives addition of disjoint genuine circular component; STRICT; third/sqrt2/2^-80/large-origin controls; triangulate/extrude/zero-twist/sweep/revolve','timeout_seconds':120,'status':'building'}
(p/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
with (p/'build.log').open('w') as log: result=subprocess.run(args,stdout=log,stderr=subprocess.STDOUT)
manifest['build_exit_code']=result.returncode
if result.returncode:
 manifest['status']='build_failed';(p/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');print((p/'build.log').read_text());raise SystemExit(result.returncode)
manifest['binary_sha256']=hashlib.file_digest((p/'mixed-probe').open('rb'),'sha256').hexdigest();manifest['status']='running';(p/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
with (p/'rows.jsonl').open('w') as out,(p/'stderr.log').open('w') as err:
 try:run=subprocess.run([str(p/'mixed-probe')],stdout=out,stderr=err,timeout=120);status=run.returncode
 except subprocess.TimeoutExpired:status=124
manifest.update(exit_code=status,status='completed' if status==0 else 'failed');(p/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('probe exit',status)
rows=[json.loads(x) for x in (p/'rows.jsonl').read_text().splitlines()]
for row in rows:print(row)
