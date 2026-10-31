import sys
p=sys.argv[1]
s=open(p).read()
old="""        self.validate_policy(policy)?;
        other.validate_policy(policy)?;
        // Refine each finite chord before entering their infinite-support"""
new="""        self.validate_policy(policy)?;
        other.validate_policy(policy)?;
        if std::env::var_os("TEMP_TRACE_CHORDS").is_some() {
            let kind = |chord: &Self| {
                let point = |q: &CurvePoint2| { let d = format!("{:?}", q.0); d.split(['(', ' ', '{']).next().unwrap_or("").to_string() };
                let support = chord.retained_support();
                format!("[{} -> {} | support {} -> {} | normal-base {} | axis {:?}]", point(chord.start()), point(chord.end()), point(support.start()), point(support.end()), chord.retained_normal_offset_base_orientation().is_some(), chord.certified_axis_direction().map(|d| d.axis()))
            };
            for (offset, target, label) in [(self, other, "self"), (other, self, "other")] {
                if let Some((ancestor, ancestor_reversed)) = offset.retained_normal_offset_ancestor() {
                    let base = match ancestor.start() { CurvePoint2(CurvePointData2::AlgebraicChordParallel(start)) => Some(start), _ => None };
                    let base_info = base.map(|start| {
                        let base_chord = start.data.source.retained_support();
                        format!("base-ptr-eq-target-support {} target-shares-base {} target==base {} source_point {} translation-zero {:?}/{:?} base-kind [{:?}]",
                            Arc::ptr_eq(&base_chord.data, &target.retained_support().data), target.shares_retained_support(base_chord), target.retained_support() == base_chord,
                            start.data.source_point.is_some(), start.data.translation_x.zero_status(), start.data.translation_y.zero_status(),
                            { let d = format!("{:?}", base_chord.start().0); d.split(['(', ' ', '{']).next().unwrap_or("").to_string() })
                    });
                    eprintln!("CHORDOFFSET {label} ancestor-reversed {ancestor_reversed} tangent-reversal {:?} own-distance {:?} {}", offset.retained_normal_offset_tangent_reversal_to(target), offset.retained_normal_offset_distance_with_tangent_reversal(false).is_some(), base_info.unwrap_or_default());
                }
            }
            eprintln!("CHORDPAIR shares={} orient={:?} normal-distance={} {} vs {}", self.shares_retained_support(other), self.shared_tangent_orientation(other), self.retained_normal_offset_distance_to(other).or_else(|| other.retained_normal_offset_distance_to(self)).is_some(), kind(self), kind(other));
        }
        // Refine each finite chord before entering their infinite-support"""
assert s.count(old)==1, s.count(old)
open(p,'w').write(s.replace(old,new))
