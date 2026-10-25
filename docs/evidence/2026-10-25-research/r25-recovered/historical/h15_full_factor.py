"""Full factorization over Q of the captured fillet-centre polynomial.

Usage: python3 -I h15_full_factor.py <center_file> <out_file>

Writes each irreducible factor (ascending integer coefficients) and identifies
the factor owning the selected root: the captured interval isolates one simple
root of the square-free product, so exactly one factor changes sign across it.
Each factor is checked independently by exact division of the product.
"""
import sys
import time
from fractions import Fraction

from sympy import Poly, symbols, ZZ

x = symbols("x")


def load(path):
    lines = open(path).read().split("\n")
    degree = int(lines[0].split()[1])
    lo, hi = lines[1].split()[1:3]
    coeffs = [Fraction(c) for c in lines[2:2 + degree + 1]]
    return degree, Fraction(lo), Fraction(hi), coeffs


def value(coefficients, point):
    result = Fraction(0)
    for c in reversed(coefficients):
        result = result * point + c
    return result


def main():
    degree, lo, hi, coeffs = load(sys.argv[1])
    f = Poly(list(reversed([int(c) for c in coeffs])), x, domain=ZZ)
    t = time.time()
    content, factors = f.factor_list()
    print(f"factored in {time.time() - t:.1f}s: content {content}, degrees {[(g.degree(), m) for g, m in factors]}", flush=True)
    product = Poly(content, x, domain=ZZ)
    with open(sys.argv[2], "w") as out:
        for g, m in factors:
            product = product * g ** m
            ascending = [int(c) for c in reversed(g.all_coeffs())]
            out.write(f"factor degree {g.degree()} multiplicity {m}\n")
            out.write(" ".join(str(c) for c in ascending) + "\n")
            out.flush()
            lower = value(ascending, lo)
            upper = value(ascending, hi)
            changes = (lower < 0) != (upper < 0) and lower != 0 and upper != 0
            quotient, remainder = f.div(g)
            print(
                f"  degree {g.degree()} (mult {m}): sign change on [{lo}, {hi}] = {changes}, "
                f"exact division remainder zero = {remainder.is_zero}, "
                f"max coefficient bits {max(abs(c).bit_length() for c in ascending)}",
                flush=True,
            )
    print(f"product of factors equals the polynomial: {product == f}", flush=True)


if __name__ == "__main__":
    main()
