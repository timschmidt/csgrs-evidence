import json,os,re,subprocess,sys
from pathlib import Path
workspace=Path(sys.argv[1])
records=json.loads(Path(sys.argv[2]).read_text())
for row in records:
    root=workspace/row['repo']
    interface=row['repo']=='alumina-interface'
    doc='docs/CURRENT-BASELINE.md' if interface else 'docs/CURRENT-STATUS.md'
    marker='- `crates/alumina-interface-core`' if interface else 'Implementation is underway'
    ending='## Value domains' if interface else '## Developer checks'
    original=subprocess.check_output(['git','-C',str(root),'show',row['base']+':README.md'],text=True)
    moved=(root/doc).read_text();start=original.index(marker)
    before=original[start:original.index(ending,start)].strip();after=moved[moved.index(marker):].strip()
    def canonical(text,folder):
        def link(m):
            value=m.group(1)
            return ']('+value+')' if re.match(r'(https?:|mailto:|#)',value) else ']('+os.path.normpath(str(root/folder/value))+')'
        return re.sub(r'\]\(([^)]+)\)',link,text)
    assert canonical(before,Path('.'))==canonical(after,Path('docs'))
    for relative in ['README.md',doc]:
        path=root/relative
        for target in re.findall(r'\]\(([^)]+)\)',path.read_text()):
            if re.match(r'(https?:|mailto:|#)',target):continue
            target=target.split('#')[0]
            assert not target or (path.parent/target).exists(),(relative,target)
    print(row['repo'],len(before.splitlines()),'narrative lines preserved; relative file targets resolve')
