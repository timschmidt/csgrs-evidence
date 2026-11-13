from pathlib import Path
import hashlib, shutil
out=Path(__file__).parent
project=out/'cost-project'; (project/'src').mkdir(parents=True,exist_ok=True)
source=Path('/mnt/development/csgrs/crates/hypersolve/examples/allocation_profile.rs').read_text()
helper=source[source.index('struct CountingAllocator;'):source.index('fn fraction(')]
(out/'allocator-reuse.txt').write_text('Unmodified helper slice from crates/hypersolve/examples/allocation_profile.rs\nSHA256 '+hashlib.sha256(helper.encode()).hexdigest()+'\n')
(project/'Cargo.toml').write_text('''[package]
name = "owned-expression-cost-probe"
version = "0.0.0"
edition = "2024"
[workspace]
[dependencies]
hypersolve = { path = "/mnt/development/csgrs/crates/hypersolve", features = ["expression-program"] }
hyperreal = { path = "/mnt/development/csgrs/crates/hyperreal", default-features = false }
''')
shutil.copy('/mnt/development/csgrs/Cargo.lock',project/'Cargo.lock')
imports='''use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
use hyperreal::Real;
use hypersolve::{Expr, SymbolId, expression_program::{ExpressionBudget, ExpressionProgram}};
'''
main='''fn budget() -> ExpressionBudget { ExpressionBudget::new(100_000, 1_000_000) }
fn main() {
 println!("| Degree | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 for degree in [1,8,32,128] {
  let x=SymbolId(0); let mut source=Expr::int(1);
  for _ in 0..degree { source=Expr::Add(Box::new(Expr::Mul(Box::new(source),Box::new(Expr::anonymous_symbol(x)))),Box::new(Expr::int(1))); }
  let sources=[source]; let values=[Real::one()];
  let program=ExpressionProgram::compile(&sources,&[x],&mut budget()).unwrap();
  let name=degree.to_string();
  print_row(&name,"compile",32,measure(32,||ExpressionProgram::compile(&sources,&[x],&mut budget()).unwrap()));
  print_row(&name,"replay+clone",32,measure(32,||ExpressionProgram::from_definition(program.definition().clone(),&mut budget()).unwrap()));
  print_row(&name,"evaluate",32,measure(32,||{
   let result=program.eval_real(&values,&mut budget()).unwrap();
   assert_eq!(result,[Real::from(degree+1)]);result
  }));
  for work in [0,1,4,16] {
   let label=format!("compile-exhaust-{work}");
   print_row(&name,&label,32,measure(32,||{
    let result=ExpressionProgram::compile(&sources,&[x],&mut ExpressionBudget::new(100_000,work));
    assert!(result.is_err()); result
   }));
  }
 }
}
'''
(project/'src/main.rs').write_text(imports+helper+main)
