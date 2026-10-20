use hyperbrep_io::part21::{parse, ErrorKind, NumberLimits, ReadLimits, Resource, ValueKind};
#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    let source = "ISO-10303-21;HEADER;H();ENDSEC;DATA;#1=A(9007199254740993.0,#2,'x''y');#2=(B()C(()));ENDSEC;END-ISO-10303-21;";
    let parsed = parse(source.as_bytes(), &ReadLimits::default()).unwrap();
    assert_eq!(parsed.entities().len(), 2);
    assert_eq!(parsed.unresolved_references().count(), 0);
    let ValueKind::Real(number) = parsed.entity(1).unwrap().components().next().unwrap().arguments().next().unwrap().kind() else { panic!() };
    assert_eq!(number.to_real(&NumberLimits::default()).unwrap(), hyperreal::Real::from(9007199254740993u64));
    let encoded = parsed.to_step(1000).unwrap();
    assert_eq!(parse(encoded.as_bytes(), &ReadLimits::default()).unwrap().to_step(1000).unwrap(), encoded);
    let deep = format!("ISO-10303-21;HEADER;H();ENDSEC;DATA;#1=A({}1{});ENDSEC;END-ISO-10303-21;", "(".repeat(20000), ")".repeat(20000));
    assert!(matches!(parse(deep.as_bytes(), &ReadLimits::default()).unwrap_err().kind, ErrorKind::Limit { resource: Resource::NestingDepth, .. }));
    let limits = ReadLimits { nesting_depth: 20001, ..ReadLimits::default() };
    let parsed = parse(deep.as_bytes(), &limits).unwrap();
    let encoded = parsed.to_step(100000).unwrap();
    assert_eq!(parse(encoded.as_bytes(), &limits).unwrap().to_step(100000).unwrap(), encoded);
    drop(parsed.clone()); drop(parsed);
    for n in 0..source.len() { assert!(parse(&source.as_bytes()[..n], &ReadLimits::default()).is_err()); }
    7
}
