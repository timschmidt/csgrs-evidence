#[test]
fn diagnostic_counts() {
    let values: Vec<u8> = Vec::new();
    assert_eq!(values.len(), 0);
    let values = [1_u8];
    assert_ne!(values.len(), 0);
}
