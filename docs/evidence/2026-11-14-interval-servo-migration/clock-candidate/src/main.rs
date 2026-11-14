mod allocations;
use alumina_clock::*;
use alumina_protocol::DeviceCycle;
use std::{hint::black_box,time::Instant};

#[derive(Clone,Copy)]
struct Fixture {frequency:u64,offset:i128,policy:ClockEstimationPolicy,samples:[ClockObservation;4]}
impl Fixture {
    fn cycle(&self,t:u64)->u64 {u64::try_from(i128::from(t)*i128::from(self.frequency)/1_000_000_000+self.offset).unwrap()}
}
fn fixture(frequency:u64,sign:i128,delay:u64)->Fixture {
    let policy=ClockEstimationPolicy{maximum_round_trip_ns:5_000_000,maximum_device_processing_cycles:frequency,maximum_drift_ppm:100,maximum_sample_age_ns:50_000_000,maximum_schedule_horizon_ns:5_000_000_000,minimum_schedule_lead_ns:100_000_000,minimum_samples:2};
    let offset=sign*i128::from(frequency)/2;
    let cycle=|t:u64|u64::try_from(i128::from(t)*i128::from(frequency)/1_000_000_000+offset).unwrap();
    let samples=std::array::from_fn(|i|{
        let send=(i as u64+1)*1_000_000_000;let inbound=if i%2==0 {delay}else{1_000_000};let outbound=if i%2==0 {1_000_000}else{delay};
        ClockObservation{response:ClockHeartbeatResponse{flags:ClockFlags(ClockFlags::MONOTONIC|ClockFlags::SHARED_BETWEEN_CORES|ClockFlags::DEADLINE_HEALTHY),counter_bits:64,source:ClockSource::EmbassyMonotonic,probe_id:i as u64+1,ui_send_ns:send,boot_id:BootId::new([0x44;16]).unwrap(),receive_cycle:DeviceCycle(cycle(send+inbound)),transmit_cycle:DeviceCycle(cycle(send+inbound+1_000_000)),frequency_hz:frequency,minimum_lead_cycles:frequency/10,maximum_schedule_horizon_cycles:frequency*60,queue_horizon_cycles:frequency/2,maximum_lateness_cycles:17,missed_deadlines:0,command_queue_free:3,work_queue_depth:1},ui_receive_ns:send+inbound+1_000_000+outbound}
    });
    Fixture{frequency,offset,policy,samples}
}
type Outcome=(ClockEstimator,Result<ClockPrediction,ClockEstimateError>,Result<ClockInstantEstimate,ClockEstimateError>,Result<ClockUiEstimate,ClockEstimateError>);
#[inline(never)]
fn completed(f:&Fixture)->Outcome {
    let mut model=ClockEstimator::new(f.policy).unwrap();
    for observation in f.samples {model.observe(observation).unwrap();}
    let now=f.samples[3].ui_receive_ns;
    let prediction=model.predict(now,now+500_000_000,u64::MAX);
    let instant=model.estimate_at(now,u64::MAX);
    let c=f.cycle(now);let inverse=model.estimate_ui_for_cycle_interval(now,DeviceCycle(c),DeviceCycle(c),u64::MAX);
    assert!(prediction.is_ok()&&instant.is_ok()&&inverse.is_ok());
    (model,prediction,instant,inverse)
}
fn verify(f:&Fixture,out:&Outcome) {
    let p=out.1.unwrap();let i=out.2.unwrap();let inv=out.3.unwrap();
    assert!(p.earliest_cycle.0<=f.cycle(p.target_ui_ns)&&f.cycle(p.target_ui_ns)<=p.latest_cycle.0);
    assert!(i.earliest_cycle.0<=f.cycle(i.ui_ns)&&f.cycle(i.ui_ns)<=i.latest_cycle.0);
    assert!(inv.earliest_ui_ns<=i.ui_ns&&i.ui_ns<=inv.latest_ui_ns);
    assert_eq!(p.scheduled_cycle.0,p.earliest_cycle.0+(p.latest_cycle.0-p.earliest_cycle.0)/2);
    assert_eq!(p.uncertainty_cycles,(p.scheduled_cycle.0-p.earliest_cycle.0).max(p.latest_cycle.0-p.scheduled_cycle.0));
}
fn main() {
    let mode=std::env::args().nth(1).unwrap_or_else(||"rows".into());
    let fixtures:Vec<_>=[1_000,1_000_000,1_000_000_000,10_000_000_000].into_iter().flat_map(|f|[-1,0,1].into_iter().flat_map(move|s|[1_000_000,2_000_000].into_iter().map(move|d|fixture(f,s,d)))).collect();
    println!("LAYOUT {} {}",std::mem::size_of::<ClockEstimator>(),std::mem::align_of::<ClockEstimator>());
    for (index,f) in fixtures.iter().enumerate() {
        let outcome=completed(f);verify(f,&outcome);
        if mode=="rows" {
            println!("RESULT {index} {outcome:?}");
            for observation in f.samples {println!("WIRE {index} {:?}",observation.response.encode().unwrap());}
            let model=outcome.0;let now=f.samples[3].ui_receive_ns;
            for maximum in [0,1,2,100,1_000,u64::MAX] {println!("QUERY {index} {maximum} {:?} {:?} {:?}",model.predict(now,now+500_000_000,maximum),model.estimate_at(now,maximum),model.estimate_ui_for_cycle_interval(now,DeviceCycle(f.cycle(now)),DeviceCycle(f.cycle(now)+1),maximum));}
            println!("INVALID {index} {:?} {:?} {:?} {:?}",model.predict(now,now-1,u64::MAX),model.estimate_at(now+100_000_000,u64::MAX),model.estimate_at(now-1,u64::MAX),model.estimate_ui_for_cycle_interval(now,DeviceCycle(2),DeviceCycle(1),u64::MAX));
            for case in 0..8 {
                let mut trial=model;let mut obs=f.samples[3];obs.response.probe_id+=1;obs.response.ui_send_ns+=1_000_000_000;obs.ui_receive_ns+=1_000_000_000;obs.response.receive_cycle.0+=f.frequency;obs.response.transmit_cycle.0+=f.frequency;
                match case {0=>obs.response.boot_id=BootId::new([0x55;16]).unwrap(),1=>obs.response.frequency_hz=0,2=>obs.response.probe_id=1,3=>obs.ui_receive_ns=obs.response.ui_send_ns,4=>obs.ui_receive_ns+=10_000_000,5=>obs.response.flags.0=0,6=>{obs.response.receive_cycle=DeviceCycle(0);obs.response.transmit_cycle=DeviceCycle(0)},_=>{}}
                let result=trial.observe(obs);println!("OBSERVE {index} {case} {result:?} {trial:?}");
            }
        }
        if mode=="alloc" {let stats=allocations::measure(64,||completed(f));assert_eq!(stats.allocations,0);assert_eq!(stats.reallocations,0);assert_eq!(stats.allocated_bytes,0);assert_eq!(stats.peak_live_bytes,0);assert_eq!(stats.deallocations,0);assert_eq!(stats.live_bytes,0);println!("ALLOC {index} {stats:?}");}
    }
    if mode=="time" {
        for _ in 0..100 {for f in &fixtures {let _ = black_box(completed(f));}}
        for epoch in 0..30 {let now=Instant::now();for _ in 0..256 {for f in &fixtures {let _ = black_box(completed(black_box(f)));}}println!("TIME {epoch} {} {}",fixtures.len()*256,now.elapsed().as_nanos());}
    }
}
