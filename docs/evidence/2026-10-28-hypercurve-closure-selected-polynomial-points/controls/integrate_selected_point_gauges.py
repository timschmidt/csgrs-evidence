from pathlib import Path
import ast,importlib.util,json,os,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';point=r/'selected-polynomial-points';diagnostic=r/'selected-point-fillets'
prior='00b29f5fe1943dab144b33ed1e0ce2617b96b025'
def save(p,x):p.write_text(json.dumps(x,indent=2)+'\n')
def git(w,*args,env=None):return subprocess.check_output(['git',*args],cwd=w,env=env,text=True).strip()
def snapshot(w):
 spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);return e.source_snapshot()
probe=json.loads((c/'selected-point-regressions-gauges2/complete.json').read_text())
predecessors=json.loads((c/'selected-point-predecessors-gauges2/complete.json').read_text())
lint=json.loads((c/'selected-point-gauges-preflight-1/complete.json').read_text())
assert probe['all_passed'] and probe['groups']==8
assert predecessors['all_passed'] and predecessors['groups']==15
assert lint['exit_code']==0 and lint['source_stable']
assert probe['source']==predecessors['source']==lint['source']==snapshot(diagnostic)[0]
assert snapshot(point)[0]==json.loads((c/'selected-polynomial-points-fix14/source-before.json').read_text())
children={'selected-query-derivatives':(6,['crates/hypercurve/tests/selected_query_derivatives.rs']), 'selected-field-root-discovery':(7,['crates/hypersolve/src/ordered_field_roots/complete.rs','crates/hypersolve/tests/selected_polynomial_root_discovery.rs']), 'rational-query-guards':(4,['crates/hypercurve/tests/rational_query_guards.rs']), 'selected-join-correspondence':(8,[])}
before={}
for name,(count,_) in children.items():
 w=r/name;assert git(w,'rev-parse','HEAD')==prior
 before[name]=set(git(w,'diff','--name-only','HEAD').splitlines());assert len(before[name])==count
 assert not git(w,'ls-files','--others','--exclude-standard')
 (c/(name+'-before-projective-gauges.patch')).write_bytes(subprocess.check_output(['git','diff','--binary','HEAD'],cwd=w))
 (c/(name+'-prepared-before-projective-gauges.json')).write_bytes((c/(name+'-prepared.json')).read_bytes())
for name in ['crates/hypercurve/src/bezier_offset/rational_form.rs','crates/hypercurve/src/polynomial_point.rs']:
 assert (diagnostic/name).read_bytes()==(point/name).read_bytes()
shared=['crates/hypercurve/src/bezier_offset.rs','crates/hypercurve/src/bezier_offset/algebraic_chord/points.rs','crates/hypercurve/src/bezier_offset/algebraic_chord/tangent.rs','crates/hypercurve/src/bezier_offset/projective_gauge_tests.rs','crates/hypercurve/src/bezier_offset/recursive_quadratic.rs','crates/hypercurve/tests/support/joint_form_arithmetic.rs','docs/MIGRATIONS.md']
fixed='''
- Normalize signed homogeneous point weights before shared orientation and
  coordinate predicates. Supporting-line intersections transport their tangent
  certificate through retained-support reversals, and cardinal displacements
  preserve the sign of the imported endpoint representation.
'''
migration='''
- Independent selected-fiber rational queries now compose through distinct
  retained generators. Callers that handled `Blocked(Unsupported)` for two
  different selectors can receive an exact result. The opposite-root fixture
  retains its original geometry and now requires the exact negative product,
  separate source selections, policy certainty and replayed equations.'''
base_catalog=json.loads((point/'crates/hypercurve/qualification/capabilities.json').read_text())
base_rows=base_catalog['fixtures'];assert len(base_rows)==284
fixture={'id':'opposite_fiber_query_composition','target':'joint_form_arithmetic','test':'different_fiber_selectors_do_not_merge','owner':'Hypercurve source-bound rational queries and Hypersolve selected-field joins','properties':['P2','P14','P18','P19','P20'],'domain':'u>0 with u^2=1/8 and separately selected opposite roots v^2=u; product, sum and point-definition replay.','origins':['authored','generated','selected_implicit'],'families':['ImplicitPolynomial'],'policies':['STRICT','APPROXIMATE_512'],'semantics':'A formerly unsupported composition now returns certified exact arithmetic while retaining the two original distinct selectors. No general region or corner closure claim.','claims':[{'stage':'representation','outcome':'exact_success','assertion':'Both original operands and distinct selected-root sources remain identifiable.'},{'stage':'incidence_order','outcome':'exact_success','assertion':'The roots have opposite signs; their product is negative, its square is 1/8, the product plus u and the root sum are zero.'},{'stage':'exact_replay','outcome':'exact_success','assertion':'Point-definition replay retains those defining relations and further exact arithmetic.'}],'oracle':'Independent equations v_minus*v_plus=-u, v_minus+v_plus=0 and u^2=1/8, checked through strict/approximate/strict policy transitions with certified receipts.','timeout_seconds':180}
for w in [point,*[r/name for name in children]]:
 for name in shared:(w/name).write_bytes((diagnostic/name).read_bytes())
 p=w/'crates/hypercurve/CHANGELOG.md';s=p.read_text();assert fixed not in s and migration.strip() not in s
 s=s.replace('## [0.4.0] - Unreleased\n','## [0.4.0] - Unreleased\n'+fixed,1)
 s=s.replace('### Breaking\n','### Breaking\n'+migration+'\n',1);p.write_text(s)
 p=w/'crates/hypercurve/qualification/capabilities.json';d=json.loads(p.read_text());assert d['fixtures'][:284]==base_rows
 d['fixtures'].insert(284,fixture);save(p,d)
 subprocess.run(['git','add','-N','crates/hypercurve/src/bezier_offset/projective_gauge_tests.rs'],cwd=w,check=True)
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=point,check=True)
source,files,patch=snapshot(point);assert len(git(point,'diff','--name-only','HEAD').splitlines())==39
assert not git(point,'ls-files','--others','--exclude-standard')
for name in shared:assert (point/name).read_bytes()==(diagnostic/name).read_bytes()
index=c/'selected-query-derivatives-source6.index';assert not index.exists();env={**os.environ,'GIT_INDEX_FILE':str(index)}
subprocess.run(['git','read-tree','HEAD'],cwd=point,env=env,check=True);subprocess.run(['git','add','-A'],cwd=point,env=env,check=True)
tree=git(point,'write-tree',env=env);parent=git(point,'rev-parse','HEAD');checkpoint=git(point,'commit-tree',tree,'-p',parent,'-m','Checkpoint selected query closure with certified projective sign transport',env=env)
subprocess.run(['git','update-ref','refs/heads/checkpoint-selected-query-derivatives-source6',checkpoint,'0'*40],cwd=point,check=True)
for name,(_,additions) in children.items():
 w=r/name;subprocess.run(['git','reset','--mixed',checkpoint],cwd=w,check=True)
 if additions:subprocess.run(['git','add','-N',*additions],cwd=w,check=True)
 assert set(git(w,'diff','--name-only','HEAD').splitlines())==before[name]
 p=c/(name+'-prepared.json');d=json.loads(p.read_text());d.update(checkpoint=checkpoint,checkpoint_tree=tree,point_source=source,parent=checkpoint,point_source_checkpoint=checkpoint,previous_checkpoint=prior,files_identical=True,epoch=time.time(),scope='Private point checkpoint includes construction-level projective sign transport and the opposite-selector exact capability migration. Child implementation preserved; fresh affected qualification and final parent receipt alignment remain required.');save(p,d)
record={'checkpoint':checkpoint,'tree':tree,'point':source,'children':{name:snapshot(r/name)[0] for name in children},'diagnostic':probe,'predecessors':predecessors,'preflight':lint,'shared_files':shared,'point_implementation':git(point,'diff','--name-only','HEAD').splitlines(),'epoch':time.time()}
save(c/'selected-point-gauges-integration.json',record)
s=json.loads((r/'SESSION_STATE.json').read_text());s['selected_point_full_regressions'].update(integration=record,checkpoint=checkpoint,status='Original and minimized regressions, fourteen predecessor cases and strict MSRV pass. Correction integrated into point and all four children. Fresh complete qualification remains required; no final commits or pushes.',source_frozen=True);s['last_update_epoch']=time.time();save(r/'SESSION_STATE.json',s)
print(json.dumps(record,indent=2))
