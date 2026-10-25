from pathlib import Path
import hashlib
import json
import subprocess

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
source = root / 'crates/hyperreal/src/computable/node/representation.rs'
text = source.read_text()
(raw / 'baseline-cache-representation.rs').write_text(text)


def replace(old, new):
    global text
    assert text.count(old) == 1, old
    text = text.replace(old, new)


replace('        let pointer = match self.0.compare_exchange(\n',
        '        R17_CACHE_STATES[0].fetch_add(1, std::sync::atomic::Ordering::Relaxed);\n        let pointer = match self.0.compare_exchange(\n')
replace('                unsafe { drop(Box::from_raw(allocated)) };\n',
        '                R17_CACHE_STATES[0].fetch_sub(1, std::sync::atomic::Ordering::Relaxed);\n                unsafe { drop(Box::from_raw(allocated)) };\n')
replace('            guard.approximation = Some(CachedApproximation {\n',
        '            let previous = guard.r17_state();\n            guard.approximation = Some(CachedApproximation {\n')
replace('                value,\n            });\n        }\n    }\n\n    fn quadratic_tower',
        '                value,\n            });\n            r17_cache_transition(previous, guard.r17_state());\n        }\n    }\n\n    fn quadratic_tower')
replace('''        self.cell_or_init()
            .write()
            .unwrap_or_else(|error| error.into_inner())
            .radical_tower_declined = true;''',
        '''        let mut guard = self.cell_or_init().write().unwrap_or_else(|error| error.into_inner());
        let previous = guard.r17_state();
        guard.radical_tower_declined = true;
        r17_cache_transition(previous, guard.r17_state());''')
replace('''        if guard.quadratic_tower.is_none() {
            guard.quadratic_tower = Some(Box::new(tower.clone()));
        }''',
        '''        if guard.quadratic_tower.is_none() {
            let previous = guard.r17_state();
            guard.quadratic_tower = Some(Box::new(tower.clone()));
            r17_cache_transition(previous, guard.r17_state());
        }''')
replace('''            unsafe { drop(Box::from_raw(pointer)) };''',
        '''            let mut cell = unsafe { Box::from_raw(pointer) };
            let state = cell.get_mut().unwrap_or_else(|error| error.into_inner()).r17_state();
            R17_CACHE_STATES[state].fetch_sub(1, std::sync::atomic::Ordering::Relaxed);
            drop(cell);''')
text += '\n' + (raw / 'cache-census.rs').read_text()
source.write_text(text)
bench = root / 'crates/hypercircuit/benches/easyduino_full_pipeline.rs'
text = bench.read_text()
old = '    if std::env::var("R17_STOP_STAGE").is_ok_and(|value| value == stage) {'
assert text.count(old) == 1
text = text.replace(old, '''    let (states, cell_bytes) = hyperreal::Computable::r17_diagnostic_cache_census();
    eprintln!("R17_CENSUS {{\\"stage\\":\\"{stage}\\",\\"cell_bytes\\":{cell_bytes},\\"states\\":{states:?}}}");
''' + old)
old = '    if std::env::var_os("R17_ALLOCATOR_CHECK").is_some() {'
assert text.count(old) == 1
text = text.replace(old, '''    if std::env::var_os("R17_CACHE_CHECK").is_some() {
        hyperreal::Computable::r17_diagnostic_cache_check();
        println!("R17_CACHE_CHECK passed: all eight states and drops conserve cell counts");
        return;
    }
''' + old)
bench.write_text(text)
subprocess.run(['cargo', 'fmt', '--all'], cwd=root, check=True)
for path in [source, bench]:
    (raw / ('census-' + path.name)).write_bytes(path.read_bytes())
(raw / 'census-instrumentation.patch').write_bytes(subprocess.check_output([
    'git', 'diff', '--', str(source.relative_to(root)), str(bench.relative_to(root))], cwd=root))
print('Private cache census instrumented; library result branches unchanged')
