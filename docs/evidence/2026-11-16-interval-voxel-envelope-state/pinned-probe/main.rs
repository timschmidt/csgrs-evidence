use hyperreal::Real;
use hypervoxel::{
    AggregateCertainty, CertifiedFieldInterval as Interval, CertifiedTensorInterval as Tensor,
    CertifiedVectorInterval as Vector, FieldEnvelopeFacts as Facts, HypervoxelResult,
};
use std::{ffi::c_void, hint::black_box};
#[cfg(feature = "allocation")]
mod allocation;
struct Input {
    vectors: Vec<Vector>,
    tensors: Vec<Tensor>,
    expected: Option<Vector>,
    certainty: AggregateCertainty,
}
fn interval(lo: i64, hi: i64) -> Interval {
    Interval {
        lower: lo.into(),
        upper: hi.into(),
    }
}
fn input(case: &str) -> Input {
    let mut i = Input {
        vectors: vec![],
        tensors: vec![],
        expected: None,
        certainty: AggregateCertainty::Certified,
    };
    match case {
        "empty" => {
            i.certainty = AggregateCertainty::Unknown;
        }
        "first" | "many" | "incompatible" => {
            i.vectors.push(Vector {
                components: vec![interval(-2, 3); 3],
            });
            i.expected = Some(i.vectors[0].clone());
            if case == "many" {
                i.vectors.extend((0..31).map(|_| Vector {
                    components: vec![interval(-1, 2); 3],
                }));
                i.tensors.push(Tensor {
                    rows: 2,
                    cols: 2,
                    components: vec![interval(-4, 5); 4],
                });
                i.tensors.push(Tensor {
                    rows: 2,
                    cols: 2,
                    components: vec![interval(-3, 4); 4],
                });
            }
            if case == "incompatible" {
                i.vectors.push(Vector {
                    components: vec![interval(0, 1); 2],
                });
                i.certainty = AggregateCertainty::Unknown;
            }
        }
        "surd" | "computable" => {
            let lower = if case == "surd" {
                Real::from(2).sqrt().unwrap()
            } else {
                Real::e()
            };
            i.vectors.push(Vector {
                components: vec![Interval {
                    lower,
                    upper: 3.into(),
                }],
            });
            i.expected = Some(i.vectors[0].clone());
        }
        "late_inverted" | "late_unknown" => {
            i.vectors.push(Vector {
                components: vec![Interval {
                    lower: Real::from(2).sqrt().unwrap(),
                    upper: 3.into(),
                }],
            });
            i.tensors.push(Tensor {
                rows: 1,
                cols: 1,
                components: vec![Interval {
                    lower: Real::e(),
                    upper: 3.into(),
                }],
            });
            let invalid = if case == "late_inverted" {
                interval(2, 1)
            } else {
                Interval {
                    lower: (Real::e() + Real::one()).sin()
                        - Real::e().sin() * Real::one().cos()
                        - Real::e().cos() * Real::one().sin(),
                    upper: Real::zero(),
                }
            };
            i.tensors.push(Tensor {
                rows: 1,
                cols: 1,
                components: vec![invalid],
            });
        }
        "inverted" => {
            i.vectors.push(Vector {
                components: vec![interval(2, 1)],
            });
        }
        "malformed" => {
            i.tensors.push(Tensor {
                rows: 2,
                cols: 2,
                components: vec![interval(0, 1)],
            });
        }
        "unknown" => {
            let zero = (Real::e() + Real::one()).sin()
                - Real::e().sin() * Real::one().cos()
                - Real::e().cos() * Real::one().sin();
            i.vectors.push(Vector {
                components: vec![Interval {
                    lower: zero,
                    upper: Real::zero(),
                }],
            });
        }
        _ => panic!("unknown case"),
    }
    i
}
#[inline(never)]
fn execute(i: &Input) -> HypervoxelResult<Facts> {
    Facts::from_envelopes(black_box(&i.vectors), black_box(&i.tensors))
}
fn validate(i: &Input, result: &HypervoxelResult<Facts>, case: &str, candidate: bool) {
    match result {
        Ok(f) => println!(
            "outcome ok {} {} {} {} {} {:?} {}",
            f.vector_count,
            f.tensor_count,
            f.envelope_count,
            f.has_envelopes,
            f.incompatible_shapes,
            f.certainty,
            f.certified_envelope_ready
        ),
        Err(e) => println!("outcome error {e:?}"),
    }

    if matches!(
        case,
        "inverted" | "malformed" | "unknown" | "late_inverted" | "late_unknown"
    ) {
        assert_eq!(result.is_err(), candidate);
        if candidate {
            let text = format!("{:?}", result.as_ref().unwrap_err());
            assert!(
                text.starts_with(if case == "unknown" || case == "late_unknown" {
                    "UnknownScalarOrdering"
                } else {
                    "InvalidFieldEnvelope"
                })
            );
        } else {
            assert!(result.as_ref().unwrap().certified_envelope_ready);
        }
        return;
    }
    let out = result.as_ref().unwrap();
    assert_eq!(out.certainty, i.certainty);
    assert_eq!(out.vector_interval, i.expected);
    assert_eq!(out.vector_count, i.vectors.len());
    assert_eq!(out.tensor_count, i.tensors.len());
    assert_eq!(out.envelope_count, i.vectors.len() + i.tensors.len());
    assert_eq!(out.has_envelopes, case != "empty");
    assert_eq!(
        out.certified_envelope_ready,
        i.certainty == AggregateCertainty::Certified
    );
    assert_eq!(out.incompatible_shapes, usize::from(case == "incompatible"));
    if case == "many" {
        assert_eq!(out.tensor_interval.as_ref(), i.tensors.first());
    } else {
        assert!(out.tensor_interval.is_none());
    }
}
unsafe extern "C" {
    fn measure_stack(
        callback: extern "C" fn(*mut c_void),
        context: *mut c_void,
        warm: i32,
        pattern: u8,
    ) -> usize;
}
struct Job<'a> {
    input: &'a Input,
    result: Option<HypervoxelResult<Facts>>,
}
extern "C" fn callback(context: *mut c_void) {
    // SAFETY: synchronous pthread join keeps this exclusively borrowed Job live.
    let job = unsafe { &mut *context.cast::<Job<'_>>() };
    job.result = Some(execute(job.input));
}
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let mode = &args[1];
    let case = &args[2];
    let warm: usize = args[3].parse().unwrap();
    let candidate = args[4] == "candidate";
    let i = input(case);
    for _ in 0..warm {
        let r = execute(&i);
        validate(&i, &r, case, candidate);
    }
    if mode == "stack" {
        for pattern in [0xa5, 0x5a, 0x00, 0xff] {
            let mut job = Job {
                input: &i,
                result: None,
            };
            // SAFETY: callback cannot outlive the synchronous join; valid stack mapping is owned by C.
            let peak =
                unsafe { measure_stack(callback, (&mut job as *mut Job<'_>).cast(), 0, pattern) };
            validate(&i, job.result.as_ref().unwrap(), case, candidate);
            println!("stack {case} {warm} {pattern} {peak}");
        }
        return;
    }
    #[cfg(feature = "allocation")]
    if mode == "allocation" {
        use allocation::{
            AllocationStats as Stats, rust_tracking_enable as enable, rust_tracking_reset as reset,
        };
        for iteration in 0..8 {
            reset();
            let before = Stats::rust_snapshot();
            enable(true);
            let result = execute(&i);
            let retained = Stats::rust_snapshot();
            // Disable event counting while asserting; counted payload lifetimes still update.
            enable(false);
            validate(&i, &result, case, candidate);
            enable(true);
            drop(result);
            let dropped = Stats::rust_snapshot();
            enable(false);
            println!("allocation {case} {warm} {iteration} {before:?} {retained:?} {dropped:?}");
        }
        drop(i);
        println!("cleanup {:?}", Stats::rust_snapshot());
        return;
    }
    #[cfg(feature = "trace")]
    if mode == "trace" {
        for iteration in 0..8 {
            hyperreal::dispatch_trace::reset();
            let guard = hyperreal::dispatch_trace::recording_scope();
            let result = execute(&i);
            drop(guard);
            let trace = hyperreal::dispatch_trace::snapshot_trace();
            validate(&i, &result, case, candidate);
            println!("trace {case} {warm} {iteration} {trace:?}");
        }
        return;
    }
    panic!("mode absent from build");
}
