use super::*;
use std::{alloc::{GlobalAlloc, Layout, System}, cell::{Cell, RefCell}, io::Write, sync::atomic::{AtomicUsize, Ordering as AtomicOrdering}, time::Instant};
static BYTES: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);
static LIVE: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
struct Allocator;
#[global_allocator]
static ALLOCATOR: Allocator = Allocator;
fn added(bytes: usize) {
    BYTES.fetch_add(bytes, AtomicOrdering::Relaxed);
    CALLS.fetch_add(1, AtomicOrdering::Relaxed);
    let live = LIVE.fetch_add(bytes, AtomicOrdering::Relaxed) + bytes;
    PEAK.fetch_max(live, AtomicOrdering::Relaxed);
}
unsafe impl GlobalAlloc for Allocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        let p=unsafe { System.alloc(layout) }; if !p.is_null() { added(layout.size()); } p
    }
    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        let p=unsafe { System.alloc_zeroed(layout) }; if !p.is_null() { added(layout.size()); } p
    }
    unsafe fn dealloc(&self, p:*mut u8, layout:Layout) {
        LIVE.fetch_sub(layout.size(),AtomicOrdering::Relaxed); unsafe {System.dealloc(p,layout)};
    }
    unsafe fn realloc(&self,p:*mut u8,layout:Layout,new_size:usize)->*mut u8 {
        let new=unsafe {System.realloc(p,layout,new_size)};
        if !new.is_null() { if new_size>=layout.size() {added(new_size-layout.size());}
        else {CALLS.fetch_add(1,AtomicOrdering::Relaxed);LIVE.fetch_sub(layout.size()-new_size,AtomicOrdering::Relaxed);} }
        new
    }
}
fn counters()->(usize,usize) {(BYTES.load(AtomicOrdering::Relaxed),CALLS.load(AtomicOrdering::Relaxed))}
thread_local! {
    static ACTIVE: Cell<Option<usize>> = const { Cell::new(None) };
    static CHILDREN: RefCell<Vec<(u128,usize,usize)>> = const { RefCell::new(Vec::new()) };
}
static NEXT: AtomicUsize = AtomicUsize::new(0);
pub(super) struct Scope { id: usize, name: &'static str, start:Instant, bytes:usize, calls:usize }
pub(super) fn scope(name: &'static str)->Option<Scope> {
    let id=ACTIVE.get()?;
    CHILDREN.with_borrow_mut(|s|s.push((0,0,0)));
    eprintln!("R16_BEGIN id={id} stage={name}");
    let (bytes,calls)=counters();
    Some(Scope{id,name,start:Instant::now(),bytes,calls})
}
impl Drop for Scope {
    fn drop(&mut self) {
        let ns=self.start.elapsed().as_nanos();let (bytes,calls)=counters();
        let bytes=bytes-self.bytes;let calls=calls-self.calls;
        let child=CHILDREN.with_borrow_mut(|stack| {
            let child=stack.pop().expect("balanced diagnostic scopes");
            if let Some(parent)=stack.last_mut() {parent.0+=ns;parent.1+=bytes;parent.2+=calls;} child
        });
        eprintln!("R16_END id={} stage={} inclusive_ns={} exclusive_ns={} bytes={} exclusive_bytes={} calls={} exclusive_calls={} live={} process_peak={}",self.id,self.name,ns,ns.saturating_sub(child.0),bytes,bytes.saturating_sub(child.1),calls,calls.saturating_sub(child.2),LIVE.load(AtomicOrdering::Relaxed),PEAK.load(AtomicOrdering::Relaxed));
    }
}
pub(super) struct RootScope { scope:Option<Scope>, previous:Option<usize> }
impl Drop for RootScope {fn drop(&mut self) {if self.scope.is_some() {drop(self.scope.take());ACTIVE.set(self.previous);}}}
fn quote(s:&str)->String {
    let mut out=String::from("\"");
    for c in s.chars() {match c {'"'=>out.push_str("\\\""),'\\'=>out.push_str("\\\\"),'\n'=>out.push_str("\\n"),'\r'=>out.push_str("\\r"),'\t'=>out.push_str("\\t"),c if c<' '=>{use std::fmt::Write;write!(out,"\\u{:04x}",c as u32).unwrap();},_=>out.push(c)}}
    out.push('"');out
}
fn real(value:&Real)->String {
    match value.exact_rational_ref() {
        Some(q)=>quote(&format!("{}{}/{}",if q.is_negative(){"-"}else{""},q.numerator(),q.denominator())),
        None=>"null".to_owned(),
    }
}
fn row(values:&[Real])->String {format!("[{}]",values.iter().map(real).collect::<Vec<_>>().join(","))}
fn polynomial(p:&BivariatePolynomial)->String {format!("[{}]",p.coefficients.iter().map(|r|row(r)).collect::<Vec<_>>().join(","))}
pub(super) fn enter(polynomials:&[&BivariatePolynomial],parameter:CurveResultantParameter,root:&AlgebraicRootRepresentation,lower:&Real,upper:&Real,endpoints:FiberIntervalEndpoints,policy:PredicatePolicy)->RootScope {
    let dimensions=polynomials.iter().map(|p|(p.coefficients.len().saturating_sub(1),p.coefficients.iter().map(Vec::len).max().unwrap_or(0).saturating_sub(1))).collect::<Vec<_>>();
    let field_degree=root.polynomial_coefficients.len().saturating_sub(1);
    let max_fiber_degree=dimensions.iter().map(|&(a,b)|match parameter {CurveResultantParameter::First=>b,CurveResultantParameter::Second=>a}).max().unwrap_or(0);
    let id=NEXT.fetch_add(1,AtomicOrdering::Relaxed);
    eprintln!("R16_CALL id={id} polynomial_count={} field_degree={field_degree} dimensions={dimensions:?} retained={parameter:?}",polynomials.len());
    if field_degree<10 || max_fiber_degree<30 {return RootScope{scope:None,previous:None};}
    let directory=std::env::var_os("R16_CAPTURE_DIR").expect("capture directory configured");let directory=std::path::Path::new(&directory);
    let document=format!("{{\"id\":{id},\"retained_parameter\":{},\"field_degree\":{field_degree},\"polynomials\":[{}],\"root_polynomial\":{},\"root_lower\":{},\"root_upper\":{},\"root_exact\":{},\"root_has_exact\":{},\"distinct_root_count\":{},\"constraint_index\":{},\"symbol\":{},\"interval_index\":{},\"validation\":{},\"fiber_lower\":{},\"fiber_upper\":{},\"endpoints\":{},\"policy\":{},\"nonrational_encoding\":\"null means uncaptured; no approximation is substituted\"}}\n",quote(&format!("{parameter:?}")),polynomials.iter().map(|p|polynomial(p)).collect::<Vec<_>>().join(","),row(&root.polynomial_coefficients),real(&root.interval.lower),real(&root.interval.upper),root.interval.exact_root.as_ref().map(real).unwrap_or_else(||"null".to_owned()),root.interval.exact_root.is_some(),root.interval.distinct_root_count,root.constraint_index,quote(&format!("{:?}",root.symbol)),root.interval_index,quote(&format!("{:?}",root.validation)),real(lower),real(upper),quote(&format!("{endpoints:?}")),quote(&format!("{policy:?}")));
    let path=directory.join(format!("fiber-{id:06}.json"));let mut file=std::fs::OpenOptions::new().write(true).create_new(true).open(&path).unwrap();file.write_all(document.as_bytes()).unwrap();file.sync_all().unwrap();
    std::fs::write(directory.join(format!("fiber-{id:06}.backtrace")),format!("{}\n",std::backtrace::Backtrace::force_capture())).unwrap();
    eprintln!("R16_CAPTURE id={id} path={}",path.display());
    let previous=ACTIVE.replace(Some(id));RootScope{scope:scope("count_bivariate_fiber_system_roots"),previous}
}
