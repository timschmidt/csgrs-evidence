from pathlib import Path
import json, subprocess, time
r=Path(__file__).resolve().parents[1]
c=r/'controls'
d=r/'selected-point-fillets'
base=json.loads((c/'selected-point-fillets-generated-parent1/complete.json').read_text())
bad=json.loads((c/'selected-point-fillets-generated-candidate1/complete.json').read_text())
assert base['all_passed'] and not bad['all_passed']
rows=json.loads((c/'selected-point-fillets-generated-candidate1/results.json').read_text())
assert len(rows)==3 and all(row['exit_code']=='external_timeout' for row in rows[1:])
f=d/'crates/hypercurve/src/bezier_offset/algebraic_chord/tangent.rs'
s=f.read_text()
start=s.index('        // Replay and finite support queries must use the same retained field')
axis=s.index('        if let Some(direction) = self.certified_axis_direction()',start)
end=s.index('        let procedural_point = matches!(',axis)
general=s[start:axis]
cardinal=s[axis:end]
assert general.count('joint_field_oriented_side')==1
s=s[:start]+cardinal+general+s[end:]
f.write_text(s)
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=d,check=True)
p=c/'selected-point-generated-lines-contract.json'
contract=json.loads(p.read_text())
contract.update(matched_baseline='Both original cases pass using Rust1.98.1 release all-features; both candidate cases exceed the external60second observation limit.',change='Reuse the existing construction-certified cardinal support comparison before the common-field determinant. No new predicate, family restriction, approximation, cache or budget charge. General determinant remains the fallback when the axis proof does not decide.',epoch=time.time())
p.write_text(json.dumps(contract,indent=2)+'\n')
print('Cardinal proof priority applied only to isolated diagnostic checkout.')
