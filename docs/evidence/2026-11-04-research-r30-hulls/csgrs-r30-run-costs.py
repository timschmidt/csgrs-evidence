from pathlib import Path
import subprocess,os,time,json,statistics,hashlib
out=Path('/tmp/csgrs-r30-cost-samples');out.mkdir()
cpus=os.sched_getaffinity(0);cpu=max(cpus)
cases=['tetra','coplanar_api','retained_api','grid4913','moment64','shell684','symbolic_cube','sphere32','sphere17']
processes=[]
for pair in range(3):
    variants=['baseline','candidate'] if pair%2==0 else ['candidate','baseline']
    for case in cases:
        for variant in variants:
            tag=f'{pair}-{variant}-{case}';count=3 if case.startswith('sphere') else 20
            cmd=['taskset','-c',str(cpu),'/tmp/csgrs-r30-'+variant+'.bin',case,str(count),str(out/(tag+'.rows'))]
            started=time.time()
            with (out/(tag+'.tsv')).open('w') as stdout,(out/(tag+'.stderr')).open('w') as stderr:
                r=subprocess.run(cmd,stdout=stdout,stderr=stderr)
            processes.append(dict(pair=pair,variant=variant,case=case,command=cmd,exit_code=r.returncode,elapsed=time.time()-started))
            (out/'processes.json').write_text(json.dumps(processes,indent=2)+'\n')
            print(tag,r.returncode,flush=True)
            if r.returncode:raise SystemExit(r.returncode)
summary=[]
for variant in ['baseline','candidate']:
    for case in cases:
        rows=[line.split('\t') for p in out.glob(f'*-{variant}-{case}.tsv') for line in p.read_text().splitlines()]
        summary.append(dict(variant=variant,case=case,samples=len(rows),cold_median_ns=statistics.median(int(r[2]) for r in rows if r[1]=='0'),warm_median_ns=statistics.median(int(r[2]) for r in rows if r[1]!='0'),requested_bytes=sorted({int(r[3]) for r in rows}),allocation_calls=sorted({int(r[4]) for r in rows}),peak_logical_bytes=sorted({int(r[5]) for r in rows}),post_drop_delta=sorted({int(r[6]) for r in rows})))
(out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(out/'row-hashes.json').write_text(json.dumps({p.name:dict(bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest()) for p in sorted(out.glob('*.rows'))},indent=2)+'\n')
