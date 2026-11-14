from pathlib import Path
import subprocess,os,json,hashlib,shutil,re,statistics,time
s=Path(__file__).parent;a=Path('/mnt/development/.interval-refactor-build/interface-validation-artifacts');exe=a/'measured';rows=[]
# Run only after qualification/build/tool installers have finished.
for trial,side in enumerate(['base','candidate','candidate','base']*3):
 source=a/side;shutil.copy2(source,exe);sha=hashlib.sha256(source.read_bytes()).hexdigest();assert hashlib.sha256(exe.read_bytes()).hexdigest()==sha
 cmd=['taskset','-c','0','setarch','x86_64','-R',str(exe)];start=time.monotonic()
 p=subprocess.run(cmd,env=os.environ|{'NETWORK_ITERATIONS':'1000000'},stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);(s/f'timing-{trial:02d}-{side}.log').write_text(p.stdout);assert p.returncode==0,p.stdout
 values={m.group(1):int(m.group(2)) for m in re.finditer(r'TIME (\w+) iterations=1000000 ns_per_operation=(\d+)',p.stdout)};assert len(values)==4
 rows.append(dict(trial=trial,side=side,command=cmd,sha256=sha,seconds=time.monotonic()-start,ns_per_operation=values));(s/'timing-runs.json').write_text(json.dumps(rows,indent=2)+'\n')
summary={}
for mode in rows[0]['ns_per_operation']:
 b=[x['ns_per_operation'][mode] for x in rows if x['side']=='base'];c=[x['ns_per_operation'][mode] for x in rows if x['side']=='candidate'];bm=statistics.median(b);cm=statistics.median(c);summary[mode]=dict(base=b,candidate=c,base_median_ns=bm,candidate_median_ns=cm,change_percent=(cm/bm-1)*100)
(s/'timing-summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
