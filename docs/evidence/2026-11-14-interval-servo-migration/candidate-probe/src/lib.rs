use alumina_foc::*;
use alumina_protocol::{DeviceCycle, Digest};
const DIGEST: Digest = Digest([0x5a; 32]);


    fn point(numerator: i64, denominator: i64) -> Q30 {
        Q30Interval::from_ratio(numerator, denominator)
            .unwrap()
            .midpoint()
    }

    fn timing() -> FocTimingProfile {
        FocTimingProfile {
            pwm_hz: 20_000,
            current_loop_hz: 10_000,
            velocity_loop_divider: 10,
            position_loop_divider: 5,
        }
    }

    fn pi(output: Q30) -> PiConfig {
        PiConfig {
            proportional_gain: Q30::HALF,
            integral_gain_per_update: point(1, 16),
            integral_minimum: output.checked_neg().unwrap(),
            integral_maximum: output,
            output_minimum: output.checked_neg().unwrap(),
            output_maximum: output,
        }
    }

    fn snapshot() -> FocParameterSnapshot {
        FocParameterSnapshot {
            configuration_digest: DIGEST,
            pole_pairs: 7,
            timing: timing(),
            maximum_phase_current: point(3, 4),
            maximum_phase_voltage: point(3, 4),
            d_current: pi(Q30::HALF),
            q_current: pi(Q30::HALF),
        }
    }

    fn grid() -> ServoLoopGrid {
        ServoLoopGrid::new(DeviceCycle(1_000), 1_000_000, timing()).unwrap()
    }

    fn config() -> ServoCascadeConfig {
        ServoCascadeConfig {
            configuration_digest: DIGEST,
            position_proportional_gain: Q30::ONE,
            velocity_controller: pi(Q30::HALF),
            maximum_velocity: Q30::HALF,
            maximum_current: point(3, 4),
            direct_current_target: Q30::ZERO,
            maximum_following_error_bits: 1_u64 << 32,
            maximum_sample_age_cycles: 100,
        }
    }

    fn setpoint(id: u32, at: u64, position_bits: i64) -> ServoSetpoint {
        ServoSetpoint {
            command_id: id,
            scheduled_at: DeviceCycle(at),
            configuration_digest: DIGEST,
            position: ServoPosition::from_bits(position_bits),
            velocity_feed_forward: Q30::ZERO,
            quadrature_current_feed_forward: Q30::ZERO,
        }
    }

    fn sample(sequence: u32, at: u64, position_bits: i64, velocity: Q30) -> ServoKinematicSample {
        ServoKinematicSample {
            sequence,
            sampled_at: DeviceCycle(at),
            available_at: DeviceCycle(at),
            configuration_digest: DIGEST,
            position: ServoPositionInterval::point(ServoPosition::from_bits(position_bits)),
            velocity: Q30Interval::point(velocity),
        }
    }


pub const VALUES: [i64; 9] = [i64::MIN, i64::MIN + 1, -(1_i64 << 32), -1, 0, 1, 1_i64 << 32, i64::MAX - 1, i64::MAX];
pub fn trace(seed: i64, mode: u32, ticks: u64, mut observe: impl FnMut(Result<ServoCascadeUpdate, ServoCascadeError>)) -> CascadedServoController {
    let mut controller = CascadedServoController::new(grid(), config(), &snapshot()).unwrap();
    for index in 0..ticks {
        let at = 1000 + index * 100;
        let target = if index % 50 == 0 { Some(setpoint((index / 50 + 1) as u32, at, seed * (1 << 24))) } else { None };
        let observation = if index % 10 == 0 {
            let mut s = sample((index / 10 + 1) as u32, at, seed * (1 << 20) + index as i64, Q30::from_bits((seed * (1 << 16)) as i32));
            s.position = ServoPositionInterval::new(ServoPosition::from_bits(s.position.lower().bits()-3), ServoPosition::from_bits(s.position.upper().bits()+4)).unwrap();
            s.velocity = Q30Interval::new(Q30::from_bits(s.velocity.lower().bits()-2), Q30::from_bits(s.velocity.upper().bits()+3)).unwrap();
            if mode == 1 && index == 10 { s.sampled_at = DeviceCycle(at - 101); }
            if mode == 2 && index == 0 { s.position = ServoPositionInterval::point(ServoPosition::from_bits(i64::MIN)); }
            if mode == 3 && index == 0 { s.position = ServoPositionInterval::new(ServoPosition::from_bits(i64::MIN), ServoPosition::from_bits(i64::MAX)).unwrap(); }
            if mode == 4 && index == 0 { s.velocity = Q30Interval::point(Q30::from_bits(i32::MIN)); }
            Some(s)
        } else { None };
        observe(controller.service(DeviceCycle(at), target, observation));
    }
    controller
}
