from pathlib import Path
import json,re,collections
s=Path(__file__).resolve().parent;summary=[];differences={}
packages=json.loads((s/'package-matrix.json').read_text())
for board in ['mks-esp32-foc-v1','mks-tinybee','mks-tinybee-4mb','t-deck-pro','t-lora-pager']:
 data={k:json.loads((s/f'{k}-{board}-image.json').read_text()) for k in ['baseline','candidate']}
 row={'board':board,**{key:{k:v[key] for k,v in data.items()} for key in ['elf_bytes','loadable_nonzero_bytes','executable_bytes','nobits_bytes','maximum_recognized_frame_bytes']}}
 row['packaging']={}
 for p in packages:
  if p['board']!=board:continue
  if p['returncode']==0:result={'outcome':'saved','bytes':p['bytes'],'flash_bytes':p['flash_bytes']}
  else:
   log=(s/f"{p['kind']}-{board}-package-final.log").read_text();m=re.search(r'image of ([\d,]+)B.*?partition of ([\d,]+)B',log,re.S);assert m,log
   size,capacity=(int(x.replace(',','')) for x in m.groups());result={'outcome':'oversized','app_bytes':size,'app_capacity':capacity,'excess_bytes':size-capacity}
  row['packaging'][p['kind']]=result
 summary.append(row);groups={}
 for kind in data:
  groups[kind]=collections.defaultdict(list)
  for r in json.loads((s/f'{kind}-{board}-frames.json').read_text()):
   if r['entry_frames']:
    assert r['elf_function_symbol']
    groups[kind][re.sub(r'::h[0-9a-f]{16}$','',r['symbol'])].append(r['entry_frames'][0]['frame_bytes'])
 changes=[]
 for name in sorted(groups['baseline'].keys()&groups['candidate'].keys()):
  a=groups['baseline'][name];b=groups['candidate'][name]
  if sorted(a)!=sorted(b):changes.append({'symbol_group':name,'baseline':sorted(a),'candidate':sorted(b),'unique_symbol_match':len(a)==len(b)==1})
 differences[board]=changes
(s/'image-matrix-summary.json').write_text(json.dumps(summary,indent=2)+'\n');(s/'frame-matrix-differences.json').write_text(json.dumps(differences,indent=2)+'\n')
for r in summary:print(r['board'],r['packaging'])
