from pathlib import Path
import shutil
s=Path(__file__).parent;root=Path('/mnt/development/csgrs');core=Path('/mnt/development/csgrs-field-core');p='crates/hyperdynamics/src/field.rs'
original=(root/p).read_text();(s/'field-direct-helper.rs').write_text(original)
shutil.copy2('/tmp/interval-refactor/rational-time-target/release/dyadic-evolution-cost-probe','/tmp/interval-refactor/rational-time-direct-helper-candidate')
start=original.index('        let mut bindings = Vec::new();',original.index('fn from_validated_source('));end=original.index('\n    }',start)
body=original[start:end]
body=body.replace('source',' $source').replace('budget','$budget').replace('charge(inputs)','charge($inputs)').replace('== time','== $time').replace('                    state\n','                    ($state)\n').replace('jacobian(&state','jacobian(&$state').replace('            time,','            time: $time,').replace('            state,','            state: $state,')
body=body.replace('             $source,','            source: $source,').replace('& $source','&$source').replace('=  $source','= $source')
macro='''// Keep the original constructor's ownership/drop scopes while sharing the
// validated-source assembly with affine clocks. Predicate and charge order are
// deliberately unchanged; this is assembly, not another validation authority.
macro_rules! assemble_field {
    ($source:ident, $time:expr, $state:expr, $inputs:expr, $budget:ident) => {{
'''+body+'''
    }};
}

'''
new=original[:start]+'        assemble_field!(source, time, state, inputs, budget)'+original[end:]
new=new.replace('        Self::from_validated_source(source, definition.time, definition.state, inputs, budget)','        assemble_field!(source, definition.time, definition.state, inputs, budget)')
new=new.replace('    // Keep the same constructor effects/order when called from from_definition.\n','')
pos=new.index('impl<const N: usize> ExpressionField<N> {');new=new[:pos]+macro+new[pos:]
(core/p).write_text(new)
