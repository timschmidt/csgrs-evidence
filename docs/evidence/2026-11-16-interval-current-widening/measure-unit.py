from pathlib import Path
import subprocess,json
s=Path(__file__).parent;llvm='/home/tim/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-20.1.1_20250829/esp-clang/bin/llvm-readelf'
for label in ['baseline','tests-only']:
 rows=json.loads((s/(label+'-unit-artifacts.json')).read_text())
 for row in rows:
  raw=subprocess.check_output(['nm','-S','--defined-only',row['path']],text=True);(s/(label+'-'+row['name']+'-symbols.txt')).write_text(raw);spans=set()
  for line in raw.splitlines():
   a=line.split()
   if len(a)>=4 and a[2] in ['t','T']:spans.add((int(a[0],16),int(a[1],16)))
  end=total=0
  for address,size in sorted(spans):total+=max(0,address+size-max(end,address));end=max(end,address+size)
  row['named_text_union']=total
  raw=subprocess.check_output([llvm,'--sections','--elf-output-style=JSON',row['path']]);(s/(label+'-'+row['name']+'-elf-sections.json')).write_bytes(raw)
  row['allocated_sections']={x['Section']['Name']['Name']:x['Section']['Size'] for x in json.loads(raw)[0]['Sections'] if x['Section']['Flags']['Value']&2}
 (s/(label+'-unit-metrics.json')).write_text(json.dumps(rows,indent=2)+'\n')
a=json.loads((s/'baseline-unit-metrics.json').read_text())[0];b=json.loads((s/'tests-only-unit-metrics.json').read_text())[0]
print('file',b['file_bytes']-a['file_bytes'],'text',b['sections']['.text']-a['sections']['.text'],'named',b['named_text_union']-a['named_text_union'])
print('growing sections',[(k,v-a['allocated_sections'].get(k,0),100*(v/a['allocated_sections'][k]-1)) for k,v in b['allocated_sections'].items() if v>a['allocated_sections'].get(k,0)])
