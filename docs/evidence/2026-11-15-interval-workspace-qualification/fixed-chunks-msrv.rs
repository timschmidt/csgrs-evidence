fn main() {
    for length in 0..=99 {
        let data: Vec<i32> = (0..length).collect();
        let old: Vec<_> = data.chunks_exact(3).map(|c| [c[0], c[1], c[2]]).collect();
        let new: Vec<_> = data.as_chunks::<3>().0.to_vec();
        assert_eq!(old, new);
    }
}
