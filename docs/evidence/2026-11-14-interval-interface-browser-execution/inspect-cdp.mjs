import fs from "node:fs";
const [port, command, argument, output] = process.argv.slice(2);
const pages = await fetch(`http://127.0.0.1:${port}/json`).then(r=>r.json());
const page = ["processes", "downloads"].includes(command) ? await fetch(`http://127.0.0.1:${port}/json/version`).then(r=>r.json()) : pages.find(p=>p.type==="page");
if (!page) throw new Error("no owned page");
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

let result;
try {
    if(command==="init-script") result=await cdp("Page.addScriptToEvaluateOnNewDocument",{source:fs.readFileSync(argument,"utf8")});
    else if(command==="processes") result=await cdp("SystemInfo.getProcessInfo");
    else if(command==="downloads") result=await cdp("Browser.setDownloadBehavior",{behavior:"allow",downloadPath:argument});
    else if(command==="export-artifacts") {await cdp("Browser.setDownloadBehavior",{behavior:"allow",downloadPath:argument});for(const y of [115,136]){await cdp("Input.dispatchMouseEvent",{type:"mousePressed",x:422,y,button:"left",clickCount:1});await cdp("Input.dispatchMouseEvent",{type:"mouseReleased",x:422,y,button:"left",clickCount:1});await new Promise(r=>setTimeout(r,1000));}result={files:fs.readdirSync(argument)};}
    else if(command==="export-one") {const a=JSON.parse(argument);await cdp("Browser.setDownloadBehavior",{behavior:"allow",downloadPath:a.directory});await cdp("Input.dispatchMouseEvent",{type:"mousePressed",x:a.x,y:a.y,button:"left",clickCount:1});await cdp("Input.dispatchMouseEvent",{type:"mouseReleased",x:a.x,y:a.y,button:"left",clickCount:1});await new Promise(r=>setTimeout(r,1000));result={files:fs.readdirSync(a.directory)};}
    else if(command==="import-one") {const a=JSON.parse(argument);await cdp("Page.enable");await cdp("Page.setInterceptFileChooserDialog",{enabled:true});await cdp("Input.dispatchMouseEvent",{type:"mouseMoved",x:a.x,y:a.y});await new Promise(r=>setTimeout(r,100));await cdp("Input.dispatchMouseEvent",{type:"mousePressed",x:a.x,y:a.y,button:"left",clickCount:1});await cdp("Input.dispatchMouseEvent",{type:"mouseReleased",x:a.x,y:a.y,button:"left",clickCount:1});await new Promise(r=>setTimeout(r,100));const doc=await cdp("DOM.getDocument");const node=await cdp("DOM.querySelector",{nodeId:doc.root.nodeId,selector:"input[type=file]"});if(!node.nodeId)throw new Error("intercepted file input absent");result=await cdp("DOM.setFileInputFiles",{nodeId:node.nodeId,files:[a.file]});await new Promise(r=>setTimeout(r,1000));}
    else if(command==="file-input") {const doc=await cdp("DOM.getDocument");const node=await cdp("DOM.querySelector",{nodeId:doc.root.nodeId,selector:"input[type=file]"});if(!node.nodeId) throw new Error("file input absent");result=await cdp("DOM.setFileInputFiles",{nodeId:node.nodeId,files:[argument]});}
    else if(command==="navigate") result=await cdp("Page.navigate",{url:argument});
    else if(command==="evaluate") result=await cdp("Runtime.evaluate",{expression:argument,returnByValue:true,awaitPromise:true});
    else if(command==="screenshot") { const value=await cdp("Page.captureScreenshot",{format:"png"});fs.writeFileSync(output,Buffer.from(value.data,"base64"));result={screenshot:output}; }
    else if(command==="metrics") {await cdp("Performance.enable");result={performance:await cdp("Performance.getMetrics"),heap:await cdp("Runtime.getHeapUsage"),dom:await cdp("Memory.getDOMCounters")};}
    else if(command==="click") {const [x,y]=argument.split(",").map(Number);await cdp("Input.dispatchMouseEvent",{type:"mousePressed",x,y,button:"left",clickCount:1});result=await cdp("Input.dispatchMouseEvent",{type:"mouseReleased",x,y,button:"left",clickCount:1});}
    else throw new Error("unknown inspection command");
    if(output && command!=="screenshot") fs.writeFileSync(output,JSON.stringify(result,null,2)+"\n");
    console.log(JSON.stringify(result,null,2));
} finally {socket.close();}
