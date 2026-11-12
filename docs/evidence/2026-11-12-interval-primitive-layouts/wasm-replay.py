import wasmtime,json,hashlib,platform
from pathlib import Path
out=Path('/tmp/interval-refactor/primitive-layouts')
path=Path('/mnt/development/csgrs/crates/hyperlattice-interval/conformance/primitive-layouts/wasm/target/wasm32-unknown-unknown/release/interval_layout_wasm.wasm')
config=wasmtime.Config();config.consume_fuel=True
engine=wasmtime.Engine(config);module=wasmtime.Module.from_file(engine,str(path))
assert not module.imports
store=wasmtime.Store(engine);instance=wasmtime.Instance(store,module,[])
exports=instance.exports(store);cap=100_000_000
store.set_fuel(cap);assert exports['float_qualification'](store)==3
rows=[]
for wide in [0,1]:
 scale=1 << (32 if wide else 8);quantum=scale//16
 for n in [0,1,2,3,4,16,64,256,1024]:
  for seed in range(17):
   expected=[0,0]
   for i in range(n):
    al=((i+seed)%17-8)*quantum;au=al+(i%3)*quantum
    bl=((i+2*seed)%13-6)*quantum;bu=bl+(i%2)*quantum
    # Four add/sub steps contain the source; intersection with source is
    # exactly source. Subsequent hull and independent dot use these bounds.
    lo=min(al,bl);hi=max(au,bu)
    products=[lo*al,lo*au,hi*al,hi*au]
    expected[0]+=min(products)//scale
    expected[1]+=-((-max(products))//scale)
   for soa in [0,1]:
    actual=[];fuel=0
    for upper in [0,1]:
     store.set_fuel(cap)
     actual.append(exports['fixed'](store,soa,wide,n,seed,upper))
     fuel+=cap-store.get_fuel()
    assert actual==expected,(wide,n,seed,soa,actual,expected)
    rows.append(dict(wide=wide,n=n,seed=seed,soa=soa,lower=actual[0],upper=actual[1],fuel_two_endpoints=fuel))
# Hostile fixture selectors must trap rather than publish a default value.
for args in [(2,0,1,0,0),(0,2,1,0,0),(0,0,5,0,0),(0,0,1,0,2)]:
 store.set_fuel(cap)
 try: exports['fixed'](store,*args)
 except wasmtime.Trap: pass
 else: raise AssertionError(args)
(out/'wasm-rows.json').write_text(json.dumps(rows,indent=2)+'\n')
summary=dict(sha256=hashlib.sha256(path.read_bytes()).hexdigest(),bytes=path.stat().st_size,completed_pairs=len(rows),calls=2*len(rows),float_qualification='both UnqualifiedEnvironment',hostile_traps=4,max_fuel_pair=max(r['fuel_two_endpoints'] for r in rows),fuel_cap_per_call=cap)
(out/'wasm-summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(summary)
