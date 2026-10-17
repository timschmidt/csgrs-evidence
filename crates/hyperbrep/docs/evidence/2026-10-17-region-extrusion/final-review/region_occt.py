"""Independent floating-point reader of the four complete region workflows."""
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
for cap in ['Butt','Round']:
    for reverse in ['false','true']:
        name=f'{cap}-reverse-{reverse}'
        path=OUT/'region-exports'/(name+'.step')
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
        actual_volume,actual_area=mass.Mass()/1e9,surface.Mass()/1e6
        volume=30+3*math.pi if cap=='Round' else 30
        area=50+8*math.pi if cap=='Round' else 62
        row=dict(case=name,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),bytes=path.stat().st_size,
            valid=valid,solids=solids.Extent(),volume_m3=actual_volume,area_m2=actual_area,
            expected_volume_m3=volume,expected_area_m2=area)
        rows.append(row)
        print(json.dumps(row),flush=True)
        assert valid and solids.Extent()==1
        assert math.isclose(actual_volume,volume,rel_tol=1e-12)
        assert math.isclose(actual_area,area,rel_tol=1e-12)
(OUT/'region-occt.json').write_text(json.dumps(dict(rows=rows,ocp=OCP.__version__,python=sys.version,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Floating-point interoperability only. Independent exact formula, incidence, point, native replay and composition assertions are separate.'),indent=2)+'\n')
