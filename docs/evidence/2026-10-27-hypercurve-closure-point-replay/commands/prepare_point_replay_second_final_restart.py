from pathlib import Path
import hashlib,json,time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-point-replay');child=Path('/tmp/hypercurve-closure-circle-replay')
probe=json.loads((root/'point-replay-fuzz-recovery.json').read_text());assert probe['exit_code']==0 and probe['source_stable']
name='crates/hypercurve/fuzz/fuzz_targets/curve_string_editing.rs'
contract=json.loads((root/'point-replay-fuzz-string-lint-contract.json').read_text())
assert hashlib.sha256((child/name).read_bytes()).hexdigest()==contract['before_sha256']
(child/name).write_bytes((checkout/name).read_bytes())
(root/'circle-replay-parent-second-fuzz-fix.json').write_text(json.dumps({'parent_source':probe['source'],'changed_parent_file':name,'previous_child_file_matches_baseline':True,'recorded_epoch':time.time()},indent=2)+'\n')
s=(root/'run_point_replay_qualification_restart.py').read_text()
s=s.replace("source == json.loads((root / 'point-replay-post-fuzz-fix-source.json').read_text())", "source == json.loads((root / 'point-replay-fuzz-recovery.json').read_text())['source']")
(root/'run_point_replay_qualification_restart2.py').write_text(s);compile(s,'restart2','exec')
for name in ['point-replay-final-results.json','point-replay-final-source-after.json','point-replay-final-files-after.json']:
 p=root/name;assert p.read_bytes()==(root/'point-replay-qualification-attempt3'/name).read_bytes();p.unlink()
p=root/'archive_point_replay_evidence.py';s=p.read_text();old='all18groups are rerun after this final source edit, and both earlier five-row attempts remain in the archive.'
new='the next attempt exposed an identity map and bool.then filter_map in the existing string-editing fuzz target. A strict all-bin --keep-going audit retained every remaining finding. Removing the identity map and using filter plus map preserves the original accepted chunks and point-construction order. All-bin strict Clippy then passes; all18groups are restarted on the final source, and all three earlier five-row attempts remain in the archive.'
assert old in s;s=s.replace(old,new);p.write_text(s)
print('Strict all-bin fuzz probe passed; final18group restart prepared; U received only the parent fuzz fix.')
