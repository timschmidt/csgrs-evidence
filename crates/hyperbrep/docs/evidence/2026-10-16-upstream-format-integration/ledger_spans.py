"""Change only the BREP value while preserving upstream's raw ledger bytes."""
import json

DECODER = json.JSONDecoder()

def members(text, start):
    assert text[start] == '{'
    position = start + 1
    result = {}
    while True:
        while text[position].isspace():
            position += 1
        if text[position] == '}':
            return result
        name, position = DECODER.raw_decode(text, position)
        while text[position].isspace():
            position += 1
        assert text[position] == ':'
        position += 1
        while text[position].isspace():
            position += 1
        start_value = position
        _, position = DECODER.raw_decode(text, position)
        assert name not in result
        result[name] = (start_value, position)
        while text[position].isspace():
            position += 1
        if text[position] == '}':
            return result
        assert text[position] == ','
        position += 1

def replace_brep(upstream, brep):
    root = members(upstream, len(upstream) - len(upstream.lstrip()))
    work_start, _ = root['current_work']
    work = members(upstream, work_start)
    encoded = json.dumps(brep, indent=2).replace('\n', '\n  ')
    if 'hyperbrep' in work:
        start, end = work['hyperbrep']
        replacement = encoded
    else:
        assert work
        start = end = list(work.values())[-1][1]
        replacement = ',\n  "hyperbrep": ' + encoded
    result = upstream[:start] + replacement + upstream[end:]
    assert result[:start] == upstream[:start]
    assert result[start + len(replacement):] == upstream[end:]
    return result
