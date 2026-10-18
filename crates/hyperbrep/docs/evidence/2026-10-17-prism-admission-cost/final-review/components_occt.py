"""Independent floating-point STEP checks for nested and separate material."""
import hashlib
import json
import math
from pathlib import Path
import sys

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
rows=[]
for reverse in ['false','true']:
    path=OUT/'component-exports'/f'components-reverse-{reverse}.step'
    reader=STEPControl_Reader()
    assert reader.ReadFile(str(path))==IFSelect_RetDone
    assert reader.NbRootsForTransfer()==reader.TransferRoots()==1
    shape=reader.OneShape()
    valid=BRepCheck_Analyzer(shape).IsValid()
    solids=TopTools_IndexedMapOfShape()
    TopExp.MapShapes_s(shape,TopAbs_SOLID,solids)
    mass,surface=GProp_GProps(),GProp_GProps()
    BRepGProp.VolumeProperties_s(shape,mass)
    BRepGProp.SurfaceProperties_s(shape,surface)
    volume,area=mass.Mass()/1e9,surface.Mass()/1e6
    row=dict(case=path.stem,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),bytes=path.stat().st_size,
        valid=valid,solids=solids.Extent(),volume_m3=volume,area_m2=area,expected_volume_m3=75,expected_area_m2=206)
    rows.append(row)
    print(json.dumps(row),flush=True)
    assert valid and solids.Extent()==3
    assert math.isclose(volume,75,rel_tol=1e-12)
    assert math.isclose(area,206,rel_tol=1e-12)
(OUT/'components-occt.json').write_text(json.dumps(dict(rows=rows,ocp=OCP.__version__,python=sys.version,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Floating-point interoperability only. Exact formula, incidence, point, replay and composition checks are in the independent public Rust consumer.'),indent=2)+'\n')
