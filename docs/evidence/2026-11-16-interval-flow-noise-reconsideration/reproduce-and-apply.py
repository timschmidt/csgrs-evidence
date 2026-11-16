from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs')
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/profile-typed-fraction/owner','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
w=root/'crates/hyperdynamics/tests/flow_noise_evolution.rs';assert not w.exists()
w.write_text('use hyperdynamics::field::taylor_flow::noise::evolution::FlowNoiseEvolutionOptions;\n#[test]\nfn controller_is_available() { let _ = FlowNoiseEvolutionOptions::default(); }\n')
command=['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features','--test','flow_noise_evolution','--no-run'];start=time.monotonic()
with (s/'missing-controller.log').open('w') as out:p=subprocess.run(command,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT)
(s/'missing-controller.json').write_text(json.dumps({'command':command,'exit_code':p.returncode,'seconds':time.monotonic()-start},indent=2)+'\n')
assert p.returncode!=0 and 'no `FlowNoiseEvolutionOptions`' in (s/'missing-controller.log').read_text()
w.unlink()
command=['git','apply','--exclude=crates/hyperdynamics/tests/fixtures/flow_noise_trace.txt','--exclude=crates/hyperdynamics/tests/flow_noise_trace.rs','/tmp/interval-refactor/flow-noise-evolution/provider-source.patch'];subprocess.run(command,cwd=root,check=True)
(s/'candidate-tracked.patch').write_bytes(subprocess.check_output(['git','diff'],cwd=root))
(s/'candidate-status.txt').write_bytes(subprocess.check_output(['git','status','--short'],cwd=root))
print('Missing controller reproduced; archived provider candidate applied, existing fixtures unchanged.',flush=True)
