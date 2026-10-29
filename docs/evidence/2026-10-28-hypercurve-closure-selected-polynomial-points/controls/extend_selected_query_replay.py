from pathlib import Path
w=Path('/home/tim/Documents/GitHub/workspace/csgrs-closure-work/selected-polynomial-points')
def edit(file,old,new):
 p=w/file;s=p.read_text();assert old in s,file;p.write_text(s.replace(old,new,1))
edit('crates/hypercurve/src/selected_query_scalar.rs','''    pub(crate) fn value(&self) -> field::Result<Value> {''','''    #[cfg(feature = "svg")]
    pub(crate) fn replay_storage_key(&self) -> (bool, *const ()) {
        (self.complement, Arc::as_ptr(&self.source).cast())
    }

    pub(crate) fn value(&self) -> field::Result<Value> {''')
edit('crates/hypercurve/src/svg/exact/graph.rs','''    max_point_depth: usize,
    circles:''','''    max_point_depth: usize,
    query_parameters: HashMap<(bool, *const ()), (crate::selected_query_scalar::SelectedQueryScalar2, u32)>,
    circles:''')
edit('crates/hypercurve/src/svg/exact/graph.rs','''            max_point_depth,
            circles:''','''            max_point_depth,
            query_parameters: HashMap::new(),
            circles:''')
old='''            let Some((start, end)) = range.as_bezier_parameters() else {
                return Err(SvgError::Unsupported(
                    "exact SVG source restrictions require a retained Bezier parameter definition"
                        .into(),
                ));
            };
            let source = self.curve(source)?;
            let start = self.parameter(start)?;
            let end = self.parameter(end)?;'''
new='''            let source = self.curve(source)?;
            let start = self.scalar_parameter(range.start())?;
            let end = self.scalar_parameter(range.end())?;'''
edit('crates/hypercurve/src/svg/exact/graph.rs',old,new)
edit('crates/hypercurve/src/svg/exact/graph.rs','''            let index = self.begin(SOURCE_RESTRICTION)?;
            self.writer.write_u32(source)?;''','''            let index = self.begin(SOURCE_RESTRICTION)?;
            self.point_depths[index as usize] = self.point_depths[start as usize].max(self.point_depths[end as usize]);
            self.writer.write_u32(source)?;''')
edit('crates/hypercurve/src/svg/exact/graph.rs','''    Parameter(BezierParameter2),''','''    Parameter(BezierParameter2),
    QueryParameter(crate::CurveParameter2),''')
edit('crates/hypercurve/src/svg/exact/graph.rs','''fn certified<T>(value:''','''fn scalar_parameter_reference(definitions: &[Definition], index: usize) -> SvgResult<crate::CurveParameter2> {
    match definitions.get(index) {
        Some(Definition::Parameter(parameter)) => Ok(parameter.clone().into()),
        Some(Definition::QueryParameter(parameter)) => Ok(parameter.clone()),
        _ => Err(malformed("exact path extension has an invalid scalar parameter reference")),
    }
}

fn certified<T>(value:''')
old='''                let start = parameter_reference(&definitions, reader.read_len()?)?.clone();
                let end = parameter_reference(&definitions, reader.read_len()?)?.clone();
                let reversed = reader.read_bool()?;
                let range = certified(CurveParameterRange2::try_new_with_policy(
                    start.into(),
                    end.into(),'''
new='''                let start_index = reader.read_len()?;
                let end_index = reader.read_len()?;
                let start = scalar_parameter_reference(&definitions, start_index)?;
                let end = scalar_parameter_reference(&definitions, end_index)?;
                point_depth = point_depths[start_index].max(point_depths[end_index]);
                let reversed = reader.read_bool()?;
                let range = certified(CurveParameterRange2::try_new_with_policy(
                    start,
                    end,'''
edit('crates/hypercurve/src/svg/exact/graph.rs',old,new)
edit('crates/hypercurve/src/svg/exact/graph.rs','''            | points::RATIONAL_QUERY_PAIR) => {''','''            | points::RATIONAL_QUERY_PAIR
            | points::QUERY_PARAMETER) => {''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs','''pub(super) const RATIONAL_QUERY_PAIR: u8 = 26;''','''pub(super) const RATIONAL_QUERY_PAIR: u8 = 26;
pub(super) const QUERY_PARAMETER: u8 = 27;''')
old='''    fn point_parameter(&mut self, parameter: &crate::CurveParameter2) -> SvgResult<u32> {
        let parameter = parameter.as_bezier_parameter().ok_or_else(|| {
            SvgError::Unsupported("exact point replay requires a retained Bezier parameter".into())
        })?;
        self.parameter(parameter)
    }'''
new='''    pub(super) fn scalar_parameter(&mut self, parameter: &crate::CurveParameter2) -> SvgResult<u32> {
        if let Some(parameter) = parameter.as_bezier_parameter() {
            return self.parameter(parameter);
        }
        let query = parameter.as_polynomial_query().ok_or_else(|| {
            SvgError::Unsupported("exact parameter replay requires a retained source definition".into())
        })?;
        let key = query.replay_storage_key();
        if let Some((_, index)) = self.query_parameters.get(&key) {
            return Ok(*index);
        }
        let form = query.query();
        let source = self.point(&form.source)?;
        let depth = next_depth(self.point_depths[source as usize], self.max_point_depth)?;
        let index = self.begin(QUERY_PARAMETER)?;
        self.writer.write_u32(source)?;
        self.polynomial(&form.numerator)?;
        self.polynomial(&form.denominator)?;
        self.point_depths[index as usize] = depth;
        self.query_parameters.insert(key, (query.clone(), index));
        Ok(index)
    }'''
edit('crates/hypercurve/src/svg/exact/graph/points.rs',old,new)
p=w/'crates/hypercurve/src/svg/exact/graph/points.rs';s=p.read_text().replace('self.point_parameter(&parameter)?','self.scalar_parameter(&parameter)?');p.write_text(s)
edit('crates/hypercurve/src/svg/exact/graph/points.rs','''                            CurvePointDefinition2::RationalQueryPair { sources, .. } => {''','''                            CurvePointDefinition2::Rational { parameter, .. }
                            | CurvePointDefinition2::Parallel { parameter, .. } => parameter.as_polynomial_query().map(|query| vec![query.query().source]).unwrap_or_default(),
                            CurvePointDefinition2::RationalQueryPair { sources, .. } => {''')
# A parameter can itself depend on retained points; propagate their depth.
for tag in ['RATIONAL_POINT','PARALLEL_POINT']:
 edit('crates/hypercurve/src/svg/exact/graph/points.rs',f'''                    let index = self.begin({tag})?;''',f'''                    depth = self.point_depths[parameter as usize];
                    let index = self.begin({tag})?;''')
# Source-bound parameter nodes are checked before any consuming curve is exposed.
edit('crates/hypercurve/src/svg/exact/graph/points.rs','''    let mut depth = 0;
    let point = match tag {''','''    let mut depth = 0;
    if tag == QUERY_PARAMETER {
        let index = reader.read_len()?;
        let source = point_reference(definitions, index)?;
        let numerator = read_polynomial(reader)?;
        let denominator = read_polynomial(reader)?;
        let depth = next_depth(point_depths[index], max_point_depth)?;
        let parameter = certified(crate::bezier_offset::point_rational_form_parameter(source, &numerator, &denominator, &CurveContext::STRICT))?;
        return Ok((Definition::QueryParameter(parameter), depth));
    }
    let point = match tag {''')
# Rational and parallel point constructions accept the same parameter envelope.
p=w/'crates/hypercurve/src/svg/exact/graph/points.rs';s=p.read_text()
old='''                parameter: parameter_reference(definitions, reader.read_len()?)?
                    .clone()
                    .into(),'''
new='''                parameter: {
                    let index = reader.read_len()?;
                    let parameter = scalar_parameter_reference(definitions, index)?;
                    depth = point_depths[index];
                    parameter
                },'''
assert s.count(old)==2;s=s.replace(old,new);p.write_text(s)
# Correct the new valid wire control: one HCP4 path cannot be empty.
p=w/'crates/hypercurve/tests/svg_point_replay.rs';s=p.read_text();a=s.index('    // Valid unused records are admitted fully before an empty path set is published.');s=s[:a]+'''    // A valid unused record is still admitted before the nonempty path.
    let text = wire(vec![wire_point(0, 2), pair([0, 0], polynomial(&[&[1]])), wire_point(3, 2), wire_support(0, 2), wire_range(3, 0, 2)], &[4]);
    assert_eq!(import_svg_document(&text).unwrap().paths().len(), 1);
}
''';p.write_text(s)
# Keep the original restriction chain intact in the maintained corpus.
c=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-closure-work/controls')
p=w/'crates/hypercurve/tests/selected_polynomial_points.rs';s=p.read_text();s+='\n#[cfg(feature = "svg")]\n'+(c/'selected-query-restriction-test.rs').read_text();p.write_text(s)
