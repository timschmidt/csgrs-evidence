from pathlib import Path
import subprocess,shutil
s=Path(__file__).parent;r=Path('/mnt/development/interval-profile-static/csgrs');a=r.parent/'alumina-interface'
assert (s/'missing-typed-entry.json').exists()
import json
assert json.loads((s/'missing-typed-entry.json').read_text())['exit_code'] != 0
assert 'E0277' in (s/'missing-typed-entry.log').read_text()
p=r/'crates/hyperreal/src/rational/arithmetic/construction.rs'
with p.open('a') as out:out.write('''

/// Exact nonnegative primitive fraction with a denominator nonzero by construction.
/// The existing fraction reducer owns canonicalization and dispatch.
impl From<(u64, core::num::NonZeroU64)> for Rational {
    fn from((numerator, denominator): (u64, core::num::NonZeroU64)) -> Self {
        Self::from_fraction_parts_reduced(
            Plus,
            BigUint::from(numerator),
            BigUint::from(denominator.get()),
        )
    }
}
''')
old=Path('/tmp/interval-refactor/profile-codegen-attribution')
for root,name in [(r,'csgrs-nonempty.patch'),(a,'alumina-interface-nonempty.patch')]:
 subprocess.run(['git','-C',str(root),'apply','--check',str(old/name)],check=True)
 subprocess.run(['git','-C',str(root),'apply',str(old/name)],check=True)
p=r/'crates/hyperinterval/src/rational/nonempty.rs';text=p.read_text()
start=text.index('    ) -> Result<Self, hyperreal::Problem> {')
end=text.index('\n    // Callers establish',start)
text=text[:start]+'''    ) -> Self {
        let uncertainty = Rational::from((numerator, denominator));
        Self::centered(nominal, &uncertainty)
    }
''' + text[end:];p.write_text(text)
p=r/'crates/hyperinterval/src/rational.rs';text=p.read_text()
text=text.replace('    /// Scalar construction diagnostics retain [`hyperreal::Problem`]. No sign\n    /// predicate is repeated on the converted uncertainty.','    /// No sign predicate is repeated on the converted uncertainty.')
oldtext='''    ) -> Result<Self, hyperreal::Problem> {
        NonEmptyRationalInterval::from_nominal_unsigned_uncertainty(nominal, numerator, denominator)
            .map(NonEmptyRationalInterval::into_interval)
    }'''
newtext='''    ) -> Self {
        NonEmptyRationalInterval::from_nominal_unsigned_uncertainty(nominal, numerator, denominator)
            .into_interval()
    }'''
assert oldtext in text;text=text.replace(oldtext,newtext);p.write_text(text)
# Remove only the unwrap or propagation belonging to the now-infallible factory.
# Keep every assertion and every independent oracle/validation unwrap unchanged.
for p in [r/'crates/hyperinterval/tests/fraction_uncertainty.rs',r/'crates/hyperinterval/tests/nonempty_transport.rs',a/'crates/alumina-interface-core/src/machine_profile.rs']:
 text=p.read_text();needle='::from_nominal_unsigned_uncertainty(';offset=0
 while (start:=text.find(needle,offset))>=0:
  i=start+len(needle);depth=1
  while depth:
   depth+=(text[i]=='(')-(text[i]==')');i+=1
  end=i
  while text[end].isspace():end+=1
  if text.startswith('.unwrap()',end):text=text[:i]+text[end+9:]
  elif text.startswith('?',end):text=text[:i]+text[end+1:]
  else:raise AssertionError((p,text[end:end+30]))
  offset=i
 p.write_text(text)
print('candidate applied in isolated repositories')
