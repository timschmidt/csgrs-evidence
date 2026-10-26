from pathlib import Path
import json
from runtime_manifest import assert_runtime
raw=Path(__file__).resolve().parent
def assert_cost_eligible():
    eligibility=json.loads((raw/'cost-eligibility.json').read_text())
    assert eligibility['eligible'],eligibility
    for name in ['latest-private-validation.json','latest-downstream-validation.json']:
        validation=json.loads((raw/name).read_text())
        assert validation['failed'] is None and validation['sources_unchanged']
        assert_runtime(json.loads((Path(validation['record'])/'sources-after.json').read_text()),'candidate')
    for name in ['latest-cost-functional.json','latest-construction-functional.json','latest-workflow-functional.json']:
        result=json.loads((raw/name).read_text())
        meta=json.loads((Path(result['record'])/'metadata.json').read_text())
        assert meta['complete'],name
        assert_runtime(json.loads(Path(meta['builds']['candidate']['sources']).read_text()),'candidate')
