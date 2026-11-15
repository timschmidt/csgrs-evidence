import fs from "node:fs";
const root = "/tmp/interval-refactor/interface-browser-execution/ui-replay";
const pages = await fetch("http://127.0.0.1:9224/json").then(r=>r.json());
const page = pages.find(p=>p.type==="page");
const socket = new WebSocket(page.webSocketDebuggerUrl);
const pending = new Map();
let nextId = 1;
await new Promise((resolve, reject) => {
  socket.onopen = resolve;
  socket.onerror = () => reject(new Error("CDP websocket failed"));
});
socket.onmessage = (message) => {
  const response = JSON.parse(message.data);
  const request = pending.get(response.id);
  if (!request) return;
  pending.delete(response.id);
  if (response.error) request.reject(new Error(response.error.message));
  else request.resolve(response.result);
};
socket.onclose = () => {
  for (const request of pending.values()) {
    request.reject(new Error("CDP websocket closed"));
  }
  pending.clear();
};

const cdp = (method, params = {}) =>
  new Promise((resolve, reject) => {
    const id = nextId++;
    pending.set(id, { resolve, reject });
    socket.send(JSON.stringify({ id, method, params }));
  });


const events = [];
const originalMessage = socket.onmessage;
socket.onmessage = m => {
  const v=JSON.parse(m.data);
  if(v.method === "Runtime.exceptionThrown" || v.method === "Runtime.consoleAPICalled") {
    events.push(v);fs.appendFileSync(root+"/ui-runtime-events.jsonl",JSON.stringify(v)+"\n");
  }
  originalMessage(m);
};
try {
  await cdp("Runtime.enable");
  await cdp("Page.enable");
  await cdp("Page.addScriptToEvaluateOnNewDocument",{source:fs.readFileSync(root+"/observe-browser.js","utf8")+`
window.addEventListener("TrunkApplicationStarted",()=>requestAnimationFrame(()=>requestAnimationFrame(()=>{window.__aluminaObservation.framesAfterTrunkMs=performance.now();})));
`});
  const nav=await cdp("Page.navigate",{url:"http://127.0.0.1:8097/dist/index.html"});
  fs.writeFileSync(root+"/ui-navigation.json",JSON.stringify(nav,null,2)+"\n");
  const start=Date.now();let last;
  while(Date.now()-start<600000) {
    await new Promise(r=>setTimeout(r,1000));
    const result=await cdp("Runtime.evaluate",{expression:`({nowMs:performance.now(),observation:window.__aluminaObservation,wasmMemoryBytes:window.__aluminaObservedMemory?.buffer.byteLength,canvas:[...document.querySelectorAll("canvas")].map(c=>({id:c.id,width:c.width,height:c.height})),readyState:document.readyState})`,returnByValue:true});
    last=result.result.value;
    fs.writeFileSync(root+"/ui-startup-observation.json",JSON.stringify({wallSeconds:(Date.now()-start)/1000,...last},null,2)+"\n");
    console.log(JSON.stringify(last));
    if(last?.observation?.framesAfterTrunkMs && last.nowMs-last.observation.framesAfterTrunkMs>2000) break;
    if(last?.observation?.errors?.length) break;
  }
  const shot=await cdp("Page.captureScreenshot",{format:"png"});fs.writeFileSync(root+"/ui-startup.png",Buffer.from(shot.data,"base64"));
  fs.writeFileSync(root+"/ui-runtime-events.json",JSON.stringify(events,null,2)+"\n");
  console.log(JSON.stringify({observationCompleted:true,frames:!!last?.observation?.framesAfterTrunkMs}));
} finally {socket.close();}
