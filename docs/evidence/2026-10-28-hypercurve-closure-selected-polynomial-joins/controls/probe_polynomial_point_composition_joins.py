from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-polynomial-joins';record=c/'polynomial-point-composition-baseline2';record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();expected=json.loads((c/'selected-polynomial-joins-qualification-final1/source-before.json').read_text());assert before==expected
attribution=json.loads((c/'polynomial-operation-frontier-joins1/attribution.json').read_text());assert attribution['source']==before
assert json.loads((c/'selected-polynomial-joins-qualification-final1/complete.json').read_text())['all_passed']
(record/'original.rs').write_bytes((c/'polynomial-point-composition-tests.rs').read_bytes());e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
libs={'hypercurve':Path(attribution['library_build']['library']),'hypersolve':Path(attribution['solver'])};deps=libs['hypersolve'].parent
def hashes():return {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in libs.values()}
hashes_before=hashes();assert hashes_before[str(libs['hypercurve'])]==attribution['library_build']['library_sha256'];assert hashes_before[str(libs['hypersolve'])]==attribution['solver_sha256'];binary=record/'original';command=['rustc','+1.98.1','--edition=2024','--test','-C','opt-level=3',str(record/'original.rs'),'--crate-name','polynomial_point_composition_baseline','-L','dependency='+str(deps)]
for name,path in libs.items():command += ['--extern',name+'='+str(path)]
command += ['-o',str(binary)]
commands=[('compile',command)]+[(name,[str(binary),name,'--exact','--nocapture']) for name in ['independent_polynomial_point_sources_satisfy_original_equations','independent_polynomial_point_queries_compose_and_replay','independent_polynomial_point_zero_divisor_stays_invalid']]
rows=[]
for name,command in commands:
 start=time.time()
 with (record/(name+'.log')).open('w') as out:p=subprocess.run(command,cwd=w,stdout=out,stderr=subprocess.STDOUT,timeout=120)
 after,af,_=e.source_snapshot();rows.append({'name':name,'command':command,'exit_code':p.returncode,'elapsed_seconds':time.time()-start,'source_stable':before==after});e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af)
 print(rows[-1],flush=True);assert after==before
 if name=='compile':assert p.returncode==0
assert hashes_before==hashes()
e.save_json(record/'attribution.json',{'source':before,'libraries_sha256':hashes_before,'compiled_under':'polynomial-operation-frontier-joins1/build.jsonl','read_only_library_reuse':True,'cargo_builds_started':0,'note':'This point-consumer frontier is on the fully qualified join candidate. It confirms that scalar joins alone do not close public point arithmetic. Reproduce again after later source changes before implementing the affected consumer.'})
assert [row['exit_code'] for row in rows]==[0,0,101,0]
failed=(record/'independent_polynomial_point_queries_compose_and_replay.log').read_text();assert 'Blocked(ExactCurveBlocker' in failed and 'reason: Unsupported' in failed
e.save_json(record/'complete.json',{'source':before,'controls_passed':2,'composition':'Unsupported','all_expected_outcomes_reproduced':True,'epoch':time.time()})
