from pathlib import Path
import hashlib
import json
import subprocess

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
path = root / 'crates/hypercircuit/benches/easyduino_full_pipeline.rs'
source = path.read_text()
(raw / 'baseline-easyduino_full_pipeline.rs').write_text(source)
assert source.count('fn main() {') == 1
source = source.replace('fn main() {', 'fn r17_original_main() {', 1)
replacements = [
    ('        let started = Instant::now();\n', '        r17_snapshot("decoded");\n        let started = Instant::now();\n'),
    ('            if profile_stages {\n', '            r17_snapshot("materialized");\n            if profile_stages {\n'),
    ('                let mut drc_findings = 0;\n', '                r17_snapshot("report-projected");\n                let mut drc_findings = 0;\n'),
    ('            }\n            let stage = Instant::now();\n            let fabrication =',
     '                r17_snapshot("drc-complete");\n            }\n            r17_snapshot("handoff-dropped");\n            let stage = Instant::now();\n            let fabrication ='),
    ('            completed += 1;\n            continue;\n', '            r17_snapshot("fabrication-cam-assembly-complete");\n            completed += 1;\n            continue;\n'),
]
for old, new in replacements:
    assert source.count(old) == 1, old
    source = source.replace(old, new, 1)
source += '\n' + (raw / 'allocator.rs').read_text()
path.write_text(source)
subprocess.run(['cargo', 'fmt', '--all'], cwd=root, check=True)
(raw / 'instrumented-easyduino_full_pipeline.rs').write_bytes(path.read_bytes())
(raw / 'instrumentation.patch').write_bytes(subprocess.check_output(['git', 'diff', '--', str(path.relative_to(root))], cwd=root))
(raw / 'instrumentation.json').write_text(json.dumps({
    'scope': 'Only private benchmark snapshots/allocator/wrapper; no library algorithm changes.',
    'source_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
    'requested_bytes': 'Sum of successful allocation sizes and full new sizes of successful reallocations; native allocations outside Rust allocator excluded.',
    'live_bytes': 'Requested Rust payload currently live; unique allocated blocks, excludes allocator overhead.',
    'peak_bytes': 'Global maximum live payload; snapshot printing/control parsing contributes small process state.',
    'stage_exit': 'process::exit intentionally holds all roots; end-live allocations are reachable snapshot data, not leak evidence.',
    'full_drop': 'Wrapper repeats original benchmark and records after all function-local roots drop; process/TLS state can remain.',
}, indent=2) + '\n')
print('Instrumented private benchmark only')
