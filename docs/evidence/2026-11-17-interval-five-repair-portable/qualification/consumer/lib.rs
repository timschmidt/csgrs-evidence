mod fixture;
use fixture::{ChainOutput, Fixture, operation};
use hyperlimit::PredicatePolicy;
#[cfg(feature = "trace")]
type Trace = hyperreal::dispatch_trace::TraceSnapshot;
#[cfg(not(feature = "trace"))]
type Trace = ();
include!("operation.rs");

fn execute_recording<const RECORD: bool>(
    case: usize,
    policy: PredicatePolicy,
    reuse: bool,
    warm: bool,
) -> String {
    let reused = reuse.then(|| fixture::fixture(case));
    let generation = reused.as_ref().map(|f| f.context.generation());
    let input = Input {
        case,
        policy,
        reused,
        generation,
    };
    if warm {
        for _ in 0..8 {
            let output = run::<RECORD>(&input);
            validate(&input, &output);
        }
    }
    let output = run::<RECORD>(&input);
    validate(&input, &output);
    format!("OUTPUT {:?}\nTRACE {:?}\n", output.report, output.trace)
}

pub fn execute(case: u32, policy: u32, recording: u32, reuse: u32, warm: u32) -> String {
    let policy = match policy {
        0 => PredicatePolicy::STRICT,
        1 => PredicatePolicy::APPROXIMATE_512,
        _ => panic!("invalid policy selector"),
    };
    assert!(reuse <= 1 && warm <= 1);
    match recording {
        0 => execute_recording::<false>(case as usize, policy, reuse == 1, warm == 1),
        #[cfg(feature = "trace")]
        1 => execute_recording::<true>(case as usize, policy, reuse == 1, warm == 1),
        _ => panic!("invalid recording selector"),
    }
}

#[cfg(target_arch = "wasm32")]
mod wasm {
    use std::cell::RefCell;
    thread_local! {
        static OUTPUT: RefCell<Option<String>> = const { RefCell::new(None) };
    }
    #[unsafe(no_mangle)]
    pub extern "C" fn chain_run(
        case: u32,
        policy: u32,
        recording: u32,
        reuse: u32,
        warm: u32,
    ) -> u32 {
        let output = super::execute(case, policy, recording, reuse, warm);
        let len = u32::try_from(output.len()).unwrap();
        OUTPUT.with(|slot| *slot.borrow_mut() = Some(output));
        len
    }
    #[unsafe(no_mangle)]
    pub extern "C" fn chain_output_pointer() -> *const u8 {
        OUTPUT.with(|slot| {
            slot.borrow()
                .as_ref()
                .map_or(std::ptr::null(), |text| text.as_ptr())
        })
    }
    #[unsafe(no_mangle)]
    pub extern "C" fn chain_clear() {
        OUTPUT.with(|slot| *slot.borrow_mut() = None);
    }
}
