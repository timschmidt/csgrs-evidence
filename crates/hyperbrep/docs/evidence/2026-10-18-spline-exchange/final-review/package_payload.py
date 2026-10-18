"""Verify spline inspection, exchange, fixtures and shared tests enter Cargo payloads."""
import hashlib,json,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,hashes,run
source=hashes();rows={}
for crate,required in [
 ('hyperbrep',{'tests/retained_region_extrusion.rs','src/construction.rs','src/topology/query.rs','src/boolean_kernel.rs','src/geometry/spline.rs','tests/spline_geometry.rs','tests/support/spline_geometry.rs'}),
 ('hyperbrep-io',{'src/step/advanced/spline.rs','src/step/write/advanced/spline.rs','tests/spline_exchange.rs','tests/support/spline_exchange.rs','tests/fixtures/spline-extrusion.step'}),
]:
    assert run('package-list-'+crate,['cargo','package','--offline','--locked','-p',crate,'--allow-dirty','--list'],300)==0
    command=json.loads((OUT/'attempts.json').read_text())[-1]
    members=(OUT/command['log']).read_text().splitlines()
    assert required<=set(members),required-set(members)
    assert not any(name.startswith('docs/evidence/') for name in members)
    rows[crate]=dict(command=command,members=members,files={name:dict(sha256=hashlib.sha256(path.read_bytes()).hexdigest(),bytes=path.stat().st_size) for name in members if (path:=ROOT/'crates'/crate/name).is_file()})
assert hashes()==source
(OUT/'package-payload.json').write_text(json.dumps(dict(source=source,crates=rows,scope='Cargo membership and physical source bytes only. No archive build, registry publication, MSRV or installed-consumer claim.'),indent=2)+'\n')
print({name:len(row['members']) for name,row in rows.items()})
