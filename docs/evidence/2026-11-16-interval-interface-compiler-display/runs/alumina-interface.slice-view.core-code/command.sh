cargo clippy --locked -p alumina-interface-core --all-targets --no-deps -- -D warnings
cargo rustc --locked --release -p alumina-interface-core --lib -- --emit=llvm-ir,asm
