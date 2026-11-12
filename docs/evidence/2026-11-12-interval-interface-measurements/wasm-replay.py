from pathlib import Path
from fractions import Fraction
import json,sys,hashlib
import wasmtime
path=Path(sys.argv[1]);config=wasmtime.Config();config.consume_fuel=True
engine=wasmtime.Engine(config);store=wasmtime.Store(engine);module=wasmtime.Module.from_file(engine,str(path));imports=module.imports
def forbidden_import(*args): raise RuntimeError('measurement invoked a host import')
assert all(isinstance(i.type,wasmtime.FuncType) for i in imports)
stubs=[wasmtime.Func(store,i.type,forbidden_import) for i in imports]
fn=wasmtime.Instance(store,module,stubs).exports(store)['measurement'];mask=(1<<64)-1
def exact_text(value):
 sign='-' if value<0 else '';whole,remainder=divmod(abs(value.numerator),value.denominator)
 if not remainder:return sign+str(whole)
 fraction=str(remainder)+'/'+str(value.denominator)
 return sign+(str(whole)+' ' if whole else '')+fraction
cases=[(n,u,d) for n in range(-32,33) for u in range(-4,9) for d in [1,2,3,7,31]]
cases += [(n,u,d) for n in [-(1<<63),-(1<<63)+1,-1,0,1,(1<<63)-1] for u in [-1,0,1,(1<<63)-1] for d in [0,1,2,3,7,(1<<64)-1]]
maxfuel=0;success=negative=invalid=0
for n,u,d in cases:
 if d==0:expected=mask;invalid+=1
 elif u<0:expected=0;negative+=1
 else:
  text=f'{exact_text(Fraction(n-u,d))} {exact_text(Fraction(n+u,d))} mm';expected=0xcbf29ce484222325
  for b in text.encode():expected=((expected^b)*0x100000001b3)&mask
  success+=1
 store.set_fuel(1000000);actual=fn(store,n,u,d)&mask
 assert actual!=mask-1, ('unexpected kernel error',n,u,d)
 assert actual==expected,(n,u,d,actual,expected)
 maxfuel=max(maxfuel,1000000-store.get_fuel())
print(json.dumps({'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'calls':len(cases),'success':success,'negative_radius':negative,'invalid_denominator':invalid,'imports':len(imports),'host_calls':0,'host_contract':'all imported functions trap if reached','maximum_fuel':maxfuel,'fuel_per_call':1000000,'oracle':'Python Fraction exact endpoint text FNV, supplemental to full-value host tests'},indent=2))
