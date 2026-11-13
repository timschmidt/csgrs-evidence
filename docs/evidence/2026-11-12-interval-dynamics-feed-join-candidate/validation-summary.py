from pathlib import Path
import json,re,subprocess
out=Path('/tmp/interval-refactor/dynamics-feed-join');old=Path('/tmp/interval-refactor/dynamics-axis')
summary={}
for name in ['post-review-0.log','interface-final-test.log']:
 summary[name]={'passed':sum(map(int,re.findall(r'test result: ok\. (\d+) passed',(out/name).read_text()))),'warning_lines':[l for l in (out/name).read_text().splitlines() if 'warning:' in l]}
def rows(p):return [[v.strip() for v in l.split('|')[1:-1]] for l in p.read_text().splitlines() if ' | certified | ' in l]
a=rows(old/'baseline-check-2.log');b=rows(out/'check-06.log');summary['successive_rows']=[len(a),len(b)]
summary['successive_structural_and_allocation_differences']=[{'row':i,'baseline':x,'candidate':y} for i,(x,y) in enumerate(zip(a,b)) if x[:10]+x[13:]!=y[:10]+y[13:]]
command=['cargo','+1.95.0','tree','--locked','-p','csgrs','--features','curve,stl-io,obj-io','--edges','normal','--prefix','none']
graph=subprocess.check_output(command,text=True);(out/'successive-dependencies.txt').write_text(graph)
previous=(old/'candidate-successive-dependencies.txt').read_text();summary['successive_graph_identical_to_prior_candidate']=graph==previous
summary['successive_graph_absent']=[name for name in ['hyperpath','hyperdynamics'] if name not in graph]
summary['final_checks']=json.loads((out/'checks.json').read_text())
summary['acceptance']='not accepted: owner binary increases by 143,168 bytes; several parser timing regressions persist; full monomorphized qualification remains open'
(out/'validation-summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v for k,v in summary.items() if k!='final_checks'},indent=2))
