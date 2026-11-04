from pathlib import Path
import re,json,shutil,hashlib
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');dest=Path('/tmp/csgrs-r06-native-wasm');(dest/'src').mkdir(parents=True,exist_ok=True)
manifest=Path('/tmp/csgrs-r06-wasm/Cargo.toml').read_text().replace('name="csgrs-r06-wasm"','name="csgrs-r06-native-wasm"')+'\n[features]\nsvg=[]\n'
(dest/'Cargo.toml').write_text(manifest);(dest/'Cargo.lock').write_text(Path('/tmp/csgrs-r06-wasm/Cargo.lock').read_text().replace('name = \"csgrs-r06-wasm\"','name = \"csgrs-r06-native-wasm\"'))
exports=[];modules=[];derivation=[]
for module,file in [('curve','crates/hypercurve/tests/polynomial_vertical_components.rs'),('empty','crates/hypercurve/tests/polynomial_empty_axis.rs')]:
 text=(root/file).read_text();names=re.findall(r'#\[test\]\s*fn (\w+)\(',text)
 names=[n for n in names if n!='exchanged_charts_replay_cold_and_compose']
 text=re.sub(r'#\[test\]\s*fn (\w+)\(',r'pub fn \1(',text)
 (dest/f'src/{module}.rs').write_text(text)
 modules.append(f'mod {module};')
 for n in names:
  export=f'{module}_{len(exports)}';exports.append({'export':export,'recipe':n})
  modules.append(f'#[unsafe(no_mangle)]\npub extern "C" fn {export}() -> u32 {{ {module}::{n}(); 1 }}')
 derivation.append({'source':file,'sha256':hashlib.sha256((root/file).read_bytes()).hexdigest(),'exports':names,'edit':'#[test] fn becomes pub fn; SVG feature remains disabled, excluding fresh-process native replay.'})
(dest/'src/lib.rs').write_text('\n'.join(modules)+'\n');(dest/'exports.json').write_text(json.dumps(exports,indent=2)+'\n');(dest/'derivation.json').write_text(json.dumps(derivation,indent=2)+'\n')
run=Path('/tmp/csgrs-r06-wasm-run.cjs').read_text().replace('/tmp/csgrs-r06-wasm-target/','/tmp/csgrs-r06-native-wasm-target/').replace('csgrs_r06_wasm.wasm','csgrs_r06_native_wasm.wasm').replace('/tmp/csgrs-r06-wasm/exports.json','/tmp/csgrs-r06-native-wasm/exports.json')
Path('/tmp/csgrs-r06-native-wasm-run.cjs').write_text(run)
