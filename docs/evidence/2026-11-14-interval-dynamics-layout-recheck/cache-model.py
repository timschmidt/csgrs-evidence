"""Diagnostic cache/branch simulation; not hardware counters or wall-time evidence."""
from pathlib import Path
from collections import defaultdict
import gzip,hashlib,json,os,re,shutil,subprocess,time
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/dynamics-layout-recheck-artifacts')
tool='/tmp/interval-refactor/profiling-tools/valgrind/usr/bin/valgrind';lib='/tmp/interval-refactor/profiling-tools/valgrind/usr/libexec/valgrind'
cases=['axis_aligned_line_offset_exact','quadratic_bezier_exact_hodograph','rect_pad_board_edge_clearance_exact','rectangular_additive_bead_schedule','specctra_trace_record_exact_import','specctra_grid_route_text_parse_256']
assert len(json.loads((s/'repeat-runs.json').read_text()))==6
(s/'cache-profiles').mkdir();common=Path('/tmp/interval-refactor/dynamics-layout-recheck-cache-executable');rows=[]
for case in cases:
 for variant in ['baseline','extraction','provider-control']:
  source=art/('observer-'+variant);shutil.copy2(source,common);stem=s/'cache-profiles'/f'{case}-{variant}';out=stem.with_suffix('.out')
  cmd=['setarch','x86_64','-R',tool,'--tool=callgrind','--cache-sim=yes','--branch-sim=yes','--I1=32768,8,64','--D1=32768,8,64','--LL=8388608,16,64','--collect-atstart=no','--toggle-collect=dynamics_profile_epoch','--callgrind-out-file='+str(out),str(common)]
  settings={'VALGRIND_LIB':lib,'OWNER_PROFILE':'1','OWNER_CASE':case};start=time.monotonic()
  with stem.with_suffix('.log').open('w') as log:r=subprocess.run(cmd,env=os.environ|settings,stdout=log,stderr=subprocess.STDOUT,timeout=180)
  assert r.returncode==0,(case,variant)
  raw=out.read_bytes();text=raw.decode();events=re.search(r'^events: (.*)',text,re.M)[1].split();summary=list(map(int,re.search(r'^summary: (.*)',text,re.M)[1].split()));summary+= [0]*(len(events)-len(summary))
  names={};counts=defaultdict(lambda:[0]*len(events));current=None;callee=False
  for line in text.splitlines():
   if line.startswith(('fn=','cfn=')):
    m=re.fullmatch(r'(c?fn)=\((\d+)\)(?: (.*))?',line);assert m,line
    kind,key,name=m.groups()
    if name is not None:names[key]=name
    if kind=='fn':current=key;callee=False
   elif line.startswith('calls='):callee=True
   elif re.match(r'^[+*\-0-9]',line):
    fields=line.split()
    if not callee and current is not None:
     for i,value in enumerate(fields[1:]):counts[current][i]+=int(value)
    callee=False
  totals=[sum(c[i] for c in counts.values()) for i in range(len(events))];assert totals==summary,(totals,summary)
  byname=defaultdict(lambda:[0]*len(events))
  for key,values in counts.items():
   for i,value in enumerate(values):byname[names[key]][i]+=value
  zipped=gzip.compress(raw,mtime=0);stem.with_suffix('.out.gz').write_bytes(zipped);out.unlink()
  row=dict(case=case,variant=variant,command=cmd,env=settings,returncode=r.returncode,elapsed_not_timing=time.monotonic()-start,executable_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),raw_sha256=hashlib.sha256(raw).hexdigest(),gzip_sha256=hashlib.sha256(zipped).hexdigest(),events=dict(zip(events,summary)),self_events={name:dict(zip(events,c)) for name,c in sorted(byname.items())})
  stem.with_suffix('.json').write_text(json.dumps(row,indent=2)+'\n');rows.append(row);print(case,variant,row['events'],flush=True)
summary=[]
for case in cases:
 data={r['variant']:r['events'] for r in rows if r['case']==case}
 summary.append({'case':case,'simulated_events':data,'instructions_identical':len({d['Ir'] for d in data.values()})==1})
(s/'cache-model-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
