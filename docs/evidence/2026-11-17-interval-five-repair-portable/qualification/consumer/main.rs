fn main() {
    let args = std::env::args()
        .skip(1)
        .map(|value| value.parse::<u32>().unwrap())
        .collect::<Vec<_>>();
    assert_eq!(args.len(), 5);
    print!(
        "{}",
        solver_five_portable::execute(args[0], args[1], args[2], args[3], args[4])
    );
}
