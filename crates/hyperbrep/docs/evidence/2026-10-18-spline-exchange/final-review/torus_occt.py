"""Optional OCCT interoperability, with independent analytic measure formulas."""
import hashlib,json,math,sys
from pathlib import Path
sys.path.insert(0,'/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.STEPControl import STEPControl_Reader
from OCP.IFSelect import IFSelect_RetDone
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.TopExp import TopExp
from OCP.TopTools import TopTools_IndexedMapOfShape
from OCP.TopAbs import TopAbs_SOLID,TopAbs_FACE,TopAbs_EDGE,TopAbs_VERTEX
out=Path(__file__).resolve().parents[1]
pi=math.pi
volume=20*pi*(25*(pi/2-math.asin(3/5))-12)
area=100*pi*(pi-2*math.atan(3/4))+160*pi
expected={
 'whole-torus':(6*pi*pi*1e9,12*pi*pi*1e6),
 'millimetre-reflected-torus':(6*pi*pi,12*pi*pi),
 'axial-half-torus':(3*pi*pi*1e9,(6*pi*pi+12*pi)*1e6),
 'longitudinal-half-torus':(3*pi*pi*1e9,(6*pi*pi+2*pi)*1e6),
 'quarter-torus':(1.5*pi*pi*1e9,(3*pi*pi+2*pi)*1e6),
 'rational-band-torus':(volume*1e9,area*1e6),
 'recut-band-torus':(volume*1e9,area*1e6),
}
attempts=json.loads((out/'attempts.json').read_text())
run=[a for a in attempts if a['label']=='torus-example' and a['exit_code']==0][-1]
native=[json.loads(line) for line in (out/run['log']).read_text().splitlines() if line.startswith('{')]
assert {row['case'] for row in native}==set(expected)
rows=[]
for row in native:
 name=row['case'];path=out/'torus-exports'/f'{name}.step'
 reader=STEPControl_Reader()
 assert reader.ReadFile(str(path))==IFSelect_RetDone,name
 assert reader.NbRootsForTransfer()==1 and reader.TransferRoots()==1,name
 shape=reader.OneShape();assert BRepCheck_Analyzer(shape).IsValid(),name
 counts=[]
 for kind in [TopAbs_SOLID,TopAbs_FACE,TopAbs_EDGE,TopAbs_VERTEX]:
  items=TopTools_IndexedMapOfShape();TopExp.MapShapes_s(shape,kind,items);counts.append(items.Extent())
 assert counts==[1,row['faces'],row['edges'],row['vertices']],(name,counts,row)
 mass,surface=GProp_GProps(),GProp_GProps()
 BRepGProp.VolumeProperties_s(shape,mass);BRepGProp.SurfaceProperties_s(shape,surface)
 v,a=expected[name]
 assert math.isclose(mass.Mass(),v,rel_tol=1e-12),(name,mass.Mass(),v)
 assert math.isclose(surface.Mass(),a,rel_tol=1e-12),(name,surface.Mass(),a)
 rows.append(dict(case=name,counts=counts,volume_mm3=mass.Mass(),expected_mm3=v,area_mm2=surface.Mass(),expected_mm2=a,bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
print(json.dumps(dict(ocp=OCP.__version__,python=sys.version,fixtures=rows,scope='Floating-point interoperability only; exact semantics and whole-edge checks are independently tested natively.'),indent=2))
