"""Independent floating-point interoperability oracle, not an exactness proof."""
import hashlib,json,sys
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

root=Path('/mnt/development/csgrs')
results=[]
for name,expected in [('box',(1,6,12,8,24)),('two-boxes',(2,12,24,16,48)),('through-hole',(1,10,24,16,20)),('tetrahedron',(1,4,6,4,12))]:
    path=root/f'crates/hyperbrep-io/tests/fixtures/faceted-{name}.step'
    reader=STEPControl_Reader();read=reader.ReadFile(str(path))
    assert read==IFSelect_RetDone,(name,read)
    roots=reader.NbRootsForTransfer();transferred=reader.TransferRoots()
    assert roots==1 and transferred==1,(name,roots,transferred)
    shape=reader.OneShape();valid=BRepCheck_Analyzer(shape).IsValid()
    assert valid,name
    counts=[]
    for kind in [TopAbs_SOLID,TopAbs_FACE,TopAbs_EDGE,TopAbs_VERTEX]:
        items=TopTools_IndexedMapOfShape();TopExp.MapShapes_s(shape,kind,items)
        counts.append(items.Extent())
    mass=GProp_GProps();BRepGProp.VolumeProperties_s(shape,mass);volume=mass.Mass()
    assert counts==list(expected[:4]),(name,counts)
    assert abs(volume-expected[4])<1e-10,(name,volume)
    results.append(dict(fixture=str(path.relative_to(root)),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),roots=roots,transferred=transferred,valid=valid,solids=counts[0],faces=counts[1],edges=counts[2],vertices=counts[3],volume_default_mm3=volume,expected_mm3=expected[4]))
print(json.dumps(dict(ocp_version=OCP.__version__,python=sys.version,scope='Independent STEP reader, topology validity, unique entity counts and floating-point volume; no exactness or full AP conformance proof',fixtures=results),indent=2))
