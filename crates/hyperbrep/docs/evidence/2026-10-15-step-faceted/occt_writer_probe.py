"""Record an external fixture-generation experiment, including failures."""
import json,resource,subprocess,sys
from pathlib import Path
out=Path(__file__).resolve().parent
if len(sys.argv)>1:
    resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    sys.path.insert(0,'/tmp/hyperbrep-occt-oracle')
    from OCP.BRepPrimAPI import BRepPrimAPI_MakeBox
    from OCP.STEPControl import STEPControl_Writer,STEPControl_FacetedBrep,STEPControl_AsIs
    from OCP.IFSelect import IFSelect_RetDone
    mode=sys.argv[1];maker=BRepPrimAPI_MakeBox(2.,3.,4.);shape=maker.Shape()
    writer=STEPControl_Writer()
    status=writer.Transfer(shape,STEPControl_FacetedBrep if mode=='faceted' else STEPControl_AsIs)
    assert status==IFSelect_RetDone,status
    path=Path('/tmp')/f'hyperbrep-occt-box-{mode}.step'
    assert writer.Write(str(path))==IFSelect_RetDone
    print('wrote',path,flush=True)
else:
    rows=[]
    for mode in ['faceted','as-is']:
        cmd=[sys.executable,str(Path(__file__).resolve()),mode]
        p=subprocess.run(cmd,capture_output=True,text=True,timeout=60)
        (out/f'occt-writer-{mode}.log').write_text(p.stdout+p.stderr)
        rows.append(dict(mode=mode,command=cmd,exit_code=p.returncode,used_as_import_fixture=False))
    (out/'occt-writer-experiment.json').write_text(json.dumps(dict(scope='External exporter probe only. The faceted writer failure is not an importer result; general-mode output is not within the implemented faceted representation mapping.',attempts=rows),indent=2)+'\n')
    print(json.dumps(rows,indent=2))
