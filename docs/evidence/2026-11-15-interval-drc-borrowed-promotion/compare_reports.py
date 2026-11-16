from pathlib import Path
import json,re,hashlib,difflib
s=Path(__file__).parent;results=json.loads((s/'timings.json').read_text());rows=[];reference=None
for run in results:
 label=f"timing-{run['index']}-{run['label']}";text=(s/(label+'.log')).read_text();blocks=re.findall(r'hyperdrc: starting emit report\n(.*?)hyperdrc: finished emit report',text,re.S);assert len(blocks)==2,(label,len(blocks))
 normalized=re.sub(r'hyperdrc-complex-project-kicad-smoke-suite-\d+','hyperdrc-complex-project-kicad-smoke-suite-PID','\n'.join(blocks));(s/(label+'-report.txt')).write_text(normalized)
 if reference is None:reference=normalized
 equal=reference==normalized
 rows.append({'run':label,'reports':len(blocks),'bytes':len(normalized.encode()),'sha256':hashlib.sha256(normalized.encode()).hexdigest(),'matches_first':equal,'normalization':'temporary process ID in source path only; every report byte otherwise retained'})
 if not equal:(s/(label+'-report.diff')).write_text(''.join(difflib.unified_diff(reference.splitlines(True),normalized.splitlines(True))))
(s/'report-equality.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(rows));assert all(x['matches_first'] for x in rows)
