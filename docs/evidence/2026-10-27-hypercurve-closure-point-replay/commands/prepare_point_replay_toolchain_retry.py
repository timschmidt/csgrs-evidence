from pathlib import Path
import json,shutil,time
root=Path(__file__).resolve().parent
rows=json.loads((root/'point-replay-final-results.json').read_text())
assert len(rows)==5 and all(r['exit_code']==0 and r['source_stable'] for r in rows[:4])
assert rows[4]['name']=='fuzz-check' and rows[4]['exit_code']==1 and rows[4]['source_stable']
assert "'cargo-clippy' is not installed" in (root/'point-replay-final-fuzz-check.log').read_text()
out=root/'point-replay-qualification-attempt1';out.mkdir(exist_ok=False)
for p in root.glob('point-replay-final-*'):
 if p.is_file():shutil.copy2(p,out/p.name)
s=(root/'run_point_replay_qualification.py').read_text()
s=s.replace("assert not (root / 'point-replay-final-results.json').exists()", "assert source == json.loads((root / 'point-replay-qualification-attempt1/point-replay-final-source-before.json').read_text())")
s=s.replace("{'CARGO_TARGET_DIR': target + '-fuzz'}", "{'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': target + '-fuzz'}")
s=s.replace('records = []\nfor name, command, extra in commands:', "records = json.loads((root / 'point-replay-qualification-attempt1/point-replay-final-results.json').read_text())[:4]\nassert [r['name'] for r in records] == [c[0] for c in commands[:4]]\nevidence.save_json(root / 'point-replay-final-results.json', records)\nfor name, command, extra in commands[4:]:")
(root/'run_point_replay_qualification_retry.py').write_text(s);compile(s,'retry','exec')
(root/'point-replay-toolchain-retry.json').write_text(json.dumps({'reason':'Runtime toolchain1.98.1 lacks Clippy. Installed MSRV1.95.0 has Clippy; it already qualifies all three affected packages.','change':'Run the identical fuzz manifest, all bins and -D warnings using installed1.95.0. Preserve first four source-identical passing groups, rerun fuzz and every remaining group. No repository source, test, policy or feature changed.','recorded_epoch':time.time()},indent=2)+'\n')
p=root/'archive_point_replay_evidence.py';s=p.read_text();old='No original hard geometry assertion, policy or tolerance was weakened.';new=old+' The first final fuzz Clippy command could not start because runtime toolchain1.98.1 lacks Clippy. The source-identical retry uses installed MSRV1.95.0 with the same fuzz manifest, all bins and -D warnings; first four passing groups and the failed attempt are preserved.';assert old in s;s=s.replace(old,new);p.write_text(s)
print('Preserved unavailable-toolchain attempt; prepared source-identical remaining14group retry.')
