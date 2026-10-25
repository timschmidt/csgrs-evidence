const fs = require('fs');
(async () => {
  const bytes = fs.readFileSync(process.argv[2]);
  const module = await WebAssembly.compile(bytes);
  const imports = WebAssembly.Module.imports(module);
  if (imports.length) throw Error(JSON.stringify(imports));
  const instance = await WebAssembly.instantiate(module);
  for (let repeat = 0; repeat < 2; repeat++) {
    for (let kind = 0; kind < 4; kind++) {
      for (let reversed = 0; reversed < 2; reversed++) {
        for (let approximate = 0; approximate < 2; approximate++) {
          const loops = instance.exports.stroke_and_rebuild(kind, reversed, approximate);
          if (loops !== 1) throw Error(`unexpected loop count ${loops}`);
          console.log(JSON.stringify({repeat,kind,reversed,approximate,loops}));
        }
      }
    }
  }
})().catch(error => { console.error(error); process.exitCode = 1; });
