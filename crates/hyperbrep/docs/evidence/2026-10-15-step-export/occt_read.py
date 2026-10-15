"""Independent floating-point reader for native-authored HyperBRep exports.

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

directory = Path(sys.argv[1]) if len(sys.argv) > 1 else Path('/tmp/hyperbrep-export-oracle')
results = []
for name, expected in [
    ('native-box', (1, 6, 12, 8, 24)),
    ('native-two', (2, 12, 24, 16, 48)),
    ('native-edited', (1, 6, 13, 9, 24)),
    ('native-hole', (1, 10, 24, 16, 20)),
    ('native-reflected', (1, 10, 24, 16, 20)),
    ('native-concave', (1, 8, 18, 12, 10)),
    ('native-inch', (1, 6, 12, 8, 25.4 ** 3)),
]:
    path = directory / (name + '.step')
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
        name=name, bytes=path.stat().st_size,
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        roots=roots, transferred=transferred, valid=True,
        solids=counts[0], faces=counts[1], edges=counts[2], vertices=counts[3],
        volume_default_mm3=volume, expected_mm3=expected[4],
    ))
print(json.dumps(dict(
    ocp_version=OCP.__version__, python=sys.version,
    scope='Independent reader: native constructors, edge split, reflection, holes, concavity, units and two bodies. Floating-point interoperability only, not exactness or full AP conformance.',
    fixtures=results,
), indent=2))
