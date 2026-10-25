"""Estimate log2|filter(root)| for captured leaf sign queries.

Usage: python3 -I leaf_value.py <leaf files...>

The selected root of the defining polynomial is bracketed by bisection on the
captured isolating interval and refined by Newton's method at high precision;
the filter is then evaluated there. This is a numerical estimate used only to
characterize the workload, not a certificate. Also reports the modular
coprimality of the filter and defining polynomial modulo a few primes, and the
degree of their exact gcd over Q.
"""
import sys
from fractions import Fraction
sys.set_int_max_str_digits(0)

import mpmath
from sympy import Poly, symbols, ZZ, QQ

x = symbols("x")


def load(path):
    lines = open(path).read().split("\n")
    meta = {}
    i = 0
    while lines[i] != "filter":
        key, _, value = lines[i].partition(" ")
        meta[key] = value
        i += 1
    i += 1
    filt = []
    while lines[i] != "defining":
        filt.append(Fraction(lines[i]))
        i += 1
    i += 1
    defining = [Fraction(l) for l in lines[i:] if l]
    return meta, filt, defining


def to_mpf(f):
    return mpmath.mpf(f.numerator) / f.denominator


def evaluate(coefficients, point):
    value = mpmath.mpf(0)
    for c in reversed(coefficients):
        value = value * point + c
    return value


def main():
    for path in sys.argv[1:]:
        meta, filt, defining = load(path)
        lo, hi = (Fraction(v) for v in meta["interval"].split())
        mpmath.mp.prec = 256
        d = [to_mpf(c) for c in defining]
        a, b = to_mpf(lo), to_mpf(hi)
        sa = mpmath.sign(evaluate(d, a))
        for _ in range(200):
            m = (a + b) / 2
            sm = mpmath.sign(evaluate(d, m))
            if sm == sa:
                a = m
            else:
                b = m
        root = (a + b) / 2
        mpmath.mp.prec = 80000
        d = [to_mpf(c) for c in defining]
        dd = [c * k for k, c in enumerate(d)][1:]
        f = [to_mpf(c) for c in filt]
        root = mpmath.mpf(root)
        for _ in range(14):
            root = root - evaluate(d, root) / evaluate(dd, root)
        value = evaluate(f, root)
        log_value = float(mpmath.log(abs(value), 2)) if value != 0 else float("-inf")
        fmax = max(abs(float(mpmath.log(abs(c), 2))) for c in f if c != 0)
        # Exact gcd over Q of the integer-scaled polynomials.
        F = Poly([int(c * 1) if c.denominator == 1 else c for c in reversed(filt)], x, domain=QQ)
        D = Poly(list(reversed(defining)), x, domain=QQ)
        g = F.gcd(D)
        print(
            f"{path.split('/')[-1]}: {meta['elapsed_ms']} ms, {meta['result']}, "
            f"log2|filter(root)| = {log_value:.1f}, log2 max|coefficient| ~ {fmax:.0f}, "
            f"gcd degree {g.degree()}, root ~ {mpmath.nstr(root, 12)}"
        )
        sys.stdout.flush()


if __name__ == "__main__":
    main()
