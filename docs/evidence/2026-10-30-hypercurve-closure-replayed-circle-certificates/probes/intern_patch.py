import sys
p=sys.argv[1]
s=open(p).read()
old="""    fn read_point(&mut self) -> SvgResult<Point2> {
        Ok(Point2::new(self.read_real()?, self.read_real()?))
    }"""
new="""    fn read_point(&mut self) -> SvgResult<Point2> {
        thread_local! { static INTERN: std::cell::RefCell<std::collections::HashMap<Vec<u8>, Point2>> = Default::default(); }
        let start = self.position;
        let point = Point2::new(self.read_real()?, self.read_real()?);
        if std::env::var_os("TEMP_INTERN").is_none() {
            return Ok(point);
        }
        let key = self.bytes[start..self.position].to_vec();
        Ok(INTERN.with(|m| m.borrow_mut().entry(key).or_insert(point).clone()))
    }"""
assert s.count(old)==1
open(p,'w').write(s.replace(old,new))
