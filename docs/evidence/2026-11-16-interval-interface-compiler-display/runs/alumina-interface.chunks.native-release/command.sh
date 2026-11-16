cargo rustc --locked --release -p alumina-interface-core --lib -- --emit=llvm-ir,asm
cargo build --locked --release
