import hashlib,json,os,pathlib,shutil,subprocess,time
root=pathlib.Path(__file__).resolve().parent
main=pathlib.Path('/mnt/development/csgrs'); tree=pathlib.Path('/mnt/development/csgrs-jacobian-integration'); source=pathlib.Path('/mnt/development/csgrs-jacobian-matrix-layout')
patch=subprocess.check_output(['git','diff','--cached','--binary'],cwd=main)
assert hashlib.sha256(patch).hexdigest()=='3bebcf6370ec1ce7b72691a9699a01e3295b7a32063c4da0a52b0996b4686d48'
(root/'integration-extraction.patch').write_bytes(patch)
# Extraction was applied by initial driver; verify it remains intact.
subprocess.run(['git','apply','--reverse','--check','-'],input=patch,cwd=tree,check=True)
for record in json.loads((root/'final-source.json').read_text()):
 p=source/record['path'];assert hashlib.sha256(p.read_bytes()).hexdigest()==record['sha256'];out=tree/record['path'];out.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,out)
env=dict(os.environ,RUSTUP_TOOLCHAIN='1.95.0',CARGO_BUILD_JOBS='4',CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/jacobian-integration',HYPERSOLVE_SKIP_BENCHMARK_REPORTS='1')
commands=[('owner',['cargo','test','--locked','-p','hypersolve','--all-features','--test','jacobian_matrix','--test','program_jacobian_trace','--test','expression_interval','--test','program_jacobian']),('dynamics',['cargo','test','--locked','-p','hyperdynamics','--all-features','--features','hypersolve/interval-lattice']),('path',['cargo','test','--locked','-p','hyperpath','--all-features','--features','hypersolve/interval-lattice']),('clippy',['cargo','clippy','--locked','-p','hypersolve','-p','hyperdynamics','-p','hyperpath','--all-targets','--all-features','--','-D','warnings'])]
records=[]
for name,command in commands:
 start=time.monotonic()
 with (root/('integration-'+name+'.log')).open('w') as log: result=subprocess.run(command,cwd=tree,env=env,stdout=log,stderr=subprocess.STDOUT)
 records.append({'name':name,'command':command,'returncode':result.returncode,'seconds':time.monotonic()-start})
 (root/'integration-commands.json').write_text(json.dumps(records,indent=2)+'\n');print(name,result.returncode,flush=True)
 if result.returncode: raise SystemExit(result.returncode)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=main)==patch
for record in json.loads((root/'final-source.json').read_text()):assert hashlib.sha256((tree/record['path']).read_bytes()).hexdigest()==record['sha256']
