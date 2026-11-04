from pathlib import Path
s=Path('/tmp/csgrs-r06-field-cost-main.rs').read_text().split('fn main()')[0]
s=s.replace('include!("/tmp/csgrs-r06-cost-allocator.rs");\n','').replace('use std::{hint::black_box,io::Write,time::Instant};\n','')
s+='''fn main(){
 let args:Vec<_>=std::env::args().collect();
 hyperreal::dispatch_trace::reset();
 let (row,_)=hyperreal::dispatch_trace::with_recording(||run(&args[1]));
 let trace=hyperreal::dispatch_trace::take_trace();
 println!("{}",serde_json::json!({"outcome":serde_json::from_str::<serde_json::Value>(&row).unwrap(),"dispatch":trace.dispatch.iter().map(|r|serde_json::json!([r.layer,r.operation,r.path,r.count])).collect::<Vec<_>>(),"rational":format!("{:?}",trace.rational)}));
}
'''
for v in ['baseline','candidate']:
 app=Path('/tmp/csgrs-r06-field-cost-'+v);(app/'src/bin').mkdir(exist_ok=True);(app/'src/bin/trace.rs').write_text(s)
 p=app/'Cargo.toml';manifest=p.read_text()
 if '[features]' in manifest:continue
 p.write_text(manifest+'\n[features]\ntrace=["hypersolve/dispatch-trace","hyperreal/dispatch-trace"]\n')
