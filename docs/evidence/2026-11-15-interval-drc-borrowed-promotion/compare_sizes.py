from pathlib import Path
import json
s=Path(__file__).parent
all_rows=[]
for kind in ["cli","benches"]:
 a=json.loads((s/f"baseline-{kind}-binaries.json").read_text())
 b=json.loads((s/f"candidate-{kind}-binaries.json").read_text())
 assert sorted(a)==sorted(b)
 rows=[{"target":n,"kind":kind,"baseline":a[n],"candidate":b[n],"delta":{k:b[n][k]-a[n][k] for k in ["bytes","text_section_bytes","named_text_bytes"]}} for n in sorted(a)]
 (s/f"{kind}-size-deltas.json").write_text(json.dumps(rows,indent=2)+"\n")
 all_rows.extend(rows)
summary={"targets":len(all_rows),"growth_by_metric":{k:[{"target":x["target"],"delta":x["delta"][k]} for x in all_rows if x["delta"][k]>0] for k in ["bytes","text_section_bytes","named_text_bytes"]},"claim":"compiled artifact comparison only; no runtime benchmark claim"}
(s/"size-summary.json").write_text(json.dumps(summary,indent=2)+"\n")
print(json.dumps(summary,indent=2))
