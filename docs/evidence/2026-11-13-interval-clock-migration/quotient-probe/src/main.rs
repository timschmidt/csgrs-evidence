fn main() {
 assert_eq!(hyperinterval::integer_quotient_bounds(-7, 3).unwrap(), (-3, -2));
 assert_eq!(hyperinterval::IntegerRange::<i128>::new(1, 2).unwrap().scale(3).unwrap().bounds(), Some((3, 6)));
}
