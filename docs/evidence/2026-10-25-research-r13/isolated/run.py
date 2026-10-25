from pathlib import Path
import subprocess,os,time,json,signal,re,collections,hashlib
p=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r13-isolated');env=os.environ.copy();env['CARGO_TARGET_DIR']='/tmp/csgrs-r13-isolated-target';env['CCACHE_DIR']='/tmp/csgrs-r13-isolated-ccache';env['CCACHE_TEMPDIR']=env['CCACHE_DIR']+'/tmp';env['PROPTEST_RNG_SEED']='20261025';Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
checks=[('boolean-stroke-fuzz',['cargo','test','--offline','--locked','--release','-p','hypercurve','--all-features','--test','hypercurve_curve_region_boolean','--test','hypercurve_curve_region_stroke','--test','hypercurve_curve_region_boolean_fuzz','--','--nocapture','--test-threads=1'],1800),('selected-successors',['cargo','test','--offline','--locked','--release','-p','hypercurve','--all-features','--lib','curve_region_boolean::certified_successor_tests','--','--nocapture','--test-threads=1'],900),('modeling-continuation',['cargo','test','--offline','--locked','--release','-p','csgrs','--all-features','--test','downstream_profiles','--test','mixed_modeling_profiles','--test','enclosure_workflows','--test','receipt_composition','--','--nocapture','--test-threads=1'],1800),('pcb-continuation',['cargo','test','--offline','--locked','--release','-p','hypercircuit','--all-features','--test','easyduino','--test','workflow','--test','curved_outline','--test','stitching','--test','routing_corpus','--test','board_boundary_receipts','--','--nocapture','--test-threads=1'],1800)]
before=hashlib.sha256(subprocess.check_output(['git','diff','--binary'],cwd=root)).hexdigest();summary=[]
with (p/'journal.jsonl').open('x',buffering=1) as journal:
 for name,cmd,limit in checks:
  start=time.time();journal.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'target':env['CARGO_TARGET_DIR'],'seed':env['PROPTEST_RNG_SEED'],'epoch':start,'timeout_seconds':limit})+'\n');print('START',name,flush=True)
  with (p/(name+'.log')).open('x') as log:
   proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   try:code=proc.wait(timeout=limit)
   except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='timeout'
  text=(p/(name+'.log')).read_text();events=[dict(re.findall(r'(\w+)=([^\s]+)',line)) for line in text.splitlines() if 'R13_SITE ' in line]
  (p/(name+'-events.json')).write_text(json.dumps(events,indent=2)+'\n');counts=collections.Counter((x['phase'],x['incoming'],x['outgoing'],x['missing'],x['valid_claims'],x['distinct'],x['incidence'],x['one_remaining']) for x in events)
  row={'event':'finish','name':name,'code':code,'seconds':time.time()-start,'sites':len(events),'one_remaining':sum(x['one_remaining']=='true' for x in events),'counts':[{'state':list(k),'count':v} for k,v in sorted(counts.items())],'test_results':re.findall(r'test result: .*',text)};journal.write(json.dumps(row)+'\n');summary.append(row);(p/'summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(name,code,'sites',len(events),'one_remaining',row['one_remaining'],flush=True)
  if code!=0:raise SystemExit(1)
after=hashlib.sha256(subprocess.check_output(['git','diff','--binary'],cwd=root)).hexdigest();assert before==after;(p/'source-stability.json').write_text(json.dumps({'before':before,'after':after})+'\n')
