from pathlib import Path
import hashlib,json,stat
root=Path('/tmp/interval-refactor')
expected={'machine-profile-module':'2479b56c77710a018e91923799c8bd260b28cc7bd7c21e4e7d19e95e6ac0a43f','machine-profile':'fb6ea79fcfc463911aef5f45e53e8d7e0cd0d897602a74589b242b967e7ddf0b','dynamics-adapters':'5fe72cd01add9d288cc4b55ee5365b60d8c6f38628a758d66e9d48c75fe263d0','coordinates':'9df7d2bbf4830ac4ce5dd5876260d13aa6e5de69fb969c40483064d70a0259fd','dynamics-requalification':'ae1d5ecd798dee0c3f069af4e468daa55b55bc78c5a46ee566393d1be2524e18','taylor-affine':'048b328a2f3d95257149cfa0329cfce39466109adcce26f51ddec443447ff092','taylor-cost-resolution':'1ab5f27a5f959a1ba153b8f311a8d786bdeafd0221b79e292c9fac6f02bc9d73','taylor':'da15cf76824197c12746e9b0d6b87bc354d9e1059c44324533d4093a8a52500c'}
expected['jacobian-matrix']='aff2dd277d79231c31895ddea643ce2810fc8c30609d6b11755713e56206e969'
expected['dynamics-return']='c58ef69a7fade56b9e1b97d85871335d27831b2a89394d0c52c371d1ddeb2188'
expected['dynamics-provider-errors']='dbe1f8aebf2cf3b8e86e2d443a043be64c571b8025401557c787136b00433787'
expected['program-composition']='c06f85cc6e98dfbe75aa6faa9941bac7476585c050e7bb242f358d669bfeaeb3'
expected['sdf-enclosure']='8a25e59d989f352cdcf8deb6499b1c31697fb9a37cb2ebcf043981d6a605c0c6'
expected['sdf-primitives']='11ea413b4825c5b0bd7ee1906f627d38c937d265209451c6bfbdb193fd263ed9'
expected['sdf-affine']='7c3068484c1f24940074673b1184cee8c5f6bafb76769434d138283c14ecf4d8'
expected['sdf-subdivision']='75802cc38a3909dbe534b662466c0d081fe6ea3eba6b264d4851a866f3fdaa0e'
results=[]
for name,want in expected.items():
 base=root/name;digest=hashlib.sha256();count=total=0
 assert base.is_dir(),base
 for path in sorted((x for x in base.rglob('*') if x.is_file() or x.is_symlink()),key=lambda p:p.relative_to(base).as_posix().encode()):
  data=str(path.readlink()).encode() if path.is_symlink() else path.read_bytes();kind='l' if path.is_symlink() else 'x' if path.stat().st_mode&stat.S_IXUSR else '-'
  digest.update(f'{hashlib.sha256(data).hexdigest()}  {kind}  {path.relative_to(base).as_posix()}\n'.encode());count+=1;total+=len(data)
 got=digest.hexdigest();results.append({'stage':name,'files':count,'bytes':total,'sha256':got,'expected':want,'matched':got==want})
(root/'sdf-lipschitz'/'prior-stages-verification.json').write_text(json.dumps(results,indent=2)+'\n')
assert all(x['matched'] for x in results),results
print('all sixteen prior stages unchanged')
