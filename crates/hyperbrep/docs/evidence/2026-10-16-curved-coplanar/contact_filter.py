"""Focused diagnosis of native contact scheduling; full admission follows."""
import json
from check import OUT, run

commands = [
    ('contact-filter-tests', ['cargo', 'test', '--offline', '--locked', '-p', 'hyperbrep', '--release', '--lib'], 900),
    ('contact-filter-clippy', ['cargo', 'clippy', '--offline', '--locked', '-p', 'hyperbrep', '-p', 'hyperbrep-io', '--all-features', '--all-targets', '--', '-D', 'warnings'], 900),
]
for label, command, seconds in commands:
    result = run(label, command, seconds)
    if result: raise SystemExit(result)
previous = [r for r in json.loads((OUT / 'attempts.json').read_text()) if r['label'] == 'benchmark-build' and r['exit_code'] == 0][-1]
result = run('benchmark-build', previous['command'], 900)
if result: raise SystemExit(result)
raise SystemExit(run('contact-filter-costs', ['python3', str(OUT / 'benchmark.py'), '--name', 'contact-filter-probe', '--only', 'kernel'], 1800))
