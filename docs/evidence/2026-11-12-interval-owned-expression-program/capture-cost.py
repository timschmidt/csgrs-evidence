from pathlib import Path
import subprocess,json,hashlib,shutil,re
out=Path(__file__).parent; root=Path('/mnt/development/csgrs')
for p in (root/'target/criterion').glob('expression_program_degree_*'):
 for q in p.glob('*/new'):
  shutil.copytree(q,out/'criterion'/p.name/q.parent.name/'new',dirs_exist_ok=True)
rows=[]
for p in sorted((out/'criterion').glob('*/*/new/estimates.json')):
 estimates=json.loads(p.read_text()); rows.append({'case':str(p.relative_to(out/'criterion').parent.parent),'median_ns':estimates['median']['point_estimate'],'median_interval_ns':estimates['median']['confidence_interval']})
(out/'timings.json').write_text(json.dumps(rows,indent=2)+'\n')
log=(out/'bench-smoke-qualified.log').read_text(); path=re.search(r'Running benches/expression_program.rs \(([^)]+)\)',log).group(1)
artifacts={'criterion':root/path,'allocation-probe':Path('/tmp/interval-refactor/owned-expression-cost-target/release/owned-expression-cost-probe')}
results=[]
for label,path in artifacts.items():
 raw=subprocess.check_output(['nm','-S','--defined-only','--demangle',str(path)]);(out/(label+'-symbols.txt')).write_bytes(raw)
 sized=[]; unsized=[]
 for line in raw.decode().splitlines():
  m=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tTwW] (.*)',line)
  if m:
   start,size,name=m.groups();size=int(size,16)
   if size:sized.append((int(start,16),int(start,16)+size))
   else:unsized.append(name)
  else:
   m=re.match(r'[0-9a-f]+ [tTwW] (.*)',line)
   if m:unsized.append(m.group(1))
 sized.sort();total=0;end=0
 for a,b in sized:
  total+=max(0,b-max(a,end));end=max(end,b)
 size=subprocess.check_output(['size',str(path)]).decode();(out/(label+'-size.txt')).write_text(size)
 results.append({'label':label,'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'sized_function_interval_union_bytes':total,'sized_function_intervals':len(set(sized)),'unsized_functions':unsized,'scope':'absolute artifact identity and sized-symbol coverage, not a comparison or full machine-code proof'})
(out/'artifacts.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(rows,indent=2));print(json.dumps(results,indent=2))
