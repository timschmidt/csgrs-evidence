from pathlib import Path
import subprocess,json,hashlib,statistics,time
root=Path.cwd();dest=Path('/tmp/csgrs-r24-cost-samples');dest.mkdir(exist_ok=True)
processes=[];summary=[];rowhashes={}
for pair in range(3):
 for flavor in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
  binary=Path('/tmp/csgrs-r24-cost-'+flavor)/'probe'
  for case in ['plain','construct','edit','replay','brep_replay']:
   prefix=dest/f'{pair}-{flavor}-{case}';command=[str(binary),case,'12',str(prefix)+'.rows'];start=time.time()
   with open(str(prefix)+'.tsv','w') as out,open(str(prefix)+'.stderr','w') as err:r=subprocess.run(command,stdout=out,stderr=err)
   processes.append(dict(command=command,exit_code=r.returncode,seconds=time.time()-start));print(pair,flavor,case,r.returncode,flush=True)
   if r.returncode:raise SystemExit(r.returncode)
for flavor in ['baseline','candidate']:
 for case in ['plain','construct','edit','replay','brep_replay']:
  rows=[]
  for file in dest.glob(f'*-{flavor}-{case}.tsv'):
   rows.extend([list(map(int,line.split('\t')[1:])) for line in file.read_text().splitlines()])
  summary.append(dict(flavor=flavor,case=case,samples=len(rows),median_ns=statistics.median(r[1] for r in rows),median_requested_bytes=statistics.median(r[2] for r in rows),median_allocation_calls=statistics.median(r[3] for r in rows),median_peak_bytes=statistics.median(r[4] for r in rows),post_drop_bytes=sorted(set(r[5] for r in rows))))
for file in dest.glob('*.rows*'):rowhashes[file.name]=dict(bytes=file.stat().st_size,sha256=hashlib.sha256(file.read_bytes()).hexdigest())
for name,data in [('processes',processes),('summary',summary),('row-hashes',rowhashes)]: (dest/(name+'.json')).write_text(json.dumps(data,indent=2)+'\n')
inputs={}
import tomllib
rootregistry={(p['name'],p['version'],p.get('source')) for p in tomllib.loads((root/'Cargo.lock').read_text())['package'] if 'source' in p}
for flavor in ['baseline','candidate']:
 p=Path('/tmp/csgrs-r24-cost-'+flavor);lock=tomllib.loads((p/'Cargo.lock').read_text());registry={(q['name'],q['version'],q.get('source')) for q in lock['package'] if 'source'in q};assert registry<=rootregistry,registry-rootregistry
 binary=p/'probe';inputs[flavor]=dict(binary_bytes=binary.stat().st_size,binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),registry_packages=len(registry),lock_sha256=hashlib.sha256((p/'Cargo.lock').read_bytes()).hexdigest())
(dest/'inputs.json').write_text(json.dumps(inputs,indent=2)+'\n')
