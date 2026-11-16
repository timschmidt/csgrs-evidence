The first timing attempt exited 1 at the artifact SHA-256 assertion, before
recording any measured block. Its 12 warmup outputs remain in
sqrt-timing-confirmation. The prior objcopy --dump-section inspection omitted
an output file, causing objcopy to rewrite the copied input executable. The
inspected copies and their hashes are retained separately; section dumps and
existing functional outputs are not substituted for the original binaries.
repair-inspected-artifacts.py restores exactly the four production paths to
baseline, rebuilds both original baseline artifacts, reapplies the identical
tracked patch, and rebuilds both candidate artifacts. Every rebuilt SHA-256
must equal its originally recorded value. The rerun uses a fresh timing directory
and verifies each artifact before every measured process. No measured adverse
sample is discarded; the first attempt had none. Future objcopy inspections
must use a separate explicit output file or a read-only parser.
