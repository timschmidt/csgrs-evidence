# Browser scope

Headless Chromium uses a fresh owned profile and SwiftShader software rendering.
The initial blank-page probe emitted browser background GCM registration errors
(despite disable-background-networking); no application data had been loaded.
That browser was deliberately stopped before application tests and replaced with
a fresh profile using host-resolver-rules=MAP * ~NOTFOUND and disabled sync.
Application/server/simulator URLs use literal loopback addresses. Initial logs and
blank metrics remain separate; they are not used as the tested browser baseline.
This is environment configuration, not a product-code change or a timeout retry.

The MAP * ~NOTFOUND flag also blocked loopback: Page.navigate returned net::ERR_NAME_NOT_RESOLVED, server received no application request, driver timed out. No application test ran. Preserved those logs, stopped that owned browser, and relaunched with EXCLUDE 127.0.0.1 and EXCLUDE localhost. Simulators retained unchanged.

CDP instrumentation notes: Page.addScriptToEvaluateOnNewDocument from a short-lived connection did not remain available to subsequent worker-page observations (cached-active-observation lacks the observation field). No worker error/long-task claims are inferred from that field. The actual UI observer keeps its Page session alive from initialization through navigation and captures the populated observation and screenshots. Export automation likewise keeps Browser.setDownloadBehavior active through the click. One early export attempt reported UI success without a retained download; a later two-click attempt retained only configuration after the scroll position changed. Coordinate correction yielded both actual files. In fresh-process import automation, the initial non-intercepted chooser was cancelled by the headless environment; merely setting interception without Page.enable did not retain a chooser. Page.enable plus interception and mouse movement delivered the original files. These setup attempts are not successful import/export witnesses. Terminal screenshots and actual retained files establish the later successful operations. No application deadlines, assertions or production APIs were changed for these automation corrections.
