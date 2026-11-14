const fs = require('node:fs');
const assert = require('node:assert/strict');
const bytes = fs.readFileSync(process.argv[2]);
const module_ = new WebAssembly.Module(bytes);
assert.deepEqual(WebAssembly.Module.imports(module_), []);
const instance = new WebAssembly.Instance(module_, {});
const results = [];
for (let i = 0; i < 3; i++) {
  const cells = instance.exports.exercise_surface_ranges();
  assert.equal(cells, 16);
  results.push(cells);
}
console.log(JSON.stringify({runtime: process.version, imports: [], completedCells: results,
  stackConfiguration: 'linker default; no custom stack flags',
  scope: 'archived Rust example via test-only export; no public JS binding claim'}));
