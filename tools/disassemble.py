#!/usr/bin/env python3
"""
Disassemble the live Xbox 360 kernel 17559 dump with symbolication.

Inputs (in scratchpad):
  krnl_dump.bin      raw memory from 0x80000000
  krnl_exports.txt   "ordinal,ADDRESS" per line (from the live console)
  krnl_ordinals.json ordinal -> name (parsed from the XDK's xboxkrnl.lib)

Output:
  disasm/kernel_full.txt    full symbolicated disassembly
  symbols/symbols.txt   address -> name, sorted
"""
import json, os, sys, struct
from capstone import *
from capstone.ppc import *

# Repo root, so the script works from a clean checkout.
SCR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE = 0x80000000

dump_path = os.path.join(SCR, 'dump', 'kernel_17559.bin')
exp_path  = os.path.join(SCR, 'symbols', 'exports_live.txt')
ord_path  = os.path.join(SCR, 'symbols', 'ordinals.json')

code = open(dump_path, 'rb').read()
print(f"dump: {len(code)} bytes, {BASE:08X}..{BASE+len(code):08X}", file=sys.stderr)

# ordinal -> name (from XDK lib)
ordmap = json.load(open(ord_path))['ordmap']   # {"55": "IoCreateDevice", ...}

# ordinal -> live address (from console)
sym = {}          # address -> name
missing = []
if os.path.exists(exp_path):
    for line in open(exp_path):
        line = line.strip()
        if not line or ',' not in line:
            continue
        o, a = line.split(',', 1)
        try:
            o = int(o); a = int(a, 16)
        except ValueError:
            continue
        name = ordmap.get(str(o))
        if name:
            sym[a] = name
        else:
            missing.append((o, a))
    print(f"symbols: {len(sym)} resolved, {len(missing)} ordinals without a name", file=sys.stderr)
else:
    print("WARNING: no krnl_exports.txt, disassembly will be unsymbolicated", file=sys.stderr)

# hand-identified internal (non-exported) functions, from EatonZ's
# Xbox-360-Patch-Collection retail-17559 source -- these are the ones we
# actually care about and they are NOT in the export table.
INTERNAL = {
    0x8015D8EC: 'SataDiskCreateDevice(+region)',
    0x8015D9D8: 'SataDiskAuthenticateDevice',
    0x8015DDDC: 'SataDiskInitialize(+region)',
    0x8009D79C: 'SataDiskDeviceControl(+region)',
    0x8009D3D8: 'SataDiskReadWrite(+region)',
    0x8009D234: 'SataDiskStartReadWrite(+region)',
    0x8009D154: 'SataDiskFinishReadWrite(+region)',
    0x8009D0B8: 'SataDiskVerify(+region)',
    0x8009CF34: 'SataDiskStartVerify(+region)',
    0x800A5F24: 'FatxProcessBootSector(+region)',
    0x8006F264: 'FscInitializeSystem(+region)',
    0x8006F7EC: 'FscMapMountBuffer(+region)',
    0x8006F030: 'FscUnmapMountBuffer(+region)',
    0x8006CB68: 'IopReadWriteFile(+region)',
    0x800BDD40: 'VdDisplayFatalError',
    0x800F98E0: 'WgcAddDevice(+region)',
    0x800F9828: 'WgcAddDevice_prologue',
    0x801A61EC: 'SataDiskUserAddressableSectors(DATA)',
}
for a, n in INTERNAL.items():
    sym.setdefault(a, n)

def label(addr):
    return sym.get(addr)

md = Cs(CS_ARCH_PPC, CS_MODE_32 | CS_MODE_BIG_ENDIAN)
md.detail = True

out = open(os.path.join(SCR, 'disasm', 'kernel_full.txt'), 'w')

# Write symbol table
with open(os.path.join(SCR, 'symbols', 'symbols.txt'), 'w') as sf:
    for a in sorted(sym):
        sf.write(f"{a:08X} {sym[a]}\n")

# PPC instructions are fixed 4 bytes. capstone's disasm() stops dead at the
# first word it can't decode (the kernel starts with a PE header, and there
# are data/padding words scattered through .text), so drive it in a loop that
# resumes 4 bytes past every failure instead of giving up.
count = 0
bad = 0
off = 0
n = len(code)
while off < n:
    addr = BASE + off
    progressed = False
    for insn in md.disasm(code[off:], addr):
        lbl = label(insn.address)
        if lbl:
            out.write(f"\n{'='*70}\n{insn.address:08X} <{lbl}>:\n{'='*70}\n")

        # annotate branch/call targets
        note = ''
        if insn.id in (PPC_INS_BL, PPC_INS_B, PPC_INS_BLA, PPC_INS_BA):
            for op in insn.operands:
                if op.type == PPC_OP_IMM:
                    t = op.imm & 0xFFFFFFFF
                    tn = label(t)
                    if tn:
                        note = f"   ; -> {tn}"
                    break
        out.write(f"{insn.address:08X}  {insn.mnemonic:<10} {insn.op_str}{note}\n")
        count += 1
        off = (insn.address - BASE) + insn.size
        progressed = True

    if not progressed or off < n:
        # emit the undecodable word verbatim and step over it
        if off + 4 <= n:
            w = struct.unpack('>I', code[off:off+4])[0]
            lbl = label(BASE + off)
            if lbl:
                out.write(f"\n{'='*70}\n{BASE+off:08X} <{lbl}>:\n{'='*70}\n")
            out.write(f"{BASE+off:08X}  .long      0x{w:08X}\n")
            bad += 1
        off += 4

out.close()
print(f"disassembled {count} instructions ({bad} undecodable words) -> disasm/kernel_full.txt", file=sys.stderr)
print(f"symbols -> symbols/symbols.txt", file=sys.stderr)
