"""Summarize captured H13 leaf sign queries.

Usage: python3 -I leaves.py <leaves-dir> [detail]

For each leaf: elapsed time, result, filter and defining degrees, coefficient
sizes, and (with detail) the magnitude log2|filter(root)| estimated with
mpmath at high precision from a refined root of the defining polynomial.
"""
import glob
import os
import sys
from fractions import Fraction
sys.set_int_max_str_digits(0)


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
        filt.append(lines[i])
        i += 1
    i += 1
    defining = [l for l in lines[i:] if l]
    return meta, filt, defining


def bits(text):
    if text == "NONRATIONAL":
        return -1
    f = Fraction(text)
    return abs(f.numerator).bit_length() + f.denominator.bit_length()


def main():
    detail = len(sys.argv) > 2
    for path in sorted(glob.glob(os.path.join(sys.argv[1], "leaf_*.txt"))):
        meta, filt, defining = load(path)
        fb = [bits(c) for c in filt]
        db = [bits(c) for c in defining]
        line = (
            f"{os.path.basename(path)} {meta['elapsed_ms']}ms {meta['result']} "
            f"filter deg {meta['filter_degree']} max {max(fb)} bits total {sum(fb)}; "
            f"defining deg {meta['defining_degree']} max {max(db)} bits"
        )
        if detail and -1 not in fb and -1 not in db:
            import mpmath

            mpmath.mp.prec = 60000
            lo, hi = (Fraction(x) for x in meta["interval"].split())
            d = [mpmath.mpf(Fraction(c).numerator) / Fraction(c).denominator for c in defining]
            f = [mpmath.mpf(Fraction(c).numerator) / Fraction(c).denominator for c in filt]
            poly = lambda cs, x: mpmath.polyval(list(reversed(cs)), x)
            a = mpmath.mpf(lo.numerator) / lo.denominator
            b = mpmath.mpf(hi.numerator) / hi.denominator
            sa = mpmath.sign(poly(d, a))
            for _ in range(20000):
                m = (a + b) / 2
                sm = mpmath.sign(poly(d, m))
                if sm == 0:
                    a = b = m
                    break
                if sm == sa:
                    a = m
                else:
                    b = m
            value = poly(f, (a + b) / 2)
            line += f"; log2|filter(root)| ~ {float(mpmath.log(abs(value), 2)) if value != 0 else '-inf'}"
        print(line)


if __name__ == "__main__":
    main()
