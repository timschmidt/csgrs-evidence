"""Independent floating-point interoperability oracle; not exact admission."""
import hashlib
import json
import math
from pathlib import Path
import sys

sys.path.insert(0, '/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.IFSelect import IFSelect_RetDone
from OCP.STEPControl import STEPControl_Reader
from OCP.TopAbs import TopAbs_SOLID
from OCP.TopExp import TopExp
from OCP.TopTools import TopTools_IndexedMapOfShape

out = Path(__file__).resolve().parents[1]
source = out / sys.argv[1]
root = math.sqrt(5)
expected = {
    'whole': (78*math.pi, (29+21*root)*math.pi),
    'positive': (39*math.pi, (29+21*root)*math.pi/2+42),
    'negative': (39*math.pi, (29+21*root)*math.pi/2+42),
    'band': (665*math.pi/24, (97+65*root)*math.pi/8+65/2),
    'lower': (271*math.pi/24, (181+19*root)*math.pi/8+19/2),
    'shifted-apex': (91*math.pi, (29+7*math.sqrt(58))*math.pi),
}
for name in ['reunion-first', 'reunion-second']:
    expected[name] = expected['whole']
for name in ['band-reunion-first', 'band-reunion-second']:
    expected[name] = expected['positive']
rows = []
for name, (volume, area) in expected.items():
    path = source / (name+'.step')
    reader = STEPControl_Reader()
    assert reader.ReadFile(str(path)) == IFSelect_RetDone
    assert reader.NbRootsForTransfer() == reader.TransferRoots() == 1
    shape = reader.OneShape()
    valid = BRepCheck_Analyzer(shape).IsValid()
    solids = TopTools_IndexedMapOfShape()
    TopExp.MapShapes_s(shape, TopAbs_SOLID, solids)
    mass, surface = GProp_GProps(), GProp_GProps()
    BRepGProp.VolumeProperties_s(shape, mass)
    BRepGProp.SurfaceProperties_s(shape, surface)
    # Writer uses metres, OCCT's reader defaults to millimetres.
    actual_volume, actual_area = mass.Mass()/1e9, surface.Mass()/1e6
    row = dict(name=name, sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
               valid=valid, solids=solids.Extent(), volume_m3=actual_volume,
               area_m2=actual_area, expected_volume_m3=volume, expected_area_m2=area)
    rows.append(row)
    print(json.dumps(row), flush=True)
    assert valid and solids.Extent() == 1, row
    assert math.isclose(actual_volume, volume, rel_tol=1e-12), row
    assert math.isclose(actual_area, area, rel_tol=1e-12), row
(out/(sys.argv[1]+'-occt.json')).write_text(json.dumps(dict(
    rows=rows, ocp=OCP.__version__, python=sys.version,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Floating-point reader interoperability only; exact geometric fidelity needs independent native checks.'), indent=2)+'\n')
