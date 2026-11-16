from pathlib import Path
import gzip,hashlib,json,subprocess,sys,time
s=Path(__file__).parent
while not (s/'admission-barrier/result.json').exists():time.sleep(2)
assert (s/'comparison-builds-completed.json').exists(), 'Review build failures before finalization'
# Analysis uses retained ELF inputs, independent of the now-restored checkout.
for directory in [s,s/'baseline']:
 if directory!=s:
  code=(s/'analyze.py').read_text().replace("label='current-'","label='baseline-'")
  (directory/'analyze.py').write_text(code)
 subprocess.run([sys.executable,str(directory/'analyze.py')],check=True)
boards=[r['board'] for r in json.loads((s/'images.json').read_text())]
for kind in ['current','baseline']:
 for board in boards:
  with (s/(kind+'-'+board+'-inspection.log')).open('w') as f:
   subprocess.run([sys.executable,str(s/'inspect-image.py'),kind,board],stdout=f,stderr=subprocess.STDOUT,check=True)
current={r['board']:r for r in json.loads((s/'image-analysis.json').read_text())}
baseline={r['board']:r for r in json.loads((s/'baseline/image-analysis.json').read_text())}
rows=[]
for board in boards:
 c,b=current[board],baseline[board]
 assert (s/('current-'+board+'-capabilities.json')).read_bytes()==(s/'baseline'/('baseline-'+board+'-capabilities.json')).read_bytes()
 row={'board':board,'capabilities_identical':True,'current':c,'baseline':b,'size_comparison':{}}
 for name in ['app_bytes','executable_bytes','allocated_file_bytes','allocated_nobits_bytes','elf_bytes']:
  delta=c[name]-b[name];percent=100*delta/b[name] if b[name] else None
  row['size_comparison'][name]={'baseline':b[name],'current':c[name],'delta_bytes':delta,'delta_percent':percent}
  if name in ['app_bytes','executable_bytes']:
   row['size_comparison'][name].update(prospective_bytes_cap=1024,prospective_percent_cap=0.1,within_prospective_caps=delta<=1024 and percent<=0.1)
 local={}
 for kind in ['current','baseline']:
  fs=json.loads((s/(kind+'-'+board+'-frames.json')).read_text())
  local[kind]=[{'symbol':x['symbol'],'entry_frames':x['entry_frames']} for x in fs if 'ClockEstimator::observe' in x['symbol']]
 row['clock_observe_local_entry_frames']=local
 row['scope']='Matched final-link image comparison; static entry frames are not transitive/interrupt/runtime stack bounds. No MCU timing or HIL. No size exception admitted.'
 rows.append(row)
 print(board,{k:v['delta_bytes'] for k,v in row['size_comparison'].items()},flush=True)
(s/'comparison.json').write_text(json.dumps(rows,indent=2)+'\n')
repo=Path('/mnt/development/interval-firmware-current/alumina-firmware')
for kind,path in [('current',s),('baseline',s/'baseline')]:
 src=json.loads((path/'sources.json').read_text())
 blob=subprocess.check_output(['git','show',src['alumina-firmware']['revision']+':crates/alumina-clock/src/lib.rs'],cwd=repo)
 (path/'clock-source.rs').write_bytes(blob)
 for ext in ['*.elf','*.bin']:
  for p in path.glob(ext):
   z=p.with_suffix(p.suffix+'.gz');assert not z.exists();z.write_bytes(gzip.compress(p.read_bytes(),mtime=0))
(s/'finalized.json').write_text(json.dumps({'status':'Measured; two boards still oversized, board partition/reserve/whole-stack/cycles/HIL gates remain open','source_after':subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip(),'source_clean':not bool(subprocess.check_output(['git','status','--porcelain'],cwd=repo)),'time':time.time()},indent=2)+'\n')
