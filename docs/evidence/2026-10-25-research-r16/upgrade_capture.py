from pathlib import Path
import json,hashlib,subprocess,time
raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r16-trace')
finished=json.loads((raw/'capture-1792955821709292761/completion.json').read_text());assert finished['sources_unchanged']
plan={'created_ns':time.time_ns(),'reason':'Second original workflow reached a different degree-4/40 pair over a degree-10 carrier; seven root coefficients and 41 predicate coefficients lacked a direct rational representation. Independent rational checking refused this incomplete capture.','amendment':'Repeat only the unchanged second workflow at 300 seconds / 8 GiB after adding per-value exact Real JSON export for nonrational entries. Stream each value into a separate durable file; record references in the fiber document. No numeric approximation or normal-form replacement.','original_records_preserved':True,'production_algorithm_changes':False,'replay_limit':'Native checked values may still fail cold import; such a failure remains explicit and is not permission to trust wire flags.'}
(raw/'full-real-capture-plan.json').write_text(json.dumps(plan,indent=2)+'\n')
p=root/'crates/hypersolve/src/algebraic_fiber/r16_trace.rs';s=p.read_text();old='None => "null".to_owned(),';assert s.count(old)==1
new='''None => {
            static NEXT_REAL: AtomicUsize = AtomicUsize::new(0);
            let index=NEXT_REAL.fetch_add(1,AtomicOrdering::Relaxed);
            let name=format!("real-{index:06}.json");
            let directory=std::env::var_os("R16_CAPTURE_DIR").expect("capture directory configured");
            let path=std::path::Path::new(&directory).join(&name);
            let file=std::fs::OpenOptions::new().write(true).create_new(true).open(&path).unwrap();
            let mut writer=std::io::BufWriter::new(&file);
            serde_json::to_writer(&mut writer,value).expect("exact Real export");
            writer.flush().unwrap();file.sync_all().unwrap();
            eprintln!("R16_REAL_EXPORT path={} bytes={}",path.display(),file.metadata().unwrap().len());
            format!("{{\\\"exact_real_file\\\":{}}}",quote(&name))
        },'''
s=s.replace(old,new).replace('null means uncaptured; no approximation is substituted','object references exact serialized Real; no approximation is substituted');p.write_text(s)
p=root/'crates/hypersolve/Cargo.toml';s=p.read_text();needle='hyperreal = { version = "0.14.0", path = "../hyperreal", default-features = false }';assert s.count(needle)==1;s=s.replace(needle,needle[:-2]+', features = ["serde"] }');s=s.replace('[dependencies]\n','[dependencies]\nserde_json = "=1.0.149"\n',1);p.write_text(s)
subprocess.run(['cargo','fmt','--all'],cwd=root,check=True)
(raw/'full-real-trace-source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root));(raw/'full-real-r16_trace.rs').write_bytes((root/'crates/hypersolve/src/algebraic_fiber/r16_trace.rs').read_bytes())
s=(raw/'run_capture.py').read_text().replace("('capture-'+str(time.time_ns()))","('capture-full-real-'+str(time.time_ns()))")
s=s.replace("'--test','hypercurve_composed_workloads',",'')
s=s.replace("[('hypercurve_composed_workloads','filleted_boolean_miter_erosion_completes'),('hypercurve_open_path_compositions','stroke_fillet_stroke_of_a_cubic_arc_path_completes')]","[('hypercurve_open_path_compositions','stroke_fillet_stroke_of_a_cubic_arc_path_completes')]")
(raw/'run_full_real_capture.py').write_text(s)
print('Full exact-value capture prepared; original records preserved')
