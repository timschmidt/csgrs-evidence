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
# Descartes' rule in the Bernstein basis on the selected interval:
# one sign variation bounds the number of interior roots by one, counted
# with multiplicity. Opposite nonzero endpoint signs supply existence.
from math import comb
n=degree
power=[sum(coefficients[i]*comb(i,j)*lo**(i-j) for i in range(j,n+1))*(hi-lo)**j for j in range(n+1)]
bernstein=[sum(power[j]*Fraction(comb(k,j),comb(n,j)) for j in range(k+1)) for k in range(n+1)]
signs=[1 if v>0 else -1 for v in bernstein if v]
variations=sum(a!=b for a,b in zip(signs,signs[1:]))
assert variations==1 and bernstein[0]*bernstein[-1]<0
print('Bernstein sign variations:',variations,'with opposite endpoint signs: unique interior root',flush=True)
# Bind the modular irreducibility input to the actual selected factor.
lines=(r/'center_164.txt').read_text().splitlines()
selected_coefficients=list(map(Fraction,lines[2:167]))
assert len(selected_coefficients)==165
factor=Poly(list(reversed(selected_coefficients)),x,domain=ZZ)
assert source.rem(factor).is_zero and factor.degree()==164
assert factor.eval(lo)*factor.eval(hi)<0
assert lines[1].split()[1:3]==[str(lo),str(hi)]
print('degree-164 modular input is the exact selected factor',flush=True)
