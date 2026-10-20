#[allow(dead_code)]
#[path="/tmp/hyperbrep-cone-edge-image-migration.rs"]
mod fixture;
#[test]
fn preserved_and_extended_edge_image_contract() {
    fixture::parameter_and_radius_failures();
    fixture::unresolved_is_not_success();
    fixture::unsupported_is_not_endpoint_agreement();
}
