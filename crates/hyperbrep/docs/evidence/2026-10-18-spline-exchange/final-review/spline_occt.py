"""Optional numerical interoperability on the exact spline exchange corpus."""
import hashlib,json,math,sys
from pathlib import Path
sys.path.insert(0,'/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.STEPControl import STEPControl_Reader
from OCP.IFSelect import IFSelect_RetDone
from OCP.Interface import Interface_Static
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.TopExp import TopExp
from OCP.TopTools import TopTools_IndexedMapOfShape
from OCP.TopAbs import TopAbs_SOLID
out=Path(__file__).resolve().parents[1];cases=json.loads((out/'spline-artifacts.json').read_text())['reader_cases'];rows=[];failed=[]
STEPControl_Reader() # Initialize translator parameters before selecting a mode.
for case in cases:
 path=out/'spline-artifacts'/case['step'];selected=96 if case['step'].endswith('-input.step') else None
 # The independent fixtures intentionally select representation #96 without a
 # product hierarchy, matching the native public import contract. Exported files
 # retain their normal product-root traversal. No geometry or tolerance changes.
 mode='OFF' if selected else 'ON';assert Interface_Static.SetCVal_s('read.step.product.mode',mode)
 reader=STEPControl_Reader();status=reader.ReadFile(str(path));roots=reader.NbRootsForTransfer();transferred=0;rank=None
 if status==IFSelect_RetDone:
  if selected:
   choice=reader.GiveList('#'+str(selected));assert choice.Length()==1
   entity=choice.Value(1);assert entity.DynamicType().Name()=='StepShape_AdvancedBrepShapeRepresentation'
   model=reader.StepModel();ranks=[i for i in range(1,roots+1) if model.Number(reader.RootForTransfer(i))==model.Number(entity)]
   assert len(ranks)==1;rank=ranks[0]
   transferred=int(reader.TransferRoot(rank))
  else:transferred=reader.TransferRoots()
 row=dict(**case,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),bytes=path.stat().st_size,read_status=str(status),roots=roots,transferred=transferred,product_mode=mode,selected_representation=selected,selected_root_rank=rank)
 if transferred:
  shape=reader.OneShape();items=TopTools_IndexedMapOfShape();TopExp.MapShapes_s(shape,TopAbs_SOLID,items)
  default_mass=GProp_GProps();BRepGProp.VolumeProperties_s(shape,default_mass)
  gauss=GProp_GProps();gauss_estimate=BRepGProp.VolumeProperties_s(shape,gauss,1e-12)
  # Gauss-Kronrod resolves the four rational-parameterization discrepancies
  # observed with both other overloads. Retain all three observations; the
  # integration estimator is not a certified error bound. Geometry, translator
  # tolerance, input bytes and the numerical comparison tolerance are unchanged.
  mass=GProp_GProps();estimate=BRepGProp.VolumePropertiesGK_s(shape,mass,1e-12,False,True)
  row.update(valid=BRepCheck_Analyzer(shape).IsValid(),observed_solids=items.Extent(),default_volume_mm3=default_mass.Mass(),gauss_volume_mm3=gauss.Mass(),gauss_estimated_relative_error=gauss_estimate,volume_mm3=mass.Mass(),requested_relative_precision=1e-12,estimated_relative_error=estimate,integration='adaptive Gauss-Kronrod, IsUseSpan=true',volume_agrees=estimate>=0 and math.isclose(mass.Mass(),case['expected_mm3'],rel_tol=1e-10,abs_tol=1e-8))
 rows.append(row)
 if not (transferred and row.get('valid') and row.get('observed_solids')==case['solids'] and row.get('volume_agrees')):failed.append(case['step'])
 (out/'spline-occt.json').write_text(json.dumps(dict(ocp_version=OCP.__version__,python=sys.version,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),rows=rows,failed=failed,scope='Independent floating-point reader, default millimetres and default translator shape processing, adaptive Gauss-Kronrod mass integration with spans at requested relative precision 1e-12. Minimal independent fixtures select representation #96 with product mode OFF; generated files use normal product mode ON. Default and adaptive Gauss mass observations are retained; the estimators are not certified bounds. Native exact assertions are separate; this does not establish exactness, full EXPRESS/AP conformance or source-history preservation. All negative or discrepant observations retained.'),indent=2)+'\n')
assert not failed,failed
print('independent spline reader cases:',len(rows))
