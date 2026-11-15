#![cfg(all(feature = "serde", feature = "fixed"))]
use hyperlattice_interval::{IntervalMatrix, IntervalVector, hyperinterval::FixedInterval};
type I = FixedInterval<i32, 0>;

#[test]
fn prepared_facts_rebuild_from_validated_sources_in_fresh_processes() {
    const KEY: &str = "INTERVAL_PREPARED_REPLAY";
    if let Ok(text) = std::env::var(KEY) {
        let matrix: IntervalMatrix<I, 2, 2> = serde_json::from_str(&text).unwrap();
        let original = matrix.mul_matrix(&matrix, &mut ()).unwrap();
        let prepared = matrix.prepare();
        let output = prepared.mul_matrix(&matrix, &mut ()).unwrap();
        assert_eq!(
            serde_json::to_vec(&output).unwrap(),
            serde_json::to_vec(&original).unwrap()
        );
        let replay: IntervalMatrix<I, 2, 2> =
            serde_json::from_slice(&serde_json::to_vec(&output).unwrap()).unwrap();
        let vector = IntervalVector::new([I::new(-2, 3).unwrap(); 2]).unwrap();
        assert_eq!(
            replay.prepare().mul_vector(&vector, &mut ()).unwrap(),
            output.mul_vector(&vector, &mut ()).unwrap()
        );
        println!(
            "REPLAY={}",
            serde_json::to_string(&(prepared.zero_entries(), output)).unwrap()
        );
        return;
    }
    for text in [
        "[[[0,0],[1,1]],[[0,0],[0,0]]]",
        "[[[-1,1],[1,1]],[[0,0],[0,0]]]",
        "null",
    ] {
        let matrix: IntervalMatrix<I, 2, 2> = serde_json::from_str(text).unwrap();
        let expected = serde_json::to_string(&(
            matrix.prepare().zero_entries(),
            matrix.mul_matrix(&matrix, &mut ()).unwrap(),
        ))
        .unwrap();
        for _ in 0..2 {
            let child = std::process::Command::new(std::env::current_exe().unwrap())
                .args([
                    "--exact",
                    "prepared_facts_rebuild_from_validated_sources_in_fresh_processes",
                    "--nocapture",
                ])
                .env(KEY, text)
                .output()
                .unwrap();
            assert!(
                child.status.success(),
                "{}",
                String::from_utf8_lossy(&child.stderr)
            );
            let stdout = String::from_utf8(child.stdout).unwrap();
            assert_eq!(
                stdout.lines().find_map(|l| l.strip_prefix("REPLAY=")),
                Some(expected.as_str())
            );
        }
    }
    for invalid in [
        "[[[2,1],[0,0]],[[0,0],[0,0]]]",
        "{\"source\":null,\"zeros\":[[true,true],[true,true]]}",
    ] {
        assert!(serde_json::from_str::<IntervalMatrix<I, 2, 2>>(invalid).is_err());
    }
}
