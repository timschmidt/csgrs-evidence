# Status: invalid experiment, no retained source change

The attempted private-helper inline experiment duplicated an existing attribute.
Strict Clippy rejected it; the duplicate was removed without suppressing warnings.
This is not a distinct qualified optimization and does not resolve phase 11.
The source inspection mistake and invalid artifact are retained as such.

Current baseline/extraction/provider-error controls reproduce the previous owner
artifacts exactly. All 194 complete result/drop observer rows agree. Current
Callgrind corner totals remain 2,503,560 baseline versus 2,507,720 provider-control
for 32 calls; the prior cost blocker remains. No fresh wall-clock campaign or
universal impossibility claim is made. Metadata-only comparison of the duplicate
artifact does not turn an invalid experiment into an accepted result.

After removing the duplicate, provider-control strict Clippy passes. Restoring
the original staged extraction then passes routing, axis-migration and format
checks. The task-owned isolated tree is restored clean at 3c9a6a8e. Main's 41-path
staged extraction and Interface's eight pending paths are unchanged. Eighteen
previous evidence stages verify unchanged. No push occurred. The full goal is
active; phase 11 retention remains open.
