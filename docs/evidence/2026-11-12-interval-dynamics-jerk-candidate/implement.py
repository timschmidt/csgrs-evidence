from pathlib import Path
import re
root=Path('/mnt/development/csgrs')
dyn=root/'crates/hyperdynamics/src'; routing=root/'crates/hyperpath/src/routing'
old=(routing/'jerk_schedule.rs').read_text(); feed=(routing/'feed.rs').read_text()
reference=routing/'jerk_migration'; reference.mkdir(exist_ok=True)
(reference/'legacy.rs').write_text(old.replace('use crate::routing::feed::require_', 'use super::legacy_guards::require_'))
start=feed.index('pub(crate) fn require_nonnegative_feed('); end=feed.index('fn require_positive_corner_radius(',start)
guards=feed[start:end]
(reference/'legacy_guards.rs').write_text('use hyperlimit::{PredicatePolicy, Sign, classify_real_sign};\nuse hyperreal::Real;\nuse super::RouteCertificationError;\n\n'+guards)
new=old.replace('use super::RouteCertificationError;\nuse super::feed::FeedPathElement;\nuse crate::routing::feed::element_length;\n','use crate::{DynamicsError, MetricSpan};\n').replace('use crate::routing::feed::require_', 'use crate::guards::require_').replace('RouteCertificationError','DynamicsError').replace('&FeedPathElement','&S').replace('&[FeedPathElement]','&[S]').replace('element_length(element, policy)', 'element.exact_length(policy)')
names=['plan_monotonic_jerk_transition','certify_jerk_ramp_feed_schedule','certify_multi_phase_jerk_ramp_feed_schedule']
for name in names: new=new.replace(f'pub fn {name}(',f'pub fn {name}<S: MetricSpan>(')
(dyn/'jerk_schedule.rs').write_text(new)
types=re.findall(r'pub struct (\w+)',old)
wrapper='//! Compatibility entry points for exact jerk scheduling.\nuse super::{RouteCertificationError, feed::FeedPathElement};\nuse hyperlimit::PredicatePolicy;\nuse hyperreal::Real;\npub use hyperdynamics::{'+', '.join(types)+'};\n\n'
for name in names:
    pos=old.index('pub fn '+name+'('); stop=old.index(' {',pos); signature=old[pos:stop]
    args=re.findall(r'^    (\w+):',signature,re.M)
    wrapper+=f'/// Compatibility wrapper for [`hyperdynamics::{name}`].\n#[deprecated(since = "0.3.0", note = "use hyperdynamics::{name}")]\n'+signature+' {\n    hyperdynamics::'+name+'('+', '.join(args)+').map_err(Into::into)\n}\n\n'
(routing/'jerk_schedule.rs').write_text(wrapper)
(dyn/'metric.rs').write_text('''//! Exact metric input independent of a geometry carrier.
use crate::DynamicsError;
use hyperlimit::PredicatePolicy;
use hyperreal::Real;

/// Structural dynamics specialization supplied by the metric owner.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum SpanDynamicsClass {
    /// The span has constant tangent with respect to path distance.
    Affine,
    /// No constant-tangent specialization is asserted.
    General,
}

/// A retained source capable of supplying its exact path length.
///
/// Implementors must preserve the source's defining geometry and provenance.
/// The returned length must be exact, stable across calls, and refer to the same
/// retained span as its dynamics class. An unavailable exact length is an error;
/// sampling or fitting is not an implementation of this contract. This protocol
/// supplies metric data, not a certificate of the source geometry's validity.
/// Consumers request lengths lazily and may query a source again during replay.
pub trait MetricSpan {
    /// Obtain the retained source length under the caller's predicate policy.
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError>;
    /// Identify a structural specialization; this does not certify axis limits.
    fn dynamics_class(&self) -> SpanDynamicsClass;
}
''')
# Preserve the original error vocabulary and exact round-trip conversions.
routing_file=root/'crates/hyperpath/src/routing.rs'; route=routing_file.read_text()
enum=re.search(r'pub enum RouteCertificationError \{.*?\n\}',route,re.S).group()
variants=re.findall(r'    /// (.*?)\n    (\w+),',enum)
lib=(dyn/'lib.rs').read_text(); begin=lib.index('/// A rejected'); lib=lib[:begin]
lib=lib.replace('General path scheduling and validated ODE\n//! integration are not yet extracted here.','Constant-jerk replay consumes exact metric spans. Lookahead and validated\n//! ODE integration are not yet extracted here.')
lib+='mod guards;\nmod jerk_schedule;\nmod metric;\npub use guards::{check_nonnegative_feed, check_positive_feed, check_positive_acceleration, check_positive_jerk};\npub use jerk_schedule::*;\npub use metric::{MetricSpan, SpanDynamicsClass};\n\n'
lib+='/// A rejected or undecided exact dynamics construction.\n///\n/// These distinctions preserve legacy route failures. They do not imply a new\n/// cumulative work, memory, or cancellation contract.\n#[derive(Clone, Copy, Debug, Eq, PartialEq)]\n'+enum.replace('RouteCertificationError','DynamicsError')+'\n\n'
lib+='impl core::fmt::Display for DynamicsError {\n    fn fmt(&self, f: &mut core::fmt::Formatter<\'_>) -> core::fmt::Result {\n        match self {\n'
for doc,name in variants: lib+=f'            Self::{name} => f.write_str("{doc.rstrip(".")}"),\n'
lib+='        }\n    }\n}\n\nimpl core::error::Error for DynamicsError {}\n'
(dyn/'lib.rs').write_text(lib)
adapter='//! Geometry-owned metric input and lossless legacy error conversion.\nuse super::{RouteCertificationError, feed::{FeedPathElement, element_length}};\nuse hyperdynamics::{DynamicsError, MetricSpan, SpanDynamicsClass};\nuse hyperlimit::PredicatePolicy;\nuse hyperreal::Real;\n\n'
for a,b in [('DynamicsError','RouteCertificationError'),('RouteCertificationError','DynamicsError')]:
    adapter+=f'impl From<{a}> for {b} {{\n    fn from(error: {a}) -> Self {{\n        match error {{\n'
    for _,name in variants: adapter+=f'            {a}::{name} => Self::{name},\n'
    adapter+='        }\n    }\n}\n\n'
adapter+='''impl MetricSpan for FeedPathElement {
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        element_length(self, policy).map_err(Into::into)
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        match self {
            Self::Line(_) => SpanDynamicsClass::Affine,
            Self::ExplicitArc(_) | Self::CubicPh(_) | Self::QuinticPh(_) => SpanDynamicsClass::General,
        }
    }
}
'''
(routing/'dynamics.rs').write_text(adapter)
axis=(routing/'axis_projection.rs').read_text(); i=axis.index('impl From<'); j=axis.index('/// Compatibility wrapper',i); (routing/'axis_projection.rs').write_text(axis[:i]+axis[j:])
route=route.replace('mod feed;','mod dynamics;\nmod feed;').replace('pub use jerk_schedule::{','#[allow(deprecated)] // One-release compatibility exports.\npub use jerk_schedule::{'); routing_file.write_text(route)
# One shared sign-classification envelope retains uncertainty and certainty metadata.
checks='''//! Shared dynamics input checks retaining predicate evidence.
use crate::DynamicsError;
use hyperlimit::{PredicateOutcome, PredicatePolicy, Sign, classify_real_sign};
use hyperreal::Real;

fn check_sign(value: &Real, policy: PredicatePolicy, negative: DynamicsError, zero: Result<(), DynamicsError>) -> PredicateOutcome<Result<(), DynamicsError>> {
    match classify_real_sign(value, policy) {
        PredicateOutcome::Decided { value, certainty, stage } => PredicateOutcome::Decided {
            value: match value { Sign::Negative => Err(negative), Sign::Zero => zero, Sign::Positive => Ok(()) }, certainty, stage,
        },
        PredicateOutcome::Unknown { needed, stage } => PredicateOutcome::Unknown { needed, stage },
    }
}

'''
replacements=''
for name,neg,zero,description in [
 ('nonnegative_feed','NegativeFeedRate','Ok(())','nonnegative feed rate'),
 ('positive_feed','NegativeFeedRate','Err(DynamicsError::ZeroFeedRate)','positive feed rate'),
 ('positive_acceleration','NegativeAcceleration','Err(DynamicsError::ZeroAcceleration)','positive acceleration limit'),
 ('positive_jerk','NegativeJerk','Err(DynamicsError::ZeroJerk)','positive jerk limit')]:
    checks+=f'''/// Check a {description}, retaining certainty and decision stage.
///
/// A decided invalid sign retains its predicate evidence too. Unknown signs
/// retain their original refinement requirement; no false validity is inferred.
pub fn check_{name}(value: &Real, policy: PredicatePolicy) -> PredicateOutcome<Result<(), DynamicsError>> {{
    check_sign(value, policy, DynamicsError::{neg}, {zero})
}}

// Legacy scheduler contract: unresolved signs remain a typed domain failure.
pub(crate) fn require_{name}(value: &Real, policy: PredicatePolicy) -> Result<(), DynamicsError> {{
    check_{name}(value, policy).value().unwrap_or(Err(DynamicsError::PredicateUnresolved))
}}

'''
    replacements+=f'''// Preserve the legacy flattened error contract; the shared check retains evidence.
pub(crate) fn require_{name}(value: &Real, policy: PredicatePolicy) -> Result<(), RouteCertificationError> {{
    hyperdynamics::check_{name}(value, policy).value().unwrap_or(Err(hyperdynamics::DynamicsError::PredicateUnresolved)).map_err(Into::into)
}}

'''
(dyn/'guards.rs').write_text(checks); (routing/'feed.rs').write_text(feed[:start]+replacements+feed[end:])
look=(routing/'lookahead.rs').read_text().replace('use super::jerk_schedule::{','use hyperdynamics::{').replace('    .map(Some)\n}', '    .map(Some)\n    .map_err(Into::into)\n}'); (routing/'lookahead.rs').write_text(look)
# Direct downstream imports retain the original application error path.
base=Path('/mnt/development/alumina-interface/crates/alumina-interface-core/src')
for filename in ['motion_schedule.rs','direct_motion.rs']:
    p=base/filename; s=p.read_text()
    s=s.replace('certify_multi_phase_jerk_ramp_feed_schedule,','')
    s=s.replace('use hyperlimit::', 'use hyperdynamics::certify_multi_phase_jerk_ramp_feed_schedule;\nuse hyperlimit::',1)
    call=s.index('    let '+('jerk_report' if filename=='motion_schedule.rs' else 'grid_jerk_report')+' = certify_multi_phase_jerk_ramp_feed_schedule(')
    end=s.index('    )?;',call); s=s[:end]+s[end:].replace('    )?;', '    ).map_err(RouteCertificationError::from)?;',1)
    p.write_text(s)
