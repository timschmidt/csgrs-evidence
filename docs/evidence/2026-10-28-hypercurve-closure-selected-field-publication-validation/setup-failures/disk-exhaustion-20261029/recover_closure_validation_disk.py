"""Preserve environmental failures and restart complete unchanged validation sets."""
from pathlib import Path
import ast
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
p = r / 'prepush-selected-fields'


def load(path):
    return json.loads(path.read_text())


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def alive(pid):
    try:
        return (Path('/proc') / str(pid) / 'stat').read_text().rsplit(')', 1)[1].split()[0] != 'Z'
    except FileNotFoundError:
        return False


for pid in [2226592, 2563553, 3516345, 3556090, 3605526, 3901724]:
    assert not alive(pid), pid
assert alive(3794681), 'Combined qualification is independent and must not be restarted here'
assert not (c / 'selected-query-fibers-qualification-final2').exists()
assert not (p / 'publication-final-commit.json').exists()
assert shutil.disk_usage(r).free > 90_000_000_000

failed = c / 'selected-query-fibers-qualification-final1'
rows = load(failed / 'results.json')
assert len(rows) == 13 and all(x['exit_code'] == 0 for x in rows[:-1])
assert rows[-1]['name'] == 'dependent-hyperbrep-io' and rows[-1]['exit_code'] == 101
assert 'No space left on device (os error 28)' in (failed / 'dependent-hyperbrep-io.log').read_text()
spec = importlib.util.spec_from_file_location('source_evidence', r / 'selected-query-fibers/scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
assert e.source_snapshot()[0] == load(failed / 'source-before.json') == load(failed / 'source-after.json')

old_workflow = p / 'validation-workflow-1793232079177781079'
old_summary = load(old_workflow / 'summary.json')
assert old_summary['completed'] == 94 and not old_summary['source_changes']
assert old_summary['results'][-1]['id'] == 'workspace-test-3-3'
assert old_summary['results'][-1]['status'] == 101
assert 'Bus error' in (old_workflow / 'workspace-test-3-3.log').read_text()
checkout = p / 'normal'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == old_summary['head']
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=checkout, text=True)
for name, digest in load(old_workflow / 'sources-before.json').items():
    assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

fiber_backup = c / 'selected-query-fibers-environment-recovery1'
integration_backup = c / 'selected-closure-integration-environment-recovery1'
prepush_backup = p / 'setup-failures/disk-exhaustion-20261029'
for d in [fiber_backup, integration_backup, prepush_backup]:
    d.mkdir(parents=True, exist_ok=False)
fiber_scripts = [
    'run_selected_query_fibers_qualification.py', 'close_selected_query_fibers.py',
    'align_selected_query_fibers.py', 'probe_polynomial_operations_query_fibers.py',
    'finalize_selected_query_fibers.py',
]
integration_scripts = [
    'review_selected_closure_integration_readiness.py',
    'close_selected_closure_integration.py', 'finalize_selected_closure_integration.py',
]
for dest, names in [(fiber_backup, fiber_scripts), (integration_backup, integration_scripts)]:
    for name in names:
        shutil.copyfile(c / name, dest / name)
for name in [
    'selected-closure-integration-readiness-controller.json',
    'selected-closure-integration-readiness-controller.log',
    'selected-closure-integration-closeout-final1-controller.json',
    'selected-closure-integration-closeout-final1-controller.log',
    'selected-field-publication-closeout-controller.json',
    'selected-field-publication-closeout-controller.log',
]:
    shutil.copyfile(c / name, integration_backup / name)
for f in p.iterdir():
    if f.is_file() and f.suffix in {'.py', '.json', '.log'}:
        shutil.copyfile(f, prepush_backup / f.name)
cleanup_names = ['integration-disk-cleanup-msrv.json', 'integration-disk-cleanup-finalized-increments.json']
for name in cleanup_names:
    for dest in [fiber_backup, integration_backup, prepush_backup]:
        shutil.copyfile(c / name, dest / name)

def edit(name, before, after):
    path = c / name
    text = path.read_text()
    assert before in text, (name, before)
    text = text.replace(before, after)
    ast.parse(text, filename=name)
    path.write_text(text)

for name in fiber_scripts:
    if name == 'run_selected_query_fibers_qualification.py':
        edit(name, "'--attempt','final1'", "'--attempt','final2'")
    else:
        edit(name, 'qualification-final1', 'qualification-final2')
edit('review_selected_closure_integration_readiness.py',
     "('selected-query-fibers', 'final1')", "('selected-query-fibers', 'final2')")
edit('close_selected_closure_integration.py', 'publication=2563553',
     "publication=gate.load(c/'selected-field-publication-closeout-controller.json')['pid']")
edit('finalize_selected_closure_integration.py',
     "        'integration-private-commit-graph-repair.json',",
     "        'integration-private-commit-graph-repair.json',\n"
     "        'integration-disk-cleanup-msrv.json', 'integration-disk-cleanup-finalized-increments.json',\n"
     "        'recover_closure_validation_disk.py', 'selected-closure-validation-environment-recovery.json',")
edit('finalize_selected_query_fibers.py',
     "        'selected-closure-integration-contract.json',",
     "        'selected-closure-integration-contract.json',\n"
     "        'recover_closure_validation_disk.py', 'selected-closure-validation-environment-recovery.json',")

record = {
    'epoch': time.time(), 'code_changed': False,
    'fiber_failure': str(failed), 'fiber_source': load(failed / 'source-before.json'),
    'parent_failure': str(old_workflow), 'parent_revision': old_summary['head'],
    'diagnosis': 'Fiber compiler explicitly exhausted disk space. Parent linker SIGBUS occurred during the same exhaustion interval; retry is required to confirm that environmental diagnosis.',
    'retry': 'All 25 fiber qualification groups, all 328 parent pre-push groups including 13 ASan campaigns, on unchanged frozen sources. Original failure records remain immutable. The independent combined-source qualification continues.',
    'gates': 'No alignment, admission, commit or push while any applicable required check is failing or incomplete. All original geometric assertions and test commands remain unchanged.',
    'cleanup': {name: load(c / name) for name in cleanup_names},
    'free_before_retry': shutil.disk_usage(r).free,
}
save(c / 'selected-closure-validation-environment-recovery.json', record)
save(prepush_backup / 'recovery.json', record)
shutil.copyfile(Path(__file__), prepush_backup / Path(__file__).name)

def launch(name, script, args=(), cwd=None, canonical=None, log_path=None):
    command = ['python3', str(c / script), *args]
    log_path = log_path or c / (name + '-controller.log')
    with log_path.open('w') as log:
        process = subprocess.Popen(command, cwd=cwd or r, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
    result = {'name': name, 'pid': process.pid, 'command': command, 'started_epoch': time.time(), 'cwd': str(cwd or r)}
    save(c / (name + '-controller.json'), result)
    if canonical:
        save(c / (canonical + '-controller.json'), result)
    return result

for mode in ['normal', 'directed']:
    save(p / (mode + '-phases.json'), [])
launches = {}
for mode in ['normal', 'directed']:
    launches[mode] = launch('selected-field-publication-' + mode + '-environment-retry1',
                            'run_selected_field_publication_validation.py', [mode],
                            log_path=p / (mode + '-controller.log'))
save(p / 'launches.json', launches)
publication = launch('selected-field-publication-closeout-environment-retry1',
                     'close_selected_field_publication_validation.py',
                     canonical='selected-field-publication-closeout')
fiber = launch('selected-query-fibers-qualification-final2',
               'run_selected_query_fibers_qualification.py', cwd=r / 'selected-query-fibers')
fiber_closeout = launch('selected-query-fibers-closeout-final2',
                        'close_selected_query_fibers.py', cwd=r / 'selected-query-fibers')
readiness = launch('selected-closure-integration-readiness-environment-retry1',
                   'review_selected_closure_integration_readiness.py',
                   canonical='selected-closure-integration-readiness')
integration = launch('selected-closure-integration-closeout-environment-retry1',
                     'close_selected_closure_integration.py', cwd=r / 'selected-closure-integration')
record['controllers'] = {**launches, 'publication': publication, 'fiber': fiber,
                         'fiber_closeout': fiber_closeout, 'readiness': readiness, 'integration_closeout': integration}
save(c / 'selected-closure-validation-environment-recovery.json', record)
save(prepush_backup / 'recovery.json', record)
print(json.dumps({'controllers': record['controllers'], 'free_bytes': shutil.disk_usage(r).free}, indent=2))
