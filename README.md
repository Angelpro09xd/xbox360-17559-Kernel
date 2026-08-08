# Xbox 360 retail kernel 17559 — reverse engineering material

A symbolicated disassembly of the Xbox 360 retail kernel, build **17559**, together with the raw
memory it was produced from and the tooling to regenerate it.

This is the material that the
[unauthenticated disk support](https://github.com/Angelpro09xd/BadStorage) work came out of.

---

## ⚠️ Keep this repository private

The contents are **Microsoft copyrighted material**:

- `dump/kernel_17559.bin` is a copy of the Xbox 360 kernel, taken from a console's own RAM.
- `disasm/` is derived from it, so the same applies.
- `vendor/xboxkrnl.lib` comes from the Xbox 360 SDK, which is not publicly licensed.

Kept privately for interoperability research this is one thing; publishing it is another. Do not
make this repository public, and do not redistribute `vendor/xboxkrnl.lib`.

Findings *derived* from this — addresses, structure layouts, how a function behaves — are facts
about how the system works and are fine to write up publicly. That is what the fork's wiki does.

---

## What is here

| Path | What it is |
|---|---|
| `dump/kernel_17559.bin` | Kernel memory, `0x80000000`–`0x801A8000` (1,736,704 bytes). File offset = `address - 0x80000000`. |
| `symbols/exports_live.txt` | `ordinal,ADDRESS` — 921 ordinals resolved on a live console. |
| `symbols/ordinals.txt` `.json` | `ordinal → name` — 905 exports, parsed out of the XDK's import library. |
| `symbols/symbols.txt` | `ADDRESS → name` — the two joined, 887 functions. |
| `disasm/kernel_full.txt.gz` | Full symbolicated disassembly, 334,644 instructions. |
| `disasm/functions/` | The functions the storage work turned on, extracted individually. |
| `tools/` | Scripts to regenerate everything. |
| `vendor/xboxkrnl.lib` | XDK import library, the source of the ordinal → name mapping. |
| `docs/` | Write-ups. |

## How the symbolication works

The kernel exports by ordinal only — there are no names in the image. Names come from joining two
independent sources:

1. **`xboxkrnl.lib`** from the XDK is an import library, so parsing its COFF members yields
   `ordinal → name` for every export.
2. **The console itself** answers `XexGetProcedureAddress` for each ordinal, giving
   `ordinal → address` for the exact build in front of you.

Join them and you get `name → address` across the whole exported surface. That is enough to
symbolicate every call target in the disassembly — including calls made *by* internal,
non-exported functions, which is what made the storage work tractable.

## Regenerating

```sh
pip install capstone

python3 tools/parse_xdk_lib.py    # vendor/xboxkrnl.lib -> symbols/ordinals.{txt,json}
python3 tools/disassemble.py      # -> disasm/kernel_full.txt + symbols/symbols.txt
```

The disassembler drives Capstone in a loop that resumes four bytes past anything it cannot decode.
Without that it stops at the first non-instruction word — and the image starts with a PE header,
with more data scattered through `.text`. Expect ~334k instructions and ~99k undecodable words.

## Taking the dump

Worth recording, because the obvious approach silently produces garbage.

The kernel and hypervisor live in the Xenon's **encrypted memory region**. The CPU decrypts on
cache-line fill; DMA does not.

Handing a kernel address straight to `WriteFile` yields a file of pure noise — all 256 byte values
roughly equally frequent, ~0.4% zeros — while reporting complete success. Copy word by word with
the CPU into an ordinary buffer first, then write that buffer out.

A good dump is ~26% zeros, with thousands of `4E800020` (`blr`) and `7D8802A6` (`mflr r12`).

`Hvx PeekPoke` is **not** the tool for this. It is for hypervisor-internal addresses, and using it
on kernel addresses hard-hung the console twice. Plain pointer reads from a title are safe and are
what produced this dump.

## Scope

One console, one build. Addresses are valid for **retail 17559 only** and mean nothing on another
build. Everything here was verified against runtime behaviour rather than assumed — where something
is inferred rather than observed, the docs say so.
