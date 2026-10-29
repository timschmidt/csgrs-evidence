from pathlib import Path
import hashlib, importlib.util, json, signal, subprocess, sys, time, os
sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-point-fillets'
producer = c / 'selected-point-regressions-candidate1'
record = c / 'selected-point-distinct-fiber-product1'
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
support = (w / 'crates/hypercurve/tests/support/joint_form_arithmetic.rs').read_text()
# Reuse the original fixtures unchanged; independently require exact arithmetic
# and retained selection relations instead of executing its Unsupported assertion.
support += '''
#[test]
fn opposite_fibers_keep_both_selections_and_exact_product() {
    let point = |lower, upper| CurvePointDefinition2::PolynomialFiber {
        equation: p(&[&[0,0,1],&[-1]]), parameter: base(),
        root: IsolatedRootInterval { lower, upper, exact_root: None, distinct_root_count: 1 },
    }.into_point().unwrap();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        evaluate_under(&policy, || {
            let negative = point(q(-3,4), q(-1,2));
            let positive = point(q(1,2), q(3,4));
            assert!(!negative.coincides_with(&positive).unwrap());
            let a = form(&negative,y()); let b = form(&positive,y());
            assert_eq!(a.compare_to_real(&Real::zero()).unwrap(),Ordering::Less);
            assert_eq!(b.compare_to_real(&Real::zero()).unwrap(),Ordering::Greater);
            let product = a.multiply(&b).unwrap();
            assert_eq!(product.compare_to_real(&Real::zero()).unwrap(),Ordering::Less);
            equal(&product.multiply(&product).unwrap(),q(1,8));
            equal(&product.add(&form(&negative,x())).unwrap(),Real::zero());
            equal(&a.add(&b).unwrap(),Real::zero());
            let (left,right) = product.operands().unwrap();
            assert!(left.source().coincides_with(&negative).unwrap());
            assert!(right.source().coincides_with(&positive).unwrap());
            assert!(!left.source().coincides_with(right.source()).unwrap());
            let source = product.source().definition().unwrap().into_point().unwrap();
            let replayed = source.rational_form(product.numerator().clone(),product.denominator().clone()).unwrap();
            equal(&replayed.add(&form(&negative,x())).unwrap(),Real::zero());
            equal(&replayed.multiply(&replayed).unwrap(),q(1,8));
            Ok::<_,ExactCurveError>(())
        }).unwrap();
    }
}
'''
(record / 'original.rs').write_text(support)
artifacts = []
for line in (producer / 'compile.log').read_text().splitlines():
    try: artifacts.append(json.loads(line))
    except ValueError: pass
libs = {}
for name in ['hypercurve', 'hypersolve']:
    item = next(row for row in artifacts if row.get('reason') == 'compiler-artifact'
                and row['target']['name'] == name and any(f.endswith('.rlib') for f in row['filenames']))
    libs[name] = Path(next(f for f in item['filenames'] if f.endswith('.rlib')))
hashes = {str(p): e.digest_file(p) for p in libs.values()}
binary = record / 'original'
command = ['rustc', '+1.98.1', '--edition=2024', '--test', '-C', 'opt-level=3',
           str(record / 'original.rs'), '--crate-name', 'distinct_fiber_product',
           '-L', 'dependency=' + str(libs['hypercurve'].parent)]
for name, path in libs.items(): command += ['--extern', name + '=' + str(path)]
command += ['-o', str(binary)]
rows = []
for name, command in [('compile', command), ('exact-product', [str(binary), 'opposite_fibers_keep_both_selections_and_exact_product', '--exact', '--nocapture'])]:
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
