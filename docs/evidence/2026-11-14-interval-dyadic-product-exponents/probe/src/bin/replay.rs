use hyperinterval::{DyadicBudget, DyadicInterval};
fn d(a:i64,b:i64,e:i32)->DyadicInterval { DyadicInterval::new(a.into(),b.into(),e).unwrap() }
fn main() {
    let mut budget=DyadicBudget::new(4096,1_000_000_000);
    let expected = [d(2,4,i32::MAX),d(-1,2,i32::MIN)];
    if std::env::args().nth(1).as_deref()==Some("generate") {
        let values = [d(1,2,i32::MAX).mul(&d(1,1,1),&mut budget).unwrap(),d(-1,2,-1_073_741_824).mul(&d(-1,2,-1_073_741_825),&mut budget).unwrap()];
        assert_eq!(values,expected);
        println!("{}",serde_json::to_string(&values).unwrap());
    } else {
        let source=std::io::read_to_string(std::io::stdin()).unwrap();
        let values:[DyadicInterval;2]=serde_json::from_str(&source).unwrap();
        assert_eq!(values,expected);
        for (value,expected) in values.iter().zip(expected) {
            assert_eq!(value.mul(&d(1,1,0),&mut budget).unwrap(),expected);
            assert_eq!(value.neg(&mut budget).unwrap().neg(&mut budget).unwrap(),expected);
        }
        assert_eq!(serde_json::to_string(&values).unwrap(),source.trim());
        println!("two canonical products replayed and consumed in a fresh process");
    }
}
