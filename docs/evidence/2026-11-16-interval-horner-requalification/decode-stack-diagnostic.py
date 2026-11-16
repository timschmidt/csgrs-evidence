from pathlib import Path
import struct,bisect,re,json,subprocess
s=Path(__file__).parent;out=s/'stack-diagnostic-artifacts';report={}
for variant in ['baseline','candidate']:
 rows=[]
 for line in (out/(variant+'.nm')).read_text().splitlines():
  f=line.split(maxsplit=3)
  if len(f)==4 and f[2] in ['t','T']:rows.append((int(f[0]),int(f[1]),f[3]))
 rows.sort();starts=[r[0] for r in rows];maps=(out/(variant+'.maps')).read_text().splitlines();base=min(int(l.split('-')[0],16)-int(l.split()[2],16) for l in maps if l.endswith('/'+variant));raw=(out/(variant+'.stack')).read_bytes();matches=[]
 for offset in range(0,len(raw)-7,8):
  value=struct.unpack_from('Q',raw,offset)[0]-base;i=bisect.bisect_right(starts,value)-1
  if i>=0:
   address,length,name=rows[i]
   if address<=value<address+length:matches.append({'snapshot_offset':offset,'elf_address':value,'function':name,'function_offset':value-address})
 frames=subprocess.check_output(['readelf','--debug-dump=frames',str(out/variant)],text=True);(out/(variant+'.frames')).write_text(frames)
 chosen={}
 for address,length,name in rows:
  if name in ['run','horner_stack_harness::invoke','hypersolve::root_isolation::polynomial_interval_excludes_zero'] or 'translated_bounds::<' in name:
   block=next((b for b in re.split(r'\n(?=[0-9a-f]{8,} )',frames) if re.search(r' FDE .*pc='+f'{address:016x}'+r'\.\.',b)),None)
   chosen[name]={'address':address,'code_bytes':length,'max_cfa_offset':max([int(x) for x in re.findall(r'DW_CFA_def_cfa(?:_offset)?: (?:r\d+ \([^)]*\) ofs )?(\d+)',block or '')],default=8)}
 log=(s/f'runs/stack-diagnostic-{variant}-run/output.log').read_text();m=re.search(r'snapshot address=(\d+) length=(\d+) peak=(\d+) measurement=(\d+)',log);assert m
 report[variant]={'capture':list(map(int,m.groups())),'module_base':base,'stale_code_address_matches':matches,'selected_frames':chosen}
(s/'stack-diagnostic-decoded.json').write_text(json.dumps({'caveat':'Stale words after callback, not an active backtrace. Valid code-address coincidences can be unrelated. Attribution requires emitted call/stack evidence; original12800samples pervariant remain acceptance record.','variants':report},indent=2)+'\n')
for variant,r in report.items():
 print(variant,'peak',r['capture'][2],'frames',r['selected_frames'])
 for m in r['stale_code_address_matches']:
  if m['snapshot_offset']<1900:print(m['snapshot_offset'],m['function'],m['function_offset'])
