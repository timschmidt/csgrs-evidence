"""Deliberate faults must fail runtime assertions; restore source after each."""
import difflib, hashlib, json, os, subprocess, time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[5]
OUT=Path(__file__).resolve().parent / "controls"
OUT.mkdir(exist_ok=True)
ENV=os.environ | {"PATH":"/home/tim/.cargo/bin:"+os.environ["PATH"],"CARGO_HOME":"/tmp/hyperbrep-review-cargo","CARGO_TARGET_DIR":"/tmp/hyperbrep-review-target"}
rows=[]
controls=[
 ("omit-selection-identity", "ownership/boolean.rs", "if first.model.same_revision(&second.model) && first.solids == second.solids {", "if false {", "selection_identity_covers_curved_sweeps"),
 ("confuse-selections", "ownership/boolean.rs", "if first.model.same_revision(&second.model) && first.solids == second.solids {", "if first.model.same_revision(&second.model) {", "unselected_bodies_never_reappear"),
 ("wrong-empty-difference", "ownership/boolean.rs", "BooleanOperation::Difference => first.clone(),", "BooleanOperation::Difference => second.clone(),", "empty_identities_continue"),
 ("unnormalized-overlap", "boolean_kernel/sets.rs", "pack(normalize(components)?)", "pack(components)", "overlapping_selections_follow_union_semantics"),
 ("ignore-later-cutters", "boolean_kernel/sets.rs", "for &b in second_solids {", "for &b in second_solids.iter().take(1) {", "overlapping_selections_follow_union_semantics"),
 ("copy-unselected-solids", "topology/transfer.rs", "self.append_records(builder, Some(&selection))?", "self.append_records(builder, None)?", "unselected_bodies_never_reappear"),
]
for label,relative,old,new,test in controls:
    path=ROOT/"crates/hyperbrep/src"/relative
    before=path.read_text()
    if label=="ignore-later-cutters":
        at=before.rindex(old); after=before[:at]+before[at:].replace(old,new,1)
    else:
        assert before.count(old)==1,(label,before.count(old))
        after=before.replace(old,new)
    patch="".join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile=relative,tofile=relative))
    (OUT/(label+".patch")).write_text(patch)
    command=["cargo","test","--offline","--locked","-p","hyperbrep","--test","body_sets",test,"--","--exact","--nocapture"]
    start=time.monotonic()
    try:
        path.write_text(after)
        with (OUT/(label+".log")).open("w") as log:
            result=subprocess.run(["timeout","--kill-after=10s","300s",*command],cwd=ROOT,env=ENV,stdout=log,stderr=subprocess.STDOUT)
        text=(OUT/(label+".log")).read_text()
        assert result.returncode==101 and "test result: FAILED" in text and f"test {test} ... FAILED" in text,(label,result.returncode)
    finally:
        path.write_text(before)
    assert path.read_text()==before
    rows.append(dict(label=label,test=test,command=command,exit_code=result.returncode,seconds=time.monotonic()-start,source_sha256=hashlib.sha256(before.encode()).hexdigest(),restored=True))
    (OUT/"results.json").write_text(json.dumps(rows,indent=2)+"\n")
    print(label,"detected and source restored",flush=True)
