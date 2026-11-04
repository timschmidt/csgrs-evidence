from pathlib import Path
import os,subprocess
p=Path('src/export.rs');s=p.read_text();s=s.replace('solid::difference(&restored, &solid::cube(1).unwrap())','restored.try_difference(&solid::cube(1).unwrap())')
s=s.replace('''                Point3::new(Real::one(), Real::zero(), Real::zero()),
                Point3::new(Real::from(2), Real::zero(), Real::zero()),''','''                Point3::new(csgrs::ratio(1,2).unwrap(), csgrs::ratio(1,5).unwrap(), Real::zero()),
                Point3::new(csgrs::ratio(3,2).unwrap(), csgrs::ratio(3,5).unwrap(), Real::zero()),''')
assert 'ratio(3,5)' in s
p.write_text(s)
start=s.index('    for part in parts {',s.index('pub fn export_parts('));end=s.index('    match format {',start);gate=s[start:end];assert 'native export validation failed' in gate
try:
 p.write_text(s[:start]+s[end:])
 result=subprocess.run(['cargo','test','--offline','--locked','--release','--bin','synaps-cad','--features','dispatch-trace','every_export_rejects_invalid_native_geometry_before_writing'],env={**os.environ,'CCACHE_DISABLE':'1','CARGO_BUILD_JOBS':'8','CARGO_TARGET_DIR':'/tmp/csgrs-research-target'},stdout=open('/tmp/csgrs-native-source-preflight-before.log','w'),stderr=subprocess.STDOUT)
 print('Without exact-source preflight:',result.returncode)
finally:p.write_text(s)
