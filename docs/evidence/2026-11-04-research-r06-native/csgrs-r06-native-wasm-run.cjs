const fs = require('node:fs');
const { performance } = require('node:perf_hooks');
const path = '/tmp/csgrs-r06-native-wasm-target/wasm32-unknown-unknown/release/csgrs_r06_native_wasm.wasm';
const bytes = fs.readFileSync(path);
const module_ = new WebAssembly.Module(bytes);
const imports = WebAssembly.Module.imports(module_);
if (imports.length) throw new Error(`Unexpected imports: ${JSON.stringify(imports)}`);
const cases = JSON.parse(fs.readFileSync('/tmp/csgrs-r06-native-wasm/exports.json', 'utf8'));
for (const item of cases) {
  const instance = new WebAssembly.Instance(module_, {});
  const start = performance.now();
  const value = instance.exports[item.export]();
  if (value !== 1) throw new Error(`Failed ${item.recipe}: ${value}`);
  process.stdout.write(JSON.stringify({ ...item, result: 'pass', milliseconds: performance.now() - start, linearMemoryBytes: instance.exports.memory.buffer.byteLength, imports: imports.length }) + '\n');
}
process.stdout.write(JSON.stringify({ completed: cases.length, wasmBytes: bytes.length, maxRssKiB: process.resourceUsage().maxRSS }) + '\n');
