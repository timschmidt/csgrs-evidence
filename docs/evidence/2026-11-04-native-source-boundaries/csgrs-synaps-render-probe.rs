use base64::Engine;
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let code = std::fs::read_to_string(&args[1]).unwrap();
    let synaps_cad::compiler::CompilationResult::Success { parts, failed_parts, views, warnings } = synaps_cad::compiler::compile_scad_code(&code, 0, None) else {
        panic!("reference scene must compile");
    };
    assert!(failed_parts.is_empty(), "unexpected failed parts");
    assert!(warnings.is_empty(), "unexpected warnings: {warnings:?}");
    for view in views {
        let bytes = base64::engine::general_purpose::STANDARD.decode(view.base64_png).unwrap();
        std::fs::write(format!("{}/synaps-{}.png", args[2], view.label), bytes).unwrap();
    }
    eprintln!("parts={} triangles={}", parts.len(), parts.iter().map(|part| part.indices.len()/3).sum::<usize>());
}
