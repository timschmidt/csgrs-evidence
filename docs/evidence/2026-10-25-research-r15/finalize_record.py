from pathlib import Path
import hashlib,json,subprocess

raw=Path(__file__).resolve().parent
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
validation=raw/'primary-validation-1792951229600891662'
assert json.loads((validation/'completion.json').read_text())=={'failed':None,'sources_unchanged':True}
summary=json.loads((validation/'summary.json').read_text())
assert summary['full-hypercurve.log']=={'groups':72,'passed':2618,'failed':0,'ignored':35}
assert summary['downstream.log']=={'groups':4,'passed':24,'failed':0,'ignored':0}
commands=[json.loads(l) for l in (validation/'commands.jsonl').read_text().splitlines()]
finished=[r for r in commands if r['event']=='finish'];assert len(finished)==8 and all(r['status']==0 for r in finished)
for row in json.loads((raw/'pre-promotion-source-review.json').read_text())['paths']:
    assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['candidate']
p=root/'crates/hypercurve/PERFORMANCE.md';s=p.read_text();needle='Combined primary validation is pending.';assert s.count(needle)==1;s=s.replace(needle,'The final combined primary run passes all 2,618 Hypercurve tests (35 ignores),\n24 downstream tests and all eight recorded checks; its compiled sources are\nunchanged across validation.');s=s.replace('The proposed retention\nbasis is the independently reproduced exact-completion gain','The retention\nbasis is the independently reproduced exact-completion gain');s=s.replace('Evidence is being prepared as `2026-10-25-research-r15`.','Evidence belongs to local archive record `2026-10-25-research-r15`.');p.write_text(s)
p=root/'docs/research-program.md';s=p.read_text();old=next(l for l in s.splitlines() if l.startswith('| R15 |'));new='| R15 | Finish local root comparisons and share singleton selection certificates | equivalent-field replay kept for exact-comparison completion after all eight final primary checks pass: 2,618 Hypercurve tests, 24 downstream tests, Clippy, docs and WASM compilation. The current primary counterfactual reproduces the previously undecided 2^-600 pair. Thirty native pairs preserve 26,880 Certified samples / 1,680 artifacts and reduce targeted overlap cost, but general performance admission fails, including one simultaneously adverse control. Costs are disclosed and measured on the private pre-R23 stack. Shared-certificate factoring, cancellation and broader R15/P06 remain open. |';assert s.count(old)==1;s=s.replace(old,new);assert '### R15 equivalent-field comparison milestone' not in s;s+='\n'+(raw/'admission-draft.md').read_text();p.write_text(s)
promotion=json.loads((raw/'primary-promotion.json').read_text());promotion['status']='kept for scoped exact-comparison completion after final combined-stack validation';promotion['validation']=str(validation);promotion['summary']=summary;promotion['commands']=finished;(raw/'admission.json').write_text(json.dumps(promotion,indent=2)+'\n')
p=raw/'review-notes.md';s=p.read_text();s=s.replace('retention remains\npending that result.','the final combined run passes all eight checks, including 2,618 Hypercurve\ntests (35 ignored) and 24 downstream tests. The scoped exact-comparison\ncompletion is kept.');p.write_text(s)
(raw/'final-source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
print('R15 final admission record updated after eight passing checks.')
