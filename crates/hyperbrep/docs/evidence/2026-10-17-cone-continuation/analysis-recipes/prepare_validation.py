from pathlib import Path
import hashlib,json,shutil
ROOT=Path('/mnt/development/csgrs')
D=ROOT/'crates/hyperbrep/docs/evidence/2026-10-17-cone-continuation'
OLD=D.parent/'2026-10-17-curved-continuation'
P=Path('/tmp/hyperbrep-cone-continuation-probe')
# Retain and run the same established qualifications, with the new scalar tests.
s=(OLD/'analysis-recipes/qualify.py').read_text().replace('hyperbrep-curved-continuation-wasm-probe','hyperbrep-cone-continuation-wasm-probe')
s=s.replace("'--test', 'public_numeric_semantics'", "'--test', 'public_numeric_semantics', '--test', 'cone_chart_relations'")
(D/'analysis-recipes/qualify.py').write_text(s)
for name in ['occt_read.py','torus_occt.py']:
 shutil.copy2(OLD/name,D/name)
# Build and measure every preserved main case, adding three complete workflows.
s=(OLD/'build_benchmarks.py').read_text().replace('curved-continuation','cone-continuation')
(D/'build_benchmarks.py').write_text(s)
s=(OLD/'benchmark.py').read_text().replace('curved-continuation','cone-continuation')
s=s.replace("OUT/'baseline-binaries.json'", "OUT/'baseline-main-binaries.json'")
s=s.replace("sectors=(7 if side=='baseline' else 9)", "sectors=(9 if side=='baseline' else 12)")
s=s.replace("['sectors/rotated_torus_reconstruction_false','sectors/rotated_torus_reconstruction_true']", "['sectors/rotated_cone_reconstruction_false','sectors/rotated_cone_reconstruction_true','sectors/rotated_cone_band']")
s=s.replace('two new repeated rotated reconstruction cases','three new repeated cone continuation cases').replace('two new repeated rotated reconstruction','three new repeated cone continuation')
(D/'benchmark.py').write_text(s)
s=(OLD/'analysis-recipes/dependency_costs.py').read_text().replace('hyperbrep-curved','hyperbrep-cone')
s=s.replace("rounding=read(OUT/'baseline-rounding-binary.json')", "rounding=base['executables']['library_perf']")
s=s.replace("('dependency-build',base,['scalar_micro','predicates'])", "('dependency-build',base['executables']['scalar_micro'],['scalar_micro','predicates'])")
s=s.replace("base['executables']|{'library_perf':rounding}", "base['executables']")
s=s.replace("write(DEST/'summary.json'", "assert len(costs)==196\nwrite(DEST/'summary.json'")
(D/'analysis-recipes/dependency_costs.py').write_text(s)
# Preserve old diagnostics, adding the original full continuation chains.
probes=dict(preceding_frontier='preceding-frontier.rs.txt',prism='prism-frontier.rs.txt',torus_growth='growth.rs.txt',frontier_extension='frontier_extension.rs.txt',reconstruction_diagnostic='reconstruction_diagnostic.rs.txt')
for binary,name in probes.items():
 shutil.copy2(OLD/name,D/name);shutil.copy2(D/name,P/'src/bin'/f'{binary}.rs')
# Observer copy generated directly from the acceptance helper. Preserve all
# assertions; capture each stage with a unique sequence rather than overwriting.
source=(ROOT/'crates/hyperbrep/tests/support/cone_continuation.rs').read_text()
core=source.split('\npub fn original_partition()',1)[0]
s=core.replace('use super::seam::','use seam::')
s='#[allow(dead_code)]\n#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/seam_cuts.rs"]\nmod seam;\n'+s
for old,new in [
 ('fn check(result: &BodySet, part: Part, context: &str) -> u64 {','fn check(result: &BodySet, part: Part, context: &str) -> u64 {\n    save(context, result);'),
 ('fn split(result: &BodySet, context: &str) -> BodySet {','fn split(result: &BodySet, context: &str) -> BodySet {\n    save(context, result);'),
 ('let union = |a: &BodySet, b: &BodySet, context: &str| {','let union = |a: &BodySet, b: &BodySet, context: &str| {\n        save(&format!("{context}-first"), a);\n        save(&format!("{context}-second"), b);'),
 ('        let restored = if cycle == 0 {','        save(&format!("band cycle {cycle}-first"), &current);\n        save(&format!("band cycle {cycle}-second"), &lower);\n        let restored = if cycle == 0 {'),
]:
 assert s.count(old)==1,old;s=s.replace(old,new)
s+='''
fn save(label: &str, value: &BodySet) {
    use std::sync::atomic::{AtomicUsize,Ordering};
    static SEQUENCE: AtomicUsize=AtomicUsize::new(0);
    let sequence=SEQUENCE.fetch_add(1,Ordering::Relaxed);
    let path=std::env::var("HYPERBREP_CONE_ARTIFACTS").unwrap();
    std::fs::create_dir_all(&path).unwrap();
    let bytes=value.model().to_json().unwrap();
    let name=format!("{sequence:04}-{}.json",label.replace(' ',"-"));
    std::fs::write(std::path::Path::new(&path).join(&name),&bytes).unwrap();
    println!("CONE_STATE {name} bytes={}",bytes.len());
}
fn main() {
    let mode=std::env::args().nth(1).unwrap();
    let receipt=match mode.as_str() {"restore"=>reconstruction(false),"swapped"=>reconstruction(true),"band"=>band(),_=>panic!("unknown mode")};
    println!("CONE_RECEIPT {mode} {receipt}");
}
'''
(D/'cone_workflow-final.rs.txt').write_text(s);(P/'src/bin/cone_workflow.rs').write_text(s)
(D/'cone-workflow-source.json').write_text(json.dumps(dict(helper=str((ROOT/'crates/hyperbrep/tests/support/cone_continuation.rs').relative_to(ROOT)),helper_sha256=hashlib.sha256(source.encode()).hexdigest(),core_sha256=hashlib.sha256(core.encode()).hexdigest(),observer_sha256=hashlib.sha256(s.encode()).hexdigest(),recipe='analysis-recipes/prepare_validation.py',scope='Generated direct copy: only observation calls and standalone module/main added; all input construction, two-cycle loops and assertions preserved.'),indent=2)+'\n')
shutil.copy2(OLD/'continuation-frontier.json',D/'baseline-frontier.json')
s=(OLD/'analysis-recipes/continuation.py').read_text().replace("'2026-10-16-torus-exchange'", "'2026-10-17-curved-continuation'").replace('hyperbrep-curved-continuation','hyperbrep-cone-continuation')
s=s.replace("reconstruction_diagnostic='reconstruction_diagnostic.rs.txt')", "reconstruction_diagnostic='reconstruction_diagnostic.rs.txt',cone_workflow='cone_workflow-final.rs.txt')")
s=s.replace('def checked(label, command, seconds=900):\n    result = run(label, command, seconds)', 'def checked(label, command, seconds=900, extra=None):\n    result = run(label, command, seconds, extra)')
needle="checked('reconstruction-continuation',[executables['reconstruction_diagnostic']['path'],str(OUT/'reconstruction-candidate-artifacts')],600)"
s=s.replace(needle,needle+'''\nfor mode in ['restore','swapped','band']:
    checked('cone-continuation-'+mode,[executables['cone_workflow']['path'],mode],600,dict(HYPERBREP_CONE_ARTIFACTS=str(OUT/'cone-candidate-artifacts'/mode)))''')
s=s.replace("assert changes==[dict(family='torus',rotation='rational',operation=op,before='resource_exhaustion',after='native_result') for op in ['restore','restore-swapped']]", "assert changes==[dict(family='cone',rotation='rational',operation=op,before='undecided',after='native_result') for op in ['band','restore','restore-swapped']]")
s=s.replace('newly admitted reconstruction','newly admitted cone continuations').replace('two exhausted torus outcomes','three undecided cone outcomes')
(D/'analysis-recipes/continuation.py').write_text(s)
s=(OLD/'analysis-recipes/frontier_review.py').read_text().replace("'2026-10-16-torus-exchange'", "'2026-10-17-curved-continuation'")
(D/'analysis-recipes/frontier_review.py').write_text(s)
paths=[P/'Cargo.toml',P/'Cargo.lock',*(P/'src/bin').glob('*.rs')]
(D/'diagnostic-project/inputs-final.json').write_text(json.dumps({str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},indent=2)+'\n')
for p in [*D.glob('*.py'),*(D/'analysis-recipes').glob('*.py'),D/'wasm-probe/run.py']:
 compile(p.read_text(),str(p),'exec')
print('Prepared qualification, 175 main cases, 196 dependency cases, 81 diagnostic slots and 103 WASM groups.')
