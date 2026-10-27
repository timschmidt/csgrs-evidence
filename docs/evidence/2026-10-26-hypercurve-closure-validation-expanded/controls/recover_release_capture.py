from pathlib import Path
import hashlib
import json
import os
import shutil
import subprocess
import time

root = Path(__file__).resolve().parent
record = root / 'validation-release-1793106753695715331'
checkout = root / 'normal'
source = Path('/tmp/csgrs-release-check.i2DKOI')
partial = record / 'temporary-consumers' / source.name
assert source.is_dir() and not source.is_symlink()
assert partial.is_dir() and not partial.is_symlink()
assert not (record / 'summary.json').exists()
events = [json.loads(line) for line in (record / 'events.jsonl').read_text().splitlines()]
finished = [event for event in events if event['event'] == 'finish']
assert len(finished) == 1 and finished[0]['status'] == 120
assert 'release check passed' in (record / 'rust-release-0-4.log').read_text()
partial_records = []
for item in sorted(partial.rglob('*')):
    rel = item.relative_to(partial)
    original = source / rel
    if item.is_symlink():
        assert original.is_symlink() and os.readlink(item) == os.readlink(original)
        partial_records.append({'path': str(rel), 'symlink': os.readlink(item)})
    elif item.is_file():
        assert original.is_file() and item.stat().st_size <= original.stat().st_size
        with item.open('rb') as copied, original.open('rb') as full:
            while block := copied.read(1024 * 1024):
                assert block == full.read(len(block)), rel
        with item.open('rb') as stream:
            digest = hashlib.file_digest(stream, 'sha256').hexdigest()
        partial_records.append({'path': str(rel), 'bytes': item.stat().st_size, 'sha256': digest, 'verified_prefix_of_original': True})
recovery = {'recorded_epoch': time.time(), 'command_status': 120, 'cause': 'Artifact retention exhausted temporary quota after the release script reported all consumer successes; no successful qualification credited.', 'partial_capture': partial_records, 'recovery': 'Retain complete consumer sources, manifests, original-file digests and command logs using the archive retention rules; preserve failed partial-capture digests; rerun both unchanged release commands.'}
(record / 'capture-recovery.json').write_text(json.dumps(recovery, indent=2) + '\n')
recovered = record / 'recovered-temporary-consumers'
env = {**os.environ, 'CSGRS_CLOSEOUT_TEMP_EVIDENCE': str(recovered)}
subprocess.run(['python3', str(root / 'rm_audit.py'), '-rf', str(source)], env=env, check=True)
assert not source.exists()
capture = json.loads((recovered / (source.name + '-capture.json')).read_text())
original_map = {row['path']: row for row in capture['files']}
for row in partial_records:
    assert row['path'] in original_map
    if 'sha256' in row and row['bytes'] == original_map[row['path']]['bytes']:
        assert row['sha256'] == original_map[row['path']]['sha256']
shutil.rmtree(partial)
before = json.loads((record / 'sources-before.json').read_text())
after = {name: hashlib.sha256((checkout / name).read_bytes()).hexdigest() for name in before}
assert before == after
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == 'b1c011a070e61970fc7ee15a0c206b2f3b84e5f0'
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=checkout, text=True).strip()
(record / 'sources-after.json').write_text(json.dumps(after, indent=2) + '\n')
summary = {'record': str(record), 'head': 'b1c011a070e61970fc7ee15a0c206b2f3b84e5f0', 'phase': 'release', 'selection': '^(?!hyperspatial-directed-)', 'planned': 2, 'completed': 1, 'results': [{k: v for k, v in finished[0].items() if k != 'event'}], 'source_changes': [], 'all_passed': False, 'recovered_closeout': 'Closed using the recorded workflow exit status 120 after quota interrupted driver record writing; source bytes unchanged. This is a failed attempt, never a successful release check.'}
(record / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print('Preserved failed release attempt; reclaimed duplicate temporary payload; source unchanged. Retry required.', flush=True)
