import subprocess,json,platform,os,hashlib,csv,statistics
from pathlib import Path
root=Path('/tmp/interval-refactor/arctangent');binary=Path('target/release/examples/atan_cost')
meta={'command':[str(binary)],'compiler':subprocess.check_output(['rustc','+stable','-Vv'],text=True),'platform':platform.platform(),'cpu':subprocess.check_output(['lscpu'],text=True),'features':'rational,dyadic; no-default-features','profile':'release','RUSTFLAGS':os.environ.get('RUSTFLAGS',''),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest()}
with (root/'samples.csv').open('w') as out,(root/'cost-stderr.log').open('w') as err:r=subprocess.run([str(binary)],stdout=out,stderr=err)
meta['exit_code']=r.returncode;(root/'cost-environment.json').write_text(json.dumps(meta,indent=2)+'\n');assert r.returncode==0
rows=list(csv.DictReader((root/'samples.csv').open()));assert len(rows)==660
results={}
for row in rows:
 key=row['backend']+'/'+row['case']+'/'+row['precision'];results.setdefault(key,[]).append(int(row['elapsed_ns'])/int(row['completed_images']))
assert all(len(v)==20 for v in results.values())
summary={k:{'samples':len(v),'median_ns_per_image':statistics.median(v),'minimum_ns':min(v),'maximum_ns':max(v)} for k,v in results.items()}
for key,value in summary.items():
 units={int(r['work_units_per_image']) for r in rows if '/'.join([r['backend'],r['case'],r['precision']])==key};assert len(units)==1;value['work_units_per_image']=units.pop()
(root/'cost-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
with (root/'cost-size.txt').open('w') as out:subprocess.run(['size',str(binary)],stdout=out,check=True)
print('completed',len(rows),'samples')
