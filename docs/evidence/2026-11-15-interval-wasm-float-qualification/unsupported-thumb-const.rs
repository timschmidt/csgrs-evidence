#![no_std]
use hyperinterval::{F32Enclosure, F64Enclosure};
const _: () = assert!(!F32Enclosure::backend_supported());
const _: () = assert!(!F64Enclosure::backend_supported());
