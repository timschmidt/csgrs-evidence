from pathlib import Path
import hashlib,json,os,signal,subprocess,time,traceback,shutil
s=Path(__file__).parent
root=Path('/mnt/development/interval-firmware-current/alumina-firmware')
env=os.environ.copy()
for key in ['RUSTFLAGS','RUSTDOCFLAGS','CARGO_TARGET_DIR','RUSTUP_TOOLCHAIN','ALUMINA_AP_PASSWORD','CARGO_ENCODED_RUSTFLAGS']:
 env.pop(key,None)
env.update(CARGO_BUILD_JOBS='4',CARGO_INCREMENTAL='0',CARGO_TERM_COLOR='never')
gcc=Path('/home/tim/.rustup/toolchains/esp/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin')
llvm=Path('/home/tim/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-20.1.1_20250829/esp-clang')
env.update(PATH=str(gcc)+':'+env['PATH'],LIBCLANG_PATH=str(llvm/'lib'),CLANG_PATH=str(llvm/'bin/clang'))
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def state():
 return {name:{'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root.parent/name,text=True).strip(),'status':subprocess.check_output(['git','status','--porcelain'],cwd=root.parent/name,text=True),'lock_sha256':sha(root.parent/name/'Cargo.lock')} for name in ['csgrs','alumina-firmware']}
def run(label,cmd,timeout=1800):
 assert not (s/(label+'.json')).exists()
 before=state();assert all(not x['status'] for x in before.values())
 rec={'command':cmd,'cwd':str(root),'source_before':before,'started_unix':time.time(),'timeout_seconds':timeout,'environment_overrides':{k:env[k] for k in ['CARGO_BUILD_JOBS','CARGO_INCREMENTAL','CARGO_TERM_COLOR','LIBCLANG_PATH','CLANG_PATH']},'ap_password':'unset; repository default retained'}
 with (s/(label+'.log')).open('wb') as f:
  p=subprocess.Popen(cmd,cwd=root,env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
  rec['pid']=p.pid;(s/'active.json').write_text(json.dumps(rec,indent=2)+'\n')
  try:rec['returncode']=p.wait(timeout=timeout)
  except subprocess.TimeoutExpired:
   os.killpg(p.pid,signal.SIGTERM)
   try:p.wait(timeout=10)
   except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait()
   rec.update(returncode=p.returncode,timed_out=True)
 rec['elapsed_seconds']=time.time()-rec['started_unix'];rec['source_after']=state();rec['source_unchanged']=before==rec['source_after'];rec['log_sha256']=sha(s/(label+'.log'))
 (s/(label+'.json')).write_text(json.dumps(rec,indent=2)+'\n');assert rec['source_unchanged'];print(label,rec['returncode'],round(rec['elapsed_seconds'],2),flush=True)
 return rec
try:
 cmds=[['rustc','+esp','-Vv'],['cargo','+esp','-V'],['rustc','+1.88.0','-Vv'],[str(gcc/'xtensa-esp32-elf-gcc'),'--version'],[str(llvm/'bin/llvm-objdump'),'--version'],['/tmp/interval-refactor/tools/espflash-v4.7.0','--version']]
 with (s/'toolchain.txt').open('wb') as f:
  for cmd in cmds:
   f.write((repr(cmd)+'\n').encode());f.write(subprocess.check_output(cmd,env=env,stderr=subprocess.STDOUT))
 (s/'initial-state.json').write_text(json.dumps(state(),indent=2)+'\n')
 boards=['mks-esp32-foc-v1','mks-tinybee','mks-tinybee-4mb','t-deck-pro','t-lora-pager'];rows=[]
 for board in boards:
  assert shutil.disk_usage(root).free>20*1024**3
  rec=run('baseline-'+board+'-build',['cargo','+1.88.0','run','--locked','-p','xtask','--','build','--board',board,'--profile','release'])
  if rec['returncode']!=0:raise RuntimeError('build failed '+board)
  cap=subprocess.check_output([str(root/'target/debug/xtask'),'capabilities','--board',board,'--json'],cwd=root,env=env)
  (s/('baseline-'+board+'-capabilities.json')).write_bytes(cap);caps=json.loads(cap)
  assert caps['capability_digest_verified'] and not caps['armable']
  elf=root/'target'/caps['target']/'release'/('alumina-firmware-'+caps['id'])
  dest=s/(board+'.elf');shutil.copyfile(elf,dest)
  sections=subprocess.check_output([str(llvm/'bin/llvm-readelf'),'--sections','--elf-output-style=JSON',str(dest)])
  (s/(board+'-sections.json')).write_bytes(sections)
  secs=[x['Section'] for x in json.loads(sections)[0]['Sections']]
  row={'board':board,'elf_bytes':dest.stat().st_size,'elf_sha256':sha(dest),'flash_bytes':caps['flash_bytes'],'flash_regions':caps['flash_regions'],'allocated_file_bytes':sum(x['Size'] for x in secs if x['Flags']['Value']&2 and x['Type']['Name']!='SHT_NOBITS'),'executable_bytes':sum(x['Size'] for x in secs if x['Flags']['Value']&4),'allocated_nobits_bytes':sum(x['Size'] for x in secs if x['Flags']['Value']&2 and x['Type']['Name']=='SHT_NOBITS')}
  output=s/(board+'.bin')
  pkg=run('baseline-'+board+'-package',['/tmp/interval-refactor/tools/espflash-v4.7.0','save-image','--chip',caps['chip'],'--flash-size',str(caps['flash_bytes']//1048576)+'mb','--merge','--skip-padding',str(dest),str(output)],120)
  row['package_returncode']=pkg['returncode']
  if output.exists():row.update(image_bytes=output.stat().st_size,image_sha256=sha(output))
  rows.append(row);(s/'images.json').write_text(json.dumps(rows,indent=2)+'\n')
 (s/'completed.json').write_text(json.dumps({'status':'all builds and packaging attempts completed; inspect package failures','time':time.time()},indent=2)+'\n')
except BaseException:
 (s/'failure.txt').write_text(traceback.format_exc());raise
