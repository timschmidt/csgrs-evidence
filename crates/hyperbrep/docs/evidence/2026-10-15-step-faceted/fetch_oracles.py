"""Fetch pinned validation-only runtimes into /tmp; production has no such dependencies."""
import hashlib, io, json, sys, urllib.request, zipfile
from pathlib import Path, PurePosixPath

out=Path(__file__).resolve().parent
records=[]
for project,version,destination,select in [
    ('cadquery-ocp-novtk','7.9.3.1.1','/tmp/hyperbrep-occt-oracle',lambda n:'cp313-cp313-manylinux' in n and 'x86_64' in n),
    ('cadquery-ocp-proxy','7.9.3.1.1','/tmp/hyperbrep-occt-oracle',lambda n:n.endswith('py3-none-any.whl')),
    ('wasmtime','38.0.0','/tmp/hyperbrep-wasmtime',lambda n:n.endswith('py3-none-manylinux1_x86_64.whl')),
]:
    metadata_url=f'https://pypi.org/pypi/{project}/{version}/json'
    with urllib.request.urlopen(metadata_url,timeout=60) as stream: metadata=json.load(stream)
    choices=[x for x in metadata['urls'] if select(x['filename'])]
    assert len(choices)==1,choices
    item=choices[0]
    with urllib.request.urlopen(item['url'],timeout=60) as stream: data=stream.read(100_000_001)
    assert len(data)==item['size'] and len(data)<100_000_000
    digest=hashlib.sha256(data).hexdigest()
    assert digest==item['digests']['sha256']
    target=Path(destination);target.mkdir(parents=True,exist_ok=True)
    with zipfile.ZipFile(io.BytesIO(data)) as archive:
        assert all(not PurePosixPath(n).is_absolute() and '..' not in PurePosixPath(n).parts for n in archive.namelist())
        archive.extractall(target)
        licenses=[n for n in archive.namelist() if 'license' in n.lower() or 'copying' in n.lower()]
    record=dict(project=project,version=version,metadata_url=metadata_url,url=item['url'],filename=item['filename'],sha256=digest,bytes=len(data),requires_dist=metadata['info']['requires_dist'],license=metadata['info'].get('license'),license_files=licenses)
    records.append(record)
    (out/'oracle-downloads.json').write_text(json.dumps(records,indent=2)+'\n')
    print(project,digest,flush=True)
