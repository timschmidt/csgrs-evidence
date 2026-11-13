from pathlib import Path
import subprocess,os,shutil,json,hashlib
s=Path(__file__).parent;core=Path('/mnt/development/csgrs-field-core');root=Path('/mnt/development/csgrs');p=s/'semantic-project'
shutil.copytree(s/'evolution-cost-project',p,dirs_exist_ok=True)
(p/'Cargo.toml').write_text((p/'Cargo.toml').read_text().replace('dyadic-evolution-cost-probe','evolution-semantic-probe'))
src=(p/'src/main.rs').read_text()
a=src.index('fn timed<T>');z=src.index('\n\n\nuse hyperdynamics',a)
src=src[:a]+'''fn timed<T>(_name:&str,_op:&str,mut f:impl FnMut()->T) { drop(f()); }
fn signature<const N:usize>(r:&EvolutionReport<N>)->String {
 let attempts:Vec<_>=r.attempts().iter().map(|a| {let p=a.report();let e=p.evidence();serde_json::json!([a.segment(),a.halvings(),a.expansions(),format!("{:?}",a.source()),p.identity(),p.proposal(),p.policy(),e.time(),e.duration(),e.image(),e.jacobian(),e.picard_image(),e.lipschitz(),e.contraction(),e.end(),format!("{:?}",p.status())])}).collect();
 serde_json::to_string(&(r.identity(),r.request(),r.options(),r.policy(),attempts,r.segments().map(|s|s.proposal()).collect::<Vec<_>>(),r.reached_time(),r.prefix_end_enclosure(),r.end_enclosure(),format!("{:?}",r.status()))).unwrap()
}
'''+src[z:]
src=src.replace('let expected=report.end_enclosure().unwrap().clone();','let expected=report.end_enclosure().unwrap().clone(); println!("SIGNATURE {name} {}",signature(&report));')
src=src.replace('timed(name,"stopped",||{let r=field.integrate(request.clone(),options.clone(),&mut budget());','timed(name,"stopped",||{let r=field.integrate(request.clone(),options.clone(),&mut budget());println!("SIGNATURE {name} {}",signature(&r));')
src=src.replace('use std::time::Instant;','')
(p/'src/main.rs').write_text(src)
env=os.environ|{'CARGO_TARGET_DIR':'/tmp/interval-refactor/rational-time-semantic-target'}
exe=Path(env['CARGO_TARGET_DIR'])/'release/evolution-semantic-probe'
def build(label):
 with (s/f'semantic-{label}-build.log').open('w') as f:subprocess.run(['cargo','build','--release','--offline','--manifest-path',str(p/'Cargo.toml')],cwd=root,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
 with (s/f'semantic-{label}.log').open('w') as f:subprocess.run([str(exe)],stdout=f,stderr=subprocess.STDOUT,check=True)
 shutil.copyfile(p/'Cargo.lock',s/f'semantic-{label}-Cargo.lock')
paths=json.loads((s/'source-paths.json').read_text());saved={q:(core/q).read_bytes() for q in paths}
backup=Path('/tmp/interval-refactor/rational-time-core-backup');backup.mkdir(exist_ok=True)
for q,data in saved.items():
 (backup/q).parent.mkdir(parents=True,exist_ok=True);(backup/q).write_bytes(data)
build('candidate')
try:
 for q in paths:
  data=subprocess.run(['git','show','80b2fc0b66d52220eb8b152313705eb5153bac99:'+q],cwd=root,stdout=subprocess.PIPE,stderr=subprocess.DEVNULL)
  if data.returncode==0:(core/q).write_bytes(data.stdout)
  else:(core/q).unlink()
 build('control')
finally:
 for q,data in saved.items():(core/q).write_bytes(data)
for q,data in saved.items():assert (core/q).read_bytes()==data
get=lambda label:[l for l in (s/f'semantic-{label}.log').read_text().splitlines() if l.startswith(('SIGNATURE ','RESOURCE '))]
a=get('control');b=get('candidate');assert a==b
sig=[l for l in a if l.startswith('SIGNATURE ')];assert len(sig)==13
(s/'semantic-comparison.json').write_text(json.dumps({'equal':True,'rows':len(sig),'completed':9,'stopped':4,'digest':hashlib.sha256(('\n'.join(a)+'\n').encode()).hexdigest(),'scope':'Identical complete serialized source/request/options/policy, all attempt metadata/proposals/local proof evidence and statuses, accepted segment order, prefix/end scopes and resource counts. Baseline source 80b2fc0, same paths/compiler and dependency versions; candidate source restored byte-for-byte after controlled baseline build.'},indent=2)+'\n')
print('13 complete report signatures match; candidate source restored',flush=True)
