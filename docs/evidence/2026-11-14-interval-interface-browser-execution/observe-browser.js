window.__aluminaObservation = {errors: [], longTasks: [], trunkStartedMs: null};
window.addEventListener("error", e => window.__aluminaObservation.errors.push({kind:"error",message:e.message,source:e.filename,line:e.lineno}));
window.addEventListener("unhandledrejection", e => window.__aluminaObservation.errors.push({kind:"unhandledrejection",message:String(e.reason)}));
window.addEventListener("TrunkApplicationStarted", e => {
    window.__aluminaObservation.trunkStartedMs = performance.now();
    window.__aluminaObservedMemory = e.detail.wasm.memory;
});
try {new PerformanceObserver(list => {
    for (const e of list.getEntries()) window.__aluminaObservation.longTasks.push({start:e.startTime,duration:e.duration});
}).observe({type:"longtask",buffered:true});} catch(e) {window.__aluminaObservation.observerUnavailable=String(e);}
