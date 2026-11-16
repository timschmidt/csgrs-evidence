use alumina_foc::*;
use alumina_protocol::{DeviceCycle,Digest};
const DIGEST:Digest=Digest([0x5a;32]);
fn channel()->CurrentChannelCalibration {CurrentChannelCalibration {
 adc_maximum_count:4095,valid_count_minimum:1200,valid_count_maximum:2800,count_at_zero:2000,
 polarity:CurrentPolarity::Increasing,normalized_current_per_count:Q30Interval::point(Q30::from_bits(1<<19)),
 maximum_additive_error:Q30::from_bits(1<<18),maximum_interval_width_ulps:1<<20,
}}
pub fn calibration(pair:TwoShuntPhasePair)->TwoShuntCurrentCalibration {TwoShuntCurrentCalibration {
 configuration_digest:DIGEST,phase_pair:pair,channel0:channel(),channel1:channel(),
 synchronization:PwmAdcSynchronization {configuration_digest:DIGEST,device_cycle_hz:20_000_000,pwm_period_cycles:1000,nominal_acquisition_offset_cycles:500,maximum_trigger_jitter_cycles:2,maximum_acquisition_cycles:20,maximum_channel_skew_cycles:8,maximum_conversion_cycles:40,minimum_switching_guard_cycles:50},
 maximum_normalized_current_slew_per_cycle:Q30::from_bits(1<<14),maximum_interchannel_skew_error:Q30::from_bits(1<<17),maximum_phase_current:Q30::ONE,maximum_phase_interval_width_ulps:1<<22,
}}
fn stamp()->PwmAdcSampleStamp {PwmAdcSampleStamp {configuration_digest:DIGEST,duty_token:7,period_sequence:11,period_started_at:DeviceCycle(10_000),previous_switching_edge_at:DeviceCycle(10_400),acquisition_started_at:DeviceCycle(10_501),channel0_sampled_at:DeviceCycle(10_506),channel1_sampled_at:DeviceCycle(10_512),conversion_completed_at:DeviceCycle(10_532),next_switching_edge_at:DeviceCycle(10_600)}}
fn parameters()->FocParameterSnapshot {
 let pi=PiConfig {proportional_gain:Q30::ZERO,integral_gain_per_update:Q30::ZERO,integral_minimum:Q30::NEG_ONE,integral_maximum:Q30::ONE,output_minimum:Q30::from_bits(-Q30::HALF.bits()),output_maximum:Q30::HALF};
 FocParameterSnapshot {configuration_digest:DIGEST,pole_pairs:7,timing:FocTimingProfile {pwm_hz:20_000,current_loop_hz:20_000,velocity_loop_divider:20,position_loop_divider:10},maximum_phase_current:Q30::ONE,maximum_phase_voltage:Q30::ONE,d_current:pi,q_current:pi}
}
#[derive(Clone,Copy,Debug)]
pub struct Input {pub source:TwoShuntCurrentCalibration,pub proof:ValidatedTwoShuntCurrentCalibration,pub raw:[u16;2],pub stamp:PwmAdcSampleStamp,pub prepare_each:bool}
pub fn input(index:u32)->Input {
 let pair=match index%3 {0=>TwoShuntPhasePair::Ab,1=>TwoShuntPhasePair::Bc,_=>TwoShuntPhasePair::Ca};
 let mut source=calibration(pair);let mut raw=[2100,1950];let mut stamp=stamp();let mut prepare_each=false;
 match index {
  0=>raw=[2000,2000],1=>raw=[2400,2100],2=>raw=[1400,1750],
  3=>source.channel0.polarity=CurrentPolarity::Decreasing,
  4=>{source.maximum_interchannel_skew_error=Q30::ZERO;source.maximum_normalized_current_slew_per_cycle=Q30::ZERO;},
  5=>source.maximum_interchannel_skew_error=Q30::from_bits(1<<18),
  6=>{source.configuration_digest=Digest([0;32]);prepare_each=true;},
  7=>{source.maximum_interchannel_skew_error=Q30::from_bits(-1);prepare_each=true;},
  8=>raw=[1199,2000],
  9=>{raw=[1199,2000];stamp.duty_token=0;},
  10=>prepare_each=true,
  11=>{source.maximum_interchannel_skew_error=Q30::from_bits(i32::MAX);prepare_each=true;},
  _=>{
   let a=index.wrapping_mul(1664525).wrapping_add(1013904223);let b=a.wrapping_mul(1664525).wrapping_add(1013904223);
   raw=[1200+(a%1601) as u16,1200+(b%1601) as u16];
   if index%2==0 {source.channel0.polarity=CurrentPolarity::Decreasing;}
   if index%5==0 {source.channel1.polarity=CurrentPolarity::Decreasing;}
   source.maximum_interchannel_skew_error=Q30::from_bits((1<<17)+(a%10000) as i32);
   for (channel,width) in [(&mut source.channel0,(a%16) as i32),(&mut source.channel1,(b%16) as i32)] {
    channel.normalized_current_per_count=Q30Interval::new(Q30::from_bits(1<<19),Q30::from_bits((1<<19)+width)).unwrap();
    channel.maximum_additive_error=Q30::from_bits((1<<18)+(width+1)/2);
   }
   prepare_each=index%7==0;
   if index%11==0 {raw[0]=0;}
   if index%13==0 {stamp.next_switching_edge_at=DeviceCycle(10_550);}
  }
 }
 let proof=if [6,7,11].contains(&index) {calibration(pair).validated().unwrap()} else {source.validated().unwrap()};
 Input {source,proof,raw,stamp,prepare_each}
}
pub type Outcome=Result<(CurrentSample,AlphaBeta),FocError>;
pub fn operate(input:Input)->Outcome {
 let proof=if input.prepare_each {input.source.validated()?} else {input.proof};
 let sample=proof.observe(input.raw,input.stamp)?;
 sample.validate_for(&parameters(),proof)?;
 let stationary=sample.stationary()?;
 Ok((sample,stationary))
}
pub fn check_exact(input:Input,result:Outcome) {
 let Ok((sample,stationary))=result else {return};
 assert_eq!(sample.raw_counts,input.raw);assert_eq!(sample.configuration_digest,input.source.configuration_digest);assert_eq!(sample.synchronization,input.stamp);
 let observed=[input.source.channel0,input.source.channel1].map(|_|(0i128,0i128));let mut expected=observed;
 for (i,c) in [input.source.channel0,input.source.channel1].into_iter().enumerate() {
  let delta=(i128::from(input.raw[i])-i128::from(c.count_at_zero))*if c.polarity==CurrentPolarity::Increasing {1} else {-1};
  let products=[delta*i128::from(c.normalized_current_per_count.lower().bits()),delta*i128::from(c.normalized_current_per_count.upper().bits())];
  let uncertainty=i128::from(c.maximum_additive_error.bits())+i128::from(input.source.maximum_interchannel_skew_error.bits());
  expected[i]=(*products.iter().min().unwrap()-uncertainty,*products.iter().max().unwrap()+uncertainty);
 }
 let missing=(-expected[0].1-expected[1].1,-expected[0].0-expected[1].0);
 let expected=match input.source.phase_pair {TwoShuntPhasePair::Ab=>[expected[0],expected[1],missing],TwoShuntPhasePair::Bc=>[missing,expected[0],expected[1]],TwoShuntPhasePair::Ca=>[expected[1],missing,expected[0]]};
 for (phase,(lo,hi)) in [sample.phases.a,sample.phases.b,sample.phases.c].into_iter().zip(expected) {assert_eq!((i128::from(phase.lower().bits()),i128::from(phase.upper().bits())),(lo,hi));}
 let sum_lower:i128=expected.iter().map(|p|p.0).sum();let sum_upper:i128=expected.iter().map(|p|p.1).sum();assert_eq!(i128::from(sample.maximum_zero_sequence.bits()),sum_lower.abs().max(sum_upper.abs()));
 assert!(stationary.alpha.lower()<=stationary.alpha.upper());assert!(stationary.beta.lower()<=stationary.beta.upper());
}
