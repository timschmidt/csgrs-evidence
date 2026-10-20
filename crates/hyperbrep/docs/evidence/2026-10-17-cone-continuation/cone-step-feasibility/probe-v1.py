"""Independent reader experiment, not a native cone STEP implementation.

Owner: hyperbrep-io exchange feasibility, P1/P4/P11/P18/P26/P39.
Missing evidence: a complete radius-5/2, height-6 direct-boundary frustum
using a revolution generator rather than a decimal semi-angle. Generate
explicit finite STEP records from a retained topology template; preserve all
outputs and diagnostics. OCCT is a floating-point test oracle only.
"""
import hashlib
import json
import math
from pathlib import Path
import re
import sys

sys.path.insert(0, '/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.BRepAdaptor import BRepAdaptor_Surface
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.IFSelect import IFSelect_RetDone
from OCP.STEPControl import STEPControl_Reader
from OCP.TopAbs import TopAbs_SOLID, TopAbs_FACE, TopAbs_EDGE, TopAbs_VERTEX
from OCP.TopExp import TopExp
from OCP.TopoDS import TopoDS
from OCP.TopTools import TopTools_IndexedMapOfShape

OUT = Path(__file__).resolve().parents[1]
DEST = OUT / 'cone-step-feasibility'
DEST.mkdir(exist_ok=True)
source = OUT.parent / '2026-10-17-curved-continuation/exports/closed-cylinder.step'
original = source.read_text()
sha = lambda data: hashlib.sha256(data).hexdigest()
rows = []
for mode in ['unit-line', 'finite-bspline']:
    entities = {
        1: '(LENGTH_UNIT()NAMED_UNIT(*)SI_UNIT(.MILLI.,.METRE.))',
        13: "CARTESIAN_POINT('',(1.2,1.6,6.))",
        15: "CARTESIAN_POINT('',(0.,0.,6.))",
        19: "CIRCLE('',#18,2.)",
        24: "DIRECTION('',(-3.,-4.,10.))",
        40: "CARTESIAN_POINT('',(0.,0.,6.))",
        59: "MANIFOLD_SOLID_BREP('cone-feasibility-" + mode + "',#58)",
        70: "CARTESIAN_POINT('',(0.,0.,10.))",
        71: "DIRECTION('',(0.,0.,-1.))",
        72: "AXIS1_PLACEMENT('',#70,#71)",
        12: "SURFACE_OF_REVOLUTION('',#75,#72)",
    }
    if mode == 'unit-line':
        entities.update({
            73: "DIRECTION('',(1.,0.,-2.))",
            74: "VECTOR('',#73,1.)",
            75: "LINE('',#70,#74)",
        })
    else:
        # Generator runs bottom to top, opposite native positive slant V.
        # The exact affine V-map has negative determinant; reverse same_sense.
        entities.update({
            39: "ADVANCED_FACE('',(#38),#12,.F.)",
            73: "CARTESIAN_POINT('',(5.,0.,0.))",
            74: "CARTESIAN_POINT('',(2.,0.,6.))",
            75: "B_SPLINE_CURVE_WITH_KNOTS('',1,(#73,#74),.UNSPECIFIED.,.F.,.F.,(2,2),(0.,1.),.UNSPECIFIED.)",
        })
    text = original
    for entity, value in entities.items():
        if entity < 70:
            text, count = re.subn(r'^#' + str(entity) + r'=.*;$',
                '#' + str(entity) + '=' + value + ';', text, flags=re.M)
            assert count == 1, entity
    extra = '\n'.join('#' + str(k) + '=' + value + ';' for k,value in entities.items() if k >= 70)
    text = text.replace('ENDSEC;\nEND-ISO-10303-21;', extra + '\nENDSEC;\nEND-ISO-10303-21;')
    text = text.replace("'closed-cylinder.step'", "'cone-feasibility-" + mode + ".step'")
    # The retained context unit's name must describe the changed unit.
    text = text.replace("CONVERSION_BASED_UNIT('metre',#3)", "CONVERSION_BASED_UNIT('millimetre',#3)")
    path = DEST / (mode + '.step')
    assert not path.exists(), path
    path.write_text(text)
    reader = STEPControl_Reader()
    read_status = reader.ReadFile(str(path))
    assert read_status == IFSelect_RetDone, (mode, read_status)
    roots = reader.NbRootsForTransfer()
    transferred = reader.TransferRoots()
    assert roots == transferred == 1, (mode, roots, transferred)
    shape = reader.OneShape()
    valid = BRepCheck_Analyzer(shape).IsValid()
    counts = []
    surfaces = []
    for kind in [TopAbs_SOLID, TopAbs_FACE, TopAbs_EDGE, TopAbs_VERTEX]:
        items = TopTools_IndexedMapOfShape()
        TopExp.MapShapes_s(shape, kind, items)
        counts.append(items.Extent())
        if kind == TopAbs_FACE:
            for i in range(1, items.Extent()+1):
                surfaces.append(str(BRepAdaptor_Surface(TopoDS.Face_s(items.FindKey(i))).GetType()))
    mass, surface = GProp_GProps(), GProp_GProps()
    BRepGProp.VolumeProperties_s(shape, mass)
    BRepGProp.SurfaceProperties_s(shape, surface)
    expected_volume = 78*math.pi
    expected_area = (29+21*math.sqrt(5))*math.pi
    row = dict(mode=mode, path=str(path.relative_to(OUT)), bytes=path.stat().st_size,
        sha256=sha(path.read_bytes()), roots=roots, transferred=transferred, valid=valid,
        counts=counts, surface_types=surfaces, volume_mm3=mass.Mass(),
        expected_volume_mm3=expected_volume, area_mm2=surface.Mass(), expected_area_mm2=expected_area)
    rows.append(row)
    print(json.dumps(row), flush=True)
    assert valid and counts == [1,3,3,2], row
    assert math.isclose(row['volume_mm3'], expected_volume, rel_tol=1e-12), row
    assert math.isclose(row['area_mm2'], expected_area, rel_tol=1e-12), row
result = dict(passed=True, rows=rows, ocp_version=OCP.__version__, python=sys.version,
    recipe_sha256=sha(Path(__file__).read_bytes()), template=str(source), template_sha256=sha(source.read_bytes()),
    scope='Independent float interoperability probe of two manually authored complete frusta. Not a native writer/importer, exact validation, general STEP/AP conformance, native Boolean continuation, performance or production capability claim.')
(DEST / 'result.json').write_text(json.dumps(result, indent=2)+'\n')
