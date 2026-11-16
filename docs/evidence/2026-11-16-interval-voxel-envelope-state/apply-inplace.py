from pathlib import Path
import subprocess,json,re
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);assert (s/'controls-complete.json').exists();assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
p=r/'crates/hypervoxel/src/field.rs';text=p.read_text();begin=text.index('        let mut vector_count = 0_usize;',text.index('impl FieldEnvelopeFacts'))
end=text.index('\n    }\n}',begin)
body=text[begin:end];loops=body[body.index('        for vector in vectors {'):body.index('        let envelope_count =')]
for name in ['vector_count','tensor_count','incompatible_shapes','vector_interval','tensor_interval']:loops=re.sub(r'\b'+name+r'\b','facts.'+name,loops)
replacement='''        let mut facts = Self {
            vector_count: 0,
            tensor_count: 0,
            envelope_count: 0,
            has_envelopes: false,
            vector_interval: None,
            tensor_interval: None,
            incompatible_shapes: 0,
            certainty: AggregateCertainty::Unknown,
            certified_envelope_ready: false,
        };

'''+loops+'''        facts.envelope_count = facts.vector_count + facts.tensor_count;
        facts.has_envelopes = facts.envelope_count > 0;
        facts.certified_envelope_ready = facts.has_envelopes && facts.incompatible_shapes == 0;
        facts.certainty = if facts.certified_envelope_ready {
            AggregateCertainty::Certified
        } else {
            AggregateCertainty::Unknown
        };
        Ok(facts)'''
p.write_text(text[:begin]+replacement+text[end:])
subprocess.run(['rustfmt','+1.95.0','--edition','2024',str(p)],cwd=r,check=True)
(s/'candidate.patch').write_bytes(subprocess.check_output(['git','diff','--','crates/hypervoxel/src/field.rs'],cwd=r))
print((s/'candidate.patch').read_text())
