from pathlib import Path
import json,hashlib,importlib.util,subprocess,time,os,sys,argparse
sys.dont_write_bytecode=True
parser=argparse.ArgumentParser();parser.add_argument('--attempt',default='2');parser.add_argument('--focus',default='fix14');args=parser.parse_args()
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-polynomial-points';record=c/('selected-query-derivative-frontier'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();assert before==json.loads((c/f'selected-polynomial-points-{args.focus}/source-before.json').read_text())
e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
artifacts=[]
for line in (c/f'selected-polynomial-points-{args.focus}/compile.log').read_text().splitlines():
 try:artifacts.append(json.loads(line))
 except json.JSONDecodeError:pass
libraries={name:Path(next(f for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']==name for f in row['filenames'] if f.endswith('.rlib'))) for name in ['hypercurve','hypersolve']}
hashes={name:hashlib.sha256(path.read_bytes()).hexdigest() for name,path in libraries.items()}
test=record/'original.rs';test.write_bytes((w/'crates/hypercurve/tests/selected_polynomial_points.rs').read_bytes()+(c/'selected-query-derivative-frontier-tests.rs').read_bytes());binary=record/'original'
command=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(test),'--crate-name','selected_query_derivative_frontier','-L','dependency='+str(libraries['hypercurve'].parent),'-o',str(binary)]
for name,path in libraries.items():command+=['--extern',name+'='+str(path)]
rows=[]
for name,cmd in [('compile',command)]+[(name,[str(binary),name,'--exact','--nocapture']) for name in ['selected_query_derivative_native_control','selected_query_derivative_native_parabola','selected_query_derivative_retained_parabola','selected_query_derivative_rational_quotient']]:
 start=time.time()
 with (record/(name+'.log')).open('w') as log: result=subprocess.run(cmd,cwd=w,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 rows.append({'name':name,'command':cmd,'exit_code':result.returncode,'elapsed_seconds':time.time()-start});e.save_json(record/'results.json',rows)
 if name=='compile':assert result.returncode==0
assert before==e.source_snapshot()[0]
assert hashes=={name:hashlib.sha256(path.read_bytes()).hexdigest() for name,path in libraries.items()}
e.save_json(record/'attribution.json',{'source':before,'libraries':{n:{'path':str(p),'sha256':hashes[n]} for n,p in libraries.items()},'source_stable':True,'compile_record':f'selected-polynomial-points-{args.focus}/compile.log'})
assert len(rows)==5 and rows[1]['exit_code']==0
for row in rows[2:]:
 assert row['exit_code']==101
 log=(record/(row['name']+'.log')).read_text()
 assert 'Blocked(ExactCurveBlocker' in log and 'reason: Unsupported' in log
e.save_json(record/'complete.json',{'source':before,'source_stable':True,'controls_passed':1,'unsupported_derivatives':3,'all_expected_outcomes_reproduced':True,'epoch':time.time()})
print(rows)
for row in rows[1:]:print(row['name'],(record/(row['name']+'.log')).read_text())
