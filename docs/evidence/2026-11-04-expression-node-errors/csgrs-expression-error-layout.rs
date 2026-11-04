fn main() {
    println!("ValidationError bytes: {}", std::mem::size_of::<csgrs::Error>());
    println!("Result<TriangleMesh> bytes: {}", std::mem::size_of::<csgrs::Result<csgrs::TriangleMesh>>());
}
