from pathlib import Path
import sys
root=Path(sys.argv[1])
p=root/'crates/hypercurve/src/bezier_region.rs'
s=p.read_text();start=s.index('pub(crate) fn retained_line_fragment_segment(');brace=s.index('{',start)+1
s=s[:brace]+'\n    #[cfg(feature = "dispatch-trace")]\n    hyperreal::dispatch_trace::record("hypercurve", "r11-probe", "line-image-request");'+s[brace:];p.write_text(s)
p=root/'crates/hypercurve/src/curve_region_boolean.rs';s=p.read_text()
start=s.index('    fn merge_certified_boolean_line_fragments(');brace=s.index('{',start)+1
s=s[:brace]+'\n        #[cfg(feature = "dispatch-trace")]\n        hyperreal::dispatch_trace::record("hypercurve", "r11-probe", "merge-attempt");'+s[brace:]
start=s.index('    fn coalesce_certified_boolean_line_runs(');end=s.index('    fn compact_line_image_result_or_retain(',start);body=s[start:end]
body=body.replace('                    current = merged;', '                    #[cfg(feature = "dispatch-trace")]\n                    hyperreal::dispatch_trace::record("hypercurve", "r11-probe", "forward-merge");\n                    current = merged;')
body=body.replace('                fragments.pop();', '                #[cfg(feature = "dispatch-trace")]\n                hyperreal::dispatch_trace::record("hypercurve", "r11-probe", "seam-merge");\n                fragments.pop();')
body=body.replace('                *fragment = BezierSplitFragment2::Materialized {', '                #[cfg(feature = "dispatch-trace")]\n                hyperreal::dispatch_trace::record("hypercurve", "r11-probe", "native-materialization");\n                *fragment = BezierSplitFragment2::Materialized {')
p.write_text(s[:start]+body+s[end:])
