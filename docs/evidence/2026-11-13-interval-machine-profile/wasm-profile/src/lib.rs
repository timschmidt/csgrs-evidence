use alumina_interface_core::machine_profile::MachineDynamicsProfile2;
use alumina_board::{OwnerDomain, ResourceId};
use alumina_config::{BindingFlags, BindingRole, ConfigurationDocumentView, ConfigurationFlags, ConfigurationHeader, ConfigurationRecord, ExactScalar, FactEvidence, Rational as ConfigurationRational, ResourceBinding, ScalarFact, SignalPolarity};
use alumina_protocol::Digest;
use alumina_storage::sha256;
#[path = "../../profile-probe/src/fixture.rs"]
mod fixture;
fn prepared(index:usize)->(Vec<u8>,Digest) {
 let mut records=fixture::machine_records();
 for record in &mut records {
  if let ConfigurationRecord::Scalar(s)=record {
   match index {
    1=>s.uncertainty=fixture::wire_rational(0,1),
    2 if s.fact==ScalarFact::AxisCalibrationScale=>s.uncertainty=fixture::wire_rational(1,10),
    3 if s.fact==ScalarFact::AxisCalibrationScale=>s.uncertainty=fixture::wire_rational(999,1000),
    4 if s.fact==ScalarFact::AxisCalibrationScale=>s.uncertainty=fixture::wire_rational(1,1),
    5 if s.fact==ScalarFact::AxisCalibrationScale=>{s.value=fixture::wire_rational(i64::MAX,13);s.uncertainty=fixture::wire_rational(i64::MAX-2,17);},
    6 if s.fact==ScalarFact::AxisPositionMinimumMetres=>s.value=fixture::wire_rational(-3,10),
    _=>{}
   }
  }
 }
 fixture::document(&records)
}

static OUTPUT: std::sync::Mutex<Vec<u8>> = std::sync::Mutex::new(Vec::new());
#[unsafe(no_mangle)]
pub extern "C" fn profile_run(index:u32)->u32 {
 let mut output=OUTPUT.lock().unwrap();output.clear();
 if index>=7 {return 0;}
 let(bytes,digest)=prepared(index as usize);
 let view=ConfigurationDocumentView::decode::<32>(&board_mks_tinybee::PACKAGE,&bytes,digest).unwrap();
 let result=MachineDynamicsProfile2::from_configuration(view);
 assert_eq!(result.is_ok(),index!=4);
 if let Ok(profile)=&result {assert_eq!(profile.configuration_identity(),view.identity());}
 *output=format!("{result:?}\n{:?}",result.as_ref().ok().map(|profile|(profile.configuration_digest().0,profile.capability_digest().0))).into_bytes();1
}
#[unsafe(no_mangle)]
pub extern "C" fn profile_len()->u32 {OUTPUT.lock().unwrap().len().try_into().unwrap()}
#[unsafe(no_mangle)]
pub extern "C" fn profile_byte(index:u32)->u32 {OUTPUT.lock().unwrap().get(index as usize).map_or(256,|v|u32::from(*v))}
