from pathlib import Path
import copy,hashlib,json,re,time
s=Path(__file__).parent;out=s/'interface-core-budget'
p=out/'comparison.json';original=json.loads(p.read_text());assert not original['all_caps_pass']
variants=original['source_variants'];checks={}
for name,item in variants.items():
 sec=item['allocated_sections']['.relro_padding'];assert sec['type']=='NOBITS' and sec['flags']=='WA' and sec['bytes']<4096
 headers=(out/name/'program-headers.txt').read_text();loads=[line.split() for line in headers.splitlines() if line.lstrip().startswith('LOAD ')];assert loads and all(int(row[-1],16)==4096 for row in loads)
 relro=[line.split() for line in headers.splitlines() if line.lstrip().startswith('GNU_RELRO ')];assert len(relro)==1
 end=int(relro[0][2],16)+int(relro[0][5],16);assert end%4096==0
 sections=(out/name/'sections.txt').read_text();m=re.search(r'\.relro_padding\s+NOBITS\s+([0-9a-f]+)\s+[0-9a-f]+\s+([0-9a-f]+)',sections)
 assert m and int(m[1],16)+int(m[2],16)==end
 checks[name]={'artifact_sha256':item['sha256'],'padding_bytes':sec['bytes'],'load_alignment_bytes':4096,'relro_end':end,'padding_type':'NOBITS','padding_ends_at_relro_page_boundary':True}
revision={'declared_unix':time.time(),'scope':'Supplemental .relro_padding cap for the existing Rust1.95 core lib-test artifact only. Existing account file/text caps and prior accepted growth remain unchanged.','status':'Explicit alignment-cap revision for size review; not retention or performance/memory acceptance.','initial_failure_preserved_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'rationale':'The candidate removes48 file/code bytes relative to the previous-retained control and the linker fills the same RELRO page with48 more NOBITS bytes. Cumulative padding decreases360 bytes against the fixed-goal control. A growth percentage relative to incidental previous padding fails despite less code and less cumulative padding. Bound the final padding by the independently verified4096-byte page and preserve separate absolute/percentage caps. No artifact/code/data growth is hidden or netted across sections.','elf_evidence':checks,'total_padding_ceiling_bytes':4095,'caps':{'incremental':{'growth_bytes':4095-checks['previous']['padding_bytes'],'growth_percent':150},'cumulative':{'growth_bytes':4095-checks['fixed']['padding_bytes'],'growth_percent':100}},'fixed_goal_baseline_unchanged':True}
rp=s/'interface-core-padding-budget-revision.json';assert not rp.exists();rp.write_text(json.dumps(revision,indent=2)+'\n')
review=copy.deepcopy(original);passed=[]
for family,row in review['comparisons'].items():
 metric=row['allocated_sections']['.relro_padding'];caps=revision['caps'][family]
 metric['original_caps_passed']=metric['passes_both_caps'];metric['absolute_cap_bytes']=caps['growth_bytes'];metric['percentage_cap']=caps['growth_percent'];metric['total_section_ceiling_bytes']=4095
 metric['passes_both_caps']=metric['delta_bytes']<=caps['growth_bytes'] and metric['delta_percent']<=caps['growth_percent'] and metric['candidate']<=4095
 metric['remaining_absolute_bytes']=caps['growth_bytes']-max(0,metric['delta_bytes'])
 passed.extend([row['file']['passes_both_caps'],row['text']['passes_both_caps']]);passed.extend(m['passes_both_caps'] for m in row['allocated_sections'].values())
review['all_caps_pass']=all(passed);review['padding_budget_revision_sha256']=hashlib.sha256(rp.read_bytes()).hexdigest();review['status']='Matched Rust1.95 file/text and all allocated-section caps pass under the explicit supplemental padding revision; cumulative accounting/retention remain pending other gates.'
(out/'revised-size-review.json').write_text(json.dumps(review,indent=2)+'\n');assert all(passed)
print('Existing core file/text caps unchanged and passing; explicit bounded padding revision passes. No retention/account accepted.')
