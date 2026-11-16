use hypervoxel::{
    AggregateCertainty, CertifiedFieldInterval, CertifiedTensorInterval, CertifiedVectorInterval,
    FieldEnvelopeFacts,
};

fn interval(lower: i64, upper: i64) -> CertifiedFieldInterval {
    CertifiedFieldInterval {
        lower: lower.into(),
        upper: upper.into(),
    }
}

/// Complete valid hull composition and expose four malformed-input outcomes.
#[unsafe(no_mangle)]
pub extern "C" fn envelope_witness() -> u32 {
    let mut cases = 0;
    for a in -2..=2 {
        for b in a..=2 {
            for c in -2..=2 {
                for d in c..=2 {
                    let left = CertifiedVectorInterval {
                        components: vec![interval(a, b)],
                    };
                    let right = CertifiedVectorInterval {
                        components: vec![interval(c, d)],
                    };
                    let facts = FieldEnvelopeFacts::from_envelopes([&left, &right], []).unwrap();
                    assert!(facts.certified_envelope_ready);
                    assert_eq!(facts.certainty, AggregateCertainty::Certified);
                    let merged = facts.vector_interval.as_ref().unwrap();
                    assert_eq!(merged.components[0], interval(a.min(c), b.max(d)));
                    let next = FieldEnvelopeFacts::from_envelopes([merged, &left], []).unwrap();
                    assert_eq!(next.vector_interval, facts.vector_interval);
                    cases += 1;
                }
            }
        }
    }
    assert_eq!(cases, 225);
    let bad = CertifiedVectorInterval {
        components: vec![interval(2, 1)],
    };
    let bad_tensor = CertifiedTensorInterval {
        rows: 1,
        cols: 1,
        components: vec![interval(2, 1)],
    };
    let missing = CertifiedTensorInterval {
        rows: 2,
        cols: 2,
        components: vec![interval(0, 1)],
    };
    let overflow = CertifiedTensorInterval {
        rows: usize::MAX,
        cols: 2,
        components: vec![],
    };
    let zero = CertifiedTensorInterval {
        rows: 0,
        cols: usize::MAX,
        components: vec![],
    };
    let zero_facts = FieldEnvelopeFacts::from_envelopes([], [&zero]).unwrap();
    assert!(zero_facts.certified_envelope_ready);
    assert_eq!(zero_facts.tensor_count, 1);
    assert_eq!(zero_facts.tensor_interval.as_ref(), Some(&zero));
    let replayed =
        FieldEnvelopeFacts::from_envelopes([], [zero_facts.tensor_interval.as_ref().unwrap()])
            .unwrap();
    assert_eq!(replayed, zero_facts);
    u32::from(FieldEnvelopeFacts::from_envelopes([&bad], []).is_err())
        | (u32::from(FieldEnvelopeFacts::from_envelopes([], [&bad_tensor]).is_err()) << 1)
        | (u32::from(FieldEnvelopeFacts::from_envelopes([], [&missing]).is_err()) << 2)
        | (u32::from(FieldEnvelopeFacts::from_envelopes([], [&overflow]).is_err()) << 3)
}
