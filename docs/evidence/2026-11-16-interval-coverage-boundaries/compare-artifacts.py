from pathlib import Path
import json,subprocess,hashlib,sys
s=Path(__file__).parent;candidate=sys.argv[1] if len(sys.argv)>1 else 'candidate';variants={x:json.loads((s/(x+'-artifacts.json')).read_text()) for x in ['fixed','original',candidate]};rows=[]
for label,artifacts in variants.items():
 assert len(artifacts)==4
 for a in artifacts:
  assert a['exit_code']==0 and (a['kind']=='example' or a['runtime_exit_code']==0)
  path=Path(a['size']['path']);assert hashlib.sha256(path.read_bytes()).hexdigest()==a['size']['sha256'];total=0
  for line in subprocess.check_output(['readelf','-SW',str(path)],text=True).splitlines():
   parts=line.split()
   if 'PROGBITS' in parts:
    i=parts.index('PROGBITS')
    if 'X' in parts[i+5]:total+=int(parts[i+3],16)
  a['size']['executable_code']=total
for base in ['fixed','original']:
 for a,b in zip(variants[base],variants[candidate]):
  assert a['name']==b['name'] and a['lock_sha256']==b['lock_sha256'];metrics={}
  for key,cap in [('file',32768),('executable_code',16384),('named_text',16384)]:
   lo=a['size'][key];hi=b['size'][key];delta=hi-lo;pct=100*delta/lo;metrics[key]={'baseline':lo,'candidate':hi,'growth_bytes':delta,'growth_percent':pct,'byte_cap':cap,'percent_cap':2,'passes':delta<=cap and pct<=2};assert metrics[key]['passes'],(base,a['name'],key,metrics[key])
  if a['kind']=='example':assert a['size']['sha256']==b['size']['sha256']
  rows.append({'baseline':base,'artifact':a['name'],'metrics':metrics,'full_hash_identical':a['size']['sha256']==b['size']['sha256']});print(base,a['name'],{k:v['growth_bytes'] for k,v in metrics.items()})
(s/('artifact-comparison-'+candidate+'.json')).write_text(json.dumps({'all_incremental_cumulative_caps_pass':True,'all_production_trig_cost_binaries_byte_identical':True,'comparisons':rows,'complete_metrics':variants,'scope':'Three extended host test artifacts; production benchmark is byte-identical and not timed. Existing54accounts unchanged pending admission. Absolute and percentage caps apply per target, no cross-target offsets.'},indent=2)+'\n')
