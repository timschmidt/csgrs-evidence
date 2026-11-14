from pathlib import Path
import json,textwrap,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/alumina-interface-validation');rows={}
p=r/'src/browser_worker.rs';original=p.read_text();text=original.replace('Ok(Some(_)) | Ok(None) => {','Ok(_) => {');assert text!=original
start=text.index('            WorkerEvent::CapabilityDocument { capability } => {',text.index('    fn apply(&mut self, envelope:'));end=text.index('            WorkerEvent::VisualAssetDocument',start);arm=text[start:end];prefix='            WorkerEvent::CapabilityDocument { capability } => {\n';assert arm.startswith(prefix) and arm.endswith('            }\n');body=arm[len(prefix):-len('            }\n')];helper='    fn apply_capability_transfer(&mut self, capability: &WorkerCapabilityDocument) {\n'+textwrap.indent(textwrap.dedent(body),'        ')+'    }\n\n';text=text[:start]+'            WorkerEvent::CapabilityDocument { capability } => {\n                self.apply_capability_transfer(capability.as_ref());\n            }\n'+text[end:];index=text.index('    fn apply(&mut self, envelope:');text=text[:index]+helper+text[index:];assert textwrap.dedent(body)==textwrap.dedent(helper[helper.index('\n')+1:-len('    }\n\n')]);p.write_text(text);rows[str(p.relative_to(r))]=dict(extracted_body_sha256=hashlib.sha256(textwrap.dedent(body).encode()).hexdigest(),exact_body_preserved=True,validation_before_dispatch_unchanged=True)
p=r/'src/lib.rs';text=p.read_text();start=text.index('    if let Some(scan) = &network.scan {',text.index('fn show_live_network_status('));end=text.index('    if network.consecutive_failures',start);block=text[start:end];prefix='    if let Some(scan) = &network.scan {\n';assert block.startswith(prefix) and block.endswith('    }\n');body=block[len(prefix):-len('    }\n')];helper='''#[cfg(target_arch = "wasm32")]
fn show_live_network_scan(
    ui: &mut egui::Ui,
    connection_id: u64,
    scan: &alumina_interface_client::worker::WorkerNetworkScanSnapshot,
    idle: bool,
    passphrase: &mut String,
    actions: &mut Vec<LiveDeviceAction>,
) {
'''+textwrap.indent(textwrap.dedent(body),'    ')+'}\n\n';text=text[:start]+'    if let Some(scan) = &network.scan {\n        show_live_network_scan(ui, connection_id, scan, idle, passphrase, actions);\n    }\n'+text[end:];index=text.index('#[cfg(target_arch = "wasm32")]\nfn erase_secret_text');text=text[:index]+helper+text[index:];p.write_text(text);rows[str(p.relative_to(r))]=dict(extracted_body_sha256=hashlib.sha256(textwrap.dedent(body).encode()).hexdigest(),exact_body_preserved=True,same_ui_no_new_scope=True,widget_and_action_order_preserved=True)
(s/'browser-extraction.json').write_text(json.dumps(rows,indent=2)+'\n')
