from pathlib import Path
import json
s=Path(__file__).parent
rows={label: {x['kind']:x for x in json.loads((s/f'final-{label}.json').read_text())} for label in ['fixed','current','validated','inplace']}
assert all(len(x)==3 and all(v['exit_code']==v['runtime_exit_code']==0 for v in x.values()) for x in rows.values())
proposal=json.loads((s/'size-proposal.json').read_text());caps=proposal['caps_per_target'];out=[]
for kind in ['benchmark','native','wasm']:
 for base in ['fixed','current','validated']:
  a=rows[base][kind]['size'];b=rows['inplace'][kind]['size'];r={'target':kind,'baseline':base,'baseline_source':rows[base][kind]['source'],'candidate_source':rows['inplace'][kind]['source'],'same_lock':rows[base][kind]['lock_sha256']==rows['inplace'][kind]['lock_sha256'],'metrics':{}};assert r['same_lock']
  for metric,capname in [('file','file'),('executable_code','executable_code'),('named_text','named_native_code')]:
   if metric not in a:continue
   delta=b[metric]-a[metric];pct=100*delta/a[metric];cap=caps[capname+'_bytes'];pcap=caps[capname+'_percent'];r['metrics'][metric]={'before':a[metric],'after':b[metric],'delta':delta,'percent':pct,'byte_cap':cap,'percent_cap':pcap,'passes':delta<=cap and pct<=pcap}
  r['all_caps_pass']=all(v['passes'] for v in r['metrics'].values());out.append(r)
  print(kind,base,{k:(v['delta'],v['passes']) for k,v in r['metrics'].items()})
failed=[r for r in out if r['baseline'] in ['fixed','current'] and not r['all_caps_pass']]
(s/'final-comparison.json').write_text(json.dumps({'comparisons':out,'all_incremental_cumulative_caps_pass':not failed,'failed_targets':failed,'scope':'Source consumer now includes dimension overflow and zero-dimensional composition; the old narrower consumer is not a substitute. No reset or enlargement of the inherited shared voxel caps.'},indent=2)+'\n')
