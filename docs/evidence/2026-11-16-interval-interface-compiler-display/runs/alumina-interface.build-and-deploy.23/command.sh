wasm-tools validate dist/alumina-interface_bg.wasm
gzip -t dist/index.html.gz
gzip -t dist/alumina-interface.js.gz
gzip -t dist/alumina-interface_bg.wasm.gz
brotli -t dist/alumina-interface_bg.wasm.br

