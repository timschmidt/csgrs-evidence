#![cfg(feature = "serde")]

use hyperreal::{Rational, Real, RealSign};
use num::{BigInt, BigUint};

// floor(pi * 2^2304), independently bracketed using exact alternating
// series for 16 atan(1/5) - 4 atan(1/239). The next integer is above pi.
const PI_BELOW_2304: &str = "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa98ec4e6c89452821e638d01377be5466cf34e90c6cc0ac29b7c97c50dd3f84d5b5b54709179216d5d98979fb1bd1310ba698dfb5ac2ffd72dbd01adfb7b8e1afed6a267e96ba7c9045f12c7f9924a19947b3916cf70801f2e2858efc16636920d871574e69a458fea3f4933d7e0d95748f728eb658718bcd5882154aee7b54a41dc25a59b59c30d5392af26013c5d1b023286085f0ca417918b8db38ef8e79dcb0603a180e6c9e0e8bb01e8a3ed71577c1bd314b2778af2fda55605c60e65525f3aa55ab945748986263e8144055ca396a2aab10b6b4cc5c341141e8cea15486af7c72e993b3ee1411636fbc2a2ba9c55d741831f6ce5c3e169b87931eafd6ba336c24cf5c";

#[test]
fn native_near_pole_cotangent_keeps_its_checked_domain_after_import() {
    let below = BigInt::parse_bytes(PI_BELOW_2304.as_bytes(), 16).unwrap();
    for above in [false, true] {
        let n = &below + if above { 1 } else { 0 };
        let q = Rational::from_bigint_fraction(n, BigUint::from(1u8) << 2304).unwrap();
        let native = Real::new(q).cot().unwrap();
        let expected = if above {
            RealSign::Positive
        } else {
            RealSign::Negative
        };
        let json = native.to_json();
        let cbor = native.to_bytes();
        assert_eq!(native.certified_sign_until(-2048).sign(), Some(expected));
        drop(native);
        let encoded: ciborium::Value = ciborium::de::from_reader(cbor.as_slice()).unwrap();
        for value in [
            Real::from_json(&json),
            Real::from_bytes(&cbor),
            Real::try_from(&encoded),
        ] {
            let restored = value.unwrap();
            assert_eq!(restored.to_json(), json);
            assert_eq!(restored.to_bytes(), cbor);
            assert_eq!(restored.certified_sign_until(-2048).sign(), Some(expected));
            assert_eq!(
                (restored.clone().inverse().unwrap() * restored - Real::one())
                    .certified_sign_until(-2048)
                    .sign(),
                Some(RealSign::Zero)
            );
        }
    }
}
