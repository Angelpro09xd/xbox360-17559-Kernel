# Storage subsystem findings (retail 17559)

Everything below was verified against runtime behaviour on a real console, not just read off the
disassembly. Where something is inferred rather than observed, it says so.

## SataDiskInitialize — the shape of it

Entry `0x8015DB18`, ends `0x8015E113`, stack frame `0x3A0`, **takes no arguments** — `r3` is
overwritten at `0x8015DB58` before any use, and the global it works on (`0x801A60E0`) is computed
internally at `0x8015DB44`.

It does two separate things, in this order:

**Before the authentication gate** it creates all twelve hard disk device objects via
`SataDiskCreateDevice` → `IoCreateDevice`:

```
PhysicalDisk   Partition0   Partition1   Cache0   Cache1   DumpPartition
SystemPartition   WindowsPartition   TitleURLCachePartition
SystemURLCachePartition   SystemExtPartition   SystemAuxPartition
```

**After the gate** (`0x8015DF28`–`0x8015E0D0`) it fills in each device's `PartitionInformation`
and clears `DO_DEVICE_INITIALIZING`.

So when authentication fails, the objects exist but stay half-built: zeroed geometry, flag still
set. `PhysicalDisk` is the exception — it is completed before the gate, which is why it keeps
working and reports the right size on a disk that failed authentication.

## The authentication gate

```asm
8015DEE4  bl      0x8015D9D8      ; SataDiskAuthenticateDevice
8015DEE8  cmplwi  r3, 0
8015DEEC  bne     0x8015DF28      ; authenticated -> initialise the partitions
; not authenticated, three ways out:
8015DEF0  lis     r11, 0x8E04     ; hardware registers
8015DEF4  lhz     r10, 0x860A(r11)
8015DEF8  rlwinm. r10, r10, 0,29,29
8015DEFC  beq     0x8015DF0C
8015DF00  lhz     r11, 0x8608(r11)
8015DF04  rlwinm. r11, r11, 0,29,29
8015DF08  bne     0x8015DF28
8015DF0C  addi    r3, r1, 0x5C
8015DF10  bl      0x80108E40      ; XeKeysGetStatus (ordinal 575)
8015DF14  lwz     r11, 0x5C(r1)
8015DF18  rlwinm. r10, r11, 0,28,28   ; bit 0x8
8015DF1C  bne     0x8015DF28
8015DF20  rlwinm. r11, r11, 0,13,13   ; bit 0x40000
8015DF24  beq     0x8015E10C      ; not a devkit -> skip initialisation entirely
8015DF28  <partition initialisation>
```

Bit `0x40000` is the devkit flag — the same one Bad Storage checks to tell devkit from retail.
Devkits initialise their partitions without authenticating at all, which is why they accept any
drive.

## SataDiskAuthenticateDevice

The security sector is at **byte offset `0x2000`** on `PhysicalDisk` — sector 16 from the *start*
of the drive:

```asm
8015D9E4  li   r11, 0x2000              ; offset
8015D9F8  li   r6, 0x200                ; 512 bytes
8015D9FC  std  r11, 0x50(r1)
8015DA0C  bl   IoSynchronousFsdRequest
8015DA30  bl   XeKeysSetKey(0x1001, buffer, 0x200)
8015DA40  bl   0x8015D910               ; digest compare
8015DA48  beq  0x8015DB08              ; mismatch -> return FALSE
```

It is **not** sixteen sectors from the *end* of the drive. That figure circulates in notes and is
wrong — zeroing there changes nothing and the disk keeps authenticating. Confirmed the hard way.

## SataDiskCreateDevice

`PDEVICE_OBJECT SataDiskCreateDevice(const char* name, ULONG flags)` at `0x8015D820`. Builds
`\Device\Harddisk0\<name>` and calls:

```asm
8015D8B0  r3 = 0x80042DC0   ; DriverObject
8015D8C8  r4 = 0x10         ; DeviceExtensionSize
8015D8C0  r5 = &name        ; OBJECT_STRING
8015D8BC  r6 = 7            ; FILE_DEVICE_DISK
8015D8B8  r7 = 0            ; Exclusive
8015D8B4  r8 = &out
8015D8CC  bl IoCreateDevice
8015D8EC  SectorSize = 0x200
8015D8F0  AlignmentRequirement = 1
8015D904  Flags |= (flags | 4)
```

`DeviceExtensionSize` is `0x10`, so the SATA extension is exactly
`{LARGE_INTEGER StartingOffset; LARGE_INTEGER PartitionLength;}` — 16 bytes, nothing more.

`0x8015D8B0` is the only place in the whole kernel that references `0x80042DC0`, which is how the
driver object was identified.

## Flags

`DO_DEVICE_INITIALIZING` is **`0x10`** here, not the `0x80` it is on Windows. From `IoCreateDevice`:

```asm
8006B00C  li  r11, 0x10
8006B01C  stw r11, 0x14(r10)   ; Flags = 0x10
8006B02C  ori r10, r10, 8      ; |= 8 for a named device
```

Which predicts, and matches what a console reports:

| Device | flags argument | Fresh | Initialised |
|---|---|---|---|
| PhysicalDisk | 1 | `0x1D` | `0x0D` |
| Partition0 | 1 | `0x1D` | `0x0D` |
| Partition1 | 0 | `0x1C` | `0x0C` |

A device with `0x10` still set makes `ObReferenceObjectByName` return `0xC000000E`
`STATUS_NO_SUCH_DEVICE` — *not* `0xC0000034` `STATUS_OBJECT_NAME_NOT_FOUND`. The name resolves; the
device is refused. Confusing the two costs a lot of time.

## Structures

**DEVICE_OBJECT**, size `0x50`, extension immediately after:

| Offset | Field |
|---|---|
| `0x08` | `DriverObject` |
| `0x14` | `Flags` |
| `0x18` | `DeviceExtension` |
| `0x1C` | `DeviceType` |
| `0x20` | `SectorSize` |
| `0x24` | `AlignmentRequirement` |

**Object directory**: 13-bucket hash table, from `NtQueryDirectoryObject`'s walk
(`0x8008A22C`–`0x8008A264`):

| Offset | Field |
|---|---|
| `0x00` | next entry in bucket chain |
| `0x08` | name length (`USHORT`) |
| `0x0C` | pointer to name text |
| `0x20` | the object body |

The `0x20` was *measured*, not read from code: the `PhysicalDisk` entry sat at `0x3A0A7C88` while
`ObReferenceObjectByName` returned `0x3A0A7CA8` for the same name.

## Partition map

From `0x8015DF28`–`0x8015E0D0`. `S` = 512-byte sector count from `SataDiskUserAddressableSectors`
(`0x801A61EC`).

| Device | StartingOffset | PartitionLength |
|---|---|---|
| PhysicalDisk | 0 | `S × 512` |
| Partition0 | 0 | `S × 512` |
| Cache0 | `0x80000` | `0x80000000` |
| Cache1 | `0x80080000` | `0x80000000` |
| DumpPartition | `0x100080000` | `0x20E30000` |
| SystemURLCachePartition | `0x100080000` | `0x6000000` |
| TitleURLCachePartition | `0x106080000` | `0x2000000` |
| SystemExtPartition | `0x10C080000` | `0xCE30000` |
| SystemAuxPartition | `0x118EB0000` | `0x8000000` |
| SystemPartition | `0x120EB0000` | `0x10000000` |
| **Partition1** | **`0x130EB0000`** | `S × 512 − 0x130EB0000` |
| WindowsPartition | 0 | 0 |

Two cross-checks that the decoding is right: the layout comes out perfectly contiguous, and
`0x130EB0000` is the content-partition offset Bad Storage already hardcodes.

The last four are conditional on `DumpGetRawDumpInfo()` (`0x800B90C8`) returning zero.

## Xbox API signatures that differ from Windows

The Windows form compiles fine and then corrupts memory, so these are worth knowing.

### NtQueryDirectoryObject — six parameters, no RestartScan

```c
NTSTATUS NtQueryDirectoryObject(
    HANDLE  DirectoryHandle,    // r3
    PVOID   Buffer,             // r4
    ULONG   Length,             // r5
    BOOLEAN ReturnSingleEntry,  // r6
    PULONG  Context,            // r7
    PULONG  ReturnLength);      // r8
```

The seven-parameter Windows form puts a `BOOLEAN` where `PULONG Context` belongs. The kernel writes
through it with no NULL check (`stw r11, 0(r23)` at `0x8008A2C0`) — an unaligned store to address 0
or 1, which black-screens the console.

`ReturnSingleEntry` also means *"ignore Context, start from the first entry"*, not *"return one
entry"*. Iterating means passing `FALSE` with a real `Context`.

Returned entries are `{USHORT Length; USHORT MaximumLength; PCHAR Buffer; ULONG TypeWord;}` with the
name inline at `+0x0C` — not two `STRING`s. `TypeWord` is shared across objects of the same type.

### OBJECT_ATTRIBUTES — 12 bytes

```c
typedef struct _OBJECT_ATTRIBUTES {
    HANDLE          RootDirectory;
    POBJECT_STRING  ObjectName;
    ULONG           Attributes;
} OBJECT_ATTRIBUTES;
```

Confirmed from `SataDiskInitialize`'s own `NtCreateDirectoryObject` call at
`0x8015DB70`–`0x8015DB84`.

## Things that turned out not to matter

- **Patching `SataDiskAuthenticateDevice`.** The gate runs once at boot. XeUnshackle already applies
  that exact patch as part of its Freeboot set — reading the bytes before writing shows
  `38600001 4E800020` already there — and the disk still does not mount.
- **Re-running the initialisation.** No warm reboot preserves patches; every reset reloads clean
  from NAND. Hot-swapping the drive triggers the boot animation and drops the exploit.
- **Bad Storage deleting the partitions.** It is loaded on every boot — XeUnshackle does it with
  `LoadLibrary("GAME:\\BadStorage.xex.dll")`, outside the `launch.ini` plugin list, which is easy to
  miss — but with `XboxHardwareInfo->Flags & 0x20` clear it returns before touching any device
  object. There is no `IoDeleteDevice` anywhere in the kernel's SATA region.
