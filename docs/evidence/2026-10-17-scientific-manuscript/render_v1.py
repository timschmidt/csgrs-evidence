"""Render one fresh manuscript snapshot and preserve every pass and diagnostic."""
import gzip
import hashlib
import json
import os
import re
import runpy
import shutil
import sys
from fractions import Fraction
from pathlib import Path

sys.dont_write_bytecode = True
ROOT = Path('/home/tim/Documents/GitHub/workspace/csgrs')
VALIDATION_ROOT = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1/checkout-baseline-v1')
R = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1/manuscript-v1')
W = Path(__file__).resolve().parent
source = R / sys.argv[1]
tag = sys.argv[2]
build = R / tag
assert source.parent == R and source.is_dir() and not build.exists()


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


runner = ROOT / 'docs/evidence/2026-10-17-package-evidence-boundary/runner_v1.py'
assert sha(runner) == 'ea8e36a670773534e854c8ad23fa3e2f2d33c9cc85e2d2c72be8d579f4d6805b'
namespace = runpy.run_path(str(runner))
scope = namespace['run'].__globals__
scope.update(ROOT=VALIDATION_ROOT, R=R)
original_guards = scope['guards']


def guards():
    reasons = original_guards()
    if sum(p.stat().st_size for p in R.rglob('*') if p.is_file()) > 8 * 1024**2:
        reasons.append('fresh_output_8_mib')
    return reasons


scope['guards'] = guards
run = scope['run']
assert not guards()
analysis = json.loads((R / 'analysis.json').read_text())
assert all(sha(ROOT / p) == h for p, h in analysis['source_and_evidence_sha256'].items())
assert Fraction(0.1) - Fraction(1, 10) == Fraction(1, 180143985094819840)
text = (source / 'hyper-stack.tex').read_text()
cites = {key for group in re.findall(r'\\cite\{([^}]+)\}', text) for key in group.split(',')}
bibs = set(re.findall(r'\\bibitem\{([^}]+)\}', text))
assert cites == bibs and len(cites) == 10
assert '\\input{results.tex}' in text
assert sha(source / 'results.tex') == json.loads((R / 'preparation-result.json').read_text())['tables_sha256']
source_hashes = {p.name: sha(p) for p in source.iterdir() if p.is_file()}
build.mkdir()
env = {'TEXMFVAR': str(R / 'texmf-var'), 'TEXMFCONFIG': str(R / 'texmf-config'),
       'TEXMFCACHE': str(R / 'texmf-cache'), 'openout_any': 'p'}
record = {'source': str(source), 'source_sha256': source_hashes,
          'build': str(build), 'commands': [], 'complete': False,
          'output_closed': False, 'runtime_tests_rerun': False,
          'renderer_sha256': sha(W / 'render_v1.py'), 'frozen_runner_sha256': sha(runner)}


def command(name, args):
    result = run(tag + '-' + name, args, source, env)
    record['commands'].append(result)
    if result['exit_code'] != 0 or result['resource_stops']:
        record.update(output_closed=True, failed_command=name)
        dump(R / (tag + '-result.json'), record)
        sys.exit(1)
    return result


command('version', ['pdflatex', '--version'])
for index in range(1, 4):
    command('pass-' + str(index), ['pdflatex', '-no-shell-escape', '-halt-on-error',
            '-interaction=nonstopmode', '-file-line-error', '-recorder',
            '-output-directory=' + str(build), 'hyper-stack.tex'])
    shutil.copy2(build / 'hyper-stack.log', R / (tag + '-pass-' + str(index) + '.log'))
log = (build / 'hyper-stack.log').read_text()
diagnostics = [line for line in log.splitlines() if re.search(
    r'Overfull \\[hv]box|Missing character|undefined|LaTeX Error|(?:LaTeX|Package \S+) Warning', line)]
record['final_log_diagnostics'] = diagnostics
if diagnostics:
    record.update(output_closed=True, failed_command='final-log-check')
    dump(R / (tag + '-result.json'), record)
    print(json.dumps({'tag': tag, 'diagnostics': diagnostics}), flush=True)
    sys.exit(1)
command('text', ['pdftotext', '-layout', str(build / 'hyper-stack.pdf'), str(build / 'hyper-stack.txt')])
command('info', ['pdfinfo', str(build / 'hyper-stack.pdf')])
pdf_text = (build / 'hyper-stack.txt').read_text()
assert 'Exact Geometry as a Compositional Contract' in pdf_text
assert '1,743' in pdf_text or '1743' in pdf_text
assert '1,750' in pdf_text or '1750' in pdf_text
assert '476' in pdf_text and '27,093' in pdf_text and 'unadmitted' in pdf_text
pages = pdf_text.split('\f')
if not pages[-1].strip():
    pages.pop()
preview_pages = {1, len(pages)}
for index, page in enumerate(pages, 1):
    if 'Complete small-batch sweep' in page or 'Complete grouped shared-coefficient' in page:
        preview_pages.add(index)
for page in sorted(preview_pages):
    command('preview-' + str(page), ['pdftoppm', '-f', str(page), '-l', str(page),
            '-r', '72', '-singlefile', '-png', str(build / 'hyper-stack.pdf'),
            str(R / (tag + '-preview-' + str(page)))])
assert all(sha(source / p) == h for p, h in source_hashes.items())
assert all(sha(ROOT / p) == h for p, h in analysis['source_and_evidence_sha256'].items())
record.update(complete=True, output_closed=True, source_unchanged=True,
              numerical_table_input_sha256=sha(R / 'analysis.json'),
              pdf_sha256=sha(build / 'hyper-stack.pdf'), pages=len(pages),
              preview_pages=sorted(preview_pages), visual_review_pending=True,
              implementation_validation_claimed=False, publication_ready=False)
dump(R / (tag + '-result.json'), record)
print(json.dumps({'tag': tag, 'pages': len(pages), 'preview_pages': sorted(preview_pages),
                  'pdf': str(build / 'hyper-stack.pdf'), 'diagnostics': diagnostics}), flush=True)
