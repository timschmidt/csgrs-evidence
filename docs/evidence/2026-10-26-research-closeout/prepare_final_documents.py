from pathlib import Path
import importlib.util, json, subprocess, time
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
raw=Path('/tmp/csgrs-research-2026-10-25')
meta=json.loads((raw/'closeout-archive.json').read_text())
assert meta['validation_admission']['all_required_checks_passed']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()=='5e7a430c6b93d6889a6b83ee88873b89d6caf5c1'
assert subprocess.check_output(['git','diff','--name-only'],cwd=root,text=True)==''
repository='/home/tim/Documents/GitHub/workspace/csgrs-evidence.git'
spec=importlib.util.spec_from_file_location('evidence_archive',root/'scripts/evidence_archive.py')
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
module.ROOTS={meta['record']:False}
rows=module.manifest(repository,meta['commit']);assert len(rows)==2
row=rows[1];record,files,size,digest=row.split('\t')
manifest=root/'docs/evidence-archive.tsv';old=manifest.read_text().splitlines()
assert not any(x.startswith(record+'\t') for x in old)
records=[x for x in old[1:] if not x.startswith('excluded:')]
excluded=[x for x in old[1:] if x.startswith('excluded:')]
new=[old[0],*sorted([*records,row],key=lambda s:s.split('\t')[0].encode()),*excluded]
local=[x for x in new[1:] if x.startswith(('docs/evidence/2026-10-25-research','docs/evidence/2026-10-26-research-closeout'))]
assert len(local)==18
module.ROOTS={x.split('\t')[0]:False for x in local}
assert module.manifest(repository,meta['commit'])==[module.HEADER,*local]
historical='b20000e377626a41b6ff8e6f87aee2b20ebd7865'
assert subprocess.check_output(['git','-C',repository,'rev-parse','refs/heads/main'],text=True).strip()==historical
changed=subprocess.check_output(['git','-C',repository,'diff-tree','--no-commit-id','--name-only','-r',historical,meta['commit']],text=True).splitlines()
assert changed and all(any(n.startswith(r+'/') for r in module.ROOTS) for n in changed)
post=raw/'post-closeout';post.mkdir(exist_ok=True)
verification={'verified_ns':time.time_ns(),'commit':meta['commit'],'record_row':row,'verified_research_records':18,'historical_paths_unchanged':True,'historical_main':historical,'previous_manifest_rows_unchanged':True,'published':False}
(post/'evidence-verification.json').write_text(json.dumps(verification,indent=2)+'\n')
manifest.write_text('\n'.join(new)+'\n')
archive=root/'docs/evidence-archive.md';text=archive.read_text()
text=text.replace('| Archived commit |','| Historical archive commit |',1).replace('| Records | 309 records,','| Historical records | 309 records,',1)
text=text.replace('| Historical records | 309 records, 552,370 files, 13.96 GB |','| Historical records | 309 records, 552,370 files, 13.96 GB |\n| Research branch | [`research-2026-10-25`](https://github.com/timschmidt/csgrs-evidence/tree/research-2026-10-25) |\n| Research closeout commit | `'+meta['commit']+'` |',1)
text=text.replace('  '+historical+'\n```','  '+meta['commit']+'\n```',1)
needle='## Local follow-on records\n\nThe latest local follow-on commit is\n'
assert needle in text
addition=f"""## Local follow-on records

The published [`research-2026-10-25` branch](https://github.com/timschmidt/csgrs-evidence/tree/research-2026-10-25)
ends at `{meta['commit']}`, adding
`{record}` ({int(files):,} files, {int(size):,} bytes), with
SHA-256 `{digest}`.
All eighteen research and closeout records verify; the earlier records and
historical `main` are unchanged.

The closeout record covers all 129 locally executable workflow steps and 196
strict Clippy checks, including the 256 Hypertri feature combinations,
stable/MSRV packaging and real external consumers, coverage, directed and
sanitizer campaigns, and release WASM demos. Its validation admission identifies
final code `5e7a430c6b93d6889a6b83ee88873b89d6caf5c1` and the unchanged compiled
inputs at earlier checkpoints. Four GitHub-hosted configuration, upload and
deployment actions were inspected but cannot run locally. Local packaging does
not establish registry publication or hosted docs.rs/deployment success.

R19 remains the final research experiment. The pre-push benchmark executions
are validation under concurrent load, not new performance-admission evidence.
The closure plans and agent instructions are committed requirements; they do
not establish implementation completeness. Earlier paragraphs below describe
the original local checkpoints; all are included in the published branch.

The preceding local follow-on commit was
"""
text=text.replace(needle,addition,1)
text=text.replace('The branch has not been pushed; the published historical archive above remains','At this checkpoint the branch had not been pushed; the published historical archive above remained')
text=text.replace('None has been pushed. Verify the expanded manifest using:', 'They were unpublished at this checkpoint. Verify the current expanded manifest using:')
text=text.replace('  8e48e5ce1c98476c61bfa406304dc3ce7158b324\n```','  '+meta['commit']+'\n```')
text=text.replace('The local\nresearch branch remains unpublished.','The branch was unpublished at this checkpoint.')
text=text.replace('The local research branch\nremains unpublished.','The branch was unpublished at this checkpoint.')
text=text.replace('The local research branch remains unpublished;', 'The branch was unpublished at this checkpoint;')
archive.write_text(text)
program=root/'docs/research-program.md';text=program.read_text()
needle='The separate repository-wide pre-push checks are part of closing out this run.'
assert needle in text
text=text.replace(needle,'The repository-wide closeout passed all 129 locally executable workflow steps\nand 196 strict Clippy checks, with final-source attribution recorded in the\n[evidence index](evidence-archive.md#local-follow-on-records). This includes\nstable/MSRV package consumers, coverage, sanitizer campaigns and WASM demos.\nFour hosted configuration/upload/deployment actions were inspected and remain\noutside local execution. Registry publication, broad operation closure and the\nremaining research packages are still open.',1)
program.write_text(text)
actual=subprocess.check_output(['git','diff','--name-only'],cwd=root,text=True).splitlines()
assert set(actual)=={'docs/evidence-archive.md','docs/evidence-archive.tsv','docs/research-program.md'}
(post/'document-delta.json').write_text(json.dumps({'validated_code_revision':'5e7a430c6b93d6889a6b83ee88873b89d6caf5c1','paths':actual,'qualification':'Only the evidence index and research ledger changed after full validation. All released source payloads, manifests, tests, API documentation inputs, consumer programs, and workflows are identical.'},indent=2)+'\n')
print(json.dumps(verification,indent=2))
