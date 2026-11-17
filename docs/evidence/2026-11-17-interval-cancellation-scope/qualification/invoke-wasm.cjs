const fs = require('node:fs');
const assert = require('node:assert/strict');
const module_ = new WebAssembly.Module(fs.readFileSync(process.argv[2]));
assert.deepEqual(WebAssembly.Module.imports(module_), []);
const baseline = process.argv[3] === 'baseline';
for (const case_ of [0, 1, 2]) {
  const instance = new WebAssembly.Instance(module_, {});
  const run = () => instance.exports.verify_cancellation_boundary(case_);
  if (baseline && case_ !== 0) {
    assert.throws(run, WebAssembly.RuntimeError);
    console.log(JSON.stringify({case: case_, expected_trap: true}));
  } else {
    assert.equal(run(), 1);
    console.log(JSON.stringify({case: case_, expected_trap: false, assertions_pass: true}));
  }
}
