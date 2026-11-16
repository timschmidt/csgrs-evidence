from pathlib import Path
import subprocess,json,sys,time,os
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);head='17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f'
assert (s/'final-controls-complete.json').exists();assert not json.loads((s/'final-comparison.json').read_text())['all_incremental_cumulative_caps_pass'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
subprocess.run(['git','switch','--detach',head],cwd=r,check=True)
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/voxel-envelope-state-tests','CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};rows=[]
for name,cmd in [('tests',['cargo','+1.95.0','test','--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel','--all-features','--test','field_path_batch']),('clippy',['cargo','+1.95.0','clippy','--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel','--all-features','--all-targets','--','-D','warnings']),('fmt',['cargo','+1.95.0','fmt','--manifest-path','crates/hypervoxel/Cargo.toml','--all','--','--check'])]:
 start=time.time()
 with (s/f'restored-{name}.log').open('w') as log:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
 row={'name':name,'command':cmd,'exit_code':code,'elapsed':time.time()-start};rows.append(row);(s/'restored-checks.json').write_text(json.dumps(rows,indent=2)+'\n');assert code==0,row
subprocess.run([sys.executable,str(s/'final-artifacts.py'),'restored'],check=True)
a=json.loads((s/'final-current.json').read_text());b=json.loads((s/'final-restored.json').read_text());assert len(a)==len(b)==3
for x,y in zip(a,b):assert x['kind']==y['kind'] and x['size']['sha256']==y['size']['sha256'],(x['kind'],y['kind'])
(s/'restoration.json').write_text(json.dumps({'head':head,'status':subprocess.check_output(['git','status','--porcelain'],cwd=r,text=True),'checks':rows,'restored_final_artifacts':3,'all_current_binary_hashes_reproduced':True,'time':time.time()},indent=2)+'\n');print('Restored checks and3matched final artifacts pass',flush=True)
