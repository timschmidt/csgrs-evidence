from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-join-correspondence'
rows=json.loads((c/'selected-join-correspondence-baseline2/results.json').read_text());assert [x['exit_code'] for x in rows]==[0,0,0,101]
def replace(name,old,new):
 p=w/name;s=p.read_text();assert s.count(old)==1,(name,old[:100],s.count(old));p.write_text(s.replace(old,new))
field='crates/hypersolve/src/selected_polynomial_field.rs'
replace(field,'        interval: IsolatedRootInterval,\n    },\n}\n','''        interval: IsolatedRootInterval,
        // A join transported this original generator and revalidated its
        // singleton selection. This is a construction relation, not a cache.
        origin: Option<GeneratorOrigin>,
    },
}

struct GeneratorOrigin(SelectedPolynomialField);

impl std::fmt::Debug for GeneratorOrigin {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        // Do not expand a shared proof graph into a diagnostic tree.
        f.debug_struct("GeneratorOrigin").finish_non_exhaustive()
    }
}
''')
replace(field,'''    fn select_strict<C: SelectedAlgebraContext>(
        &self,
        coefficients: Vec<SelectedPolynomialValue>,
        lower: Real,
        upper: Real,
        policy: &C,
    ) -> Result<Self, SelectedPolynomialError<C::Error>> {
        match policy.real_sign''','''    fn select_strict<C: SelectedAlgebraContext>(
        &self,
        coefficients: Vec<SelectedPolynomialValue>,
        lower: Real,
        upper: Real,
        policy: &C,
    ) -> Result<Self, SelectedPolynomialError<C::Error>> {
        self.select_strict_with_origin(coefficients, lower, upper, None, policy)
    }

    // Only a join supplies an origin, after embedding that source's original
    // coefficients. The same open singleton below then proves correspondence.
    fn select_strict_with_origin<C: SelectedAlgebraContext>(
        &self,
        coefficients: Vec<SelectedPolynomialValue>,
        lower: Real,
        upper: Real,
        origin: Option<Self>,
        policy: &C,
    ) -> Result<Self, SelectedPolynomialError<C::Error>> {
        match policy.real_sign''')
replace(field,'            monic,\n            interval: IsolatedRootInterval {','            monic,\n            origin: origin.map(GeneratorOrigin),\n            interval: IsolatedRootInterval {')
join='crates/hypersolve/src/selected_polynomial_field/join.rs'
replace(join,'use std::collections::HashMap;','use std::collections::{HashMap, HashSet};')
replace(join,'    fn native_and_path(&self) -> (&RecursiveQuadraticField, Vec<Self>) {','''    fn generator_origin(&self) -> Option<&Self> {
        match self.0.as_ref() {
            FieldData::Extension { origin: Some(origin), .. } => Some(&origin.0),
            _ => None,
        }
    }

    /// A source and target can name the same transported generator through
    /// different joins. Follow only retained, validated construction links;
    /// absence of a link says nothing about equality of their scalar values.
    fn corresponding_generator(
        &self,
        source: &Self,
    ) -> ArithmeticResult<Option<SelectedPolynomialValue>> {
        // The owned fields keep every keyed node alive for this call. Pointer
        // equality identifies a named proof node, never an unproved equality.
        let mut sources = HashSet::new();
        let mut original = Some(source);
        while let Some(field) = original {
            sources.insert(Arc::as_ptr(&field.0) as usize);
            original = field.generator_origin();
        }
        let mut target = self;
        while let FieldData::Extension { parent, .. } = target.0.as_ref() {
            let mut original = Some(target);
            while let Some(field) = original {
                if sources.contains(&(Arc::as_ptr(&field.0) as usize)) {
                    return Ok(Some(self.lift(&target.generator()?)?));
                }
                original = field.generator_origin();
            }
            target = parent;
        }
        Ok(None)
    }

    fn native_and_path(&self) -> (&RecursiveQuadraticField, Vec<Self>) {''')
replace(join,'''        let FieldData::Extension {
            defining, interval, ..
        } = source.0.as_ref()''','''        if let Some(image) = self.field.corresponding_generator(&source)? {
            self.generators.push(GeneratorEmbedding { source, image });
            return Ok(());
        }
        let FieldData::Extension {
            defining, interval, ..
        } = source.0.as_ref()''')
replace(join,'''        let field = self.field.select_strict(
            coefficients,
            interval.lower.clone(),
            interval.upper.clone(),
            policy,
        )?;''','''        let field = self.field.select_strict_with_origin(
            coefficients,
            interval.lower.clone(),
            interval.upper.clone(),
            Some(source.clone()),
            policy,
        )?;''')
definition='crates/hypersolve/src/selected_polynomial_field/definition.rs'
replace(definition,'    NativeValue {\n        field: usize,','''    /// Replays a common-field construction, including its original selected
    /// generator correspondences. Both references name earlier field records.
    /// This is an operation recipe, not a trusted equality assertion.
    JoinedField {
        first: usize,
        second: usize,
    },
    NativeValue {
        field: usize,''')
encode='crates/hypersolve/src/selected_polynomial_field/definition/encode.rs'
replace(encode,'''                FieldData::Extension {
                    parent, defining, ..
                } => std::iter::once(Self::Field(parent.clone()))''','''                FieldData::Extension {
                    parent, origin: Some(origin), ..
                } => vec![Self::Field(parent.clone()), Self::Field(origin.0.clone())],
                FieldData::Extension {
                    parent, defining, ..
                } => std::iter::once(Self::Field(parent.clone()))''')
replace(encode,'''                FieldData::Extension {
                    parent,
                    defining,
                    interval,
                    ..
                } => Node::PolynomialField''','''                FieldData::Extension {
                    parent, origin: Some(origin), ..
                } => Node::JoinedField {
                    first: id(Self::Field(parent.clone())),
                    second: id(Self::Field(origin.0.clone())),
                },
                FieldData::Extension {
                    parent,
                    defining,
                    interval,
                    ..
                } => Node::PolynomialField''')
replay='crates/hypersolve/src/selected_polynomial_field/definition/replay.rs'
replace(replay,'''            Node::NativeValue {
                field,
                numerator,
                denominator,
            } => {''','''            Node::JoinedField { first, second } => {
                let first = self.field(*first)?;
                let second = self.field(*second)?;
                let joined = exact(first.joined_with(&second, policy)?)?;
                Admitted::Field(joined.field().clone())
            }
            Node::NativeValue {
                field,
                numerator,
                denominator,
            } => {''')
codec='crates/hypersolve/tests/support/selected_polynomial_replay.rs'
replace(codec,'''            Node::NativeValue {
                field,
                numerator,
                denominator,
            } => json!(["native-value", field, numerator, denominator]),''','''            Node::JoinedField { first, second } => json!(["join", first, second]),
            Node::NativeValue {
                field,
                numerator,
                denominator,
            } => json!(["native-value", field, numerator, denominator]),''')
replace(codec,'            "native-value" => Node::NativeValue {','''            "join" => Node::JoinedField {
                first: index(&v[1]),
                second: index(&v[2]),
            },
            "native-value" => Node::NativeValue {''')
changelog='crates/hypersolve/CHANGELOG.md'
replace(changelog,'## [0.4.0] - Unreleased\n','''## [0.4.0] - Unreleased

- Selected-field joins retain validated source-generator correspondences.
  Reusing either original operand or a corresponding generator from another
  join preserves its existing authority instead of adjoining a duplicate root.
  Definition graphs retain the join recipe and re-establish these relations
  through strict source and selection replay.
''')
replace(changelog,'### Breaking\n','''### Breaking

- `SelectedPolynomialDefinitionNode` gains `JoinedField`; exhaustive matches
  and graph format owners must handle the new operation record. Existing
  records retain their meanings. Joined fields intentionally export their
  construction dependencies instead of an unrelated polynomial selection.
''')
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=w,check=True)
p=c/'selected-join-correspondence-contract.json';s=json.loads(p.read_text());s.update(status='Fresh owner baseline reproduces original second-operand depth growth with both existing controls passing. Initial retained-origin and strict JoinedField replay implementation applied; validation pending.',fresh_baseline=json.loads((c/'selected-join-correspondence-baseline2/complete.json').read_text()),epoch=time.time());p.write_text(json.dumps(s,indent=2)+'\n');print('Initial retained-origin and replay implementation applied.')
