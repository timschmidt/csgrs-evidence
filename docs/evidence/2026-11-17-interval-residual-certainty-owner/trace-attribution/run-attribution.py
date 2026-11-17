from pathlib import Path
import ast
import collections
import hashlib
import json
import os
import re
import subprocess
import time

s = Path(__file__).parent
old = Path('/tmp/interval-refactor/residual-certainty-admission')
started = time.monotonic()
deadline = started + 90
assert not os.environ.get('LD_PRELOAD')
assert not (s / 'attribution-completion.json').exists()
builds = {r['label']: r for r in json.loads((old / 'resource-builds.json').read_text()) if r['features'] == 'trace' and r['label'] != 'pilot'}
references, rows = {}, []


def save(name, value):
    (s / name).write_text(json.dumps(value, indent=2) + '\n')


def ownership():
    for pid, start, wanted in [(3790860, '46852177', None), (1621335, '38218939', 'T'), (3416600, '45823480', 'T')]:
        raw = Path(f'/proc/{pid}/stat').read_text()
        fields = raw[raw.rfind(')') + 2:].split()
        assert fields[19] == start and fields[0] != 'Z' and (wanted is None or fields[0] == wanted)


def collect(label, recording, mode, name, command, code):
    assert code == 0
    fields = dict(line.split(' ', 1) for line in (s / (name + '.stdout')).read_text().splitlines())
    output = fields['OUTPUT'], fields['TRACE']
    if recording in references:
        assert references[recording] == output
    else:
        references[recording] = output
    stderr = (s / (name + '.stderr')).read_text()
    events = []
    pattern = re.escape(builds[label]['binary']['path']) + r'\(\+0x([0-9a-f]+)\)'
    for block in stderr.split('END_ALLOC632\n'):
        if not block.strip():
            continue
        assert block.startswith('ALLOC632 pointer='), block
        offsets = re.findall(pattern, block)
        assert offsets
        events.append(offsets)
    row = dict(label=label, recording=recording, mode=mode, name=name, command=command, exit_code=code, allocations=ast.literal_eval(fields['ALLOCATION']), full_output_trace_sha256=hashlib.sha256(('\n'.join(output)).encode()).hexdigest(), allocation_stacks=events)
    rows.append(row)
    save('attribution-observations.json', rows)


try:
    for label, build in builds.items():
        assert hashlib.sha256(Path(build['binary']['path']).read_bytes()).hexdigest() == build['binary']['sha256']
    pilot = json.loads((s / 'pilot.json').read_text())
    for result in pilot['results']:
        collect('candidate', 'active', result['mode'], 'pilot-' + result['mode'], result['command'], result['exit_code'])
    for label in ['fixed', 'current', 'candidate']:
        for recording, pairs in [('active', 15 if label == 'candidate' else 16), ('passive', 2)]:
            for rep in range(pairs):
                for mode in ['plain', 'interposed']:
                    ownership()
                    remaining = deadline - time.monotonic()
                    assert remaining > 0
                    name = f'{label}-{recording}-{rep}-{mode}'
                    command = [builds[label]['binary']['path'], '0', 'observe', '1', '165', recording, 'strict', 'rebuild']
                    env = dict(os.environ)
                    if mode == 'interposed':
                        env['LD_PRELOAD'] = str(s / 'malloc_trace.so')
                    process = subprocess.run(command, env=env, capture_output=True, text=True, timeout=min(20, remaining))
                    (s / (name + '.stdout')).write_text(process.stdout)
                    (s / (name + '.stderr')).write_text(process.stderr)
                    collect(label, recording, mode, name, command, process.returncode)
    symbol_maps = {}
    for label, build in builds.items():
        offsets = sorted({offset for row in rows if row['label'] == label for stack in row['allocation_stacks'] for offset in stack})
        command = ['addr2line', '-C', '-f', '-e', build['binary']['path'], *['0x' + value for value in offsets]]
        text = subprocess.check_output(command, text=True, timeout=min(20, deadline - time.monotonic()))
        (s / (label + '-resolved.txt')).write_text(text)
        lines = text.splitlines()
        assert len(lines) == 2 * len(offsets)
        symbol_maps[label] = {offset: dict(function=lines[2 * i], source=lines[2 * i + 1]) for i, offset in enumerate(offsets)}
    save('symbol-maps.json', symbol_maps)
    classified = []
    for row in rows:
        events = []
        for offsets in row['allocation_stacks']:
            functions = [symbol_maps[row['label']][offset]['function'] for offset in offsets]
            events.append(dict(offsets=offsets, functions=functions, trace_collection=any('dispatch_trace::collect_dispatch_counts' in f for f in functions), btree=any('alloc::collections::btree::' in f for f in functions), observed_epoch=any('residual_certainty_resource::allocation::observe' in f for f in functions)))
        classified.append(dict(**row, resolved_events=events, observed_epoch_632=sum(e['observed_epoch'] for e in events), all_632_from_trace_btree=all(e['trace_collection'] and e['btree'] for e in events)))
    save('classified-observations.json', classified)
    groups = []
    for label in ['fixed', 'current', 'candidate']:
        for recording in ['active', 'passive']:
            for mode in ['plain', 'interposed']:
                selected = [r for r in classified if (r['label'], r['recording'], r['mode']) == (label, recording, mode)]
                groups.append(dict(label=label, recording=recording, mode=mode, processes=len(selected), allocation_tuples=sorted(set(tuple(r['allocations']) for r in selected)), observed_epoch_632=sorted(set(r['observed_epoch_632'] for r in selected)), all_632_from_trace_btree=all(r['all_632_from_trace_btree'] for r in selected)))
    assert len(rows) == 108 and time.monotonic() <= deadline
    for label in builds:
        assert sum(r['label'] == label and r['recording'] == 'active' for r in rows) == 32
        assert sum(r['label'] == label and r['recording'] == 'passive' for r in rows) == 4
    summary = dict(processes=len(rows), full_output_trace_domains=len(references), groups=groups, every_captured_632_allocation_from_trace_btree=all(r['all_632_from_trace_btree'] for r in classified), all_original_binary_hashes_preserved=True, original_charges_subtracted=False, resource_cap_revision=False, admitted=False, resource_measurement_claim=False, scope='One exact zero residual, warm rebuilt inputs, original trace binaries. Allocation stacks only; no universal attribution, unchanged resource measurement or timing claim.')
    save('attribution-summary.json', summary)
    save('attribution-completion.json', dict(terminal=True, exit_code=0, processes=len(rows), seconds=time.monotonic() - started))
    print(json.dumps(summary, indent=2))
except BaseException as error:
    save('attribution-completion.json', dict(terminal=True, exit_code=1, error=repr(error), processes=len(rows), seconds=time.monotonic() - started))
    raise
