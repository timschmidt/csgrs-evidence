use alumina_board::{OwnerDomain,ResourceId};
use alumina_config::{BindingFlags,BindingRole,ConfigurationFlags,ConfigurationHeader,ConfigurationRecord,ExactScalar,FactEvidence,Rational as ConfigurationRational,ResourceBinding,ScalarFact,SignalPolarity};
use alumina_protocol::Digest;
use alumina_storage::sha256;
mod fixture;
fn main(){let (bytes,digest)=fixture::document(&fixture::machine_records());println!("{} {:?}",bytes.len(),digest);std::fs::write(std::env::args().nth(1).unwrap(),bytes).unwrap();}
