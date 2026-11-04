const fs=require('fs');
const bytes=fs.readFileSync('/tmp/csgrs-r06-native-wasm-target/wasm32-unknown-unknown/release/csgrs_r30_wasm.wasm');
const module_=new WebAssembly.Module(bytes);
if(WebAssembly.Module.imports(module_).length!==0)throw Error('unexpected WASM imports');
const names=WebAssembly.Module.exports(module_).map(x=>x.name).filter(x=>/^hull_\d+$/.test(x)).sort();
if(names.length!==3)throw Error('missing shared recipes');
for(const name of names){const instance=new WebAssembly.Instance(module_,{});const start=performance.now();instance.exports[name]();console.log(JSON.stringify({export:name,result:'pass',milliseconds:performance.now()-start,imports:0,linearMemoryBytes:instance.exports.memory.buffer.byteLength}));}
console.log(JSON.stringify({completed:names.length,wasmBytes:bytes.length,maxRssKiB:process.resourceUsage().maxRSS}));
