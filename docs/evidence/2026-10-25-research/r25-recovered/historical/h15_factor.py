"""Factorization evidence for the captured degree-214 fillet-centre polynomial.

Usage: python3 -I h15_factor.py <center_file> [primes]

Reports the content, the x-power factor, square-freeness, and for good primes
p (not dividing the leading coefficient, f mod p square-free) the degrees of
the irreducible factors of f mod p. The intersection over primes of the
subset sums of those degree multisets bounds the degrees of factors over Q:
if it is {0, deg f}, f is irreducible over Q.
"""
import sys
import time
from fractions import Fraction
from math import gcd

from sympy import Poly, symbols, ZZ, primerange
from sympy.polys.galoistools import gf_from_int_poly, gf_sqf_p, gf_ddf_zassenhaus, gf_monic

x = symbols("x")


def load(path):
    lines = open(path).read().split("\n")
    degree = int(lines[0].split()[1])
    lo, hi = lines[1].split()[1:3]
    coeffs = [Fraction(c) for c in lines[2:2 + degree + 1]]
    return degree, Fraction(lo), Fraction(hi), coeffs


def subset_sums(degrees):
    sums = {0}
    for d in degrees:
        sums |= {s + d for s in sums}
    return sums


def main():
    degree, lo, hi, coeffs = load(sys.argv[1])
    nprimes = int(sys.argv[2]) if len(sys.argv) > 2 else 40
    den = 1
    for c in coeffs:
        den = den * c.denominator // gcd(den, c.denominator)
    ints = [int(c * den) for c in coeffs]
    content = 0
    for c in ints:
        content = gcd(content, abs(c))
    ints = [c // content for c in ints]
    low = 0
    while ints[low] == 0:
        low += 1
    print(f"degree {degree}, x^{low} factor, content {content}, max bits {max(abs(c).bit_length() for c in ints)}")
    print(f"interval [{lo}, {hi}]")
    ints = ints[low:]
    f = Poly(list(reversed(ints)), x, domain=ZZ)
    t = time.time()
    g = f.gcd(f.diff(x))
    print(f"gcd(f, f') degree {g.degree()} ({time.time() - t:.1f}s)")
    lc = ints[-1]
    allowed = set(range(0, f.degree() + 1))
    used = 0
    for p in primerange(3, 100000):
        if lc % p == 0:
            continue
        fp = gf_from_int_poly(list(reversed(ints)), p)
        fp = gf_monic(fp, p, ZZ)[1]
        if not gf_sqf_p(fp, p, ZZ):
            continue
        factors = gf_ddf_zassenhaus(fp, p, ZZ)
        degs = []
        for poly, d in factors:
            n = (len(poly) - 1) // d
            degs += [d] * n
        allowed &= subset_sums(degs)
        used += 1
        print(f"p={p}: factor degrees {sorted(degs, reverse=True)[:12]}{'...' if len(degs) > 12 else ''} ({len(degs)} factors); allowed factor degrees now {sorted(allowed)[:20]}{'...' if len(allowed) > 20 else ''}")
        sys.stdout.flush()
        if allowed == {0, f.degree()} or used >= nprimes:
            break
    print("RESULT allowed degrees over Q:", sorted(allowed))


if __name__ == "__main__":
    main()
