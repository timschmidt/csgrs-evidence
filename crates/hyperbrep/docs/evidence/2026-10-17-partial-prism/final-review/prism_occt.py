"""Optional floating-point interoperability oracle; native exact tests remain authoritative."""
import argparse
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

parser = argparse.ArgumentParser()
parser.add_argument('directory', type=Path)
parser.add_argument('output', type=Path)
args = parser.parse_args()

def expectation(name):
    family = name.split('-')[0]
    if family == 'cylinder':
        if name in ['cylinder-touch-identity-difference', 'cylinder-disjoint-identity-difference']:
            return 1, 150 * math.pi, 110 * math.pi
        return 1, 75 * math.pi, 55 * math.pi + 60
    if family == 'annulus':
        return 1, 63 * math.pi, 63 * math.pi + 36
    if family in ('bore', 'coaxial_bore'):
        return 1, 126 * math.pi, 126 * math.pi
    if family == 'box':
        if 'tiny_upper_gap' in name:
            return 1, 300 + 50e-12, 380 + 10e-12
        return 1, 300, 280
    if family == 'strip':
        return 2, 480, 496
    if family == 'ring':
        return 1, 252, 288
    raise ValueError(name)

rows = []
files = sorted(args.directory.glob('*.step'))
assert {path.name for path in files} == set(['annulus-cover-identity-difference.step', 'bore-cover-identity-difference.step', 'box-cover-identity-difference.step', 'box-same-identity-difference.step', 'box-tiny_upper_gap-identity-difference.step', 'coaxial_bore-cover-identity-difference.step', 'cylinder-cover-identity-difference.step', 'cylinder-cover-rational-difference.step', 'cylinder-lower_equal-identity-difference.step', 'cylinder-same-identity-difference.step', 'cylinder-tiny_cover-identity-difference.step', 'cylinder-upper_equal-identity-difference.step', 'ring-cover-identity-difference.step', 'strip-cover-identity-difference.step', 'cylinder-touch-identity-difference.step', 'cylinder-disjoint-identity-difference.step'])
for path in files:
    solids, volume, area = expectation(path.stem)
    row = dict(file=path.name, sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
               bytes=path.stat().st_size, expected_solids=solids,
               expected_volume_mm3=volume * 1e9, expected_area_mm2=area * 1e6)
    try:
        reader = STEPControl_Reader()
        row['read'] = reader.ReadFile(str(path)) == IFSelect_RetDone
        assert row['read'], 'STEP read failed'
        row['roots'] = reader.NbRootsForTransfer()
        row['transferred'] = reader.TransferRoots()
        assert row['roots'] == row['transferred'] == 1, 'representation transfer failed'
        shape = reader.OneShape()
        row['valid'] = BRepCheck_Analyzer(shape).IsValid()
        counts = []
        for kind in (TopAbs_SOLID, TopAbs_FACE, TopAbs_EDGE, TopAbs_VERTEX):
            items = TopTools_IndexedMapOfShape()
            TopExp.MapShapes_s(shape, kind, items)
            counts.append(items.Extent())
        row['topology'] = dict(zip(('solids', 'faces', 'edges', 'vertices'), counts))
        mass, surface = GProp_GProps(), GProp_GProps()
        BRepGProp.VolumeProperties_s(shape, mass)
        BRepGProp.SurfaceProperties_s(shape, surface)
        row['volume_mm3'], row['area_mm2'] = mass.Mass(), surface.Mass()
        row['volume_matches'] = math.isclose(mass.Mass(), volume * 1e9, rel_tol=1e-12)
        row['area_matches'] = math.isclose(surface.Mass(), area * 1e6, rel_tol=1e-12)
        row['passed'] = row['valid'] and counts[0] == solids and row['volume_matches'] and row['area_matches']
    except Exception as error:
        row['error'] = repr(error)
        row['passed'] = False
    rows.append(row)
    print(path.name, 'passed' if row['passed'] else 'FAILED', flush=True)
report = dict(ocp_version=OCP.__version__, python=sys.version, fixtures=rows,
              passed=sum(x['passed'] for x in rows), failed=sum(not x['passed'] for x in rows),
              scope='Optional OCCT floating-point STEP import, topology and mass-properties checks of all fourteen preserved and two newly emitted prism diagnostic files. Does not establish exact equality, native provenance, full EXPRESS/AP conformance or geometry below OCCT tolerances.')
args.output.write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({k:v for k,v in report.items() if k != 'fixtures'}, indent=2))
raise SystemExit(bool(report['failed']))
