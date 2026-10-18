mod acceptance;
mod images;
use hyperbrep::*;
use hyperbrep_io::step::*;
use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicUsize, Ordering};
use std::time::Instant;

struct CountingAllocator;
static COUNTING: AtomicBool = AtomicBool::new(false);
static CALLS: AtomicUsize = AtomicUsize::new(0);
static BYTES: AtomicUsize = AtomicUsize::new(0);
fn record(size: usize) {
    if COUNTING.load(Ordering::Relaxed) {
        CALLS.fetch_add(1, Ordering::Relaxed);
        BYTES.fetch_add(size, Ordering::Relaxed);
    }
}
// SAFETY: The original pointers and layouts pass unchanged to System; the
// independent counters neither inspect allocations nor change their lifetime.
unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        record(layout.size());
        unsafe { System.alloc(layout) }
    }
    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        record(layout.size());
        unsafe { System.alloc_zeroed(layout) }
    }
    unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, size: usize) -> *mut u8 {
        record(size);
        unsafe { System.realloc(ptr, layout, size) }
    }
    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        unsafe { System.dealloc(ptr, layout) }
    }
}
#[global_allocator]
static ALLOCATOR: CountingAllocator = CountingAllocator;

fn measure(name: &str, outcome: &str, operation: fn()) {
    operation();
    CALLS.store(0, Ordering::Relaxed);
    BYTES.store(0, Ordering::Relaxed);
    COUNTING.store(true, Ordering::Relaxed);
    let started = Instant::now();
    let iterations = 3;
    for _ in 0..iterations {
        black_box(operation)();
    }
    let elapsed = started.elapsed().as_nanos();
    COUNTING.store(false, Ordering::Relaxed);
    println!(
        "{{\"case\":\"{name}\",\"outcome\":\"{outcome}\",\"iterations\":{iterations},\"elapsed_ns\":{elapsed},\"allocation_calls\":{},\"requested_bytes\":{}}}",
        CALLS.load(Ordering::Relaxed),
        BYTES.load(Ordering::Relaxed)
    );
}
fn step_probe() {
    let region = acceptance::profile(false, false, false);
    let body = builder::extrude_curve_region(&region, 0.into(), 3.into()).unwrap();
    let context = OperationContext::strict(WorkBudget {
        refinements: 10000,
        promotions: 1000,
    });
    let result = write_advanced(
        &[StepBody {
            solid: body.bodies().next().unwrap(),
            name: "parabolic cap",
        }],
        &StepWriteOptions::new("retained.step", "2026-10-18T00:00:00"),
        &context,
    )
    .result
    .unwrap();
    match result {
        Err(error) => println!("step_error={error:?}"),
        Ok(output) => {
            let file =
                StepFile::read(output.text().as_bytes(), &StepReadOptions::default()).unwrap();
            let imported = file
                .import_representation(output.representation(), &ImportLimits::default(), &context)
                .result
                .unwrap()
                .unwrap();
            assert_eq!(imported.bodies().len(), 1);
            acceptance::verify(imported.bodies()[0].solid().model(), false, false);
            println!("step=certified bytes={}", output.text().len());
        }
    }
}
fn main() {
    match std::env::args().nth(1).as_deref().unwrap_or("all") {
        "all" => {
            acceptance::run_all();
            images::run_all();
            println!("native_groups=6 curve_proof_groups=8 outcome=certified");
        }
        "step" => step_probe(),
        "artifacts" => {
            let directory = std::path::PathBuf::from(std::env::args_os().nth(2).unwrap());
            std::fs::create_dir_all(&directory).unwrap();
            for reverse in [false, true] {
                for components in [false, true] {
                    for affine in [false, true] {
                        let region = acceptance::profile(reverse, components, affine);
                        let body =
                            builder::extrude_curve_region(&region, 0.into(), 3.into()).unwrap();
                        acceptance::verify(body.model(), components, affine);
                        acceptance::verify(&acceptance::replay(body.model()), components, affine);
                        let text = body.model().to_json().unwrap();
                        let name =
                            format!("reverse-{reverse}-components-{components}-affine-{affine}");
                        std::fs::write(directory.join(format!("{name}.json")), &text).unwrap();
                        println!("case={name} outcome=certified native_bytes={}", text.len());
                    }
                }
            }
        }
        "measure" => {
            measure("eight_profiles", "certified", acceptance::retained_chords_extrude_with_exact_holes_components_and_reversed_affine_images);
            measure(
                "cut_restore_replay",
                "certified",
                acceptance::retained_profile_results_continue_through_slab_cuts_and_restoration,
            );
            measure("thin_touching_components", "certified", acceptance::equal_profile_intervals_preserve_exact_thin_components_and_touching_union);
            measure(
                "planar_replay",
                "certified",
                acceptance::retained_chord_planar_face_uses_the_same_native_image_proof,
            );
            measure(
                "unequal_holes",
                "expected_typed_rejection",
                acceptance::interval_continuation_requires_equal_material_including_holes,
            );
            measure(
                "self_intersecting",
                "expected_typed_rejection",
                acceptance::native_images_do_not_bypass_planar_path_simplicity,
            );
        }
        _ => panic!("unknown mode"),
    }
}
