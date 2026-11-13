"""Read ELF64 little-endian section bytes without modifying the artifact."""
import struct

def sections(path):
    data = path.read_bytes()
    assert data[:6] == b'\x7fELF\x02\x01'
    offset = struct.unpack_from('<Q', data, 40)[0]
    size, count, index = struct.unpack_from('<HHH', data, 58)
    headers = [struct.unpack_from('<IIQQQQIIQQ', data, offset + i * size) for i in range(count)]
    names = data[headers[index][4]:headers[index][4] + headers[index][5]]
    return {
        names[h[0]:].split(b'\0', 1)[0].decode(): data[h[4]:h[4] + h[5]] if h[1] != 8 else b''
        for h in headers
    }
