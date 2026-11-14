fn summaries() -> [Option<Summary>; 7] {
    let valid = Summary {
        record_count: 8,
        realtime_record_count: 5,
        binding_count: 6,
        stepper_axes: 3,
        foc_axes: 2,
        safety_binding: true,
        flags: 0,
    };
    [
        None,
        Some(valid),
        Some(Summary {
            record_count: 0,
            ..valid
        }),
        Some(Summary {
            realtime_record_count: 9,
            ..valid
        }),
        Some(Summary {
            binding_count: 9,
            ..valid
        }),
        Some(Summary {
            stepper_axes: u8::MAX,
            foc_axes: u8::MAX,
            ..valid
        }),
        Some(Summary {
            stepper_axes: 8,
            foc_axes: 8,
            ..valid
        }),
    ]
}
fn snapshot_identity_authorization_and_summary_truth_table() {
    let phases = [
        Phase::Empty,
        Phase::Recovering,
        Phase::Validating,
        Phase::CandidateValid,
        Phase::Preparing,
        Phase::Activating,
        Phase::Committing,
        Phase::Authorizing,
        Phase::Active,
        Phase::Clearing,
        Phase::Aborting,
        Phase::Rejected,
    ];
    let mut count = 0;
    for phase in phases {
        for jobs_authorized in [false, true] {
            for active_transaction_id in [0, 1, u64::MAX] {
                for active_digest in [[0; 32], [1; 32], std::array::from_fn(|i| u8::from(i == 31))]
                {
                    for active_bytes in [0, 1, u32::MAX] {
                        for summary in summaries() {
                            let snapshot = Snapshot {
                                phase,
                                jobs_authorized,
                                active_transaction_id,
                                active_digest,
                                active_bytes,
                                summary,
                            };
                            let parts = [
                                active_transaction_id != 0,
                                active_digest != [0; 32],
                                active_bytes != 0,
                                summary.is_some(),
                            ];
                            let present = parts.into_iter().filter(|v| *v).count();
                            let identity_ok = match present {
                                0 => !jobs_authorized && phase != Phase::Active,
                                4 => {
                                    phase != Phase::Empty
                                        && (phase != Phase::Active || jobs_authorized)
                                }
                                _ => false,
                            };
                            let summary_ok = summary.is_none_or(|s| {
                                s.record_count > 0
                                    && s.realtime_record_count <= s.record_count
                                    && s.binding_count <= s.record_count
                                    && u16::from(s.stepper_axes) + u16::from(s.foc_axes) <= 16
                            });
                            let expected = identity_ok && summary_ok;
                            let actual = snapshot.validate();
                            assert_eq!(actual.is_ok(), expected, "{snapshot:?}");
                            if !expected {
                                assert!(matches!(
                                    actual,
                                    Err(WorkerContractError::ConfigurationSnapshot)
                                ));
                            }
                            let json = serde_json::to_string(&snapshot).unwrap();
                            if std::env::var_os("PROBE_TRANSCRIPT").is_some() { println!("SNAPSHOT {} {}",json,expected); }
                            let decoded: Snapshot = serde_json::from_str(&json).unwrap();
                            assert_eq!(snapshot, decoded);
                            assert_eq!(decoded.validate().is_ok(), expected);
                            count += 1;
                        }
                    }
                }
            }
        }
    }
    assert_eq!(count, 4536);
}
