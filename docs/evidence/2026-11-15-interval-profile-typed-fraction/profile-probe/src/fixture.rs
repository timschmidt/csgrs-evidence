use super::*;
pub(super) fn wire_rational(numerator: i64, denominator: u64) -> ConfigurationRational {
    ConfigurationRational::new(numerator, denominator).unwrap()
}

pub(super) fn binding(
    instance: u16,
    role: BindingRole,
    resource: ResourceId,
    polarity: SignalPolarity,
) -> ConfigurationRecord {
    let safety = role == BindingRole::EmergencyStop;
    ConfigurationRecord::Binding(ResourceBinding {
        instance,
        role,
        resource,
        owner: OwnerDomain::Realtime,
        polarity,
        flags: BindingFlags(if safety {
            BindingFlags::REQUIRED_INTERLOCK
        } else {
            0
        }),
        minimum_active_cycles: 48,
        minimum_inactive_cycles: 48,
        maximum_frequency_hz: if safety { 0 } else { 100_000 },
        watchdog_cycles: 240_000,
    })
}

pub(super) fn scalar(
    instance: u16,
    fact: ScalarFact,
    numerator: i64,
    denominator: u64,
    uncertainty_numerator: i64,
    uncertainty_denominator: u64,
) -> ConfigurationRecord {
    ConfigurationRecord::Scalar(ExactScalar {
        instance,
        fact,
        value: wire_rational(numerator, denominator),
        uncertainty: wire_rational(uncertainty_numerator, uncertainty_denominator),
        evidence: FactEvidence::Measured,
    })
}

pub(super) fn axis_scalars(instance: u16) -> Vec<ConfigurationRecord> {
    vec![
        scalar(instance, ScalarFact::AxisFullStepsPerTurn, 200, 1, 0, 1),
        scalar(instance, ScalarFact::AxisMicrosteps, 16, 1, 0, 1),
        scalar(
            instance,
            ScalarFact::AxisMotorTurnsPerOutputTurn,
            1,
            1,
            0,
            1,
        ),
        scalar(
            instance,
            ScalarFact::AxisTravelMetresPerOutputTurn,
            1,
            500,
            0,
            1,
        ),
        scalar(
            instance,
            ScalarFact::AxisCalibrationScale,
            1,
            1,
            1,
            1_000_000,
        ),
        scalar(instance, ScalarFact::AxisPositionMinimumMetres, 0, 1, 0, 1),
        scalar(instance, ScalarFact::AxisPositionMaximumMetres, 3, 10, 0, 1),
        scalar(
            instance,
            ScalarFact::AxisVelocityLimitMetresPerSecond,
            1,
            20,
            1,
            1_000,
        ),
        scalar(
            instance,
            ScalarFact::AxisAccelerationLimitMetresPerSecondSquared,
            1,
            2,
            1,
            100,
        ),
        scalar(
            instance,
            ScalarFact::AxisJerkLimitMetresPerSecondCubed,
            5,
            1,
            1,
            10,
        ),
        scalar(
            instance,
            ScalarFact::AxisFollowingErrorMetres,
            1,
            100_000,
            1,
            500_000,
        ),
    ]
}

pub(super) fn machine_records() -> Vec<ConfigurationRecord> {
    let mut records = vec![
        binding(
            0,
            BindingRole::AxisStep,
            ResourceId::I2sOut { engine: 0, bit: 1 },
            SignalPolarity::ActiveHigh,
        ),
        binding(
            0,
            BindingRole::AxisDirection,
            ResourceId::I2sOut { engine: 0, bit: 2 },
            SignalPolarity::ActiveHigh,
        ),
        binding(
            0,
            BindingRole::AxisDisable,
            ResourceId::I2sOut { engine: 0, bit: 0 },
            SignalPolarity::ActiveHigh,
        ),
        binding(
            0,
            BindingRole::EmergencyStop,
            ResourceId::Gpio(33),
            SignalPolarity::ActiveLow,
        ),
        binding(
            1,
            BindingRole::AxisStep,
            ResourceId::I2sOut { engine: 0, bit: 4 },
            SignalPolarity::ActiveHigh,
        ),
        binding(
            1,
            BindingRole::AxisDirection,
            ResourceId::I2sOut { engine: 0, bit: 5 },
            SignalPolarity::ActiveHigh,
        ),
        binding(
            1,
            BindingRole::AxisDisable,
            ResourceId::I2sOut { engine: 0, bit: 3 },
            SignalPolarity::ActiveHigh,
        ),
    ];
    records.extend(axis_scalars(0));
    records.push(scalar(0, ScalarFact::TimerTickHertz, 1_000_000, 1, 0, 1));
    records.push(scalar(
        0,
        ScalarFact::StepperOutputQuantumCycles,
        1,
        1,
        0,
        1,
    ));
    records.extend(axis_scalars(1));
    records.sort_by_key(|record| record.canonical_order_key());
    records
}

pub(super) fn document(records: &[ConfigurationRecord]) -> (Vec<u8>, Digest) {
    let realtime_record_count = records
        .iter()
        .filter(|record| record.realtime_relevant())
        .count();
    let header = ConfigurationHeader {
        capability_digest: board_mks_tinybee::CAPABILITY_DIGEST,
        record_count: u16::try_from(records.len()).unwrap(),
        realtime_record_count: u16::try_from(realtime_record_count).unwrap(),
        flags: ConfigurationFlags(ConfigurationFlags::MOTION),
    };
    let mut bytes = Vec::from(header.encode().unwrap());
    for record in records {
        bytes.extend_from_slice(&record.encode().unwrap());
    }
    let digest = sha256(&bytes).digest;
    (bytes, digest)
}

