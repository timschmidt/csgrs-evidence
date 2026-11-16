const fs = require('node:fs');
const m = new WebAssembly.Module(fs.readFileSync(process.argv[2]));
const expected=Number(process.argv[3]);const imports=WebAssembly.Module.imports(m);if(imports.length)throw new Error(JSON.stringify(imports));
const runs=[];
for(let trial=0;trial<4;trial++){const i=new WebAssembly.Instance(m,{});for(let repeat=0;repeat<4;repeat++){const before=i.exports.memory.buffer.byteLength;const mask=i.exports.envelope_witness();if(mask!==expected)throw new Error('mask '+mask+' expected '+expected);runs.push({trial,repeat,mask,before,memory_bytes:i.exports.memory.buffer.byteLength});}}
console.log(JSON.stringify({imports,runs}));
