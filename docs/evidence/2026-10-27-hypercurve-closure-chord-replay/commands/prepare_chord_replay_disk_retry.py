from pathlib import Path
import json,shutil
root=Path(__file__).resolve().parent
rows=json.loads((root/'chord-replay-final-results.json').read_text())
assert len(rows)==9 and all(r['exit_code']==0 and r['source_stable'] for r in rows[:8])
assert rows[8]['name']=='dependent-hypercircuit' and rows[8]['exit_code']==101 and rows[8]['source_stable']
assert 'No space left on device' in (root/'chord-replay-final-dependent-hypercircuit.log').read_text()
out=root/'chord-replay-qualification-attempt1';out.mkdir(exist_ok=False)
for p in root.glob('chord-replay-final-*'):
 if p.is_file():shutil.copy2(p,out/p.name)
shutil.copy2(root/'point-replay-build-cache-recovery.json',root/'chord-replay-build-cache-recovery.json')
s=(root/'run_chord_replay_qualification.py').read_text()
s=s.replace("assert not (root / 'chord-replay-final-results.json').exists()", "assert source == json.loads((root / 'chord-replay-qualification-attempt1/chord-replay-final-source-before.json').read_text())")
s=s.replace('records = []\nfor name, command, extra in commands:', "records = json.loads((root / 'chord-replay-qualification-attempt1/chord-replay-final-results.json').read_text())[:8]\nassert [r['name'] for r in records] == [c[0] for c in commands[:8]]\nevidence.save_json(root / 'chord-replay-final-results.json', records)\nfor name, command, extra in commands[8:]:")
(root/'run_chord_replay_qualification_retry.py').write_text(s);compile(s,'retry','exec')
p=root/'archive_chord_replay_evidence.py';s=p.read_text();s=s.replace("{root / 'check_increment_receipt.py'}", "{root / 'check_increment_receipt.py', root / 'reclaim_completed_point_replay_builds.py'}")
s=s.replace("Final qualification uses the committed R parent plus the complete frozen S patch.", "Final qualification uses the committed R parent plus the complete frozen S patch. The first downstream hypercircuit build exhausted the repository filesystem before executing its tests; the failed log and original nine-row run are retained under chord-replay-qualification-attempt1. Removing only completed Q/N Cargo caches recovered 15GB. Source-identical qualification retains the first eight passing groups and reruns hypercircuit plus all remaining commands; no test, feature, policy or geometry was changed.")
p.write_text(s)
print('Preserved failed attempt and prepared source-identical remaining-nine-group retry.')
