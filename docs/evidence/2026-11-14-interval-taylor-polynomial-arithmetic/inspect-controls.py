from pathlib import Path
import re,subprocess,json,hashlib,sys,collections
s=Path(__file__).parent
label=sys.argv[1]
def sections(p):
    data=Path(p).read_bytes();rows={}
    for line in subprocess.check_output(['readelf','-SW',p],text=True).splitlines():
        m=re.match(r'\s*\[\s*\d+\]\s+(\S+)\s+(\S+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+\S+\s+(\S+)',line)
        if not m:continue
        name,kind,address,offset,size,flags=m.groups();offset=int(offset,16);size=int(size,16)
        rows[name]=dict(kind=kind,address=int(address,16),offset=offset,size=size,flags=flags,sha256=None if kind=='NOBITS' else hashlib.sha256(data[offset:offset+size]).hexdigest())
    return rows
def symbols(p):
    rows=[]
    for line in subprocess.check_output(['nm','-S','--defined-only',p],text=True).splitlines():
        parts=line.split(maxsplit=3)
        if len(parts)!=4 or parts[2] not in ('t','T'):continue
        address,size,kind,name=parts
        # LLVM disambiguators may change when source-level declarations are added.
        name=re.sub(r'\.llvm\.\d+', '.llvm.ID', name)
        rows.append((name,int(address,16),int(size,16),kind))
    return sorted(rows)
rows=[]
for r in json.loads((s/f'{label}-control-artifact-comparison.json').read_text()):
    a=sections(r['baseline']['path']); b=sections(r['candidate']['path'])
    sa=symbols(r['baseline']['path']);sb=symbols(r['candidate']['path'])
    differences={n:dict(baseline=a.get(n),candidate=b.get(n)) for n in a.keys()|b.keys() if a.get(n)!=b.get(n)}
    allocated=[n for n in differences if 'A' in a[n]['flags'] and n!='.note.gnu.build-id']
    row=dict(name=r['name'],target=r['target'],raw_bytes_delta=r['candidate']['bytes']-r['baseline']['bytes'],differences=differences,allocated_differences_except_build_id=allocated,canonical_function_layout_equal=sa==sb,function_counts=[len(sa),len(sb)],function_bytes=[sum(x[2] for x in sa),sum(x[2] for x in sb)])
    rows.append(row);print(row['name'],row['target'],row['raw_bytes_delta'],allocated,row['canonical_function_layout_equal'])
(s/f'{label}-inspected-controls.json').write_text(json.dumps(rows,indent=2)+'\n')
