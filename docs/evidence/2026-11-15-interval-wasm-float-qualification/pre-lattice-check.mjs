// Shared Node/browser verifier. Expected endpoint bits come from oracle.py.
export async function verify(bytes, corpus) {
  const module = await WebAssembly.compile(bytes);
  const imports = WebAssembly.Module.imports(module);
  if (imports.length) throw new Error(`Unexpected module imports: ${JSON.stringify(imports)}`);
  const { exports: api } = await WebAssembly.instantiate(module);
  if (api.qualification() !== 3) throw new Error("Both IEEE backends must be qualified");
  const statuses = {};
  const counts = {};
  for (const [index, row] of corpus.cases.entries()) {
    const [width, operation, flags, a, b, c, d, exponent, expected, lower, upper] = row;
    const inputs = [a, b, c, d].map(width === 32 ? Number : BigInt);
    const query = api[`query${width}`];
    const call = selector => BigInt.asUintN(64, query(operation, selector, flags, ...inputs, exponent));
    const status = Number(call(0));
    if (status !== expected) throw new Error(`Case ${index}: status ${status} != ${expected}; ${JSON.stringify(row)}`);
    if (status === 0 || status === 2) {
      const lo = call(1), hi = call(2);
      if (lo !== BigInt(lower) || hi !== BigInt(upper)) {
        throw new Error(`Case ${index}: bits [${lo.toString(16)},${hi.toString(16)}] != [${lower},${upper}]; ${JSON.stringify(row)}`);
      }
    }
    const key = `${width}/${operation}`;
    counts[key] = (counts[key] ?? 0) + 1;
    statuses[status] = (statuses[status] ?? 0) + 1;
  }
  return { cases: corpus.cases.length, counts, statuses, imports, seed: corpus.seed };
}

if (typeof process !== "undefined" && process.argv[1]?.endsWith("check.mjs")) {
  const fs = await import("node:fs/promises");
  const [wasm, corpus] = process.argv.slice(2);
  if (!wasm || !corpus) throw new Error("Usage: node check.mjs MODULE.wasm CORPUS.json");
  const report = await verify(await fs.readFile(wasm), JSON.parse(await fs.readFile(corpus, "utf8")));
  console.log(JSON.stringify({ ...report, node: process.version, versions: process.versions }, null, 2));
}
