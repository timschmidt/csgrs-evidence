use rand::{Rng, SeedableRng};
fn main() {
    for seed in 0..1000 {
        let mut rng = rand::rngs::SmallRng::seed_from_u64(seed);
        let mut data = vec![0_u8; 32 * 32 * 32];
        for step in 0..1000 {
            let x = rng.random_range(0_i32..32);
            let y = rng.random_range(0_i32..32);
            let z = rng.random_range(0_i32..32);
            let index = (z * 32 * 32 + y * 32 + x) as usize;
            let value = rng.random_range(1_i32..=255) as u8;
            if data[index] == value {
                println!("seed={seed} step={step} position=({x},{y},{z}) value={value}");
                return;
            }
            data[index] = value;
        }
    }
    panic!("no duplicate stream found");
}
