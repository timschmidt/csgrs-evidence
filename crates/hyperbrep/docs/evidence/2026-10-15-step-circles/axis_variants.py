"""Independently read exact orientation variants before adding native assertions."""
import hashlib
import json
import math
from pathlib import Path
import sys
sys.path.insert(0, '/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.STEPControl import STEPControl_Reader
from OCP.IFSelect import IFSelect_RetDone
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.TopExp import TopExp
from OCP.TopTools import TopTools_IndexedMapOfShape
from OCP.TopAbs import TopAbs_SOLID, TopAbs_FACE, TopAbs_EDGE, TopAbs_VERTEX

root = Path(__file__).resolve().parents[5]
out = Path(__file__).resolve().parent
source = (root/'crates/hyperbrep-io/tests/fixtures/exact-cylinder.step').read_text()

def replace_records(changes):
    lines = source.splitlines(keepends=True)
    for id, record in changes.items():
        matching = [i for i,line in enumerate(lines) if line.startswith(f'#{id}=')]
        assert len(matching)==1
        lines[matching[0]] = f'#{id}={record};\n'
    return ''.join(lines)

variants = {
    'negative-circle-axes': replace_records({
        27:"DIRECTION('',(0.,0.,-1.))", 42:"DIRECTION('',(0.,0.,-1.))",
        21:"EDGE_CURVE('',#22,#22,#24,.F.)", 38:"EDGE_CURVE('',#31,#31,#39,.F.)",
    }),
    'negative-cylinder-axis': replace_records({48:"DIRECTION('',(0.,0.,-1.))"}),
    'negative-cap-axes': replace_records({
        57:"DIRECTION('',(0.,0.,-1.))",66:"DIRECTION('',(0.,0.,-1.))",
        50:"ADVANCED_FACE('',(#51),#54,.F.)",59:"ADVANCED_FACE('',(#60),#63,.T.)",
    }),
    # Exact rotation (x,y,z) -> (x,(3*y-4*z)/5,(4*y+3*z)/5).
    'oblique-cylinder': replace_records({
        **{id:"DIRECTION('',(0.,-4.,3.))" for id in [27,36,42,48,57,66]},
        23:"CARTESIAN_POINT('',(3.,-3.2,7.4))",
        **{id:"CARTESIAN_POINT('',(3.,2.4,3.2))" for id in [32,34]},
        **{id:"CARTESIAN_POINT('',(0.,-5.6,4.2))" for id in [26,56]},
    }),
    # Rational source coordinates, irrational unit frame and height 7*sqrt(2).
    'radical-frame-cylinder': replace_records({
        **{id:"DIRECTION('',(0.,1.,1.))" for id in [27,36,42,48,57,66]},
        **{id:"DIRECTION('',(1.,1.,0.))" for id in [28,43,49,58,67]},
        23:"CARTESIAN_POINT('',(5.,7.,7.))",
        **{id:"CARTESIAN_POINT('',(5.,0.,0.))" for id in [32,34]},
        **{id:"CARTESIAN_POINT('',(0.,7.,7.))" for id in [26,56]},
    }),
}
directory = out/'axis-fixtures'
directory.mkdir(exist_ok=True)
results=[]
for name,text in variants.items():
    path=directory/(name+'.step')
    path.write_text(text)
    reader=STEPControl_Reader()
    assert reader.ReadFile(str(path))==IFSelect_RetDone,name
    assert reader.NbRootsForTransfer()==1 and reader.TransferRoots()==1,name
    shape=reader.OneShape()
    assert BRepCheck_Analyzer(shape).IsValid(),name
    counts=[]
    for kind in [TopAbs_SOLID,TopAbs_FACE,TopAbs_EDGE,TopAbs_VERTEX]:
        items=TopTools_IndexedMapOfShape()
        TopExp.MapShapes_s(shape,kind,items)
        counts.append(items.Extent())
    assert counts==[1,3,3,2],(name,counts)
    volume,area=GProp_GProps(),GProp_GProps()
    BRepGProp.VolumeProperties_s(shape,volume)
    BRepGProp.SurfaceProperties_s(shape,area)
    height=7*math.sqrt(2) if name=='radical-frame-cylinder' else 7
    assert math.isclose(volume.Mass(),25*height*math.pi*1e9,rel_tol=1e-12),name
    assert math.isclose(area.Mass(),(50+10*height)*math.pi*1e6,rel_tol=1e-12),name
    results.append(dict(name=name,path=str(path.relative_to(root)),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),counts=counts,valid=True,volume_mm3=volume.Mass(),area_mm2=area.Mass()))
print(json.dumps(dict(ocp_version=OCP.__version__,scope='Floating-point interoperability of exact handedness and oblique-frame variants; separate from native strict admission.',fixtures=results),indent=2))
