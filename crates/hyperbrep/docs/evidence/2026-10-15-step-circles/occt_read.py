"""Optional independent floating-point reader; never native exact authority.

The pinned oracle is acquired by ../2026-10-15-step-faceted/fetch_oracles.py.
This hand-authored fixture is independent of the unchanged, off-carrier OCCT
cylinder retained by the native rejection regression.
"""
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
path = root/'crates/hyperbrep-io/tests/fixtures/exact-cylinder.step'
reader = STEPControl_Reader()
assert reader.ReadFile(str(path)) == IFSelect_RetDone
assert reader.NbRootsForTransfer() == 1
assert reader.TransferRoots() == 1
shape = reader.OneShape()
assert BRepCheck_Analyzer(shape).IsValid()
counts = []
for kind in [TopAbs_SOLID, TopAbs_FACE, TopAbs_EDGE, TopAbs_VERTEX]:
    items = TopTools_IndexedMapOfShape()
    TopExp.MapShapes_s(shape, kind, items)
    counts.append(items.Extent())
assert counts == [1, 3, 3, 2], counts
volume, area = GProp_GProps(), GProp_GProps()
BRepGProp.VolumeProperties_s(shape, volume)
BRepGProp.SurfaceProperties_s(shape, area)
expected_volume, expected_area = 175*math.pi*1e9, 120*math.pi*1e6
assert math.isclose(volume.Mass(), expected_volume, rel_tol=1e-12)
assert math.isclose(area.Mass(), expected_area, rel_tol=1e-12)
print(json.dumps(dict(
    ocp_version=OCP.__version__, python=sys.version,
    path=str(path.relative_to(root)), sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
    roots=1, transferred=1, valid=True, solids=counts[0], faces=counts[1],
    edges=counts[2], vertices=counts[3],
    volume_default_mm3=volume.Mass(), expected_mm3=expected_volume,
    area_default_mm2=area.Mass(), expected_mm2=expected_area,
    scope='Independent floating-point interoperability of the original exact cylinder fixture. Does not certify exactness, STEP conformance or native general-shell coverage.',
), indent=2))
