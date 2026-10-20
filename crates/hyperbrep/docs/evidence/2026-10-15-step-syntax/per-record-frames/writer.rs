use super::*;
use error::{check, push};

struct Output {
    text: String,
    limit: usize,
}
impl Output {
    fn add(&mut self, text: &str) -> Result<(), Error> {
        let observed = self.text.len().saturating_add(text.len());
        check(Resource::OutputBytes, observed, self.limit, 0)?;
        self.text
            .try_reserve(text.len())
            .map_err(|_| Error::new(0, ErrorKind::Allocation))?;
        self.text.push_str(text);
        Ok(())
    }
}

fn value(exchange: &Exchange<'_>, index: usize, out: &mut Output) -> Result<(), Error> {
    let mut index = index;
    let mut frames: Vec<(usize, bool)> = Vec::new();
    loop {
        if let Some(&(end, _)) = frames.last() {
            if index == end {
                out.add(")")?;
                frames.pop();
                if frames.is_empty() {
                    break;
                }
                continue;
            }
            let parent = frames.last_mut().expect("nonempty frame stack");
            if parent.1 {
                out.add(",")?;
            }
            parent.1 = true;
        }
        let node = &exchange.nodes[index];
        match node.kind {
            ValueKind::Aggregate | ValueKind::Typed(_) => {
                if let ValueKind::Typed(name) = node.kind {
                    out.add(name)?;
                }
                out.add("(")?;
                push(&mut frames, (node.end, false), node.span.start)?;
            }
            _ => {
                out.add(&exchange.source[node.span.clone()])?;
            }
        }
        index += 1;
        if frames.is_empty() {
            break;
        }
    }
    Ok(())
}
fn record(exchange: &Exchange<'_>, record: &RecordData<'_>, out: &mut Output) -> Result<(), Error> {
    out.add(record.name)?;
    value(exchange, record.arguments, out)
}
pub(super) fn write(exchange: &Exchange<'_>, limit: usize) -> Result<String, Error> {
    let mut out = Output {
        text: String::new(),
        limit,
    };
    out.add("ISO-10303-21;\nHEADER;\n")?;
    for item in &exchange.records[exchange.header.clone()] {
        record(exchange, item, &mut out)?;
        out.add(";\n")?;
    }
    out.add("ENDSEC;\n")?;
    for section in &exchange.sections {
        out.add("DATA")?;
        if let Some(arguments) = section.arguments {
            value(exchange, arguments, &mut out)?;
        }
        out.add(";\n")?;
        for entity in &exchange.entities[section.entities.clone()] {
            // Reuse the original ID token, avoiding an intermediate format allocation.
            let token = &exchange.source[entity.span.clone()];
            let length = 1 + token[1..].bytes().take_while(u8::is_ascii_digit).count();
            out.add(&token[..length])?;
            out.add("=")?;
            if entity.complex {
                out.add("(")?;
            }
            for component in &exchange.records[entity.components.clone()] {
                record(exchange, component, &mut out)?;
            }
            if entity.complex {
                out.add(")")?;
            }
            out.add(";\n")?;
        }
        out.add("ENDSEC;\n")?;
    }
    out.add("END-ISO-10303-21;\n")?;
    Ok(out.text)
}
