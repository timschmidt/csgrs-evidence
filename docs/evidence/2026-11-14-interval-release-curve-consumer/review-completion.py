from pathlib import Path
import hashlib,json,re,subprocess,tomllib,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-release-curve-consumer');b=Path('/mnt/development/.interval-refactor-build/release-curve-consumer')
source=json.loads((s/'SOURCE.json').read_text());results={}
for label in ['msrv','stable']:
 q=json.loads((s/(label+'-qualification.json')).read_text());assert q['client_count']==27 and q['source_commit']==source['commit']
 consumer=tomllib.loads((s/(label+'-consumer-Cargo.toml')).read_text())
 prior=tomllib.loads(Path('/tmp/interval-refactor/interval-release/consumer-Cargo.toml').read_text())
 current_deps=consumer['dependencies'];old_deps=prior['dependencies']
 assert current_deps.keys()==old_deps.keys()
 for name in current_deps:
  if name!='hypercurve':assert current_deps[name]==old_deps[name],name
 assert current_deps['hypercurve']=={'version':'=0.4.0','features':['interval-ranges']}
 assert old_deps['hypercurve']=='=0.4.0'
 tomllib.loads((s/(label+'-consumer-Cargo.lock')).read_text())
 binary=b/label/'target/release-check/consumer/debug/curve_interval_ranges'
 start=time.monotonic();p=subprocess.run([str(binary)],capture_output=True)
 (s/(label+'-curve-example-final.log')).write_bytes(p.stdout+p.stderr)
 assert p.returncode==0 and p.stdout.count(b'parameters=')==4,p.stdout
 q['independent_final_example_run']={'returncode':0,'parameter_cell_reports':4,'seconds':time.monotonic()-start,'binary_bytes':binary.stat().st_size,'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest()}
 q['dependency_declarations_change_only_hypercurve_feature']=True
 q['client_log_snapshots']='Opportunistic snapshots may be partial; authoritative pipeline results are the 27 explicit ok lines and zero exit. New example is separately rerun after completion.'
 results[label]=q
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
(s/'QUALIFICATION.json').write_text(json.dumps({'source_commit':source['commit'],'release_runs':results,'local_checks':json.loads((s/'local-checks.json').read_text()),'focused_controls':json.loads((s/'focused-controls.json').read_text()),'full_pre_push_not_run':True,'no_push_or_publication':True,'phase_14_not_complete':True},indent=2)+'\n')
print('both complete release runs and four-cell example reruns verified')
