fn main() {
    let args: Vec<u32> = std::env::args()
        .skip(1)
        .map(|x| x.parse().unwrap())
        .collect();
    assert_eq!(args.len(), 5);
    print!(
        "{}",
        residual_certainty_consumer::execute(args[0], args[1], args[2], args[3], args[4])
    );
}
