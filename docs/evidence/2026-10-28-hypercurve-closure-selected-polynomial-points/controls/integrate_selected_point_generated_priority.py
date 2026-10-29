from pathlib import Path
import ast, importlib.util, json, os, re, subprocess, sys, time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1]; c=r/'controls'; point=r/'selected-polynomial-points'; diagnostic=r/'selected-point-fillets'
prior='e404d59bc951b020b96ad6efd093edf98c6b95b6'
def save(p,x): p.write_text(json.dumps(x,indent=2)+'\n')
def git(w,*args,env=None): return subprocess.check_output(['git',*args],cwd=w,env=env,text=True).strip()
def snapshot(w):
 spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);return e.source_snapshot()
probe=json.loads((c/'selected-point-fillets-generated-shared1/complete.json').read_text())
assert probe['all_passed'] and probe['groups']==11
assert snapshot(diagnostic)[0]==probe['source']
assert snapshot(point)[0]==json.loads((c/'selected-polynomial-points-fix13/source-before.json').read_text())
children={'selected-query-derivatives':['crates/hypercurve/tests/selected_query_derivatives.rs'],'selected-field-root-discovery':['crates/hypersolve/src/ordered_field_roots/complete.rs','crates/hypersolve/tests/selected_polynomial_root_discovery.rs'],'rational-query-guards':['crates/hypercurve/tests/rational_query_guards.rs']}
before={}
for name in children:
 w=r/name;assert git(w,'rev-parse','HEAD')==prior
 before[name]=set(git(w,'diff','--name-only','HEAD').splitlines());assert len(before[name])=={'selected-query-derivatives':6,'selected-field-root-discovery':7,'rational-query-guards':4}[name]
 assert not git(w,'ls-files','--others','--exclude-standard')
 (c/(name+'-before-generated-priority.patch')).write_bytes(subprocess.check_output(['git','diff','--binary','HEAD'],cwd=w))
 (c/(name+'-prepared-before-generated-priority.json')).write_bytes((c/(name+'-prepared.json')).read_bytes())
changed='crates/hypercurve/src/bezier_offset/algebraic_chord/tangent.rs'
old='  selected-quintic Boolean composition.\n'
new=old+'  Scalar, finite and batched chord predicates reuse certified cardinal-support\n  evidence before joining selected fields, preserving generated-line overlap,\n  restriction and reversal.\n'
for w in [point,*[r/name for name in children]]:
 (w/changed).write_bytes((diagnostic/changed).read_bytes())
 p=w/'crates/hypercurve/CHANGELOG.md';s=p.read_text();assert s.count(old)==1;p.write_text(s.replace(old,new))
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=point,check=True)
source,files,patch=snapshot(point);assert len(git(point,'diff','--name-only','HEAD').splitlines())==34
assert not git(point,'ls-files','--others','--exclude-standard')
index=c/'selected-query-derivatives-source5.index';assert not index.exists();env={**os.environ,'GIT_INDEX_FILE':str(index)}
subprocess.run(['git','read-tree','HEAD'],cwd=point,env=env,check=True);subprocess.run(['git','add','-A'],cwd=point,env=env,check=True)
tree=git(point,'write-tree',env=env);parent=git(point,'rev-parse','HEAD');checkpoint=git(point,'commit-tree',tree,'-p',parent,'-m','Checkpoint selected point queries with shared native chord proof priority',env=env)
subprocess.run(['git','update-ref','refs/heads/checkpoint-selected-query-derivatives-source5',checkpoint,'0'*40],cwd=point,check=True)
for name,additions in children.items():
 w=r/name;subprocess.run(['git','reset','--mixed',checkpoint],cwd=w,check=True);subprocess.run(['git','add','-N',*additions],cwd=w,check=True)
 assert set(git(w,'diff','--name-only','HEAD').splitlines())==before[name]
 p=c/(name+'-prepared.json');data=json.loads(p.read_text());data.update(checkpoint=checkpoint,checkpoint_tree=tree,point_source=source,parent=checkpoint,point_source_checkpoint=checkpoint,previous_checkpoint=prior,files_identical=True,epoch=time.time(),scope='Private point checkpoint retains shared certified cardinal-support priority. Child implementation changes preserved; final point receipt alignment remains pending.');save(p,data)
scripts=['run_selected_polynomial_points_qualification.py','close_selected_polynomial_points.py','probe_polynomial_operations_points.py','probe_selected_query_derivative_frontier.py','finalize_selected_polynomial_points.py','run_selected_query_derivatives_qualification.py','close_selected_query_derivatives.py','probe_polynomial_operations_derivatives.py','align_selected_query_derivatives.py','finalize_selected_query_derivatives.py','run_selected_field_root_discovery_qualification.py','qualify_selected_field_root_discovery.py','close_selected_field_root_discovery.py','probe_polynomial_operations_roots.py','align_selected_field_root_discovery.py','finalize_selected_field_root_discovery.py']
for name in scripts:
 p=c/name;s=p.read_text()
 for old,new in [('selected-polynomial-points-fix13','selected-polynomial-points-fix14'),("default='fix13'","default='fix14'"),('selected-query-derivatives-fix8','selected-query-derivatives-fix9'),('selected-query-derivatives-preflight-6','selected-query-derivatives-preflight-7'),('selected-field-root-discovery-fix4','selected-field-root-discovery-fix5'),('selected-field-root-discovery-preflight-3','selected-field-root-discovery-preflight-4'),('qualification-final5','qualification-final6'),('closeout-final5','closeout-final6'),("'final5'","'final6'")]: s=s.replace(old,new)
 s=re.sub(r'(selected-field-root-discovery-qualification-)final\d+',r'\g<1>final4',s)
 if name=='finalize_selected_field_root_discovery.py':
  # Correct the older dynamic NAME reference as well as literal references.
  s=re.sub(r"NAME \+ '-qualification-final\d+'", "NAME + '-qualification-final4'",s)
 if name=='run_selected_polynomial_points_qualification.py': s=s.replace("complete['groups']==22","complete['groups']==23")
 if name=='qualify_selected_field_root_discovery.py':
  s=s.replace("'polynomial_point_order','polynomial_closure_composition'","'polynomial_point_order','polynomial_generated_lines','polynomial_closure_composition'").replace('thirteen selected curve consumers','fourteen selected curve consumers')
 if name=='finalize_selected_polynomial_points.py':
  s=s.replace("IMPLEMENTATION = {","IMPLEMENTATION = {'"+changed+"', ",1)
  s=s.replace("focused['groups'] == 22","focused['groups'] == 23")
  s=s.replace("prefixes = [", "prefixes = ['selected-point-generated-lines-review', ",1)
  s=s.replace("for name in ['selected-point-quintic-contract.json'", "for name in ['selected-point-generated-lines-contract.json', 'integrate_selected_point_generated_priority.py', 'fix_selected_point_generated_priority.py', 'probe_selected_point_tail.py', 'selected-point-quintic-contract.json'")
  s=s.replace('All four original cases are included in the 22-group focused run.','All four earlier cases and the ten original generated-line cases are included\nin the 23-group focused run. Shared scalar, finite and batched chord dispatch\nconsumes existing certified cardinal-support evidence before the general\ndeterminant; original overlap, restriction and reversal retain their meaning.')
  s=s.replace('Matched compiler/release observations, original interrupted broad runs and stacks are retained; no general speed claim.','Shared scalar, finite and batched chord dispatch consumes existing certified cardinal-support evidence before general field joining; all ten original generated-line cases complete. Initial refinement-only priority left the overlap case slow and is retained as an incomplete attempt. Matched compiler/release observations, original interrupted broad runs and stacks are retained; no general speed claim.')
 ast.parse(s);p.write_text(s)
p=c/'probe_selected_polynomial_points.py';s=p.read_text();needle="e.save_json(record/'complete.json'";assert s.count(needle)==1
s=s.replace(needle,"run('native-generated-lines',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','polynomial_generated_lines'],300)\n"+needle);ast.parse(s);p.write_text(s)
p=c/'selected-point-generated-lines-contract.json';data=json.loads(p.read_text());data.update(checkpoint=checkpoint,status='Shared native axis proof priority passes all ten unchanged generated-line cases. Initial and partial failures retained. Fresh full qualification required.',epoch=time.time());save(p,data)
p=c/'selected-polynomial-points-contract.json';data2=json.loads(p.read_text());data2['generated_line_priority_followup']=data;save(p,data2)
record={'checkpoint':checkpoint,'tree':tree,'point':source,'children':{name:snapshot(r/name)[0] for name in children},'diagnostic':probe,'epoch':time.time()};save(c/'selected-point-generated-lines-integration.json',record);print(json.dumps(record,indent=2))
