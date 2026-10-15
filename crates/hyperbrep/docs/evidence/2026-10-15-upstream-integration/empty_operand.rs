//! Diagnostic only: the merged API cannot consume its successful empty result.
//! This is retained as a missing-API reproduction, not a passing runtime test.

use hyperbrep::{SolidRef, boolean};

pub fn consume_empty_result(solid: SolidRef<'_>) {
    let empty = boolean::difference(solid, solid).unwrap();
    assert!(empty.is_empty());
    let _ = boolean::union(&empty, &empty);
}
