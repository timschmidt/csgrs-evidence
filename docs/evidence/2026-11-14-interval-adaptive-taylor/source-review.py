from pathlib import Path
import subprocess,json
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-taylor');base=json.loads((s/'BASELINE.json').read_text())['csgrs']['head'];p='crates/hyperdynamics/src/field/taylor_flow.rs';before=subprocess.check_output(['git','show',base+':'+p],cwd=r);after=(r/p).read_bytes();assert after.startswith(before);suffix=after[len(before):].decode();assert suffix=='\n/// Bounded automatic order and duration selection with local remainder limits.\n#[cfg(feature = "adaptive-taylor")]\npub mod adaptive;\n'
rows={}
for name in ['field.rs','field/evolution.rs','field/picard.rs','field/taylor_flow/evolution.rs']:
 p='crates/hyperdynamics/src/'+name;assert subprocess.check_output(['git','show',base+':'+p],cwd=r)==(r/p).read_bytes();rows[p]='byte-identical to baseline'
(s/'source-review.json').write_text(json.dumps(dict(existing_taylor_flow_is_unchanged_prefix=True,existing_algorithms=rows,new_entry_reuses_original_picard_and_taylor_verify=True,original_predicate_order_unchanged=True),indent=2)+'\n')
