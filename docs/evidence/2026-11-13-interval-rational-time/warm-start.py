import os,sys,time
from pathlib import Path
end=time.monotonic()+2
while time.monotonic()<end:pass
print('CPU_FREQUENCY_BEFORE_EXEC_KHZ='+Path('/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq').read_text().strip(),flush=True)
os.execv(sys.argv[1],[sys.argv[1]])
