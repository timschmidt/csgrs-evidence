from pathlib import Path
import csv,hashlib,io,json,re,subprocess
s=Path(__file__).parent
tool='/tmp/interval-refactor/tools/espflash-v4.7.0'
assert (s/'completed.json').exists()
assert not (s/'image-analysis.json').exists()
rows=json.loads((s/'images.json').read_text());summary=[]
def run(label,cmd):
 p=subprocess.run(cmd,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
 (s/(label+'.log')).write_bytes(p.stdout)
 (s/(label+'.json')).write_text(json.dumps({'command':cmd,'returncode':p.returncode},indent=2)+'\n')
 assert p.returncode==0,(cmd,p.stdout)
 return p.stdout
for r in rows:
 board=r['board'];flash=r['flash_bytes'];label='baseline-'+board
 caps=json.loads((s/(label+'-capabilities.json')).read_text())
 assert caps['flash_regions']==[]
 out={**r,'partition_scope':'espflash 4.7.0 default layout only; board-declared partition/reserve qualification missing','required_prospective_app_reserve_bytes':65536,'reserve_scope':'Diagnostic screen only, not an adopted board contract'}
 if r['package_returncode']!=0:
  log=(s/(label+'-package.log')).read_text()
  m=re.search(r'image of ([\d,]+)B.*?partition of ([\d,]+)B',log,re.S);assert m and 'image_too_big' in log
  size,cap=map(lambda x:int(x.replace(',','')),m.groups())
  out.update(outcome='oversized',app_bytes=size,app_partition_bytes=cap,free_app_bytes=cap-size,headroom_after_prospective_reserve_bytes=cap-size-65536,packaging_pass=False)
 else:
  merged=(s/(board+'.bin')).read_bytes()
  # Extract the generated default table and have the same shipping tool validate
  # its format/digest. Do not infer a board-authorized map from this table.
  table=s/(board+'-partition-table.bin');assert not table.exists()
  assert merged[0x8000:0x8002]==bytes.fromhex('aa50')
  table.write_bytes(merged[0x8000:0x9000])
  csv_path=s/(board+'-partition-table.csv')
  run(board+'-partition-decode',[tool,'--skip-update-check','partition-table','--to-csv','--output',str(csv_path),str(table)])
  parsed=[]
  for row in csv.reader(csv_path.read_text().splitlines()):
   if not row or row[0].lstrip().startswith('#'):continue
   row=[x.strip() for x in row];parsed.append(row)
  apps=[p for p in parsed if p[1]=='app'];assert len(apps)==1,parsed
  def number(x):
   if x.lower().endswith('k'):return int(x[:-1],0)*1024
   if x.lower().endswith('m'):return int(x[:-1],0)*1024*1024
   return int(x,0)
  app=apps[0];offset=number(app[3]);cap=number(app[4]);assert offset+cap<=flash
  raw=s/(board+'-app.bin');assert not raw.exists()
  run(board+'-app-image',[tool,'--skip-update-check','save-image','--chip',caps['chip'],'--flash-size',str(flash//1048576)+'mb',str(s/(board+'.elf')),str(raw)])
  assert raw.exists(),list(s.glob(board+'*bin'))
  data=raw.read_bytes();assert data==merged[offset:],(board,len(data),offset,len(merged))
  out.update(outcome='saved-default-layout',app_bytes=len(data),app_sha256=hashlib.sha256(data).hexdigest(),app_offset=offset,app_partition_bytes=cap,free_app_bytes=cap-len(data),headroom_after_prospective_reserve_bytes=cap-len(data)-65536,packaging_pass=True,partitions=parsed)
 summary.append(out)
 print(board,out['outcome'],out['app_bytes'],out['app_partition_bytes'],out['free_app_bytes'],flush=True)
(s/'image-analysis.json').write_text(json.dumps(summary,indent=2)+'\n')
