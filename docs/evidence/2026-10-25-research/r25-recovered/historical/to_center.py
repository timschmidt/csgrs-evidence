"""Convert an ascending integer coefficient line to the centre file format.

Usage: python3 -I to_center.py <coefficient_file> <interval_lo> <interval_hi> <out>
"""
import sys

coefficients = open(sys.argv[1]).read().split()
with open(sys.argv[4], "w") as out:
    out.write(f"degree {len(coefficients) - 1}\n")
    out.write(f"interval {sys.argv[2]} {sys.argv[3]}\n")
    for c in coefficients:
        out.write(f"{c}/1\n")
