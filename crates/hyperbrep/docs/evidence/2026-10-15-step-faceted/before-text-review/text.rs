use super::{Error, ErrorKind, Resource, decode::Site, error::charge};
use crate::part21::{Value, ValueKind};

pub(super) fn decode(
    value: Value<'_, '_>,
    site: Site,
    total: &mut usize,
    limit: usize,
) -> Result<String, Error> {
    let ValueKind::String(token) = value.kind() else {
        return Err(Error::at(
            site.id,
            value.span().start,
            ErrorKind::Expected("string"),
        ));
    };
    let body = &token[1..token.len() - 1];
    let mut output = String::new();
    let mut cursor = 0;
    while cursor < body.len() {
        let offset = value.span().start + 1 + cursor;
        let fail = |kind| Error::at(site.id, offset, kind);
        let rest = &body[cursor..];
        let character = if rest.starts_with("''") {
            cursor += 2;
            '\''
        } else if rest.starts_with("\\\\") {
            cursor += 2;
            '\\'
        } else if rest.starts_with("\\PA\\") {
            cursor += 4;
            continue;
        } else if rest.starts_with("\\P") {
            return Err(fail(ErrorKind::Unsupported(
                "ISO 8859 alphabets other than Latin-1",
            )));
        } else if rest.starts_with("\\S\\") {
            let byte = *body
                .as_bytes()
                .get(cursor + 3)
                .ok_or_else(|| fail(ErrorKind::Invalid("incomplete PAGE directive")))?;
            if !(0x20..=0x7e).contains(&byte) {
                return Err(fail(ErrorKind::Invalid("non-Latin PAGE character")));
            }
            cursor += 4;
            char::from(byte + 128)
        } else if rest.starts_with("\\X\\") {
            let code = hex(body
                .as_bytes()
                .get(cursor + 3..cursor + 5)
                .ok_or_else(|| fail(ErrorKind::Invalid("incomplete hexadecimal character")))?)
            .ok_or_else(|| fail(ErrorKind::Invalid("invalid hexadecimal character")))?;
            cursor += 5;
            char::from(code as u8)
        } else if rest.starts_with("\\X2\\") || rest.starts_with("\\X4\\") {
            let width = if rest.as_bytes()[2] == b'2' { 4 } else { 8 };
            let start = cursor + 4;
            let length = body[start..]
                .find("\\X0\\")
                .ok_or_else(|| fail(ErrorKind::Invalid("unterminated Unicode directive")))?;
            if length == 0 || length % width != 0 {
                return Err(fail(ErrorKind::Invalid("invalid Unicode group length")));
            }
            for group in body.as_bytes()[start..start + length].chunks_exact(width) {
                let code = hex(group)
                    .and_then(char::from_u32)
                    .ok_or_else(|| fail(ErrorKind::Invalid("invalid Unicode scalar")))?;
                append(&mut output, code, total, limit).map_err(fail)?;
            }
            cursor = start + length + 4;
            continue;
        } else if rest.starts_with('\\') {
            return Err(fail(ErrorKind::Invalid("unknown string control directive")));
        } else {
            let character = rest.chars().next().expect("nonempty UTF-8 remainder");
            cursor += character.len_utf8();
            // Part 21 physical control octets are not string content. Encoded
            // controls (for example X/0A) above remain actual content.
            if character.is_ascii_control() {
                continue;
            }
            character
        };
        append(&mut output, character, total, limit).map_err(fail)?;
    }
    Ok(output)
}
fn hex(bytes: &[u8]) -> Option<u32> {
    bytes.iter().try_fold(0u32, |value, byte| {
        let digit = match byte {
            b'0'..=b'9' => byte - b'0',
            b'A'..=b'F' => byte - b'A' + 10,
            _ => return None,
        };
        value.checked_mul(16)?.checked_add(u32::from(digit))
    })
}
fn append(
    out: &mut String,
    character: char,
    total: &mut usize,
    limit: usize,
) -> Result<(), ErrorKind> {
    charge(
        total,
        character.len_utf8(),
        limit,
        Resource::DecodedTextBytes,
    )?;
    out.try_reserve(character.len_utf8())
        .map_err(|_| ErrorKind::Allocation)?;
    out.push(character);
    Ok(())
}
