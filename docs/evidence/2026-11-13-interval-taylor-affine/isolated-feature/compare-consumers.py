from pathlib import Path
import struct,json,subprocess,hashlib
p=Path(__file__).parent;bins=Path('/tmp/interval-refactor/taylor-affine-binaries');rows=[]
def sections(path):
 data=path.read_bytes();assert data[:6]==b'\x7fELF\x02\x01';h=struct.unpack_from('<16sHHIQQQIHHHHHH',data);secs=[struct.unpack_from('<IIQQQQIIQQ',data,h[6]+i*h[11]) for i in range(h[12])];s=secs[h[13]];names=data[s[4]:s[4]+s[5]]
 return data,{names[s[0]:].split(b'\0')[0].decode():(s,b'' if s[1]==8 else data[s[4]:s[4]+s[5]]) for s in secs[1:]}
for project in ['old-native-cost','old-native-semantic','model-cost']:
 baseline=bins/('baseline-'+project);final=bins/('isolated-'+project);a,sa=sections(baseline);b,sb=sections(final);different=[]
 for name,(s,data) in sa.items():
  t,other=sb[name]
  if s!=t or data!=other:different.append(dict(section=name,allocated=bool(s[2]&2),metadata_equal=s==t,baseline_bytes=len(data),final_bytes=len(other),differing_common_bytes=sum(x!=y for x,y in zip(data,other))))
 row=dict(project=project,baseline_bytes=len(a),final_bytes=len(b),baseline_sha256=hashlib.sha256(a).hexdigest(),final_sha256=hashlib.sha256(b).hexdigest(),whole_file_identical=a==b,text_identical=sa['.text']==sb['.text'],loaded_sections_identical_except_build_id=all(not d['allocated'] or d['section']=='.note.gnu.build-id' for d in different),different_sections=different)
 if project=='old-native-semantic':
  old=subprocess.check_output([str(baseline)]);new=subprocess.check_output([str(final)]);(p/'baseline-semantic.log').write_bytes(old);(p/'final-semantic.log').write_bytes(new);row.update(semantic_bytes=len(new),semantic_identical=old==new);assert old==new
 rows.append(row);(p/'consumer-comparison.json').write_text(json.dumps(rows,indent=2)+'\n');print(project,'text',row['text_identical'],'loaded',row['loaded_sections_identical_except_build_id'],'size',len(b)-len(a),flush=True)
