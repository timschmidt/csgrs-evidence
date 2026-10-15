exec(open('/tmp/qualify_selected_archive.py').read().split('start=int(sys.argv[1])')[0])
commands=[
 ('final-tests',['cargo','test','--offline','--locked','-p','hyperbrep','--all-features']),
 ('final-default-tests',['cargo','test','--offline','--locked','-p','hyperbrep']),
 ('final-hypercurve-tests',['cargo','test','--offline','--locked','-p','hypercurve','--test','parameter_charts']),
 ('final-clippy',['cargo','clippy','--offline','--locked','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings']),
 ('hypercurve-test-clippy',['cargo','clippy','--offline','--locked','-p','hypercurve','--test','parameter_charts','--','-D','warnings']),
 ('final-release-selected-tests',['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--release','--test','selected_topology']),
 ('final-fmt',['cargo','fmt','--all','--','--check']),
 ('fuzz-fmt',['cargo','fmt','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--','--check']),
 ('diff-check',['git','diff','--check']),
]
records=json.loads((out/'commands.json').read_text())
for name,cmd in commands:
 print('running',name,flush=True);started=time.time()
 with (out/(name+'.log')).open('w') as log: run=subprocess.run(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT)
 records.append(dict(name=name,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started));(out/'commands.json').write_text(json.dumps(records,indent=2)+'\n')
 print(name,run.returncode,flush=True)
 if run.returncode:
  print((out/(name+'.log')).read_text()[-7000:],flush=True);raise SystemExit(run.returncode)
