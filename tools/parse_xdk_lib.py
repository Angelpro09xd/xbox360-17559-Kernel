#!/usr/bin/env python3
"""Parse xboxkrnl.lib (COFF archive of import members) -> ordinal:name map."""
import struct, sys, json, os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

data = open(os.path.join(ROOT, 'vendor', 'xboxkrnl.lib'), 'rb').read()
assert data[:8] == b'!<arch>\n', "not a COFF archive"

pos = 8
members = []
while pos + 60 <= len(data):
    hdr = data[pos:pos+60]
    if hdr[58:60] != b'`\n':
        # try to realign (members are 2-byte aligned)
        pos += 1
        continue
    name = hdr[0:16].decode('ascii', 'replace').strip()
    try:
        size = int(hdr[48:58].decode('ascii').strip())
    except ValueError:
        break
    body = data[pos+60: pos+60+size]
    members.append((name, body))
    pos += 60 + size
    if pos % 2:
        pos += 1

print(f"archive members: {len(members)}", file=sys.stderr)

ordmap = {}   # ordinal -> name
byname = {}   # name -> ordinal
noord = []

for name, body in members:
    if len(body) < 20:
        continue
    sig1, sig2 = struct.unpack('<HH', body[0:4])
    if sig1 != 0x0000 or sig2 != 0xFFFF:
        continue  # not an import object member
    version, machine = struct.unpack('<HH', body[4:8])
    tds, sizeofdata = struct.unpack('<II', body[8:16])
    ordinal_hint, typefld = struct.unpack('<HH', body[16:20])
    strs = body[20:20+sizeofdata].split(b'\x00')
    impname = strs[0].decode('ascii','replace') if strs else ''
    dllname = strs[1].decode('ascii','replace') if len(strs) > 1 else ''
    imptype = typefld & 0x3
    nametype = (typefld >> 2) & 0x7
    # nametype 0 == IMPORT_OBJECT_ORDINAL
    if nametype == 0:
        ordmap[ordinal_hint] = impname
        byname[impname] = ordinal_hint
    else:
        noord.append((impname, ordinal_hint, nametype))

print(f"imports by ordinal: {len(ordmap)}", file=sys.stderr)
print(f"imports by name (hint only): {len(noord)}", file=sys.stderr)
if noord[:5]:
    print(f"  sample by-name: {noord[:5]}", file=sys.stderr)

out = os.path.join(ROOT, 'symbols', 'ordinals.json')
json.dump({'ordmap': {str(k): v for k, v in ordmap.items()},
           'byname': byname}, open(out,'w'), indent=1, sort_keys=True)
print(f"wrote {out}", file=sys.stderr)

# print sorted
for o in sorted(ordmap):
    print(f"{o}\t{ordmap[o]}")
