from pathlib import Path
import gzip
import hashlib
import json
import re
import subprocess

s = Path('/tmp/interval-refactor/residual-certainty-owner')
out = Path(__file__).parent
r = Path('/mnt/development/interval-residual-certainty/csgrs')
completion = json.loads((s / 'owner-completion.json').read_text())
assert completion['exit_code'] == 0 and completion['seconds'] <= 21600
assert (s / 'owner-hold-released.json').exists()
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=r, text=True).strip() == 'aad7409a5928e309812d9a5cc361d46313685266'
assert not subprocess.check_output(['git', 'status', '--porcelain=v1'], cwd=r)
rows = json.loads((s / 'owner-builds.json').read_text())
assert len(rows) == 35
profiles, outcomes = {}, {}
controls = symbols = source_files = 0
for row in rows:
    size = row['size']
    binary = Path(size['path'])
    assert hashlib.sha256(binary.read_bytes()).hexdigest() == size['sha256']
    assert binary.stat().st_size == size['file']
    listings = {}
    for kind, record in size['listings'].items():
        data = gzip.decompress(Path(record['path']).read_bytes())
        assert len(data) == record['bytes'] and hashlib.sha256(data).hexdigest() == record['sha256']
        listings[kind] = data.decode()
    addresses = {}
    for line in listings['symbols'].splitlines():
        match = re.match(r'([0-9a-f]+) ([0-9a-f]+) [tT] ', line)
        if match:
            address, length = match.groups()
            assert address not in addresses or addresses[address] == int(length, 16)
            addresses[address] = int(length, 16)
    assert sum(addresses.values()) == size['named_text']
    symbols += len(addresses)
    objdump = subprocess.check_output(['objdump', '-h', str(binary)], text=True).splitlines()
    allocated = executable = 0
    for i, line in enumerate(objdump[:-1]):
        fields = line.split()
        if len(fields) >= 7 and fields[0].isdigit():
            flags = {f.strip() for f in objdump[i + 1].split(',')}
            allocated += int(fields[2], 16) if 'ALLOC' in flags else 0
            executable += int(fields[2], 16) if 'CODE' in flags else 0
    assert allocated == size['allocated_bytes'] and executable == size['executable_bytes']
    key = row['features'], row['kind']
    profile = row['cargo_artifact']['profile']
    assert profile['opt_level'] == '3' and profile['debug_assertions'] is False
    if key in profiles:
        assert profiles[key] == profile
    else:
        profiles[key] = profile
    name = row['name']
    text = (s / (name + '-functional.stdout')).read_text()
    assert row['functional_exit_code'] == row['build_exit_code'] == 0
    if row['kind'] in ['unit', 'smoke', 'regression']:
        items = re.findall(r'^test (.+) \.\.\. (ok|ignored)$', text, flags=re.M)
        counts = re.findall(r'test result: ok\. (\d+) passed; 0 failed; (\d+) ignored;', text)
        assert len(counts) == 1 and int(counts[0][0]) == row['functional_cases']
        assert [list(x) for x in items] == row['test_outcomes']
        if row['kind'] == 'regression':
            assert row['functional_cases'] == 4
    elif row['kind'] in ['certification', 'representations']:
        items = re.findall(r'^Testing (.+)$', text, flags=re.M)
        assert items == row['benchmark_cases'] and text.count('Success') == len(items)
        assert len(items) == (12 if row['kind'] == 'certification' else 22)
    elif row['kind'] == 'trace':
        report = (s / (name + '-trace-output') / 'dispatch_trace.md').read_bytes()
        assert hashlib.sha256(report).hexdigest() == row['dispatch_report_sha256']
        assert len(text.splitlines()) == 11
        items = (report, text)
    else:
        assert row['functional_cases'] == 0 and 'Metadata-only' in row['functional_scope']
        assert 'Testing ' not in text
        items = []
    if row['kind'] != 'regression':
        if key in outcomes:
            assert items == outcomes[key]
        else:
            outcomes[key] = items
    controls += row['functional_cases']
assert controls == completion['functional_cases'] == 5264
for label, revision in [('fixed', 'c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb'), ('current', '4192d8c726d3333a31cb7eddc30cc0d464d61411'), ('candidate', 'aad7409a5928e309812d9a5cc361d46313685266')]:
    for record in json.loads((s / (label + '-sources.json')).read_text()):
        data = (s / 'sources' / label / record['path']).read_bytes()
        assert data == subprocess.check_output(['git', 'show', revision + ':' + record['path']], cwd=r)
        assert hashlib.sha256(data).hexdigest() == record['sha256']
        source_files += 1
commands = json.loads((s / 'owner-commands.json').read_text())
assert all(c['exit_code'] == 0 for c in commands)
assert all(any(c['name'] == name for c in commands) for name in ['owner-none-clippy', 'owner-all-clippy', 'owner-format'])
warnings = []
for path in sorted(s.glob('*.stderr')):
    warnings.extend(dict(file=path.name, line=line) for line in path.read_text().splitlines() if line.startswith(('warning:', 'warning[')))
assert not warnings, warnings
summary = json.loads((s / 'owner-size-summary.json').read_text())
assert summary['failed_metrics'] == [dict(kind='unit', features='none', metric='file', charge=15456)]
assert summary['all_headroom_pass'] and not summary['all_original_caps_pass']
proposal = json.loads(Path('/tmp/interval-refactor/residual-certainty-owner-size-proposal/proposal.json').read_text())
assert proposal['original_summary_sha256'] == hashlib.sha256((s / 'owner-size-summary.json').read_bytes()).hexdigest()
assert proposal['original_failure_preserved'] and proposal['proposed_pass'] and not proposal['adopted']
result = dict(artifacts=len(rows), functional_controls=controls, unique_address_symbols_checked=symbols, source_files_verified=source_files, like_image_release_profiles_equal=True, test_and_benchmark_identities_preserved=True, full_trace_reports_equal=True, metadata_only_images=6, new_regression_images=2, strict_clippy_configs=2, formatting_pass=True, compiler_warnings=warnings, original_failed_metrics=summary['failed_metrics'], separate_proposal_adopted=False, candidate_restored=True, runtime_claim=False, admitted=False)
(out / 'verification.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
