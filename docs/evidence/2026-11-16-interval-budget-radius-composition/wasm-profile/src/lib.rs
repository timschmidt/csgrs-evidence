use alumina_interface_core::machine_profile::{MachineDynamicsProfile2,MachineResolutionBudget2};
use hyperreal::Rational;
use alumina_board::{OwnerDomain, ResourceId};
use alumina_config::{BindingFlags, BindingRole, ConfigurationDocumentView, ConfigurationFlags, ConfigurationHeader, ConfigurationRecord, ExactScalar, FactEvidence, Rational as ConfigurationRational, ResourceBinding, ScalarFact, SignalPolarity};
use alumina_protocol::Digest;
use alumina_storage::sha256;
#[path = "../../profile-probe/src/fixture.rs"]
mod fixture;
fn prepared(index: usize) -> (Vec<u8>, Digest) {
 let mut records=fixture::machine_records();
 for record in &mut records { if let ConfigurationRecord::Scalar(s)=record {
  if index==5 && s.fact==ScalarFact::AxisPositionMinimumMetres {s.value=fixture::wire_rational(-3,10);}
  if index==6 {s.uncertainty=fixture::wire_rational(0,1);}
 }}
 fixture::document(&records)
}
fn allocations(index:usize)->(Rational,Rational,Rational) {
 match index {
  1=>(Rational::fraction(1,10).unwrap(),Rational::zero(),Rational::zero()),
  2=>(Rational::zero(),Rational::from(-1),Rational::from(-1)),
  3=>(Rational::fraction(1,10).unwrap(),Rational::from(-1),Rational::from(-1)),
  4=>(Rational::fraction(1,1000).unwrap(),Rational::zero(),Rational::zero()),
  _=>(Rational::fraction(1,10).unwrap(),Rational::fraction(1,100).unwrap(),Rational::fraction(1,100).unwrap()),
 }
}
fn serialized(result:&Result<MachineResolutionBudget2,alumina_interface_core::machine_profile::MachineProfileError>)->String {
 result.as_ref().map_or_else(|_|String::new(),|v|serde_json::to_string(&[
 v.requested_total_error_mm(),v.source_curve_allocation_mm(),v.controller_interpolation_allocation_mm(),
 v.endpoint_quantization_error_mm(),v.step_event_tracking_error_mm(),v.command_lattice_error_mm(),
 v.calibration_error_mm(),v.following_error_mm(),v.output_grid_position_error_mm(),v.required_total_error_mm()
 ]).unwrap())
}
static OUTPUT: std::sync::Mutex<Vec<u8>> = std::sync::Mutex::new(Vec::new());
#[unsafe(no_mangle)]
pub extern "C" fn profile_run(index:u32)->u32 {
 let mut output=OUTPUT.lock().unwrap();output.clear();
 if index>=7 {return 0;}
 let(bytes,digest)=prepared(index as usize);
 let view=ConfigurationDocumentView::decode::<32>(&board_mks_tinybee::PACKAGE,&bytes,digest).unwrap();
 let profile=MachineDynamicsProfile2::from_configuration(view).unwrap();
 let(total,source,controller)=allocations(index as usize);
 let result=MachineResolutionBudget2::certify(&profile,total,source,controller);
 assert_eq!(result.is_ok(),!matches!(index,2|3|4));
 *output=format!("{result:?}\n{:?}\n{}",result.as_ref().ok().map(|profile|(profile.configuration_digest().0,profile.capability_digest().0)),serialized(&result)).into_bytes();1
}
#[unsafe(no_mangle)]
pub extern "C" fn profile_len()->u32 {OUTPUT.lock().unwrap().len().try_into().unwrap()}
#[unsafe(no_mangle)]
pub extern "C" fn profile_byte(index:u32)->u32 {OUTPUT.lock().unwrap().get(index as usize).map_or(256,|v|u32::from(*v))}
