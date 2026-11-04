fn main() {
    for code in ["cube(-1);", "cube(1); cube(-1);", ""] {
        match synaps_cad::compiler::compile_views_only(code) {
            Ok(views) => eprintln!("source={code:?} successful_views={}", views.len()),
            Err(error) => eprintln!("source={code:?} failure={error}"),
        }
    }
}
