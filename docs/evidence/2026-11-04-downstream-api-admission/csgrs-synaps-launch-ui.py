import os,subprocess
from pathlib import Path
env=os.environ.copy()
for key in ['WAYLAND_DISPLAY','WAYLAND_SOCKET']:
    env.pop(key,None)
env.update({'XDG_CONFIG_HOME':'/tmp/csgrs-synaps-ui/config','XDG_CACHE_HOME':'/tmp/csgrs-synaps-ui/cache','XDG_DATA_HOME':'/tmp/csgrs-synaps-ui/data','RUST_LOG':'warn'})
with Path('/tmp/csgrs-synaps-ui-runtime.log').open('w') as log:
    child=subprocess.Popen(['/tmp/csgrs-research-target/release/synaps-cad'],cwd='/home/tim/Documents/GitHub/workspace/synaps-cad',env=env,stdout=log,stderr=subprocess.STDOUT)
    Path('/tmp/csgrs-synaps-ui.pid').write_text(str(child.pid)+'\n')
    try: raise SystemExit(child.wait())
    except KeyboardInterrupt:
        child.terminate();child.wait();raise SystemExit(130)
