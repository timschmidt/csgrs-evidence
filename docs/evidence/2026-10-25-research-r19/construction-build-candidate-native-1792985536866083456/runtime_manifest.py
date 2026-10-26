from pathlib import Path
import hashlib
import json
raw=Path(__file__).resolve().parent
def runtime_sources(variant):
    pointer=json.loads((raw/'latest-runtime-manifest.json').read_text())
    return json.loads(Path(pointer['manifest']).read_text())['variants'][variant]
def assert_runtime(sources,variant):
    for name,entry in runtime_sources(variant).items():
        assert hashlib.sha256(Path(entry['source']).read_bytes()).hexdigest()==entry['sha256'],name
        assert sources[name]==entry['sha256'],(variant,name)
def snapshot_runtime(record,variant):
    manifest=runtime_sources(variant)
    folder=record/'runtime';folder.mkdir()
    for name,entry in manifest.items():
        (folder/Path(name).name).write_bytes(Path(entry['source']).read_bytes())
    (record/'runtime-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    (record/'runtime_manifest.py').write_bytes(Path(__file__).read_bytes())
