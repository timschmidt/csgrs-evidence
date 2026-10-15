from pathlib import Path
import importlib.util, json, statistics, sys
root=Path('/mnt/development/csgrs');out=Path('/tmp/hyperbrep-archive-admission-evidence')
spec=importlib.util.spec_from_file_location('benchmark_receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');receipt=importlib.util.module_from_spec(spec);sys.modules[spec.name]=receipt;spec.loader.exec_module(receipt)
expected=receipt.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text())
rows={kind:[receipt.read_receipt((out/f'{kind}-{trial}.log').read_text(),expected) for trial in range(1,7)] for kind in ['baseline','candidate']}
cases=[]
for index,case in enumerate(expected):
    ratios=[candidate[index].per_iteration_ns/baseline[index].per_iteration_ns for baseline,candidate in zip(rows['baseline'],rows['candidate'])]
    cases.append(dict(case=case,ratios=ratios,paired_median_ratio=statistics.median(ratios),baseline_ns=[r[index].per_iteration_ns for r in rows['baseline']],candidate_ns=[r[index].per_iteration_ns for r in rows['candidate']]))
(out/'paired-comparison.json').write_text(json.dumps(dict(method='Diagnostic median of each case’s six temporally paired candidate/baseline ratios; no samples omitted.',cases=cases),indent=2)+'\n')
print('diagnostic paired median',statistics.median(r['paired_median_ratio'] for r in cases),'maximum',max(r['paired_median_ratio'] for r in cases))
