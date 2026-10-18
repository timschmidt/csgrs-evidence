"""Optional independent numerical reader; never supplies native geometry authority."""
from decimal import Decimal as D, localcontext
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path
import sys

sys.path.insert(0, '/tmp/hyperbrep-occt-oracle')
import OCP
from OCP.STEPControl import STEPControl_Reader
from OCP.IFSelect import IFSelect_RetDone
from OCP.Interface import Interface_Static
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.TopExp import TopExp
from OCP.TopTools import TopTools_IndexedMapOfShape
from OCP.TopAbs import TopAbs_SOLID

OUT = Path(__file__).resolve().parents[1]
# Independent Bernstein numerator expansion of the authored controls. Integrate
# area = 16 - integral(y dx); no native curve, import or measurement API is used.
def power(values):
    result = [Q(0)]*len(values)
    degree = len(values)-1
    for i, value in enumerate(values):
        for j in range(degree-i+1):
            result[i+j] += value*math.comb(degree, i)*math.comb(degree-i, j)*(-1)**j
    return result
weights = [Q(x) for x in [1, 2, 3, 4, 5, 1]]
xs = [Q(-2), Q(-6, 5), Q(-2, 5), Q(2, 5), Q(6, 5), Q(2)]
ys = [Q(x) for x in [4, -4, -4, -4, -4, 4]]
polys = [power(weights), power([x*w for x, w in zip(xs, weights)]), power([y*w for y, w in zip(ys, weights)])]
def integrate(precision):
    with localcontext() as context:
        context.prec = precision
        denominator, numerator_x, numerator_y = [[D(x.numerator)/D(x.denominator) for x in p] for p in polys]
        derivative = lambda p: [D(i)*x for i, x in enumerate(p)][1:]
        dx, dw = derivative(numerator_x), derivative(denominator)
        def evaluate(p, t):
            value = D(0)
            for x in reversed(p):
                value = value*t+x
            return value
        def f(t):
            w, x, y = [evaluate(p, t) for p in [denominator, numerator_x, numerator_y]]
            return y*(evaluate(dx, t)*w-x*evaluate(dw, t))/(w*w*w)
        previous = [(f(D(0))+f(D(1)))/2]
        history = []
        for level in range(1, 18):
            count = 2**level
            h = D(1)/count
            row = [previous[0]/2+h*sum((f(D(i)*h) for i in range(1, count, 2)), D(0))]
            for order in range(1, level+1):
                row.append(row[-1]+(row[-1]-previous[order-1])/(4**order-1))
            difference = abs(row[-1]-previous[-1])
            history.append(dict(level=level, intervals=count, integral=str(row[-1]), last_difference=str(difference)))
            if level >= 8 and difference < D('1e-25'):
                return dict(precision=precision, volume=str(3*(16-row[-1])), history=history)
            previous = row
        raise AssertionError('Independent quadrature did not converge in the declared probe budget')
integrals = [integrate(50), integrate(80)]
assert abs(D(integrals[0]['volume'])-D(integrals[1]['volume'])) < D('1e-25')
volume = float(integrals[-1]['volume'])
rows, failed = [], []
STEPControl_Reader()
for path in sorted((OUT/'measurement-artifacts').glob('*.step')):
    selected = 96 if path.name.endswith('-input.step') else None
    mode = 'OFF' if selected else 'ON'
    assert Interface_Static.SetCVal_s('read.step.product.mode', mode)
    reader = STEPControl_Reader()
    status = reader.ReadFile(str(path))
    roots, transferred, rank = reader.NbRootsForTransfer(), 0, None
    if status == IFSelect_RetDone:
        if selected:
            choice = reader.GiveList('#96')
            assert choice.Length() == 1
            entity, model = choice.Value(1), reader.StepModel()
            ranks = [i for i in range(1, roots+1) if model.Number(reader.RootForTransfer(i)) == model.Number(entity)]
            assert len(ranks) == 1
            rank = ranks[0]
            transferred = int(reader.TransferRoot(rank))
        else:
            transferred = reader.TransferRoots()
    expected = volume*(1 if path.name.split('-')[2] == 'true' else 1e9)
    row = dict(file=path.name, sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
               read_status=str(status), roots=roots, transferred=transferred,
               selected_representation=selected, selected_root_rank=rank, product_mode=mode, expected_mm3=expected)
    if transferred:
        shape = reader.OneShape()
        solids = TopTools_IndexedMapOfShape()
        TopExp.MapShapes_s(shape, TopAbs_SOLID, solids)
        mass = GProp_GProps()
        estimate = BRepGProp.VolumePropertiesGK_s(shape, mass, 1e-12, False, True)
        row.update(valid=BRepCheck_Analyzer(shape).IsValid(), solids=solids.Extent(),
                   volume_mm3=mass.Mass(), estimated_relative_error=estimate,
                   volume_agrees=estimate >= 0 and math.isclose(mass.Mass(), expected, rel_tol=1e-10, abs_tol=1e-8))
    if not (row.get('valid') and row.get('solids') == 1 and row.get('volume_agrees')):
        failed.append(path.name)
    rows.append(row)
    (OUT/'quintic-occt.json').write_text(json.dumps(dict(ocp=OCP.__version__, python=sys.version,
        recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), independent_quadrature=integrals,
        rows=rows, failed=failed, scope='Independent floating-point reader with default translator settings, selected representation #96 for bare inputs, normal product roots for exports, and adaptive Gauss-Kronrod mass integration with spans. Decimal Romberg convergence is numerical evidence, not a certified integration bound or an exact native measurement. Native exact assertions remain separate.'), indent=2)+'\n')
assert len(rows) == 8 and not failed, failed
print('Independent quintic STEP reader:', len(rows), 'accepted')
