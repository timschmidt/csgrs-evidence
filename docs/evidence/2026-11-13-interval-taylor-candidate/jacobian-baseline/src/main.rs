#[path="/mnt/development/csgrs-taylor/crates/hypersolve/tests/support/jacobian_trace.rs"]
mod trace;
fn main(){let (summary,evidence)=trace::snapshot();println!("SUMMARY_START\n{summary}SUMMARY_END\n{evidence}");}
