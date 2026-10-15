//! Feasibility probe only: native edge admission/replay, not STEP mapping.
use hyperbrep::*;

fn probe(x: Real, y: Real, turns: i32, anchor_frame: bool) -> Result<usize, String> {
    let radius = Real::from(5);
    let (axis_x, axis_y, start) = if anchor_frame {
        (
            Vector3::new([
                (&x / &radius).unwrap(),
                (&y / &radius).unwrap(),
                Real::zero(),
            ]),
            Vector3::new([
                (-&y / &radius).unwrap(),
                (&x / &radius).unwrap(),
                Real::zero(),
            ]),
            Real::tau() * Real::from(turns),
        )
    } else {
        let phase = y
            .clone()
            .try_atan2(x.clone())
            .map_err(|e| format!("angle: {e:?}"))?;
        (
            Vector3::x(),
            Vector3::y(),
            phase + Real::tau() * Real::from(turns),
        )
    };
    let end = &start + Real::tau();
    let mut builder = ModelBuilder::new();
    let vertex = builder
        .vertex(Point3::new(x, y, Real::zero()).into())
        .map_err(|e| format!("vertex: {e:?}"))?;
    let curve = Curve3::circle_arc(
        Point3::origin(),
        axis_x,
        axis_y,
        radius,
        start.clone(),
        end.clone(),
    )
    .map_err(|e| format!("curve: {e:?}"))?;
    let curve = builder
        .curve(curve)
        .map_err(|e| format!("staging: {e:?}"))?;
    let domain = ParameterDomain::new(start, end).map_err(|e| format!("domain: {e:?}"))?;
    builder
        .edge(&vertex, &vertex, &curve, domain.into())
        .map_err(|e| format!("edge: {e:?}"))?;
    let model = builder.finish().map_err(|e| format!("finish: {e:?}"))?;
    let json = model.to_json().map_err(|e| format!("encode: {e:?}"))?;
    let loaded = RawModel::from_json(&json, &ArchiveLimits::default())
        .map_err(|e| format!("decode: {e:?}"))?
        .validate()
        .map_err(|e| format!("replay: {e:?}"))?;
    assert_eq!(loaded.to_json().unwrap(), json);
    assert_eq!((loaded.counts().vertices, loaded.counts().edges), (1, 1));
    Ok(json.len())
}

fn main() {
    for (x, y) in [(3, 4), (-3, 4), (-3, -4), (3, -4)] {
        for turns in [-2, 0, 3] {
            for anchored in [false, true] {
                println!(
                    "x={x} y={y} turns={turns} anchored={anchored}: {:?}",
                    probe(x.into(), y.into(), turns, anchored)
                );
            }
        }
    }
    let tiny = (Real::one() / Real::from(1_000_000_000_000_i64)).unwrap();
    for anchored in [false, true] {
        println!(
            "off_carrier anchored={anchored}: {:?}",
            probe(3.into(), Real::from(4) + &tiny, 0, anchored)
        );
    }
}
