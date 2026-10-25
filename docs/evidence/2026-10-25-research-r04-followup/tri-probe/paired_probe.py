from pathlib import Path
import hashlib,itertools,json,os,signal,subprocess,time,sys
p=Path(__file__).resolve().parent
out=p/(sys.argv[1] if len(sys.argv)>1 else 'paired')
out.mkdir(exist_ok=False);(out/'rows').mkdir()
pairs=int(sys.argv[2]) if len(sys.argv)>2 else 30
cases=list(itertools.product(range(8),['forward','reverse'],['strict','approximate']))
manifest={'pairs':pairs,'cases':cases,'samples_per_process':20,'warm_samples':list(range(10,20)),'timeout_seconds':120,'status':'running','timing':'earcut only; independent area, positive-triangle and boundary-incidence validation outside timer','cache':'sample 0 fresh process; later samples reuse input; outputs dropped every sample; no artificial cache clear','allocator':'System requested allocation/reallocation bytes, calls, live and peak','artifact':'complete ordered triangle indices over identical source fixtures; all orientations, exact area and boundary incidence independently validated'}
manifest['binaries']={v:hashlib.sha256((p/(v+'-probe')).read_bytes()).hexdigest() for v in ['baseline','candidate']}
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
with (out/'journal.jsonl').open('w',buffering=1) as journal:
 for pair in range(pairs):
  for kind,direction,policy in cases:
   case=f'{kind}-{direction}-{policy}';results={}
   for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
    tag=f'{pair:02}-{case}-{variant}';exact=out/'rows'/(tag+'.json');cmd=[str(p/(variant+'-probe')),str(kind),direction,policy,str(exact)];start=time.time()
    journal.write(json.dumps({'event':'start','tag':tag,'command':cmd,'epoch':start})+'\n')
    with (out/(tag+'.jsonl')).open('w') as log,(out/(tag+'.stderr')).open('w') as err:
     process=subprocess.Popen(cmd,stdout=log,stderr=err,start_new_session=True)
     try:code=process.wait(timeout=120)
     except subprocess.TimeoutExpired:os.killpg(process.pid,signal.SIGKILL);process.wait();code='timeout'
    record={'event':'finish','tag':tag,'code':code,'seconds':time.time()-start}
    if code==0:
     record.update(output_bytes=exact.stat().st_size,output_sha256=hashlib.sha256(exact.read_bytes()).hexdigest())
     results[variant]=(exact,[json.loads(l) for l in (out/(tag+'.jsonl')).read_text().splitlines()])
    journal.write(json.dumps(record)+'\n')
    if code!=0:raise SystemExit(f'{tag}: {code}')
   a,ar=results['baseline'];b,br=results['candidate']
   assert a.read_bytes()==b.read_bytes(),f'exact rows differ: {pair} {case}'
   assert len(ar)==len(br)==20
   for x,y in zip(ar,br):
    assert (x['certainty'],x['checksum'],x['output_size'])==(y['certainty'],y['checksum'],y['output_size']),(pair,case,x,y)
   journal.write(json.dumps({'event':'exact-match','pair':pair,'case':case,'samples':20})+'\n')
   if pair>0:a.unlink();b.unlink()
  print('completed pair',pair,flush=True)
manifest['status']='completed';(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
