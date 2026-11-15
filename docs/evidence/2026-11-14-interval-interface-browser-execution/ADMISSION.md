# Current browser and simulator execution

Phases 8/14, P8/P9/P19/P27/P31-P37. Owners: Alumina Interface browser authority,
client worker, canonical machine/schedule evidence and local firmware simulator.
The current coordinated state is BASELINE.json, including the unaccepted pending
CSGRS extraction and Interface migration patches. This run cannot accept those
migrations or establish their cost gates merely because the browser works.

Missing acceptance witness: after current interval changes, compilation/packaging
has been checked but live browser execution, schedule worker composition and
browser memory have not been reproduced. Rebuild the current combined state and
reuse the existing maintained CDP/worker/simulator harness. Begin with current
no-fault clock/cached-job completion and cold/fresh-owner replay; exercise typed
failure/recovery where practical without touching real devices. Inspect app boot,
canvas rendering and browser errors, and record bounded observation metrics.
Scope is headless Chromium/software graphics plus local simulators, not radio,
physical hardware, human usability or universal browser performance.

No production edits before a failing/missing behavior is reproduced and its owning
contract identified. If defects appear, preserve the failing witness and fix the
lowest sufficient layer without weakening existing expectations, protocol deadlines,
identity, qualification or authority boundaries. New automation should reuse the
existing CDP/protocol harness rather than create another control implementation.
All network service actors belong to this test and bind loopback. Keep simulator
jobs separate from device commands. Preserve all pending changes and all 52 frozen
records; record commands, source/patch/tool/bundle identities and live process
handles. Stop only owned processes after their terminal evidence is captured.
No push, publication, external communication or physical-device qualification.

Reproduced finding: clock-loopback-qualified.json reports strict schema mismatch (actual 15, harness hardcodes 13) at b4a15bd with current pending patch. Owning layer: Interface browser acceptance harness and client wire schema, P6/P19/P27. Input domain: current schema-15 worker messages and current browser harness commands. Minimal fix: one explicit harness version used by all messages and strict receive comparison, with a client-owned source alignment regression; do not accept arbitrary advertised worker versions or alter scenario assertions/deadlines. Production protocol remains unchanged.
