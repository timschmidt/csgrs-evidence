import wasmtime,json,hashlib,random
from pathlib import Path
out=Path('/tmp/interval-refactor/authored-center-radius')
path=Path('/mnt/development/csgrs/crates/hyperlattice-interval/conformance/centered-wasm/target/wasm32-unknown-unknown/release/centered_interval_wasm.wasm')
cfg=wasmtime.Config();cfg.consume_fuel=True
engine=wasmtime.Engine(cfg);module=wasmtime.Module.from_file(engine,str(path));assert not module.imports
store=wasmtime.Store(engine);instance=wasmtime.Instance(store,module,[]);exports=instance.exports(store)
cap=1_000_000;rows=[];calls=0;maxfuel=0

def call(name,*args):
 global calls,maxfuel
 store.set_fuel(cap);v=exports[name](store,*args);calls+=1;maxfuel=max(maxfuel,cap-store.get_fuel());return v
assert call('empty_unit_and_qualification')==1
rng=random.Random(20261112)
for bits in [32,64]:
 low=-(1<<(bits-1));high=-low-1
 values=[low,low+1,-2,-1,0,1,2,high-1,high]
 pairs=[(c,r) for c in values for r in values]
 pairs += [(c,r) for c in range(-32,33) for r in range(-2,17)]
 pairs += [(rng.randint(low,high),rng.randint(low,high)) for _ in range(2000)]
 for c,r in pairs:
  expected=-1 if r<0 else -2 if c-r<low or c+r>high else 1
  status=call('vector_i'+str(bits),c,r,0);assert status==expected,(bits,c,r,status,expected)
  bounds=None
  if status==1:
   bounds=[call('vector_i'+str(bits),c,r,s) for s in [1,2]]
   assert bounds==[c-r,c+r]
  rows.append(dict(family=bits,center=c,radius=r,status=status,bounds=bounds))
for c in list(range(-32,33))+[-(1<<31),-(1<<31)+1,(1<<31)-1]:
 for r in list(range(-2,17))+[(1<<31)-1]:
  expected=-1 if r<0 else -2 if min(c-r,-c-r)<-(1<<31) or max(c+r,-c+r)>(1<<31)-1 else 1
  status=call('matrix',c,r,0,0);assert status==expected,(c,r,status,expected)
  bounds=None
  if status==1:
   bounds=[[call('matrix',c,r,row,s) for s in [1,2]] for row in [0,1]]
   assert bounds==[[c-r,c+r],[-c-r,-c+r]]
  rows.append(dict(family='matrix32',center=c,radius=r,status=status,bounds=bounds))
for name,args in [('vector_i32',(0,0,3)),('matrix',(0,0,2,0))]:
 try:call(name,*args)
 except wasmtime.Trap:pass
 else:raise AssertionError('selector did not trap')
(out/'wasm-rows.json').write_text(json.dumps(rows,indent=2)+'\n')
summary=dict(calls=calls,cases=len(rows),success=sum(r['status']==1 for r in rows),invalid=sum(r['status']==-1 for r in rows),overflow=sum(r['status']==-2 for r in rows),max_fuel=maxfuel,cap=cap,bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest())
(out/'wasm-summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(summary)
