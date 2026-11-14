from pathlib import Path
import json,subprocess,hashlib,re
s=Path(__file__).parent
artifacts=Path('/mnt/development/.interval-refactor-build/taylor-polynomial-arithmetic-artifacts')
rows=[]
for name in ['old-native-cost-dyadic-evolution-cost-probe','model-cost-taylor-model-cost-probe','affine-cost-taylor-model-cost-probe']:
    transcripts=[]
    for label in ['baseline','private']:
        path=artifacts/f'{label}-{name}'
        result=subprocess.run([str(path)],capture_output=True,text=True)
        (s/f'{label}-{name}-observations.log').write_text(result.stdout+result.stderr)
        assert result.returncode==0,(name,label,result.stderr)
        # This is an outcome/allocation comparison during builds, not a timing claim.
        canonical='\n'.join(re.sub(r' cold_ns=\d+','',line) for line in result.stdout.splitlines() if not line.startswith('TIMING '))+'\n'
        (s/f'{label}-{name}-canonical.log').write_text(canonical)
        transcripts.append(canonical)
    assert transcripts[0]==transcripts[1],name
    rows.append(dict(name=name,equal=True,canonical_bytes=len(transcripts[0].encode()),sha256=hashlib.sha256(transcripts[0].encode()).hexdigest(),timing_disposition='Incidental timings retained but excluded from semantic/allocation comparison; no timing conclusion under concurrent builds'))
    (s/'consumer-observation-comparison.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,'equal',flush=True)
