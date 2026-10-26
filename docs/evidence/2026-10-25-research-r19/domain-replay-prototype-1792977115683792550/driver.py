from pathlib import Path
import hashlib
import json
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r19-trace')
baseline = json.loads((raw / 'latest-regression-baseline.json').read_text())
assert baseline['status'] == 101 and baseline['failure_kind'] == 'reproduced UnknownCertificate', baseline
path = root / 'crates/hyperreal/src/computable/node/representation.rs'
record = raw / ('domain-replay-prototype-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
source = path.read_text()
(record / 'before.rs').write_text(source)
old = '''                return self.sign_until(floor).map(|sign| sign != RealSign::Zero);'''
new = '''                return self
                    .sign_until(floor)
                    .map(|sign| sign != RealSign::Zero)
                    .or_else(|| self.imported_affine_pi_trig_nonzero().then_some(true));'''
assert source.count(old) == 1
source = source.replace(old, new)
anchor = '''    /// `Some(true)` proves the condition and `Some(false)` refutes it.
    fn imported_domain_condition'''
helper = '''    // Native rational cotangents may retain sin(q + a*pi) as the
    // denominator after range reduction. For rational q != 0 and rational a,
    // neither sine nor cosine vanishes: otherwise q would be a nonzero
    // rational multiple of pi. Replay that proof from the graph, only after
    // ordinary nonzero admission declines. No sign or wire flag is trusted.
    // The post-order import walk has already proved every child domain.
    fn imported_affine_pi_trig_nonzero(&self) -> bool {
        let mut image = self;
        for _ in 0..48 {
            match &image.internal.approximation {
                Approximation::Negate(child) | Approximation::Offset(child, _) => {
                    image = child;
                }
                Approximation::PrescaledSin(argument) | Approximation::PrescaledCos(argument) => {
                    let Some(polynomial) = argument.pi_laurent_polynomial(48) else {
                        return false;
                    };
                    return polynomial.terms.iter().all(|(power, coefficient)| {
                        matches!(*power, 0 | 1)
                            && coefficient.radicals.is_empty()
                            && coefficient.atoms.is_empty()
                    }) && polynomial.terms.iter().any(|(power, coefficient)| {
                        *power == 0 && !coefficient.rational.is_zero()
                    });
                }
                _ => return false,
            }
        }
        false
    }

'''
assert source.count(anchor) == 1
source = source.replace(anchor, helper + anchor)
path.write_text(source)
subprocess.run(['cargo', 'fmt', '--all'], cwd=root, check=True)
(record / 'after.rs').write_bytes(path.read_bytes())
(record / 'source.patch').write_bytes(subprocess.check_output(['git', 'diff', '--binary'], cwd=root))
(record / 'completion.json').write_text(json.dumps({
    'reproduced_baseline': baseline,
    'changed_runtime': str(path.relative_to(root)),
    'before_sha256': hashlib.sha256((record / 'before.rs').read_bytes()).hexdigest(),
    'after_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
    'scope': 'Private candidate only. Rational affine pi non-pole proof after existing reciprocal admission declines; no precision increase, graph rewrite, persistent cache, or assumed nonzero flag.'
}, indent=2) + '\n')
print('R19 PRIVATE PROTOTYPE', record, flush=True)
