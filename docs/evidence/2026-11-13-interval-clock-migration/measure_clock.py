from pathlib import Path
import subprocess, shutil, os, statistics, json, sys, hashlib
stage=Path(__file__).resolve().parent
artifacts=Path('/mnt/development/.interval-refactor-build/clock-migration-artifacts')
label=sys.argv[1]
p=artifacts/f'clock-{label}'
shutil.copy2('/mnt/development/.interval-refactor-build/clock-owner-probe/release/clock-owner-probe',p)
for mode in ['rows','alloc']:
    out=subprocess.check_output([str(p),mode])
    (stage/f'clock-{label}-{mode}.log').write_bytes(out)
    assert out==(stage/f'clock-baseline-{mode}.log').read_bytes(), mode
for command in [['size','-A'],['nm','-SC'],['objdump','-Cd']]:
    (stage/f'clock-{label}-{command[0]}.log').write_bytes(subprocess.check_output(command+[str(p)]))
rows=[]
for variant in ['baseline',label]:
    for warmup in range(int(os.environ.get('CLOCK_WARMUP_RUNS','0'))):
        out=subprocess.check_output(['taskset','-c',str(min(os.sched_getaffinity(0))),str(artifacts/f'clock-{variant}'),'time'])
        (stage/f'clock-{label}-warmup-{variant}-{warmup}.log').write_bytes(out)
for r in range(int(os.environ.get('CLOCK_ROUNDS','6'))):
    for variant in (['baseline',label] if r%2==0 else [label,'baseline']):
        out=subprocess.check_output(['taskset','-c',str(min(os.sched_getaffinity(0))),str(artifacts/f'clock-{variant}'),'time'],text=True)
        (stage/f'clock-{label}-time-{r}-{variant}.log').write_text(out)
        vals=[int(v.split()[3])/int(v.split()[2]) for v in out.splitlines() if v.startswith('TIME ')]
        row=dict(round=r,label=variant,samples_ns=vals,median_ns=statistics.median(vals))
        rows.append(row)
        print(r,variant,row['median_ns'],flush=True)
(stage/f'clock-{label}-times.json').write_text(json.dumps(rows,indent=2)+'\n')
(stage/f'clock-{label}-artifact.json').write_text(json.dumps(dict(path=str(p),sha256=hashlib.sha256(p.read_bytes()).hexdigest(),bytes=p.stat().st_size),indent=2)+'\n')
