"""Matched warm completed-contract regression probe; no speedup claim."""
import hashlib, json, os, statistics, subprocess, time
from pathlib import Path
import qualify
ROOT,OUT,ENV=qualify.ROOT,qualify.OUT,qualify.ENV

def digest(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    baseline=Path("/tmp/hyperbrep-body-set-baseline")
    before=json.loads((OUT/"baseline-environment.json").read_text())
    assert digest(baseline)==before["binary_sha256"]
    source=qualify.hashes()
    commands=[]
    def run(label,args,timeout=900):
        start=time.monotonic()
        with (OUT/(label+".log")).open("w") as log:
            result=subprocess.run(["timeout","--kill-after=15s",str(timeout)+"s",*args],cwd=ROOT,env=ENV,stdout=log,stderr=subprocess.STDOUT)
        commands.append(dict(label=label,command=args,exit_code=result.returncode,seconds=time.monotonic()-start,log=label+".log"))
        (OUT/"performance-commands.json").write_text(json.dumps(commands,indent=2)+"\n")
        assert result.returncode==0,label
        assert source==qualify.hashes()
    run("candidate-build",["cargo","build","--offline","--locked","-p","hyperbrep","--release","--no-default-features","--message-format=json"])
    artifacts=[json.loads(l) for l in (OUT/"candidate-build.log").read_text().splitlines() if l.startswith("{")]
    artifact=next(a for a in artifacts if a.get("reason")=="compiler-artifact" and a["target"]["name"]=="hyperbrep")
    library=Path(next(f for f in artifact["filenames"] if f.endswith(".rlib")))
    candidate=Path("/tmp/hyperbrep-body-set-candidate")
    run("candidate-probe-build",["rustc","--edition=2024","-O","-L","dependency=/tmp/hyperbrep-review-target/release/deps","--extern","hyperbrep="+str(library),str(OUT/"candidate_probe.rs"),"-o",str(candidate)])
    growth=Path("/tmp/hyperbrep-body-set-growth")
    run("growth-build",["rustc","--edition=2024","-O","-L","dependency=/tmp/hyperbrep-review-target/release/deps","--extern","hyperbrep="+str(library),str(OUT/"growth_probe.rs"),"-o",str(growth)])
    run("growth-probe",["taskset","-c",str(min(os.sched_getaffinity(0))),str(growth)],300)
    growth_rows=[json.loads(line) for line in (OUT/"growth-probe.log").read_text().splitlines()]
    assert [r["input_bodies_each"] for r in growth_rows]==[1,4,16,64]
    (OUT/"growth.json").write_text(json.dumps(dict(scope="Absolute native finite-composition scaling probe; includes construction, operations, independent occupancy/volume checks and archive replay; process timeout is external containment",rows=growth_rows,binary_sha256=digest(growth),source_sha256=source),indent=2)+"\n")
    for repetition in range(3):
        for label,binary in ([("baseline",baseline),("candidate",candidate)] if repetition%2==0 else [("candidate",candidate),("baseline",baseline)]):
            run(f"paired-{repetition}-{label}",["taskset","-c",str(min(os.sched_getaffinity(0))),str(binary)],300)
    rows=[]
    labels=[json.loads(l)["label"] for l in (OUT/"baseline-probe.log").read_text().splitlines() if json.loads(l)["sample"]==0]
    for label in labels:
        samples={kind:[json.loads(line) for repetition in range(3) for line in (OUT/f"paired-{repetition}-{kind}.log").read_text().splitlines() if json.loads(line)["label"]==label] for kind in ["baseline","candidate"]}
        assert all(len(s)==15 for s in samples.values())
        all_samples=samples["baseline"]+samples["candidate"]
        for field in ["archive_bytes","archive_fnv1a64","iterations","completion"]:
            assert len({r[field] for r in all_samples})==1,(label,field)
        measurements={kind:{field:statistics.median(s[field] for s in values)/20 for field in ["ns","allocation_calls","requested_bytes"]} for kind,values in samples.items()}
        rows.append(dict(label=label,samples_per_binary=15,iterations_per_sample=20,measurements_per_completion=measurements,ratios={field:measurements["candidate"][field]/measurements["baseline"][field] for field in ["ns","allocation_calls","requested_bytes"]},archive_bytes=all_samples[0]["archive_bytes"],archive_fnv1a64=all_samples[0]["archive_fnv1a64"],completion="certified",timing_range_ns={kind:[min(v["ns"] for v in values)/20,max(v["ns"] for v in values)/20] for kind,values in samples.items()}))
    result=dict(scope="Warm six-row completed-contract regression probe, not cold, peak-memory, campaign or cross-library evidence",rows=rows,binaries={kind:dict(path=str(binary),bytes=binary.stat().st_size,sha256=digest(binary)) for kind,binary in [("baseline",baseline),("candidate",candidate)]},candidate_library=dict(path=str(library),sha256=digest(library)),source_sha256=source,baseline_revision=before["revision"],cpu=min(os.sched_getaffinity(0)),ordering="baseline/candidate, candidate/baseline, baseline/candidate",decision="Retain exact composition extension with measured regression costs visible; no performance-only or speedup claim")
    (OUT/"performance.json").write_text(json.dumps(result,indent=2)+"\n")
    for row in rows: print(row["label"],json.dumps(row["ratios"]),flush=True)

if __name__=="__main__": main()
