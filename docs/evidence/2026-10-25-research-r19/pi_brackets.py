"""Independent rational input brackets, before any Hyperreal import probe.

Machin's identity follows from rational tangent addition and principal-angle
bounds. Alternating-series bounds then give strict dyadic brackets for pi.
No Hyperreal approximation or binary floating-point value supplies an input.
"""
from fractions import Fraction as Q
from pathlib import Path
import hashlib
import json
import sys
import time

sys.set_int_max_str_digits(100_000)
raw = Path(__file__).resolve().parent
out = raw / 'pi-brackets.json'
assert not out.exists()

def tan_double(x):
    assert x * x < 1
    return 2 * x / (1 - x * x)

four = tan_double(tan_double(Q(1, 5)))
assert four == Q(120, 119)
assert (four - Q(1, 239)) / (1 + four / 239) == 1
# atan(x) is between x-x^3/3 and x for 0<x<1. Thus the difference
# 4atan(1/5)-atan(1/239) is in (0,4/5), inside (0,pi/2), since
# pi/2=2 integral_0^1 1/(1+x^2) dx > 1. Its tangent is 1, hence pi/4.
assert 4 * (Q(1, 5) - Q(1, 375)) - Q(1, 239) > 0
assert Q(4, 5) < 1

def atan_bounds(denominator, bits):
    total = Q(0)
    power = denominator
    count = 0
    while True:
        term = Q(1 if count % 2 == 0 else -1, (2 * count + 1) * power)
        if abs(term) < Q(1, 20 * 2 ** (bits + 64)):
            # This is the first omitted term. The true alternating remainder
            # is strictly between zero and this term.
            return min(total, total + term), max(total, total + term), count
        total += term
        count += 1
        assert count <= 4096
        power *= denominator * denominator

def pair(q):
    return [str(q.numerator), str(q.denominator)]

def validate(bits, lower, upper, first, second):
    lo = Q(*map(int, first))
    hi = Q(*map(int, second))
    assert Q(3) < lo < lower < upper < hi < Q(4)
    assert hi - lo == Q(1, 2**bits)

rows = []
for bits in [32, 256, 1024, 2048, 2176, 2304, 4096, 8192]:
    a, b, n = atan_bounds(5, bits)
    c, d, m = atan_bounds(239, bits)
    lower, upper = 16 * a - 4 * d, 16 * b - 4 * c
    scale = 2**bits
    cell = (lower * scale).__floor__()
    assert (upper * scale).__floor__() == cell
    lo, hi = pair(Q(cell, scale)), pair(Q(cell + 1, scale))
    validate(bits, lower, upper, lo, hi)
    try:
        validate(bits, lower, upper, hi, lo)
    except AssertionError:
        pass
    else:
        raise AssertionError('reversed-bound negative control was accepted')
    rows.append({'bits': bits, 'below': lo, 'above': hi,
        'machin_lower': pair(lower), 'machin_upper': pair(upper),
        'atan5_terms': n, 'atan239_terms': m, 'reversed_bound_rejected': True})

result = {'created_ns': time.time_ns(), 'generator_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    'method': 'Exact Fraction arithmetic, rational tangent/principal-angle proof of Machin identity, strict alternating-series bounds and dyadic cell verification.',
    'scope': 'Input oracle only. No native/cold-import behavior, resource bound or defect has been measured.', 'rows': rows}
out.write_text(json.dumps(result, indent=2) + '\n')
print('R19 independent pi brackets', len(rows), 'precision scales; all reversed-bound controls rejected;', out.stat().st_size, 'bytes')
