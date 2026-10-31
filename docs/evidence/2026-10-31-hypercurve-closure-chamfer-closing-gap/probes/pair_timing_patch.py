import sys
p=sys.argv[1]
s=open(p).read()
old="""    pub(super) fn pair_result(
        &self,
        pair: &RegionCarrierPair,
    ) -> ExactCurveResult<RegionPairResult> {
        let first"""
new="""    pub(super) fn pair_result(
        &self,
        pair: &RegionCarrierPair,
    ) -> ExactCurveResult<RegionPairResult> {
        let started = std::time::Instant::now();
        let result = self.pair_result_probe(pair);
        let elapsed = started.elapsed();
        if std::env::var_os("TEMP_PAIR_TIMING").is_some() && elapsed.as_millis() >= 200 {
            let describe = |index: usize| { let d = format!("{:?}", self.data.carriers[index]); d.chars().take(70).collect::<String>() };
            let context = format!("{:?}", pair.context).chars().take(40).collect::<String>();
            eprintln!("PAIRTIME {:>8.3}s {} | {} | {} | contacts {:?}", elapsed.as_secs_f64(), context, describe(pair.first_carrier_index), describe(pair.second_carrier_index), result.as_ref().map(|r| r.contacts.len()).ok());
        }
        result
    }

    fn pair_result_probe(
        &self,
        pair: &RegionCarrierPair,
    ) -> ExactCurveResult<RegionPairResult> {
        let first"""
assert s.count(old)==1
open(p,'w').write(s.replace(old,new))
