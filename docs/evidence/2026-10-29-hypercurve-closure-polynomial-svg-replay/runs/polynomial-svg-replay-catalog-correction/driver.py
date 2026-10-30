from pathlib import Path
import importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'polynomial-svg-replay';prior=c/'polynomial-svg-replay-qualification-final9';record=c/'polynomial-svg-replay-catalog-correction';record.mkdir()
complete=json.loads((prior/'complete.json').read_text());assert complete['all_passed'] and complete['groups']==17
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();assert before==complete['source'];e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
name='crates/hypercurve/qualification/capabilities.json';path=w/name;old=path.read_text();catalog=json.loads(old);assert json.dumps(catalog,indent=2)+'\n'==old
fixture=next(v for v in catalog['fixtures'] if v['id']=='implicit_region_limits');e.save_json(record/'old-fixture.json',fixture)
claim=next(v for v in fixture['claims'] if v['stage']=='evaluation');assert claim['outcome']=='unsupported'
fixture['domain']='The original parabola cap at zero offset, its unique trim-only chord-setback chamfer of 1/64 on each support, nonzero round offset and circular-fillet attempts, and finite projection with chord error 0.001.'
fixture['semantics']=fixture['semantics'].replace('Nonzero offsets, circular fillets and finite projection remain typed gaps on this fixture; broader corner closure is not established.','Finite display projection certifies the original 0.001 chord-error bound while preserving the exact source. Nonzero offsets and circular fillets remain typed gaps on this fixture; broader corner closure is not established.')
claim.update({'outcome':'qualified_approximation','assertion':'One closed profile retains the original cap edge; every remaining chord obeys the independent whole-parabola secant bound including emitted-coordinate errors. The exact source and subsequent zero-offset symmetric-difference identity remain unchanged.'})
fixture['oracle'] += ' Projection checks exact cap endpoints and every emitted parabola chord using delta_y^2/4 plus both exact endpoint residuals <= 0.001; display chords never replace the retained polynomial source.'
e.save_json(record/'new-fixture.json',fixture);path.write_text(json.dumps(catalog,indent=2)+'\n')
after,af,patch=e.source_snapshot();changed=[v[0] for v in af if v not in files];assert changed==[name],changed;e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);(record/'candidate.patch').write_bytes(patch)
e.save_json(record/'scope.json',{'owner':'Hypercurve capability record','properties':['P29','P36','P37','P39'],'finding':'The original finite projection test now passes its stronger whole-chord bound, while this prior fixture record still advertised Unsupported.','implementation_unchanged':True,'changed_inputs':changed,'prior_qualification':str(prior),'claim':'This updates a tested receipt; it supplies no independent proof of implementation completeness.'})
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_NET_OFFLINE':'true','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CARGO_TARGET_DIR':str(r.parent/'hypercurve-polynomial-chamfer-admission')}
matrix=['python3','crates/hypercurve/scripts/capability_matrix.py','--output',str(record/'capabilities')]
for fixture_id in json.loads((prior/'capability-selection.json').read_text()):matrix+=['--fixture',fixture_id]
commands=[('fmt',['cargo','+1.99.1','fmt','--all','--','--check']),('typos',['typos']),('diff',['git','diff','--check']),('repository-budget',['scripts/check-repository-budget.sh']),('matrix-guards',['python3','crates/hypercurve/scripts/test_capability_matrix.py']),('matrix',matrix)]
rows=[]
for name,command in commands:
 assert e.source_snapshot()[0]==after
 started=time.time()
 with (record/(name+'.log')).open('w') as log:
  proc=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True);e.save_json(record/'active.json',{'pid':proc.pid,'name':name,'command':command,'epoch':started})
  try:code=proc.wait(timeout=3600)
  except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='external_timeout'
 current=e.source_snapshot()[0];row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'source_stable':current==after};rows.append(row);e.save_json(record/'results.json',rows);assert code==0 and current==after,row
 e.save_json(record/'source-checked.json',current)
e.save_json(record/'complete.json',{'all_passed':True,'groups':len(rows),'source':after,'implementation_qualification':complete,'changed_inputs':['crates/hypercurve/qualification/capabilities.json'],'epoch':time.time()})
