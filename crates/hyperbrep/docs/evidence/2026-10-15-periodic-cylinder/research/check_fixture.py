"""Exact decimal incidence audit of the retained original OCCT cylinder export.

Generation used OCP 7.9.3.1 installed only in /tmp/hyperbrep-occt-oracle:
STEPControl_Writer(); Interface_Static.SetIVal_s('write.surfacecurve.mode', 0);
writer.Transfer(BRepPrimAPI_MakeCylinder(2,4).Shape(), STEPControl_AsIs);
writer.Write(path). The same recipe with MakeBox(2,3,4) generated occt-box.step.
The retained files include the original OCCT timestamp; reruns need not match it.
"""
import hashlib, json, re
from fractions import Fraction
from pathlib import Path
out=Path(__file__).resolve().parent
p=out/'occt-cylinder.step';text=p.read_text()
assert "#16 = CLOSED_SHELL('',(#17,#50,#59));" in text
assert "#21 = EDGE_CURVE('',#22,#22,#24,.T.);" in text
assert "#38 = EDGE_CURVE('',#31,#31,#39,.T.);" in text
assert "#45 = CYLINDRICAL_SURFACE('',#46,2.);" in text
assert text.count(' = ADVANCED_FACE(')==3 and text.count(' = CIRCLE(')==2
rows=[]
for entity in [23,32]:
    coordinates=re.search(r"#"+str(entity)+r" = CARTESIAN_POINT\('',\(([^)]*)\)\);",text).group(1).split(',')
    x,y,z=map(Fraction,coordinates);residual=x*x+y*y-4
    assert x==2 and residual>0 and z in [0,4]
    rows.append(dict(point_entity=entity,coordinates=coordinates,radius_squared_residual=str(residual),exactly_incident=False))
result=dict(occt_version='7.9.3.1',source_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),side_faces=1,cap_faces=2,closed_circle_edges=2,vertices=rows,decision='Strict native incidence rejects these points; explicit healing remains separate. This is a feasibility diagnosis, not completed STEP analytic import.')
(out/'fixture-audit.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
