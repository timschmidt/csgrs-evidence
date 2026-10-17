"""Describe the independent reader's invalid original thin-layer observation."""
import hashlib,json,math,sys
from pathlib import Path
sys.path.insert(0,'/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.BRep import BRep_Tool
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.IFSelect import IFSelect_RetDone
from OCP.STEPControl import STEPControl_Reader
from OCP.TopAbs import TopAbs_SOLID,TopAbs_SHELL,TopAbs_FACE,TopAbs_WIRE,TopAbs_EDGE,TopAbs_VERTEX
from OCP.TopExp import TopExp
from OCP.TopoDS import TopoDS
from OCP.TopTools import TopTools_IndexedMapOfShape
OUT=Path(__file__).resolve().parents[1]
path=OUT/'final-prism-artifacts/cylinder-tiny_lower_gap-identity-difference.step'
reader=STEPControl_Reader();assert reader.ReadFile(str(path))==IFSelect_RetDone and reader.TransferRoots()==1
shape=reader.OneShape();analyzer=BRepCheck_Analyzer(shape);rows=[];points=[]
for kind,name in [(TopAbs_SOLID,'solid'),(TopAbs_SHELL,'shell'),(TopAbs_FACE,'face'),(TopAbs_WIRE,'wire'),(TopAbs_EDGE,'edge'),(TopAbs_VERTEX,'vertex')]:
 items=TopTools_IndexedMapOfShape();TopExp.MapShapes_s(shape,kind,items)
 for i in range(1,items.Extent()+1):
  sub=items.FindKey(i);result=analyzer.Result(sub)
  statuses=[] if result is None else [str(x) for x in result.Status()]
  if not analyzer.IsValid(sub) or any(x!='BRepCheck_Status.BRepCheck_NoError' for x in statuses):rows.append(dict(kind=name,index=i,valid=analyzer.IsValid(sub),statuses=statuses))
  if kind==TopAbs_VERTEX:
   vertex=TopoDS.Vertex_s(sub);p=BRep_Tool.Pnt_s(vertex)
   points.append(dict(index=i,point_mm=[p.X(),p.Y(),p.Z()],tolerance_mm=BRep_Tool.Tolerance_s(vertex)))
distances=[math.dist(a['point_mm'],b['point_mm']) for i,a in enumerate(points) for b in points[i+1:]]
report=dict(path=str(path.relative_to(OUT)),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),valid=analyzer.IsValid(),ocp=OCP.__version__,statuses=rows,vertices=points,minimum_positive_vertex_distance_mm=min(d for d in distances if d>0),recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),scope='Reader diagnostics only. Default tolerance and near-coincident vertices are reported, not treated as exact authority or a proved cause. Native exact measures, classification, manifold incidence and cold STEP continuation independently pass; no tolerance healing or output geometry changes are made.')
(OUT/'occt-thin-diagnostic.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
