"""Review the complete changed STEP entities, plus an optional external reader."""
from collections import Counter
from fractions import Fraction
import hashlib,json,math,re,sys
from pathlib import Path
sys.path.insert(0,'/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.IFSelect import IFSelect_RetDone
from OCP.STEPControl import STEPControl_Reader
from OCP.TopAbs import TopAbs_SOLID
from OCP.TopExp import TopExp
from OCP.TopTools import TopTools_IndexedMapOfShape
OUT=Path(__file__).resolve().parents[1]
capture=json.loads((OUT/'step-receipt-capture.json').read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
entities=lambda text:{int(k):v for k,v in re.findall(r'^#(\d+)=(.*);$',text,re.M)}
refs=lambda text:[int(x) for x in re.findall(r'#(\d+)',text)]
vector=lambda text:tuple(Fraction(x) for x in re.fullmatch(r"(?:DIRECTION|CARTESIAN_POINT)\('',\(([^()]*)\)\)",text)[1].split(','))
rows=[];readers=[]
for index in range(4):
 paths={side:OUT/'step-receipt-artifacts'/side/(str(index)+'.step') for side in ['baseline','candidate']}
 text={side:p.read_text() for side,p in paths.items()}
 a,b=(entities(text[side]) for side in ['baseline','candidate'])
 assert set(a)==set(b)
 changed=[k for k in a if a[k]!=b[k]]
 assert changed=={0:[],1:[75,95,110],2:[],3:[101,121,133,153]}[index]
 # Headers, physical trim curves, all topology and every other entity are
 # identical. Each changed entity is used only by one carrier placement.
 changes=[]
 for key in changed:
  uses=[k for k,v in a.items() if key in refs(v)]
  assert len(uses)==1
  placement=uses[0];assert a[placement]==b[placement] and a[placement].startswith('AXIS2_PLACEMENT_3D(')
  origin,axis,x=refs(a[placement])
  carriers=[k for k,v in a.items() if placement in refs(v)];assert len(carriers)==1
  carrier=carriers[0];assert a[carrier]==b[carrier]
  if a[key].startswith('DIRECTION('):
   assert key==axis and a[carrier].startswith('CYLINDRICAL_SURFACE(')
   assert vector(b[key])==tuple(-v for v in vector(a[key]))
   proof='Only the cylinder axis reverses. With unchanged origin, reference X and radius, the complete chart map is (u,v)->(-u,-v); it preserves the cylinder set and radial normal. Existing spatial trims and face orientation are unchanged.'
  else:
   assert key==origin and a[carrier].startswith('PLANE(')
   delta=tuple(y-x for x,y in zip(vector(a[key]),vector(b[key])))
   assert sum(d*n for d,n in zip(delta,vector(a[axis])))==0
   proof='Only the plane origin moves, by an exactly rational vector orthogonal to its unchanged normal. The complete oriented plane and all existing spatial trims remain identical.'
  changes.append(dict(entity=key,before=a[key],after=b[key],only_referrer=placement,carrier=carrier,proof=proof))
 # Replacing exactly these complete entities must recover the entire file.
 restored=text['candidate']
 for key in changed:restored=restored.replace(f'#{key}={b[key]};',f'#{key}={a[key]};')
 assert restored==text['baseline']
 rows.append(dict(index=index,case='half_cylinder' if index<2 else 'annular_prism',reflected=bool(index%2),files={side:dict(path=str(p.relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size) for side,p in paths.items()},changed_entities=changes,all_other_file_bytes_identical=True,entity_counts=dict(Counter(v.split('(')[0] for v in a.values()))))
 for side,p in paths.items():
  reader=STEPControl_Reader();assert reader.ReadFile(str(p))==IFSelect_RetDone and reader.TransferRoots()==1
  shape=reader.OneShape();solids=TopTools_IndexedMapOfShape();TopExp.MapShapes_s(shape,TopAbs_SOLID,solids)
  volume,area=GProp_GProps(),GProp_GProps();BRepGProp.VolumeProperties_s(shape,volume);BRepGProp.SurfaceProperties_s(shape,area)
  scale=1 if index%2 else 1000
  expected_volume=(75 if index<2 else 126)*math.pi*scale**3
  expected_area=((55*math.pi+60) if index<2 else 126*math.pi)*scale**2
  row=dict(index=index,side=side,sha256=sha(p),valid=BRepCheck_Analyzer(shape).IsValid(),solids=solids.Extent(),volume_mm3=volume.Mass(),area_mm2=area.Mass(),expected_volume_mm3=expected_volume,expected_area_mm2=expected_area)
  readers.append(row);print(json.dumps(row),flush=True)
  assert row['valid'] and row['solids']==1
  assert math.isclose(row['volume_mm3'],expected_volume,rel_tol=1e-10) and math.isclose(row['area_mm2'],expected_area,rel_tol=1e-10)
result=dict(source=capture['source'],rows=rows,readers=readers,ocp=OCP.__version__,recipe_sha256=sha(Path(__file__)),exact_scope='Two identity exports are byte-identical. The two reflected exports change exactly six cylinder axis directions and one plane origin, with complete exact carrier-equivalence checks. All spatial curves, vertices, topology, orientations and all other file bytes remain unchanged. This is a review of the four captured artifacts, not a general STEP equivalence solver.',reader_scope='All eight files additionally read as valid single solids in optional floating-point OCCT, with independently derived volume and area. This is interoperability evidence, not exactness authority.')
(OUT/'step-receipt-equivalence.json').write_text(json.dumps(result,indent=2)+'\n')
print('Reviewed seven exact carrier-placement changes and eight independent reader outputs.',flush=True)
