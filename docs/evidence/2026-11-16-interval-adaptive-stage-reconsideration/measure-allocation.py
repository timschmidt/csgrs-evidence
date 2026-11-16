from pathlib import Path
import subprocess,json,time,hashlib,re,sys
s=Path(__file__).parent;label=sys.argv[1];artifact=json.loads((s/(label+'-probe-artifact.json')).read_text());exe=Path(artifact['path']);assert hashlib.sha256(exe.read_bytes()).hexdigest()==artifact['sha256']
out=s/(label+'-allocation');out.mkdir(exist_ok=False);runs=[];samples=[]
def stats(text):return {k:int(v) for k,v in re.findall(r'(\w+): (\d+)',text)}
for case in range(3):
 for mode in ['prepare','restrict','paired']:
  for order in [1,3]:
   for warm in ['false','true']:
    cmd=[str(exe),str(case),mode,str(order),warm];start=time.monotonic();p=subprocess.run(cmd,capture_output=True,text=True,timeout=60);stem=f'{case}-{mode}-{order}-{warm}';(out/(stem+'.log')).write_text(p.stdout+p.stderr)
    row={'case':case,'mode':mode,'order':order,'warmup_16':warm=='true','command':cmd,'exit_code':p.returncode,'seconds':time.monotonic()-start};runs.append(row);assert p.returncode==0,row
    observed=[]
    for line in p.stdout.splitlines():
     m=re.fullmatch(r'ROW case=(\d+) mode=(\w+) order=(\d+) warm=(\w+) repeat=(\d+) before=AllocationStats \{ (.*) \} retained=AllocationStats \{ (.*) \} after=AllocationStats \{ (.*) \}',line)
     if m:
      c,md,n,w,repeat,before,retained,after=m.groups();sample={'label':label,'case':int(c),'mode':md,'order':int(n),'warmup_16':w=='true','repeat':int(repeat),'before':stats(before),'retained':stats(retained),'after':stats(after)};observed.append(sample);samples.append(sample)
    assert len(observed)==8,(row,len(observed))
(out/'runs.json').write_text(json.dumps(runs,indent=2)+'\n');(out/'samples.json').write_text(json.dumps(samples,indent=2)+'\n');print(label,len(runs),'fresh processes',len(samples),'observations',flush=True)
