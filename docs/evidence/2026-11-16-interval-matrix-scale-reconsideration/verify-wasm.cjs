const fs = require('fs');
(async () => {
 const cases = JSON.parse(fs.readFileSync(__dirname + '/wasm-cases.json','utf8'));
 let count = 0;
 for (const label of ['baseline','candidate']) {
  const path = '/mnt/development/.interval-refactor-build/matrix-scale-reconsideration/artifacts/' + label + '-matrix-scale.wasm';
  const {instance} = await WebAssembly.instantiate(fs.readFileSync(path));
  for (const c of cases) {
   const actual = c.expected.map((_, index) => Number(instance.exports.scale_entry(...c.input,index)));
   if (JSON.stringify(actual)!==JSON.stringify(c.expected)) throw new Error(JSON.stringify({label,...c,actual}));
   count += actual.length;
  }
 }
 console.log(JSON.stringify({cases_per_binary:cases.length,checked_status_and_endpoint_values:count,independent_integer_oracle:true,passed:true}));
})().catch(e=>{console.error(e);process.exit(1)});
