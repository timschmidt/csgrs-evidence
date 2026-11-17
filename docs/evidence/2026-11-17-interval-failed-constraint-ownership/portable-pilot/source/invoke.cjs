const fs = require('node:fs');
const assert = require('node:assert/strict');
const module_ = new WebAssembly.Module(fs.readFileSync(process.argv[2]));
const imports = WebAssembly.Module.imports(module_);
assert.deepEqual(imports, []);
const configs = JSON.parse(fs.readFileSync(process.argv[3], 'utf8'));
for (const config of configs) {
  const instance = new WebAssembly.Instance(module_, {});
  const e = instance.exports;
  const before = e.memory.buffer.byteLength;
  const length = e.residual_run(...config.args);
  assert(length > 0 && length < 4 * 1024 * 1024);
  const pointer = e.residual_output_pointer();
  assert(pointer > 0 && pointer + length <= e.memory.buffer.byteLength);
  const output = new TextDecoder('utf-8', {fatal: true}).decode(new Uint8Array(e.memory.buffer, pointer, length));
  assert(output.startsWith('OUTPUT ') && output.includes('\nTRACE ') && output.endsWith('\n'));
  const materialized = e.memory.buffer.byteLength;
  e.residual_clear();
  assert.equal(e.residual_output_pointer(), 0);
  const after = e.memory.buffer.byteLength;
  assert(Math.max(before, materialized, after) <= 192 * 1024 * 1024);
  console.log(JSON.stringify({config, output, before, materialized, after, imports}));
}
