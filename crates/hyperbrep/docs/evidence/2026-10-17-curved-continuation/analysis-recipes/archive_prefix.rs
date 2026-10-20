use hyperbrep::{ArchiveLimits, RawModel};
use serde_json::Value;

fn validate(value: &Value) -> bool {
    let json = serde_json::to_string(value).unwrap();
    let result = RawModel::from_json(&json, &ArchiveLimits::default()).unwrap().validate();
    match result {
        Ok(model) => { println!("accepted {:?}", model.counts()); false }
        Err(error) => {
            let text = format!("{error:?}");
            println!("error={text}");
            text.contains("Build(Geometry(PredicateUnresolved")
        }
    }
}

fn main() {
    let path = std::env::args().nth(1).unwrap();
    let raw: Value = serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
    println!("full archive");
    assert!(validate(&raw));
    let layers = ["edges", "edge_uses", "wires", "faces", "shells", "solids"];
    for (index, field) in layers.iter().enumerate() {
        let mut prefix = raw.clone();
        for later in &layers[index+1..] {
            prefix[*later] = Value::Array(Vec::new());
        }
        println!("complete layer {field}");
        if !validate(&prefix) { continue; }
        let count = raw[*field].as_array().unwrap().len();
        let mut lo = 0;
        let mut hi = count;
        while lo < hi {
            let middle = (lo + hi) / 2;
            prefix[*field] = Value::Array(raw[*field].as_array().unwrap()[..middle].to_vec());
            println!("layer {field} prefix {middle}");
            if validate(&prefix) { hi = middle; } else { lo = middle + 1; }
        }
        println!("first failing layer={field} prefix={lo} record={}", raw[*field][lo-1]);
        return;
    }
    panic!("no monotone local failure found");
}
