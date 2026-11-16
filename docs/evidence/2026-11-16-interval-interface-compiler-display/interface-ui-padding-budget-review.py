from pathlib import Path
import copy,hashlib,json,re,subprocess,time
s=Path(__file__).parent
p=s/'interface-ui-final-comparison/report.json';original=json.loads(p.read_text())
assert not original['all_size_caps_pass']
paths={'fixture-driver':('interface-artifacts-baseline/fixture-driver','interface-artifacts-ui-final/fixture-driver',100.0),'ui-release-tests':('interface-ui-tests-baseline/test-binary','interface-ui-tests-final/test-binary',400.0)}
revision={'declared_unix':time.time(),'status':'Explicit revision of supplemental linker-padding size caps only; pending performance/memory review and cumulative archival/accounting before retention.','supersedes':'interface-ui-section-proposal.json only for .relro_padding in the two named stable x86_64 native artifacts; initial failed comparison retained unchanged.','original_comparison_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'rationale':'The independently inspected ELF LOAD alignment is4096 bytes. The NOBITS .relro_padding section has no file payload and fills the final RELRO page. Its size depends on the preceding section endpoint: shrinking the fixture code16 bytes grows padding16 bytes. A fraction of old padding is not a meaningful alignment capacity. Keep the section within one existing4096-byte page, with explicit per-target growth and percentage ceilings. No code, file, other-section, geometry, performance or memory gate is relaxed.','no_flash_claim':True,'caps':{},'elf_checks':{}}
for name,(ap,bp,percent) in paths.items():
 items=[]
 for rel in [ap,bp]:
  binary=s/rel;sections=subprocess.check_output(['readelf','-SW',str(binary)],text=True);headers=subprocess.check_output(['readelf','-lW',str(binary)],text=True)
  match=re.search(r'\[\s*\d+\]\s+\.relro_padding\s+(\S+)\s+([0-9a-f]+)\s+[0-9a-f]+\s+([0-9a-f]+)\s+[0-9a-f]+\s+(\S+)',sections)
  assert match and match[1]=='NOBITS' and match[4]=='WA'
  start=int(match[2],16);size=int(match[3],16)
  load_lines=[line.split() for line in headers.splitlines() if line.lstrip().startswith('LOAD ')]
  assert load_lines and all(int(line[-1],16)==4096 for line in load_lines)
  assert (start+size)%4096==0 and size<4096
  relro=[line.split() for line in headers.splitlines() if line.lstrip().startswith('GNU_RELRO ')]
  assert len(relro)==1 and int(relro[0][2],16)+int(relro[0][5],16)==start+size
  items.append({'artifact':rel,'artifact_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'padding_bytes':size,'padding_end':start+size,'type':match[1],'load_alignment_bytes':4096,'relro_end_matches_page_boundary':True})
 baseline=items[0]['padding_bytes']
 revision['caps'][name]={'section':'.relro_padding','growth_bytes':4095-baseline,'growth_percent':percent,'total_section_ceiling_bytes':4095,'fixed_baseline_padding_bytes':baseline}
 revision['elf_checks'][name]=items
out=s/'interface-ui-padding-budget-revision.json';assert not out.exists();out.write_text(json.dumps(revision,indent=2)+'\n')
review=copy.deepcopy(original)
checks=[]
for family,rows in review['comparisons'].items():
 for name,row in rows.items():
  checks.append(row['file']['passes_both_caps'])
  if 'total_emitted_code' in row:checks.append(row['total_emitted_code']['passes_both_caps'])
  for section,metric in row.get('sections',{}).items():
   if name in revision['caps'] and section=='.relro_padding':
    caps=revision['caps'][name]
    metric['original_caps_passed']=metric['passes_both_caps']
    metric['absolute_cap_bytes']=caps['growth_bytes'];metric['percentage_cap']=caps['growth_percent']
    metric['remaining_absolute_bytes']=caps['growth_bytes']-max(metric['delta_bytes'],0)
    metric['total_section_ceiling_bytes']=caps['total_section_ceiling_bytes']
    metric['passes_both_caps']=metric['delta_bytes']<=caps['growth_bytes'] and metric['delta_percent']<=caps['growth_percent'] and metric['candidate_bytes']<=caps['total_section_ceiling_bytes']
   checks.append(metric['passes_both_caps'])
review['all_size_caps_pass']=all(checks)
review['padding_budget_revision_sha256']=hashlib.sha256(out.read_bytes()).hexdigest()
review['original_comparison_retained']=str(p)
review['status']='Size caps pass only under the separately recorded supplemental padding-budget revision. Retention remains pending performance/memory/dispatch review and cumulative archival/accounting.'
(s/'interface-ui-revised-size-review.json').write_text(json.dumps(review,indent=2)+'\n')
assert all(checks) and review['headroom_passes']
print('Explicit padding-cap revision passes; original failure preserved; all other caps unchanged. Retention still pending.')
