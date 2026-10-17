"""Inspect every changed final consumer archive independently of byte receipts."""
from collections import Counter
import hashlib,json
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[4]
a=json.loads((OUT/'artifact-comparison.json').read_text());rows=[];transitions=Counter()
for item in a['rows']:
 if item['unchanged']:continue
 assert item['path'].endswith('.json')
 old=json.loads((ROOT/item['baseline']).read_text());new=json.loads((OUT/item['path']).read_text())
 keys=[k for k in old if old[k]!=new.get(k)];assert set(old)==set(new) and set(keys)<={'surfaces','pcurves','faces'}
 for k in old:
  if isinstance(old[k],list):assert len(old[k])==len(new[k]),(item['path'],k)
 changes=[]
 for i,(before,after) in enumerate(zip(old['surfaces'],new['surfaces'])):
  if before==after:continue
  assert list(before)==['Extrusion'] and list(after) in [['Plane'],['Cylinder']]
  e=before['Extrusion'];profile=e['profile'];kind=next(iter(after));transitions[kind]+=1
  if kind=='Plane':
   assert list(profile)==['Line']
   assert after[kind]['origin']==profile['Line']['start'] and after[kind]['v']==e['direction']
  else:
   arc=profile['EllipseArc'];assert arc['circle'] and arc['x_radius']==arc['y_radius']
   for t,s in [('origin','center'),('x','x'),('y','y'),('radius','x_radius')]:assert after[kind][t]==arc[s]
  changes.append(dict(index=i,from_carrier='Extrusion',to_carrier=kind))
 face_changes=[]
 for i,(before,after) in enumerate(zip(old['faces'],new['faces'])):
  if before==after:continue
  assert {k:v for k,v in before.items() if k!='orientation'}=={k:v for k,v in after.items() if k!='orientation'}
  assert before['orientation']=='Forward' and after['orientation']=='Reversed'
  assert 'Cylinder' in new['surfaces'][after['surface']]
  face_changes.append(i)
 rows.append(dict(path=item['path'],baseline_sha256=item['baseline_sha256'],candidate_sha256=item['candidate_sha256'],changed_fields=keys,carrier_changes=changes,reoriented_cylindrical_hole_faces=face_changes,all_entity_counts_preserved=True,vertices_spatial_curves_edges_edge_uses_wires_shells_solids_selection_unchanged=True))
assert len(rows)==16 and transitions==dict(Plane=57,Cylinder=36)
report=dict(rows=rows,carrier_transitions=dict(transitions),unchanged_step_files=sum(r['unchanged'] and r['path'].endswith('.step') for r in a['rows']),scope='Structural inventory of all 16 migrated final consumer archives. Identical boundary geometry/connectivity plus complete carrier/chart equations and independent exact native/STEP workflows establish the feature claim; this inventory alone is not a general semantic equality oracle.',recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(OUT/'artifact-review.json').write_text(json.dumps(report,indent=2)+'\n');print('Reviewed 16 native archives: 57 plane and 36 cylinder carrier replacements; all entity counts and spatial boundary records unchanged.')
