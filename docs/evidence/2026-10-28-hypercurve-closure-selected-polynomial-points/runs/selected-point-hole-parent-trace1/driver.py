from pathlib import Path
import hashlib, importlib.util, json, signal, subprocess, sys, time, os
sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'prepush-selected-fields/normal'
producer = c / 'selected-point-regressions-parent1'
record = c / 'selected-point-hole-parent-trace1'
record.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
assert source == json.loads((producer / 'source-before.json').read_text())
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
support = (w / 'crates/hypercurve/tests/hypercurve_curve_region_promotion.rs').read_text()
support = support.replace('mod support;', '#[path = ' + json.dumps(str((w / 'crates/hypercurve/tests/support/mod.rs').resolve())) + ']\nmod support;', 1)
needle = 'fn algebraic_chord_material_hole_contact_and_hole_collapse_are_exact() {\n'
assert support.count(needle) == 1
support = support.replace(needle, needle + '    let _trace = hyperreal::dispatch_trace::recording_scope();\n', 1)
needle = '        assert_eq!(contacted.certainty, CurveCertainty::Certified);'
assert support.count(needle) == 1
support = support.replace(needle, '        eprintln!("PARENT CONTACT {policy:?} {fill_rule:?} {reverse}");\n        for entry in hyperreal::dispatch_trace::take().into_iter().filter(|entry| entry.layer == "hypercurve") { eprintln!("{entry:?}"); }\n' + needle, 1)
(record / 'original.rs').write_text(support)
artifacts = []
for line in (producer / 'compile.log').read_text().splitlines():
    try: artifacts.append(json.loads(line))
    except ValueError: pass
libs = {}
for name in ['hypercurve', 'hyperreal']:
    item = next(row for row in artifacts if row.get('reason') == 'compiler-artifact'
                and row['target']['name'] == name and any(f.endswith('.rlib') for f in row['filenames']))
    libs[name] = Path(next(f for f in item['filenames'] if f.endswith('.rlib')))
hashes = {str(p): e.digest_file(p) for p in libs.values()}
binary = record / 'original'
command = ['rustc', '+1.98.1', '--edition=2024', '--test', '-C', 'opt-level=3',
           str(record / 'original.rs'), '--crate-name', 'selected_point_hole_parent_trace',
           '-L', 'dependency=' + str(libs['hypercurve'].parent)]
for name, path in libs.items(): command += ['--extern', name + '=' + str(path)]
command += ['--cfg', 'feature="dispatch-trace"', '-o', str(binary)]
rows = []
for name, command in [('compile', command), ('original-hole', [str(binary), 'algebraic_chord_material_hole_contact_and_hole_collapse_are_exact', '--exact', '--nocapture'])]:
    started = time.time()
    with (record / (name + '.log')).open('w') as log:
        proc = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, stdout=log,
                                stderr=subprocess.STDOUT, start_new_session=True)
        try: code = proc.wait(timeout=120)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL); proc.wait(); code = 'external_timeout'
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time()-started}
    rows.append(row); e.save_json(record / 'results.json', rows); print(row, flush=True)
    assert e.source_snapshot()[0] == source
    assert hashes == {str(p): e.digest_file(p) for p in libs.values()}
    if code != 0: break
e.save_json(record / 'complete.json', {'all_passed': len(rows) == 2 and all(row['exit_code']==0 for row in rows),
    'source': source, 'producer': str(producer), 'library_sha256': hashes, 'epoch': time.time()})
