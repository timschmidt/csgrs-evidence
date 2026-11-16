cargo fmt --all -- --check
git diff --check
cargo build --locked --bin alumina-cam-fixture
