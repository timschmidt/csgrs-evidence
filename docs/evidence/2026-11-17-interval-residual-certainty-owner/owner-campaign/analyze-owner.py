from pathlib import Path
import hashlib
import json

s = Path(__file__).parent
completion = json.loads((s / 'owner-completion.json').read_text())
assert completion['exit_code'] == 0
rows = json.loads((s / 'owner-builds.json').read_text())
ledger = json.loads((s / 'accepted-size-accounts.json').read_text())
prior_rows = json.loads((s / 'prior-owner-builds.json').read_text())
assert len(rows) == 35
assert len({r['lock_sha256'] for r in rows}) == 1
assert all(r['build_exit_code'] == r['functional_exit_code'] == 0 for r in rows)
assert all(hashlib.sha256(Path(r['size']['path']).read_bytes()).hexdigest() == r['size']['sha256'] for r in rows)

paths = {
    'unit': 'crates/hypersolve/src/lib.rs',
    'smoke': 'crates/hypersolve/tests/smoke.rs',
    'trace': 'crates/hypersolve/benches/dispatch_trace.rs',
    'certification': 'crates/hypersolve/benches/certification.rs',
    'representations': 'crates/hypersolve/benches/representations.rs',
    'retained_fuzz': 'crates/hypersolve/benches/retained_fuzz.rs',
}
metrics = ['file', 'text', 'named_text', 'allocated_bytes', 'executable_bytes']
accounts = []
for features in ['none', 'all']:
    for kind, path in paths.items():
        if features == 'none' and kind == 'trace':
            continue
        group = {r['label']: r for r in rows if r['features'] == features and r['kind'] == kind}
        assert set(group) == {'fixed', 'current', 'candidate'}
        sizes = {label: row['size'] for label, row in group.items()}
        historical = next((a for a in ledger['accounts'] if a['artifact'] == path), {}) if features == 'all' else {}
        old_kind = 'benchmark' if kind == 'certification' else kind
        known = {r['label']: r['size'] for r in prior_rows if features == 'all' and r['kind'] == old_kind and r['label'] in ['fixed', 'current']}
        capacity, reserve = (16 << 20, 2 << 20) if kind in ['unit', 'trace'] else (32 << 20, 4 << 20)
        account = dict(kind=kind, features=features, artifact=path, capacity=capacity, reserve=reserve, final_file=sizes['candidate']['file'], remaining=capacity - sizes['candidate']['file'], metrics={})
        account['headroom_pass'] = account['remaining'] >= reserve
        for metric in metrics:
            values = {label: size[metric] for label, size in sizes.items()}
            f, c, n = (values[label] for label in ['fixed', 'current', 'candidate'])
            old = historical.get('metrics', {}).get(metric, {})
            prior_values = {label: size[metric] for label, size in known.items()}
            baseline = old.get('baseline', min(f, prior_values.get('fixed', f)))
            accepted = old.get('accepted_positive_growth_bytes', 0)
            file_charge = historical.get('metrics', {}).get('file', {}).get('accepted_positive_growth_bytes', 0)
            reserved_file = file_charge if metric == 'allocated_bytes' else 0
            reservation = max(accepted, reserved_file, 0, f - baseline, c - baseline, *(v - baseline for v in prior_values.values()))
            charge = max(0, n - c)
            cumulative = reservation + charge
            fallback = dict(incremental_bytes=1024 if metric == 'named_text' else 4096,
                            incremental_percent=0.5 if metric == 'named_text' else 1,
                            cumulative_bytes=4096 if metric == 'named_text' else 16384,
                            cumulative_percent=1 if metric == 'named_text' else 2)
            caps = old.get('caps', fallback)
            # Keep the historical denominator as an additional constraint:
            # a larger current image cannot loosen an existing percentage gate.
            incremental_denominator = min(c, baseline)
            assert baseline > 0 and incremental_denominator > 0
            passes = charge <= caps['incremental_bytes'] and cumulative <= caps['cumulative_bytes'] and 100 * charge <= caps['incremental_percent'] * incremental_denominator and 100 * cumulative <= caps['cumulative_percent'] * baseline
            account['metrics'][metric] = dict(values=values, historical_baseline=baseline, known_prior_fixed_current=prior_values, accepted_positive_charge=accepted, conservative_file_reservation=reserved_file, prior_positive_reservation=reservation, incremental_positive_charge=charge, cumulative_positive_charge=cumulative, incremental_denominator=c, historical_incremental_denominator=baseline, effective_incremental_denominator=incremental_denominator, cumulative_denominator=baseline, caps=caps, remaining_absolute_bytes=caps['cumulative_bytes'] - cumulative, caps_pass=passes)
        account['caps_pass'] = account['headroom_pass'] and all(m['caps_pass'] for m in account['metrics'].values())
        accounts.append(account)

added = []
for row in rows:
    if not row['added']:
        continue
    size = row['size']
    limits = {'file': 8 << 20, 'allocated_bytes': 8 << 20, 'executable_bytes': 6 << 20, 'named_text': 6 << 20}
    account = dict(features=row['features'], size=size, absolute_limits=limits, capacity=16 << 20, reserve=2 << 20, remaining=(16 << 20) - size['file'], relative_baseline=None)
    account['caps_pass'] = all(size[m] <= cap for m, cap in limits.items()) and account['remaining'] >= account['reserve']
    added.append(account)
assert len(accounts) == 11 and len(added) == 2
summary = dict(artifacts=len(rows), ordinary_accounts=len(accounts), added_accounts=len(added), functional_cases=sum(r['functional_cases'] for r in rows), metadata_only_images=sum(r['kind'] == 'retained_fuzz' for r in rows), accounts=accounts, new_witness_images=added, all_original_caps_pass=all(a['caps_pass'] for a in accounts + added), failed_metrics=[dict(kind=a['kind'], features=a['features'], metric=m, charge=v['cumulative_positive_charge']) for a in accounts for m, v in a['metrics'].items() if not v['caps_pass']], all_headroom_pass=all(a['headroom_pass'] for a in accounts) and all(a['remaining'] >= a['reserve'] for a in added), accepted_ledger_unchanged=True, admitted=False, runtime_claim=False, scope='Finite owner final-image measurements and selected completed release controls. Retained-fuzz metadata startup does not execute its corpus. Full runtime, memory, complete consumer and combined admission remain separate.')
assert hashlib.sha256((s / 'accepted-size-accounts.json').read_bytes()).hexdigest() == hashlib.sha256(Path('/mnt/development/csgrs/docs/research/interval-size-accounts.json').read_bytes()).hexdigest()
(s / 'owner-size-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps({k: v for k, v in summary.items() if k not in ['accounts', 'new_witness_images']}, indent=2))
for account in accounts:
    print(account['features'], account['kind'], account['caps_pass'], {m: v['cumulative_positive_charge'] for m, v in account['metrics'].items()})
