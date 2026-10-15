"""Independent floating-point reader for original inputs and edited native exports.

Use fetch_oracles.py in the adjacent step-faceted evidence to acquire the pinned
optional OCP wheel. No external kernel enters production or exact acceptance.
"""
import hashlib
import json
import sys
from pathlib import Path

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

root = Path('/mnt/development/csgrs')
out = Path(__file__).resolve().parent
fixtures = root / 'crates/hyperbrep-io/tests/fixtures'
results = []
for path, expected in [
    (fixtures / 'occt-advanced-box-3d.step', (1, 6, 12, 8, 24)),
    (fixtures / 'occt-advanced-box.step', (1, 6, 12, 8, 24)),
    (fixtures / 'occt-advanced-hole.step', (1, 10, 24, 16, 20)),
    (out / 'exports/advanced-box-3d.step', (1, 6, 12, 8, 24)),
    (out / 'exports/advanced-box-pcurves.step', (1, 6, 12, 8, 24)),
    (out / 'exports/advanced-hole.step', (1, 10, 24, 16, 20)),
    (out / 'exports/advanced-hole-edited.step', (1, 10, 25, 17, 20)),
]:
    name = path.stem
    reader = STEPControl_Reader()
    assert reader.ReadFile(str(path)) == IFSelect_RetDone, name
    roots = reader.NbRootsForTransfer()
    transferred = reader.TransferRoots()
    assert (roots, transferred) == (1, 1), (name, roots, transferred)
    shape = reader.OneShape()
    assert BRepCheck_Analyzer(shape).IsValid(), name
    counts = []
    for kind in [TopAbs_SOLID, TopAbs_FACE, TopAbs_EDGE, TopAbs_VERTEX]:
        items = TopTools_IndexedMapOfShape()
        TopExp.MapShapes_s(shape, kind, items)
        counts.append(items.Extent())
    mass = GProp_GProps()
    BRepGProp.VolumeProperties_s(shape, mass)
    volume = mass.Mass()
    assert counts == list(expected[:4]), (name, counts)
    assert abs(volume - expected[4]) < 1e-8, (name, volume)
    results.append(dict(
        name=name, path=str(path.relative_to(root)), bytes=path.stat().st_size,
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        roots=roots, transferred=transferred, valid=True,
        solids=counts[0], faces=counts[1], edges=counts[2], vertices=counts[3],
        volume_default_mm3=volume, expected_mm3=expected[4],
    ))
print(json.dumps(dict(
    ocp_version=OCP.__version__, python=sys.version,
    scope='Independent reader: original advanced inputs and exact planar faceted exports, including edge split and reflection. Floating-point interoperability only, not exactness or full AP conformance.',
    fixtures=results,
), indent=2))
