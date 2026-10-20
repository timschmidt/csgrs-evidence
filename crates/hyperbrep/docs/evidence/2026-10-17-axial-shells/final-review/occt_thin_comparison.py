"""Compare exact authored STEP vertices to the optional reader's retained points."""
from decimal import Decimal
import hashlib,json,re
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
diagnostic=json.loads((OUT/'occt-thin-diagnostic.json').read_text());p=OUT/diagnostic['path']
assert hashlib.sha256(p.read_bytes()).hexdigest()==diagnostic['sha256']
text=p.read_text();assert 'SI_UNIT($,.METRE.)' in text
points={i:tuple(Decimal(x)*1000 for x in values.split(',')) for i,values in re.findall(r"#(\d+)=CARTESIAN_POINT\('',\(([^)]+)\)\);",text)}
refs=re.findall(r"#(\d+)=VERTEX_POINT\('',#(\d+)\);",text)
vertices=[dict(vertex=int(i),point=int(ref),position_mm=[str(x) for x in points[ref]]) for i,ref in refs]
actual={tuple(Decimal(str(x)) for x in r['point_mm']) for r in diagnostic['vertices']}
missing=[r for r in vertices if tuple(Decimal(x) for x in r['position_mm']) not in actual]
assert len(vertices)==10 and len(actual)==7 and len(missing)==3
assert all(Decimal(r['position_mm'][2])==Decimal('1e-9') for r in missing)
result=dict(step=diagnostic['path'],sha256=diagnostic['sha256'],step_vertices=vertices,reader_unique_points=len(actual),missing_exact_step_positions=missing,default_vertex_tolerance_mm=[r['tolerance_mm'] for r in diagnostic['vertices']],observation='All three distinct STEP vertices at height 1e-9 mm are absent in the read shape. Their separation from height zero is below the reader-reported 1e-7 mm vertex tolerance. The reader reports two self-intersecting wires/unorientable faces. No exact output, fixture or native validation is weakened to match this imported shape.',scope='Named OCCT import configuration only; this is not a diagnosis of every importer or a full internal causal trace.',recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(OUT/'occt-thin-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(result['observation'])
