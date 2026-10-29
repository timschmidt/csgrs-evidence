from pathlib import Path
import hashlib, importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-point-fillets';record=c/'selected-join-correspondence-baseline1';record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();producer=c/'selected-point-fillets-generated-shared1';assert source==json.loads((producer/'source-before.json').read_text());assert json.loads((producer/'complete.json').read_text())['all_passed']
e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
text=(w/'crates/hypersolve/tests/selected_polynomial_join_retention.rs').read_text().replace('"support/recursive_quadratic.rs"',json.dumps(str((w/'crates/hypersolve/tests/support/recursive_quadratic.rs').resolve())))
text+='''
#[test]
fn consuming_the_original_second_operand_keeps_its_certified_generator() {
    let context = TestContext::strict();
    let a = root(2);
    let b = root(3);
    let ab = value(a.joined_with(&b, &context).unwrap());
    assert_eq!(depth(ab.field()), 2);
    let again = value(ab.field().joined_with(&b, &context).unwrap());
    let image = again.embed(&b.generator().unwrap()).unwrap();
    assert_eq!(
        image.multiply(&image).unwrap().multiply(&image).unwrap()
            .subtract(&again.field().constant(real(3)).unwrap()).unwrap()
            .sign(&context).unwrap(),
        Classification::Decided(hyperreal::RealSign::Zero)
    );
    assert_eq!(depth(again.field()), 2,
        "a validated original generator correspondence must survive later joins");
}
'''
(record/'original.rs').write_text(text)
artifacts=[]
for line in (producer/'compile.log').read_text().splitlines():
 try:artifacts.append(json.loads(line))
 except json.JSONDecodeError:pass
libs={}
for name in ['hypersolve','hyperreal','hyperlimit']:
 item=next(x for x in artifacts if x.get('reason')=='compiler-artifact' and x['target']['name']==name)
 libs[name]=Path(next(f for f in item['filenames'] if f.endswith('.rlib')))
def hashes():return {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in libs.values()}
original_hashes=hashes();binary=record/'original';command=['rustc','+1.98.1','--edition=2024','--test','-C','opt-level=3',str(record/'original.rs'),'--crate-name','selected_join_correspondence_baseline','-L','dependency='+str(libs['hypersolve'].parent)]
for name,path in libs.items():command+=['--extern',name+'='+str(path)]
command+=['-o',str(binary)];rows=[]
for name,command in [('compile',command),('original-first-operand-control',[str(binary),'a_native_base_already_containing_all_sources_keeps_polynomial_ancestry','--exact','--nocapture']),('original-second-operand',[str(binary),'consuming_the_original_second_operand_keeps_its_certified_generator','--exact','--nocapture'])]:
 start=time.time()
 with (record/(name+'.log')).open('w') as out:
  p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(record/'active.json',{'pid':p.pid,'name':name,'command':command,'started_epoch':start})
  try:code=p.wait(timeout=60)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
 after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-start,'source_stable':source==after,'external_timeout_seconds':60};rows.append(row);e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);print(row,flush=True);assert source==after and hashes()==original_hashes
 if name=='compile':assert code==0
out={'source':source,'compiled_producer':str(producer),'library_sha256':original_hashes,'libraries_stable':hashes()==original_hashes,'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'cargo_builds_started':0,'all_expected_outcomes_reproduced':[row['exit_code'] for row in rows]==[0,0,101],'scope':'Original first operand reuses retained ancestry; consuming the original second operand is checked for preserved known generator correspondence, exact cubic value and avoidable field-depth growth. This is a missing computational-closure witness, not a false geometric answer. No implementation change.','epoch':time.time()};e.save_json(record/'complete.json',out);print(json.dumps(out,indent=2))
