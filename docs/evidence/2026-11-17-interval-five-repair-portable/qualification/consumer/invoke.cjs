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
  try {
    const length = e.chain_run(...config.args);
    assert.equal(config.expected_failure, false);
    assert(length > 0 && length < 4 * 1024 * 1024);
    const pointer = e.chain_output_pointer();
    assert(pointer > 0 && pointer + length <= e.memory.buffer.byteLength);
    const output = new TextDecoder('utf-8', {fatal: true}).decode(new Uint8Array(e.memory.buffer, pointer, length));
    assert(output.startsWith('OUTPUT ') && output.includes('\nTRACE ') && output.endsWith('\n'));
    const materialized = e.memory.buffer.byteLength;
    e.chain_clear();
    assert.equal(e.chain_output_pointer(), 0);
    const after = e.memory.buffer.byteLength;
    assert(Math.max(before, materialized, after) <= 192 * 1024 * 1024);
    console.log(JSON.stringify({config, output, before, materialized, after, imports, expected_trap: false}));
  } catch (error) {
    if (!config.expected_failure || !(error instanceof WebAssembly.RuntimeError)) throw error;
    console.log(JSON.stringify({config, imports, expected_trap: true, error: String(error)}));
  }
}
