from pathlib import Path
import re,subprocess
root=Path('/mnt/development/csgrs');d=root/'crates/hyperdynamics/src';p=root/'crates/hyperpath/src';r=p/'routing'
feed=(r/'feed.rs').read_text();look=(r/'lookahead.rs').read_text();routing=(p/'routing.rs').read_text();solve=(p/'solve.rs').read_text()
def block(s, marker, docs=False):
 start=s.index(marker);a=s.index('{',start);depth=1;i=a+1
 while depth:
  depth+=(s[i]=='{')-(s[i]=='}');i+=1
 if docs:start=s.rfind('\n\n',0,start)+2
 return s[start:i]
def replace_block(s,marker,new):return s.replace(block(s,marker,True),new,1)
def wrapper(s,name,target=None,source=None):
 old=block(s,'pub fn '+name+'(',True);sig=old[old.index('pub fn '):old.index(' {',old.index('pub fn '))];args=re.findall(r'^    (\w+):',sig,re.M)
 if source:args[0]=source
 target=target or name
 docs=old[:old.index('pub fn ')];return docs+f'#[deprecated(since = "0.3.0", note = "use hyperdynamics::{target}")]\n'+sig+' {\n    hyperdynamics::'+target+'('+', '.join(args)+').map_err(Into::into)\n}'
# Frozen original modules, independent of the extracted implementation.
base='0d17fe178839b002b95173adf1f05137291639f3'
def original(path):return subprocess.check_output(['git','show',base+':crates/hyperpath/src/'+path],cwd=root,text=True)
ref=r/'feed_join_migration';ref.mkdir(exist_ok=True)
oldfeed=original('routing/feed.rs');oldlook=original('routing/lookahead.rs');oldroute=original('routing.rs');oldsolve=original('solve.rs');oldjerk=original('routing/jerk_schedule.rs')
legacy_common='use super::RouteCertificationError;\nuse std::cmp::Ordering;\nuse hyperlimit::{PredicatePolicy,Sign,classify_real_sign,compare_reals};\nuse hyperreal::Real;\nuse hypersolve::{CandidateCertificationReport,Constraint,Expr,Problem,VariableId,certify_candidate,context_from_problem};\nuse crate::segment::LinePathSegment;\n\n'
for name in ['ConstantFeedTimeReport','AccelerationLimitedFeedProfileClass','AccelerationLimitedFeedTimeReport']:
 kind='enum' if 'ProfileClass' in name else 'struct';legacy_common+=block(oldroute,'pub '+kind+' '+name,True)+'\n\n'
for name in ['route_axis_length','classify_acceleration_limited_profile','acceleration_limited_feed_time_equation']:
 legacy_common+=block(oldroute,'fn '+name+'(',True).replace('fn '+name,'pub(super) fn '+name,1)+'\n\n'
for name in ['certify_constant_feed_time','certify_acceleration_limited_feed_time']:legacy_common+=block(oldroute,'pub fn '+name+'(',True)+'\n\n'
for name in ['constant_feed_time_equation','symmetric_jerk_limited_feed_time_equation']:legacy_common+=block(oldsolve,'pub fn '+name+'(',True)+'\n\n'
(ref/'common.rs').write_text(legacy_common)
(ref/'feed.rs').write_text(oldfeed.replace('crate::solve::','super::common::'))
(ref/'lookahead.rs').write_text(oldlook.replace('crate::routing::feed::','super::feed::'))
(ref/'jerk_schedule.rs').write_text(oldjerk.replace('crate::routing::feed::','super::feed::'))
# Whole-path metric protocol: preserves aggregate lazy lengths and old axis views.
metric=(d/'metric.rs').read_text()+'''
/// A retained whole path with a stable empty/nonempty shape and exact length.
///
/// Geometry owners may provide borrowed views with stricter admitted domains.
/// Length acquisition is lazy and must retain the original source, traversal,
/// failure distinctions and exact scalar meaning. This contract does not verify
/// arbitrary provider code or establish geometry validity. Empty native slices
/// have zero length, while scheduling operations reject empty input first.
pub trait MetricPath {
    /// Whether this retained path contains no spans, without evaluating lengths.
    fn is_empty(&self) -> bool;
    /// Obtain the exact aggregate length under the caller's policy.
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError>;
}

impl<S: MetricSpan> MetricPath for [S] {
    fn is_empty(&self) -> bool { <[S]>::is_empty(self) }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        self.iter().try_fold(Real::zero(), |sum, span| {
            span.exact_length(policy).map(|length| sum + length)
        })
    }
}
impl<S: MetricSpan, const N: usize> MetricPath for [S; N] {
    fn is_empty(&self) -> bool { N == 0 }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        MetricPath::exact_length(self.as_slice(), policy)
    }
}
impl<S: MetricSpan> MetricPath for Vec<S> {
    fn is_empty(&self) -> bool { Vec::is_empty(self) }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        MetricPath::exact_length(self.as_slice(), policy)
    }
}
''';(d/'metric.rs').write_text(metric)
(d/'join.rs').write_text('''//! Lazy source-owned join decisions with their complete retained evidence.
use crate::{CornerLookaheadJoinClass, DynamicsError};
use hyperlimit::PredicatePolicy;

/// A source-owned join decision and its original evidence.
///
/// The receipt must retain the endpoint/tangent relations, certainty and source
/// identity on which classification relies. A successful class asserts the
/// exact corresponding relation; invalid or undecided geometry remains a typed
/// error. This container is not itself a validator of arbitrary user providers.
#[derive(Clone, Debug)]
pub struct ClassifiedJoin<E> {
    /// Dynamics class or explicit failure from the geometry owner.
    pub classification: Result<CornerLookaheadJoinClass, DynamicsError>,
    /// Complete source-owned predicate receipt, including failure evidence.
    pub receipt: E,
}

/// Retained span data whose geometry owner can classify an adjacent join.
///
/// Classification is requested lazily under the supplied policy. Implementors
/// must preserve source identities and transport all consumed evidence in the
/// receipt. Repeated requests must remain valid for the same retained sources;
/// scheduling does not authorize precomputation, approximation or weaker proof.
pub trait JoinSpan {
    /// Geometry-owned receipt transported without replacing it by a class alone.
    type Receipt: Clone + core::fmt::Debug;
    /// Classify this span's end against the outgoing span's start.
    fn classify_join(&self, outgoing: &Self, policy: PredicatePolicy) -> ClassifiedJoin<Self::Receipt>;
}
''')
# Shared scalar-only feed reports, equations, profile selection, and replay.
new='//! Exact feed-profile and corner-speed replay over retained metric inputs.\nuse std::cmp::Ordering;\nuse hyperlimit::{PredicatePolicy,Sign,classify_real_sign,compare_reals};\nuse hyperreal::Real;\nuse hypersolve::{CandidateCertificationReport,Constraint,ConstraintKind,Expr,Problem,VariableId,certify_candidate,context_from_problem};\nuse crate::{DynamicsError,MetricPath,JoinSpan};\nuse crate::guards::{require_nonnegative_feed,require_positive_feed,require_positive_acceleration,require_positive_jerk};\n\n'
for name in ['ConstantFeedTimeReport','AccelerationLimitedFeedProfileClass','AccelerationLimitedFeedTimeReport']:
 kind='enum' if 'ProfileClass' in name else 'struct';item=block(routing,'pub '+kind+' '+name,True);new+=item+'\n\n';routing=routing.replace(item,'',1)
for marker in ['pub struct JerkLimitedFeedTimeReport','pub enum CornerLookaheadJoinClass','pub struct CornerLookaheadJoinReport','pub struct CornerLookaheadLimitReport','impl CornerLookaheadLimitReport']:
 item=block(feed,marker,True)
 if marker=='pub struct CornerLookaheadJoinReport':item=item.replace('CornerLookaheadJoinReport {','CornerLookaheadJoinReport<E> {').replace('pub tangent_join: TangentJoinReport','pub tangent_join: E')
 if marker=='pub struct CornerLookaheadLimitReport':item=item.replace('CornerLookaheadLimitReport {','CornerLookaheadLimitReport<E> {').replace('Vec<CornerLookaheadJoinReport>','Vec<CornerLookaheadJoinReport<E>>')
 if marker=='impl CornerLookaheadLimitReport':item=item.replace('impl CornerLookaheadLimitReport {','impl<E> CornerLookaheadLimitReport<E> {')
 new+=item+'\n\n'
for oldname in ['certify_constant_feed_time_for_path','certify_acceleration_limited_feed_time_for_path','certify_symmetric_jerk_limited_feed_time_for_path']:
 item=block(feed,'pub fn '+oldname+'(',True);name=oldname.removesuffix('_for_path');item=item.replace('pub fn '+oldname+'(','pub fn '+name+'<P: MetricPath + ?Sized>(').replace('route: &[FeedPathElement]','route: &P').replace('route_path_length(route, policy)','route.exact_length(policy)').replace('crate::solve::constant_feed_time_equation','constant_feed_time_equation').replace('RouteCertificationError','DynamicsError')
 # Links now refer to the new owner rather than the old routing module.
 item=item.replace('[`super::certify_constant_feed_time`]','[`certify_constant_feed_time`]')
 new+=item+'\n\n'
item=block(feed,'pub fn certify_corner_lookahead_limits(',True).replace('pub fn certify_corner_lookahead_limits(','pub fn certify_corner_lookahead_limits<J: JoinSpan>(').replace('spans: &[TangentSpan]','spans: &[J]').replace('Result<CornerLookaheadLimitReport,','Result<CornerLookaheadLimitReport<J::Receipt>,').replace('RouteCertificationError','DynamicsError')
a=item.index('        let tangent_join = classify_tangent_join(');b=item.index('        let certification =',a)
item=item[:a]+'''        let classified = pair[0].classify_join(&pair[1], policy);
        let class = classified.classification?;
        let tangent_join = classified.receipt;
'''+item[b:];new+=item+'\n\n'
for name in ['build_jerk_limited_report','certify_corner_lookahead_join_candidate','peak_feed_limit_constraint','peak_acceleration_limit_constraint','corner_feed_cap_constraint','corner_centripetal_limit_constraint','require_positive_corner_radius']:
 new+=block(feed,'fn '+name+'(',True).replace('RouteCertificationError','DynamicsError')+'\n\n'
for name in ['classify_acceleration_limited_profile','acceleration_limited_feed_time_equation']:
 item=block(routing,'fn '+name+'(',True);new+=item+'\n\n';routing=routing.replace(item,'',1)
for name in ['constant_feed_time_equation','symmetric_jerk_limited_feed_time_equation']:
 item=block(solve,'pub fn '+name+'(',True);new+=item+'\n\n'
 # Pure equation wrappers return constraints directly, with no fallible mapping.
 sig=item[item.index('pub fn '):item.index(' {',item.index('pub fn '))];args=re.findall(r'^    (\w+):',sig,re.M);docs=item[:item.index('pub fn ')]
 solve=solve.replace(item,docs+f'#[deprecated(since = "0.3.0", note = "use hyperdynamics::{name}")]\n'+sig+' {\n    hyperdynamics::'+name+'('+', '.join(args)+')\n}',1)
(d/'feed.rs').write_text(new)
# Hyperpath feed keeps native input and exact geometry authority only.
compat='//! Native feed metric inputs and one-release dynamics compatibility.\nuse super::{RouteCertificationError,ConstantFeedTimeReport,AccelerationLimitedFeedTimeReport};\nuse crate::arc::ExplicitCircularArc;\nuse crate::ph::{CubicPythagoreanHodograph,QuinticPythagoreanHodograph};\nuse crate::segment::LinePathSegment;\nuse crate::tangent::{TangentSpan,TangentJoinReport};\nuse hyperlimit::PredicatePolicy;\nuse hyperreal::Real;\npub use hyperdynamics::{JerkLimitedFeedTimeReport,CornerLookaheadJoinClass};\n/// Native tangent receipts retained by the dynamics report.\npub type CornerLookaheadJoinReport=hyperdynamics::CornerLookaheadJoinReport<TangentJoinReport>;\n/// Native tangent receipts retained for every adjacent join.\npub type CornerLookaheadLimitReport=hyperdynamics::CornerLookaheadLimitReport<TangentJoinReport>;\n\n'+block(feed,'pub enum FeedPathElement',True)+'\n\n'
for name in ['certify_constant_feed_time_for_path','certify_acceleration_limited_feed_time_for_path','certify_symmetric_jerk_limited_feed_time_for_path']:
 compat+=wrapper(feed,name,name.removesuffix('_for_path'))+'\n\n'
compat+=wrapper(feed,'certify_symmetric_jerk_limited_feed_time',source='&AxisMetricPath(route)')+'\n\n'+wrapper(feed,'certify_corner_lookahead_limits')+'\n\n'
compat+=block(feed,'pub(crate) fn element_length(',True)+'\n\n'
# Existing jerk compatibility references and frozen prior tests still use these
# delegates; lookahead moves to the owning shared checks directly.
for name in ['require_nonnegative_feed','require_positive_feed','require_positive_acceleration','require_positive_jerk']:
 compat+=block(feed,'pub(crate) fn '+name+'(',True)+'\n\n'
compat+='''pub(crate) struct AxisMetricPath<'a>(pub(crate) &'a [LinePathSegment]);
impl hyperdynamics::MetricPath for AxisMetricPath<'_> {
    fn is_empty(&self) -> bool { self.0.is_empty() }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, hyperdynamics::DynamicsError> {
        super::route_axis_length(self.0, policy).ok_or(hyperdynamics::DynamicsError::UnsupportedRouteGeometry)
    }
}
'''
(r/'feed.rs').write_text(compat)
for name in ['certify_constant_feed_time','certify_acceleration_limited_feed_time']:
 routing=replace_block(routing,'pub fn '+name+'(',wrapper(routing,name,source='&feed::AxisMetricPath(route)'))
routing=routing.replace('use crate::solve::{constant_feed_time_equation, differential_pair_skew_equation};','use crate::solve::differential_pair_skew_equation;\nuse hyperdynamics::constant_feed_time_equation;')
routing=routing.replace('pub use feed::{','#[allow(deprecated)] // One-release compatibility exports.\npub use feed::{').replace('pub use lookahead::{','#[allow(deprecated)] // One-release compatibility exports.\npub use lookahead::{')
routing+='\npub use hyperdynamics::{ConstantFeedTimeReport,AccelerationLimitedFeedTimeReport,AccelerationLimitedFeedProfileClass};\n'
(p/'routing.rs').write_text(routing);(p/'solve.rs').write_text(solve)
# Geometry-owned tangent decision and complete receipt, made lazily on request.
adapter=(r/'dynamics.rs').read_text()+'''
impl hyperdynamics::JoinSpan for crate::tangent::TangentSpan {
    type Receipt=crate::tangent::TangentJoinReport;
    fn classify_join(&self, outgoing: &Self, policy: PredicatePolicy) -> hyperdynamics::ClassifiedJoin<Self::Receipt> {
        use crate::tangent::{TangentJoinClass, classify_tangent_join};
        use hyperdynamics::CornerLookaheadJoinClass;
        let receipt=classify_tangent_join(&self.end,&self.end_tangent,&outgoing.start,&outgoing.start_tangent,policy);
        let classification=match receipt.class {
            TangentJoinClass::G1Continuous=>Ok(CornerLookaheadJoinClass::StraightThrough),
            TangentJoinClass::Corner=>Ok(CornerLookaheadJoinClass::RadiusLimitedCorner),
            TangentJoinClass::ReversedTangent=>Ok(CornerLookaheadJoinClass::ReversalStop),
            TangentJoinClass::DegenerateTangent|TangentJoinClass::EndpointMismatch|TangentJoinClass::Unknown=>Err(DynamicsError::UnsupportedRouteGeometry),
        };
        hyperdynamics::ClassifiedJoin { classification, receipt }
    }
}
''';(r/'dynamics.rs').write_text(adapter)
# Move lookahead with generic metric spans and associated geometry receipts.
a=look.index('use crate::tangent::');b=look.index('/// Exact local lookahead speed proposal',a)
newlook=look[:a]+'''use crate::{DynamicsError,MetricSpan,JoinSpan,PlannedMonotonicJerkTransition,plan_monotonic_jerk_transition};
use crate::feed::{CornerLookaheadJoinClass,CornerLookaheadJoinReport,CornerLookaheadLimitReport};
use crate::guards::{require_nonnegative_feed,require_positive_acceleration,require_positive_feed,require_positive_jerk};

'''+look[b:]
newlook=newlook.replace('RouteCertificationError','DynamicsError').replace('route: &[FeedPathElement]','route: &[S]').replace('spans: &[TangentSpan]','spans: &[J]').replace('element: &FeedPathElement','element: &S').replace('element_length(element, policy)','element.exact_length(policy)')
genericreports=['PlannedLookaheadFeedSchedule','PlannedJerkFeasibleLookaheadSchedule','LookaheadFeedScheduleReport']
for name in genericreports:
 newlook=newlook.replace('pub struct '+name+' {','pub struct '+name+'<E> {').replace('impl '+name+' {','impl<E> '+name+'<E> {').replace(': '+name+',',': '+name+'<E>,').replace('Result<'+name+',','Result<'+name+'<J::Receipt>,')
newlook=newlook.replace('pub corners: CornerLookaheadLimitReport,','pub corners: CornerLookaheadLimitReport<E>,')
for name in ['plan_lookahead_feed_schedule','plan_jerk_feasible_lookahead_schedule','certify_lookahead_feed_schedule']:newlook=newlook.replace('pub fn '+name+'(','pub fn '+name+'<S: MetricSpan, J: JoinSpan>(')
newlook=newlook.replace('fn certify_local_corner_limits(','fn certify_local_corner_limits<J: JoinSpan>(').replace('Result<CornerLookaheadLimitReport,','Result<CornerLookaheadLimitReport<J::Receipt>,').replace('fn plan_span_monotonic_transition(','fn plan_span_monotonic_transition<S: MetricSpan>(').replace('    .map(Some)\n    .map_err(Into::into)','    .map(Some)')
a=newlook.index('        let tangent_join = classify_tangent_join(');b=newlook.index('        let certification =',a);newlook=newlook[:a]+'''        let classified = pair[0].classify_join(&pair[1], policy);
        let class = classified.classification?;
        let tangent_join = classified.receipt;
'''+newlook[b:]
newlook=replace_block(newlook,'fn lookahead_join_class(','''fn lookahead_join_class<J: JoinSpan>(incoming: &J,outgoing: &J,policy: PredicatePolicy) -> Result<CornerLookaheadJoinClass,DynamicsError> {
    let classified=incoming.classify_join(outgoing,policy);
    classified.classification
}''')
newlook=replace_block(newlook,'fn lookahead_join_class_from_tangent(','')
(d/'lookahead.rs').write_text(newlook)
compat='//! One-release exact lookahead compatibility with native tangent receipts.\nuse super::RouteCertificationError;\nuse super::feed::FeedPathElement;\nuse crate::tangent::{TangentSpan,TangentJoinReport};\nuse hyperlimit::PredicatePolicy;\nuse hyperreal::Real;\npub use hyperdynamics::{JerkFeasibleNodeComponent,LookaheadFeedPlanningLimits,LookaheadFeedSchedule,LookaheadSpanTransitionReport};\n'
for name in genericreports:compat+='/// Dynamics report retaining the native complete tangent receipt.\npub type '+name+'=hyperdynamics::'+name+'<TangentJoinReport>;\n'
for name in ['plan_lookahead_feed_schedule','plan_jerk_feasible_lookahead_schedule','certify_lookahead_feed_schedule']:compat+='\n'+wrapper(look,name)+'\n'
(r/'lookahead.rs').write_text(compat)
lib=(d/'lib.rs').read_text().replace('mod metric;','mod metric;\nmod feed;\nmod join;\nmod lookahead;\npub use feed::{ConstantFeedTimeReport,AccelerationLimitedFeedProfileClass,AccelerationLimitedFeedTimeReport,JerkLimitedFeedTimeReport,CornerLookaheadJoinClass,CornerLookaheadJoinReport,CornerLookaheadLimitReport,certify_constant_feed_time,certify_acceleration_limited_feed_time,certify_symmetric_jerk_limited_feed_time,certify_corner_lookahead_limits,constant_feed_time_equation,symmetric_jerk_limited_feed_time_equation};\npub use join::{ClassifiedJoin,JoinSpan};\npub use lookahead::*;').replace('pub use metric::{MetricSpan, SpanDynamicsClass};','pub use metric::{MetricPath,MetricSpan, SpanDynamicsClass};')
(d/'lib.rs').write_text(lib)
