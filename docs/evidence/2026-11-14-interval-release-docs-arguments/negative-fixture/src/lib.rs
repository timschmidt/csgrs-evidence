#[cfg(all(doc, not(docsrs)))]
compile_error!("release documentation dropped required docsrs cfg");
/// Documentation fixture.
pub fn documented() {}
