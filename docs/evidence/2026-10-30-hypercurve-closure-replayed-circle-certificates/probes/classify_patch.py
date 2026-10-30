import sys
p=sys.argv[1]
s=open(p).read()
old="""pub(crate) fn compare_reals(left: &Real, right: &Real, policy: &CurveContext) -> Option<Ordering> {"""
new="""pub(crate) fn compare_reals(left: &Real, right: &Real, policy: &CurveContext) -> Option<Ordering> {
    let result = compare_reals_probe(left, right, policy);
    if let Some(label) = std::env::var_os("TEMP_TRACE_COMPARE") {
        let trace = std::backtrace::Backtrace::force_capture().to_string();
        let caller = trace.lines().filter(|l| l.contains("hypercurve::")).nth(1).unwrap_or("").trim().to_string();
        if caller.contains("algebraic_chord_point_coordinate_order") || caller.contains("same_value") {
            use std::io::Write;
            let mut file = std::fs::OpenOptions::new().create(true).append(true).open(format!("/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/8cd25168-f43b-472e-9cc0-d4310351812c/scratchpad/probes/trace-{}.txt", label.to_string_lossy())).unwrap();
            let sizes = if result.is_none() { format!("{} vs {}", left.to_bytes().len(), right.to_bytes().len()) } else { String::new() };
            writeln!(file, "{} {:?} {}", caller.split("::").last().unwrap_or(""), result, sizes).unwrap();
        }
    }
    result
}

fn compare_reals_probe(left: &Real, right: &Real, policy: &CurveContext) -> Option<Ordering> {"""
assert s.count(old)==1
open(p,'w').write(s.replace(old,new))
