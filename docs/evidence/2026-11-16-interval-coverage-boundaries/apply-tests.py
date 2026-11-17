from pathlib import Path
import json,subprocess
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);assert (s/'artifact-controls-complete.json').exists();assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
for name,source in [('trigonometry','rounding-test.rs'),('fractional_power','power-test.rs')]:
 p=r/f'crates/hyperinterval/tests/{name}.rs';p.write_text(p.read_text()+(s/source).read_text())
p=r/'crates/hyperinterval/tests/tangent.rs';t=p.read_text();needle='''        let mut no_work = DyadicBudget::new(0, 0);
        let result = if cot {''';assert t.count(needle)==1
replacement='''        let mut no_work = DyadicBudget::new(0, 0);
        let finite_empty = DyadicInterval::empty();
        let finite_result = if cot {
            finite_empty.cot(i32::MIN, &mut no_work)
        } else {
            finite_empty.tan(i32::MIN, &mut no_work)
        }
        .unwrap();
        assert!(finite_result.range.is_empty());
        assert_eq!(finite_result.domain, DomainCoverage::Complete);
        assert_eq!(
            finite_result.range.exp(i32::MIN, &mut no_work).unwrap(),
            finite_result
        );
        assert_eq!(no_work.remaining_work(), 0);
        let result = if cot {''';p.write_text(t.replace(needle,replacement))
subprocess.run(['cargo','+1.95.0','fmt','--all'],cwd=r,check=True)
(s/'candidate.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=r))
