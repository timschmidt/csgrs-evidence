from pathlib import Path
import json,subprocess,os,time,hashlib,math,random,statistics,shutil,threading
s=Path(__file__).parent;root=Path('/mnt/development/interval-horner-current/csgrs');out=s/'benchmark';out.mkdir(exist_ok=False)
plan=json.loads((s/'benchmark-plan.json').read_text());assert json.loads((s/plan['size_screen']).read_text())['all_screen_caps_pass']
assert json.loads((s/'runs'/plan['correctness_command']/'result.json').read_text())['exit_code']==0
for variant in ['baseline','candidate']:
 p=s/plan['artifact_directories'][variant]/'certification';meta=json.loads((p.parent/'report.json').read_text())['artifacts']['certification'];assert hashlib.sha256(p.read_bytes()).hexdigest()==meta['sha256']
runner=out/'certification';rows=[];started_all=time.monotonic()
for block in range(plan['blocks']):
 order=['baseline','candidate','candidate','baseline'] if block%2==0 else ['candidate','baseline','baseline','candidate']
 for repetition,variant in enumerate(order):
  assert time.monotonic()-started_all<plan['total_budget_seconds']
  destination=out/f'{block:02d}-{repetition}-{variant}';destination.mkdir()
  binary=s/plan['artifact_directories'][variant]/'certification';shutil.copy2(binary,runner)
  command=[str(runner),'--bench',plan['pattern'],'--sample-size',str(plan['sample_size']),'--measurement-time',str(plan['measurement_seconds']),'--warm-up-time',str(plan['warmup_seconds']),'--nresamples','10000','--noplot']
  env=os.environ|{'CRITERION_HOME':str(destination/'criterion')};started=time.monotonic();timed_out=[]
  with (destination/'output.log').open('w') as log:
   process=subprocess.Popen(command,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT)
   def expire():
    if process.returncode is None:
     timed_out.append(True)
     try:process.kill()
     except ProcessLookupError:pass
   timer=threading.Timer(plan['invocation_timeout_seconds'],expire);timer.start()
   try:
    pid,status,usage=os.wait4(process.pid,0);process.returncode=os.waitstatus_to_exitcode(status)
   finally:timer.cancel();timer.join()
  result={'block':block,'variant':variant,'repetition':repetition,'command':command,'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'wall_seconds':time.monotonic()-started,'cpu_seconds':usage.ru_utime+usage.ru_stime,'max_rss_kib':usage.ru_maxrss,'exit_code':process.returncode,'timeout':bool(timed_out),'cases':{}}
  for estimate in destination.glob('criterion/**/new/estimates.json'):
   benchmark=json.loads((estimate.parent/'benchmark.json').read_text());data=json.loads(estimate.read_text());result['cases'][benchmark['full_id']]=data['mean']['point_estimate']
  (destination/'result.json').write_text(json.dumps(result,indent=2)+'\n');rows.append(result);(out/'raw.json').write_text(json.dumps(rows,indent=2)+'\n')
  assert process.returncode==0 and not timed_out and set(result['cases'])==set(plan['cases']),result
  print(block,repetition,variant,round(result['wall_seconds'],2),flush=True)
summary={};rng=random.Random(plan['bootstrap_seed'])
for name in plan['cases']:
 differences=[]
 for block in range(plan['blocks']):
  groups={variant:[math.log(row['cases'][name]) for row in rows if row['block']==block and row['variant']==variant] for variant in ['baseline','candidate']};assert all(len(v)==2 for v in groups.values());differences.append(statistics.mean(groups['candidate'])-statistics.mean(groups['baseline']))
 bootstrap=sorted(math.exp(statistics.mean(rng.choices(differences,k=len(differences)))) for _ in range(10000))
 summary[name]={'ratio':math.exp(statistics.mean(differences)),'bootstrap_95_percent':[bootstrap[250],bootstrap[9749]],'paired_block_log_ratios':differences}
(s/'benchmark-review.json').write_text(json.dumps({'scope':plan['scope'],'estimates':summary,'raw':str(out/'raw.json'),'retention':'pending review; completed timing alone is not admission'},indent=2)+'\n')
