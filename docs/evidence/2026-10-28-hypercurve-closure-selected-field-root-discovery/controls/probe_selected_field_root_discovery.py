from pathlib import Path
import hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-query-derivatives';record=c/'selected-field-root-discovery-frontier1';record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);before,files,patch=e.source_snapshot();focus=c/'selected-query-derivatives-fix5'
assert before==json.loads((focus/'source-before.json').read_text());e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
source=(w/'crates/hypersolve/tests/selected_polynomial_fields.rs').read_text();support=record/'support';support.mkdir();(support/'recursive_quadratic.rs').write_bytes((w/'crates/hypersolve/tests/support/recursive_quadratic.rs').read_bytes())
extra='''
#[test]
fn selected_field_simple_root_discovery_control() {
    use hypersolve::{isolate_ordered_field_polynomial_roots,OrderedFieldRootIsolationConfig,OrderedFieldRootIsolationStatus};
    use hypersolve::selected_polynomial_field::SelectedPolynomialContext;
    let q=base();let parent=select(&q,coefficients(&q,&[-2,0,0,1]),1,2);let a=parent.generator().unwrap();
    let polynomial=vec![a.scale(&real(-1)).unwrap(),parent.constant(real(0)).unwrap(),parent.constant(real(0)).unwrap(),parent.constant(real(1)).unwrap()];
    let policy=TestContext::strict();let mut context=SelectedPolynomialContext {field:parent.clone(),policy:&policy};
    let report=isolate_ordered_field_polynomial_roots(polynomial.clone(),&real(1),&real(2),OrderedFieldRootIsolationConfig::default(),&mut context).unwrap();
    eprintln!("simple status={:?}, intervals={}",report.status,report.intervals.len());
    assert_eq!(report.status,OrderedFieldRootIsolationStatus::Isolated);assert_eq!(report.intervals.len(),1);
    let interval=&report.intervals[0];let selected=decided(parent.select(polynomial,interval.lower.clone(),interval.upper.clone(),&policy).unwrap());let b=selected.generator().unwrap();
    is_zero(&power(&b,3).subtract(&selected.lift(&a).unwrap()).unwrap());is_zero(&power(&b,9).subtract(&selected.constant(real(2)).unwrap()).unwrap());
    let graph=hypersolve::selected_polynomial_field::SelectedPolynomialDefinition::from_values(&[b.clone(),selected.lift(&a).unwrap()],10000).unwrap();
    let values=decided(graph.replay(10000,&policy).unwrap());is_zero(&power(&values[0],3).subtract(&values[1]).unwrap());
}
#[test]
fn selected_field_repeated_root_discovery_frontier() {
    use hypersolve::{isolate_ordered_field_polynomial_roots,OrderedFieldRootIsolationConfig,OrderedFieldRootIsolationStatus};
    use hypersolve::selected_polynomial_field::SelectedPolynomialContext;
    let q=base();let parent=select(&q,coefficients(&q,&[-2,0,0,1]),1,2);let a=parent.generator().unwrap();
    let mut polynomial=coefficients(&parent,&[0,0,0,0,0,0,1]);polynomial[0]=power(&a,2);polynomial[3]=a.scale(&real(-2)).unwrap();
    // (t^3-a)^2 has exactly one distinct real root in (1,2). Selection with a
    // supplied interval works; automatic discovery must preserve multiplicity.
    let selected=select(&parent,polynomial.clone(),1,2);is_zero(&power(&selected.generator().unwrap(),3).subtract(&selected.lift(&a).unwrap()).unwrap());
    let policy=TestContext::strict();let mut context=SelectedPolynomialContext {field:parent.clone(),policy:&policy};
    let report=isolate_ordered_field_polynomial_roots(polynomial,&real(1),&real(2),OrderedFieldRootIsolationConfig {max_subdivision_depth:12,refinement_steps:8},&mut context).unwrap();
    eprintln!("repeated status={:?}, intervals={}",report.status,report.intervals.len());
    assert_eq!(report.status,OrderedFieldRootIsolationStatus::Isolated,"complete selected-root discovery is still required");assert_eq!(report.intervals.len(),1);
}
'''
a=source.index('#[test]\nfn elliptic_corner_contact_keeps_original_curve_distance_and_selected_side()');b=source.index('\n#[test]',a+1);contact=source[a:b].replace('fn elliptic_corner_contact_keeps_original_curve_distance_and_selected_side()','fn selected_field_elliptic_contact_discovery_frontier()')
old='''    let field = select(&parent, equation, -2, -1);'''
new='''    let policy=TestContext::strict();
    let mut context=hypersolve::selected_polynomial_field::SelectedPolynomialContext {field:parent.clone(),policy:&policy};
    let report=hypersolve::isolate_ordered_field_polynomial_roots(equation.clone(),&real(-4),&real(4),hypersolve::OrderedFieldRootIsolationConfig::default(),&mut context).unwrap();
    eprintln!("contact status={:?}, intervals={}",report.status,report.intervals.len());
    assert_eq!(report.status,hypersolve::OrderedFieldRootIsolationStatus::Isolated);
    assert_eq!(report.intervals.len(),2);
    let interval=report.intervals.iter().find(|interval| interval.upper<real(-1)).expect("original left/down contact must be discovered");
    let field=decided(parent.select(equation,interval.lower.clone(),interval.upper.clone(),&policy).unwrap());'''
assert old in contact;contact=contact.replace(old,new).replace('    let equation = contact','    let equation: Vec<_> = contact');test=record/'original.rs';test.write_text(source+extra+contact)
artifacts=[]
for line in (focus/'compile.log').read_text().splitlines():
 try:artifacts.append(json.loads(line))
 except json.JSONDecodeError:pass
libs={name:Path(next(f for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']==name for f in row['filenames'] if f.endswith('.rlib'))) for name in ['hyperreal','hyperlimit','hypersolve']};hashes={n:hashlib.sha256(p.read_bytes()).hexdigest() for n,p in libs.items()};binary=record/'original'
command=['rustc','+1.98.1','--edition=2024','--test','-C','opt-level=3',str(test),'-L','dependency='+str(libs['hypersolve'].parent),'-o',str(binary)]
for n,p in libs.items():command+=['--extern',n+'='+str(p)]
rows=[]
for name,cmd in [('compile',command)]+[(n,[str(binary),n,'--exact','--nocapture']) for n in ['selected_field_simple_root_discovery_control','selected_field_repeated_root_discovery_frontier','selected_field_elliptic_contact_discovery_frontier']]:
 start=time.time()
 with (record/(name+'.log')).open('w') as log:
  process=subprocess.Popen(cmd,cwd=w,stdout=log,stderr=subprocess.STDOUT,start_new_session=True);e.save_json(record/'active.json',{'pid':process.pid,'name':name,'command':cmd,'epoch':start})
  try:code=process.wait(timeout=300)
  except subprocess.TimeoutExpired:os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
 row={'name':name,'command':cmd,'exit_code':code,'elapsed_seconds':time.time()-start,'external_timeout_seconds':300};rows.append(row);e.save_json(record/'results.json',rows);print(row,flush=True)
 if name=='compile':assert code==0
assert e.source_snapshot()[0]==before and hashes=={n:hashlib.sha256(p.read_bytes()).hexdigest() for n,p in libs.items()}
e.save_json(record/'attribution.json',{'source':before,'source_stable':True,'libraries':{n:{'path':str(p),'sha256':hashes[n]} for n,p in libs.items()},'compile_record':str(focus/'compile.log'),'scope':'Read-only frontier probe of existing ordered-field isolation, field selection and scalar replay. It does not establish geometric corner construction or complete root-discovery support.'})
for row in rows[1:]:print((record/(row['name']+'.log')).read_text(),flush=True)
