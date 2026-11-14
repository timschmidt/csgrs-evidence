from pathlib import Path
import subprocess,json,sys,gzip,hashlib,re
stage=Path('/tmp/interval-refactor/embedded-qualification')
llvm=Path('/home/tim/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-20.1.1_20250829/esp-clang/bin')
kind,board=sys.argv[1:];target='xtensa-esp32-none-elf' if board.startswith('mks-') else 'xtensa-esp32s3-none-elf'
canonical={'mks-tinybee':'mks-tinybee-v1','mks-tinybee-4mb':'mks-tinybee-v1-4mb','t-lora-pager':'t-lora-pager-current'}.get(board,board)
path=Path('/mnt/development')/f'alumina-embedded-{kind}'/'target'/target/'release'/f'alumina-firmware-{canonical}'
label=f'{kind}-{board}'
raw=subprocess.check_output([str(llvm/'llvm-readelf'),'--sections','--elf-output-style=JSON',str(path)])
(stage/f'{label}-sections.json').write_bytes(raw)
sections=json.loads(raw)[0]['Sections'];allocated=[]
for item in sections:
 x=item['Section'];flags=x['Flags']['Value']
 if flags&2: allocated.append({'name':x['Name']['Name'],'bytes':x['Size'],'address':x['Address'],'flags':flags,'nobits':x['Type']['Name']=='SHT_NOBITS'})
assembly=subprocess.check_output([str(llvm/'llvm-objdump'),'-d','--no-show-raw-insn','--demangle',str(path)])
(stage/f'{label}-disassembly.txt.gz').write_bytes(gzip.compress(assembly,mtime=0))
symbol_bytes=subprocess.check_output([str(llvm/'llvm-readelf'),'--symbols','--elf-output-style=JSON',str(path)])
(stage/f'{label}-symbols.json.gz').write_bytes(gzip.compress(symbol_bytes,mtime=0))
function_starts={x['Symbol']['Value'] for x in json.loads(symbol_bytes)[0]['Symbols'] if x['Symbol']['Type']['Value']==2}
frames=[];symbol=None;instructions=[]
def finish():
 if symbol is None:return
 entries=[]
 for address,text in instructions:
  m=re.match(r'entry\s+a1,\s*(0x[0-9a-fA-F]+|[0-9]+)',text)
  if m:entries.append({'address':address,'frame_bytes':int(m.group(1),0)})
 frames.append({'symbol':symbol,'address':symbol_address,'instructions':len(instructions),'elf_function_symbol':symbol_address in function_starts,'entry_frames':[x for x in entries if x['address']==symbol_address and symbol_address in function_starts],'interior_entry_encodings_not_proven':[x for x in entries if x['address']!=symbol_address]})
for line in assembly.decode().splitlines():
 m=re.match(r'^([0-9a-f]+) <(.*)>:$',line)
 if m: finish();symbol_address=int(m.group(1),16);symbol=m.group(2);instructions=[];continue
 m=re.match(r'^\s*([0-9a-f]+):\s+(.+)$',line)
 if m and symbol is not None:instructions.append((int(m.group(1),16),m.group(2).strip()))
finish()
(stage/f'{label}-frames.json').write_text(json.dumps(frames,indent=2)+'\n')
result={'source_artifact':str(path),'elf_bytes':path.stat().st_size,'elf_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'allocated_sections':allocated,'loadable_nonzero_bytes':sum(x['bytes'] for x in allocated if not x['nobits']),'executable_bytes':sum(x['bytes'] for x in allocated if x['flags']&4),'nobits_bytes':sum(x['bytes'] for x in allocated if x['nobits']),'function_labels':len(frames),'recognized_entry_instructions':sum(len(x['entry_frames']) for x in frames),'maximum_recognized_frame_bytes':max((f['frame_bytes'] for row in frames for f in row['entry_frames']),default=None),'scope':'Static entry allocation only; not transitive/interrupt/runtime stack use or cycles.'}
(stage/f'{label}-image.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k!='allocated_sections'},indent=2))
