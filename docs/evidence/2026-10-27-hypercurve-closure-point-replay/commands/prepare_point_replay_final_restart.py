from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-point-replay')
child=Path('/tmp/hypercurve-closure-circle-replay')
old_files={r[0]:r[2] for r in json.loads((root/'point-replay-qualification-attempt2/point-replay-final-files-before.json').read_text())}
changed=subprocess.check_output(['git','diff','--name-only','--','crates/hypercurve/fuzz'],cwd=checkout,text=True).splitlines()
keep={'crates/hypercurve/fuzz/fuzz_targets/svg.rs','crates/hypercurve/fuzz/fuzz_targets/bezier_region.rs'}
restored=[]
(root/'point-replay-fuzz-format-candidate.patch').write_bytes(subprocess.check_output(['git','diff','--binary','--','crates/hypercurve/fuzz'],cwd=checkout))
for name in changed:
 if name in keep:continue
 original=subprocess.check_output(['git','show','HEAD:'+name],cwd=checkout)
 assert hashlib.sha256(original).hexdigest()==old_files[name]
 (checkout/name).write_bytes(original)
 restored.append(name)
(root/'point-replay-fuzz-format-cleanup.json').write_text(json.dumps({'restored':restored,'reason':'Fuzz-manifest formatting reordered unrelated existing imports. Restore only files proven identical to the captured pre-format source and HEAD; retain the two intended fuzz target changes.','recorded_epoch':time.time()},indent=2)+'\n')
name='crates/hypercurve/fuzz/fuzz_targets/bezier_region.rs'
assert hashlib.sha256((child/name).read_bytes()).hexdigest()==old_files[name]
(child/name).write_bytes((checkout/name).read_bytes())
def snapshot(checkout,label):
 spec=importlib.util.spec_from_file_location(label,checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);return e.source_snapshot()
source,files,patch=snapshot(checkout,'parent')
assert snapshot(child,'child')==(source,files,patch)
(root/'point-replay-post-fuzz-fix-source.json').write_text(json.dumps(source,indent=2)+'\n')
(root/'circle-replay-parent-fuzz-fix.json').write_text(json.dumps({'source':source,'changed_parent_file':name,'parent_and_child_all_bytes_equal':True,'recorded_epoch':time.time()},indent=2)+'\n')
s=(root/'run_point_replay_qualification.py').read_text()
s=s.replace("assert not (root / 'point-replay-final-results.json').exists()", "assert source == json.loads((root / 'point-replay-post-fuzz-fix-source.json').read_text())")
s=s.replace("{'CARGO_TARGET_DIR': target + '-fuzz'}", "{'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': target + '-fuzz'}")
(root/'run_point_replay_qualification_restart.py').write_text(s);compile(s,'restart','exec')
for name in ['point-replay-final-results.json','point-replay-final-source-after.json','point-replay-final-files-after.json']:
 p=root/name
 assert p.read_bytes()==(root/'point-replay-qualification-attempt2'/name).read_bytes()
 p.unlink()
p=root/'archive_point_replay_evidence.py';s=p.read_text();old='The source-identical retry uses installed MSRV1.95.0 with the same fuzz manifest, all bins and -D warnings; first four passing groups and the failed attempt are preserved.'
new=old+' That retry found two existing collapsible_if warnings in the unchanged region fuzz harness. The final let-chain preserves guards and evaluation order; all18groups are rerun after this final source edit, and both earlier five-row attempts remain in the archive.'
assert old in s;s=s.replace(old,new);p.write_text(s)
print('Restored',len(restored),'unrelated formatting edits; U mirrors the one final parent change; all18checks prepared to restart.')
