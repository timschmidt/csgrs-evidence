from pathlib import Path
s=Path(__file__).parent
p=Path('/tmp/interval-refactor/physics-flow/inspect-artifacts.py').read_text().replace('physics-flow','adaptive-taylor');(s/'inspect-artifacts.py').write_text(p)
p=Path('/tmp/interval-refactor/physics-flow/compare-symbols.py').read_text().replace('physics-flow','adaptive-taylor').replace("[('physics-base','physics-default'),('dynamics-base','dynamics-candidate')]","[('base','default'),('base','enabled')]");(s/'compare-symbols.py').write_text(p)
p=Path('/tmp/interval-refactor/physics-flow/environment.py').read_text();p=p.replace("out['iterations_new']=10000","out['iterations_new']=1000");(s/'environment.py').write_text(p)
p=Path('/tmp/interval-refactor/verify-after-physics-flow.py').read_text().replace("(root/'physics-flow-final-frozen-check.json')","(Path(__file__).parent/'prior-stages-verification.json')");(s/'verify-prior-stages.py').write_text(p)
