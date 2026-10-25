from pathlib import Path
from fractions import Fraction
from sympy import Poly, symbols, ZZ, __version__
import hashlib
r=Path(__file__).resolve().parent/'historical/h15'
raw=(r/'center_214.txt').read_bytes()
assert hashlib.sha256(raw).hexdigest()=='e56954fbe73023ba266e011b4e2ae1bb702d6bf43c59fd9574e6b2ca6560d2f6'
lines=raw.decode().splitlines();degree=int(lines[0].split()[1]);lo,hi=map(Fraction,lines[1].split()[1:3])
coefficients=list(map(Fraction,lines[2:2+degree+1]))
assert all(x.denominator==1 for x in coefficients)
x=symbols('x');source=Poly(list(reversed([int(c) for c in coefficients])),x,domain=ZZ)
lines=(r/'factors_214.txt').read_text().splitlines();product=Poly(1,x,domain=ZZ);degrees=[];selected=[]
print('SymPy',__version__,flush=True)
for i in range(0,len(lines),2):
 header=lines[i].split();d,m=int(header[2]),int(header[4]);coeffs=list(map(int,lines[i+1].split()))
 f=Poly(list(reversed(coeffs)),x,domain=ZZ)
 assert f.degree()==d and m==1
 product*=f**m;degrees.append(d)
 assert source.rem(f).is_zero
 changes=f.eval(lo)*f.eval(hi)<0
 if changes: selected.append(d)
 print('factor',d,'exact-divisor',True,'sign-change',bool(changes),flush=True)
assert degrees==[2,8,40,164] and selected==[164]
assert product==source
assert source.gcd(source.diff()).degree()==0
print('exact product and square-freeness verified',flush=True)
assert source.count_roots(lo,hi)==1
print('exactly one real root in captured interval',lo,hi,flush=True)
