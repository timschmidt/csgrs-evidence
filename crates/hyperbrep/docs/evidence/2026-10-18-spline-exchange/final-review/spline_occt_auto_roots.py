"""Optional numerical interoperability on the exact spline exchange corpus."""
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
from OCP.TopAbs import TopAbs_SOLID
out=Path(__file__).resolve().parents[1];cases=json.loads((out/'spline-artifacts.json').read_text())['reader_cases'];rows=[]
for case in cases:
 path=out/'spline-artifacts'/case['step'];reader=STEPControl_Reader()
 status=reader.ReadFile(str(path));roots=reader.NbRootsForTransfer();transferred=reader.TransferRoots() if status==IFSelect_RetDone else 0
 row=dict(**case,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),bytes=path.stat().st_size,read_status=str(status),roots=roots,transferred=transferred)
 if transferred:
  shape=reader.OneShape();items=TopTools_IndexedMapOfShape();TopExp.MapShapes_s(shape,TopAbs_SOLID,items)
  default_mass=GProp_GProps();BRepGProp.VolumeProperties_s(shape,default_mass)
  # The installed OCP overload documents adaptive 2D Gauss integration. Use
  # it for rational parameterizations, retaining the default observation too.
  mass=GProp_GProps();estimate=BRepGProp.VolumeProperties_s(shape,mass,1e-12)
  row.update(valid=BRepCheck_Analyzer(shape).IsValid(),observed_solids=items.Extent(),default_volume_mm3=default_mass.Mass(),volume_mm3=mass.Mass(),requested_relative_precision=1e-12,estimated_relative_error=estimate,volume_agrees=math.isclose(mass.Mass(),case['expected_mm3'],rel_tol=1e-10,abs_tol=1e-8))
 rows.append(row)
 (out/'spline-occt.json').write_text(json.dumps(dict(ocp_version=OCP.__version__,python=sys.version,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),rows=rows,scope='Independent floating-point reader, default millimetres, adaptive Gauss mass integration at requested relative precision 1e-12. Default non-adaptive observations are also retained; the estimator is not a certified bound. Native exact assertions are separate; this does not establish exactness, full EXPRESS/AP conformance or source-history preservation. All negative or discrepant observations retained.'),indent=2)+'\n')
 assert transferred and row['valid'] and row['observed_solids']==case['solids'] and row['volume_agrees'],row
print('independent spline reader cases:',len(rows))
