fn main() {
    for input in ["9007199254740993.0", "0.1", "1.E400", "1.E-400"] {
        let (_, a) = ruststep::parser::token::real(input).unwrap();
        let (_, b) = step_p21::parser::token::real(input).unwrap();
        println!("number input={input} ruststep={a:.17e} step_p21={b:.17e}");
    }
    for (name, record) in [
        ("escaped-apostrophe", "#1=LABEL('one''two');"),
        ("empty-aggregate", "#1=GROUP(());"),
        ("complex", "#1=(A()B(1.0));"),
        ("forward-reference", "#1=A(#2);#2=B($,*,.U.);"),
    ] {
        let source = format!("ISO-10303-21;HEADER;FILE_DESCRIPTION((),'2;1');FILE_NAME('','',(),(),'','','');FILE_SCHEMA(('TEST'));ENDSEC;DATA;{record}ENDSEC;END-ISO-10303-21;");
        let a = ruststep::parser::parse(&source).is_ok();
        let b = step_p21::parser::parse(&source).is_ok();
        println!("syntax case={name} ruststep={a} step_p21={b}");
        assert!(a && b, "shared fixture {name}");
    }
    std::panic::set_hook(Box::new(|_| {}));
    for input in ["9223372036854775808", "184467440737095516160000"] {
        let a = std::panic::catch_unwind(|| ruststep::parser::token::integer(input));
        let b = std::panic::catch_unwind(|| step_p21::parser::token::integer(input));
        println!("integer input={input} ruststep_panics={} step_p21_panics={}", a.is_err(), b.is_err());
    }
}
