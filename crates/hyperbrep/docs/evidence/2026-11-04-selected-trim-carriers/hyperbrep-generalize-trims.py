from pathlib import Path
import shutil,re
files=['src/geometry.rs','src/boolean_kernel.rs','src/topology/mod.rs','src/topology/edit/face.rs','src/topology/edit/attachment.rs','src/topology/edit/edge.rs']
root=Path('crates/hyperbrep');backup=Path('/tmp/hyperbrep-selected-trim-baseline')
for name in files:
    p=backup/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy(root/name,p)
p=root/'src/geometry.rs';s=p.read_text()
start=s.index('pub(crate) struct SurfaceIntersectionBoundaryContact {');end=s.index('#[derive(Clone, Debug, Default)]',start)
part=s[start:end].replace('parameter: Real','parameter: Parameter').replace('Option<Real>','Option<Parameter>').replace('pcurve_point: CurvePoint2','pcurve_point: hypercurve::CurvePoint2').replace('spatial_point: Point3','spatial_point: GeometricPoint3').replace('-> &Real','-> &Parameter').replace('Option<&Real>','Option<&Parameter>').replace('-> &CurvePoint2','-> &hypercurve::CurvePoint2').replace('-> &Point3','-> &GeometricPoint3')
s=s[:start]+part+s[end:]
# The scalar inverse remains the cheap path; the dynamic inverse reuses Hypercurve.
a=s.index('    pub(crate) fn parameters_at_point(&self, point: &Point2)');b=s.index('    pub(crate) fn reflected_and_reversed_x(',a)
part=s[a:b]
part=part.replace('''        crate::context::strict(|| {
            let point = CurvePoint2::new(point.x.clone(), point.y.clone());
            if let Some(line) = self.line_segment() {''','''        self.parameters_at_selected_point(&CurvePoint2::new(point.x.clone(), point.y.clone()).into())
    }

    pub(crate) fn parameters_at_selected_point(
        &self,
        point: &hypercurve::CurvePoint2,
    ) -> GeometryResult<Vec<Parameter>> {
        crate::context::strict(|| {
            if let Some(line) = self.line_segment()
                && let Some(point) = point.coordinates()
            {''')
part=part.replace('line.classify_point(&point)','line.classify_point(point)').replace('self.curve.point_locations(&point.into())?','self.curve.point_locations(point)?')
s=s[:a]+part+s[b:]
# Prefer native rebasing when available, retain the chart for selected ends.
needle='''    /// Restricts the spatial curve and both exact pcurve mappings to one
    /// increasing represented parameter interval.'''
insert='''    pub(crate) fn trimmed_interval(&self, start: &Parameter, end: &Parameter) -> GeometryResult<Self> {
        if let (Some(start), Some(end)) = (start.try_real(), end.try_real()) {
            return self.subcurve(start, end);
        }
        self.restrict_source(ParameterRange::new(start.clone(), end.clone())?)
    }

'''
assert needle in s;s=s.replace(needle,insert+needle);p.write_text(s)
p=root/'src/boolean_kernel.rs';s=p.read_text()
# Use retained parameters in all interval assembly and coalescing.
a=s.index('struct FaceRetainedParameterInterval {');b=s.index('type ExactParameterIntervals',a)
s=s[:a]+s[a:b].replace('start: Real','start: crate::Parameter').replace('end: Real','end: crate::Parameter')+s[b:]
s=s.replace('.subcurve(&interval.start, &interval.end)?','.trimmed_interval(&interval.start, &interval.end)?')
s=s.replace('let start = exact_max(&first_interval.start, &second_interval.start)?;','let start = if first_interval.start.compare(&second_interval.start)? == Ordering::Less { second_interval.start.clone() } else { first_interval.start.clone() };')
s=s.replace('let end = exact_min(&first_interval.end, &second_interval.end)?;','let end = if first_interval.end.compare(&second_interval.end)? == Ordering::Greater { second_interval.end.clone() } else { first_interval.end.clone() };')
s=s.replace('start: spatial_domain.represented_start()?.clone(),','start: spatial_domain.start().clone(),').replace('end: spatial_domain.represented_end()?.clone(),','end: spatial_domain.end().clone(),')
# Preserve useful prior represented views, but do not require one.
a=s.index('            let Some((pcurve_start, pcurve_end)) = (match fragment.represented_parameter_range()');b=s.index('            // Hypercurve\'s closed-set trim',a)
part=s[a:b]
part=part.replace('            let Some((pcurve_start, pcurve_end)) = (match','            let represented = match')
old='''            }) else {
                return Ok(Classification::Uncertain(UncertaintyReason::Unsupported));
            };
'''
assert part.endswith(old)
part=part[:-len(old)]+'''            };
            let (pcurve_start, pcurve_end) = if let Some((start, end)) = represented {
                (crate::Parameter::from_real(start), crate::Parameter::from_real(end))
            } else {
                let range = fragment.parameter_range()?;
                (crate::Parameter::from_curve(range.start())?, crate::Parameter::from_curve(range.end())?)
            };
'''
s=s[:a]+part+s[b:]
# The angular-only native seam path remains explicit; affine transport retains roots.
a=s.index('fn retained_spatial_parameter(');b=s.index('\nfn model_boundary_contacts(',a)
part=s[a:b].replace('parameter: &Real','parameter: &crate::Parameter').replace(') -> Result<Real, GeometryError>',') -> Result<crate::Parameter, GeometryError>')
part=part.replace('exact_order(parameter, start)?','parameter.compare(&start.clone().into())?').replace('exact_order(parameter, end)?','parameter.compare(&end.clone().into())?')
part=part.replace('contact.parameter(),','contact.parameter().try_real().ok_or(GeometryError::UnrepresentableParameter)?,').replace('return Ok(lift.clone());','return Ok(lift.clone().into());')
part=part.replace('''    carrier
        .spatial_parameter_at(&parameter.clone().into())?
        .try_real()
        .cloned()
        .ok_or(GeometryError::UnrepresentableParameter)''','''    carrier.spatial_parameter_at(parameter)''')
s=s[:a]+part+s[b:]
for name in ['contacts_at_interval_start','contacts_at_interval_end']:
    a=s.index('fn '+name+'(');b=s.index('\n}\n',a)+3
    part=s[a:b].replace('parameter: &Real','parameter: &crate::Parameter')
    part=re.sub(r'exact_order\(parameter, (&interval\.(?:start|end))\)\?',r'parameter.compare(\1)?',part)
    s=s[:a]+part+s[b:]
# Only retained interval comparisons change; native scalar line intervals stay native.
a=s.index('fn coalesce_face_parameter_intervals(');b=s.index('fn push_unique_line_interval(',a)
part=s[a:b]
part=re.sub(r'exact_order\((&interval\.(?:start|end)), (&(?:ordered\[insertion - 1\]|previous)\.(?:start|end))\)\?',r'\1.compare(\2)?',part)
# Remove the borrow on the receiver inserted above.
part=part.replace('&interval.start.compare','interval.start.compare').replace('&interval.end.compare','interval.end.compare')
s=s[:a]+part+s[b:]
# These comparisons are confined to interval start/end locals, which are now parameters.
a=s.index('fn trim_surface_curve_in_authored_charts(');b=s.index('fn model_boundary_contacts(',a)
part=s[a:b].replace('exact_order(&start, &end)?','start.compare(&end)?')
s=s[:a]+part+s[b:]
p.write_text(s)
p=root/'src/topology/mod.rs';s=p.read_text();a=s.index('enum FaceSplitEndpointLocation');b=s.index('\nstruct OrderedFaceSplitTrace',a)
s=s[:a]+s[a:b].replace('parameter: Real','parameter: Parameter')+s[b:];p.write_text(s)
p=root/'src/topology/edit/attachment.rs';s=p.read_text()
s=s.replace('''                    decided_model_order(compare_reals(
                        &start_parameter,
                        &end_parameter,
                        crate::STRICT_PREDICATES,
                    ))? == std::cmp::Ordering::Equal''','''                    start_parameter.compare(&end_parameter)? == std::cmp::Ordering::Equal''')
for end in ['start','end']:
    old=f'''decided_model_order(compare_reals(
                    contact.parameter(),
                    (edge.domain.{end}())
                        .try_real()
                        .ok_or(crate::GeometryError::UnrepresentableParameter)?,
                    crate::STRICT_PREDICATES,
                ))?'''
    assert old in s;s=s.replace(old,f'contact.parameter().compare(edge.domain.{end}())?')
s=s.replace('(parameter).into(),','parameter,');p.write_text(s)
p=root/'src/topology/edit/face.rs';s=p.read_text().replace('self.split_edge(edge, (parameter).into())?','self.split_edge(edge, parameter)?')
# Keep existing scalar location behavior for now, converting at the shared carrier.
s=s.replace('''                            parameter,
                            pcurve_split: None,''','''                            parameter: parameter.into(),
                            pcurve_split: None,''').replace('''                    parameter,
                    pcurve_split: None,''','''                    parameter: parameter.into(),
                    pcurve_split: None,''')
p.write_text(s)
p=root/'src/topology/edit/edge.rs';s=p.read_text().replace('contact.spatial_point().clone().into()','contact.spatial_point().clone()').replace('.map(|value| Parameter::from_real(value.clone()))','.cloned()')
s=s.replace('contact.pcurve_point().clone(),','contact.pcurve_point().coordinates().cloned().ok_or(GeometryError::UnsupportedPcurveContour)?,')
p.write_text(s)
