; IoCreateDevice  0x8006AEA0 - 0x8006B14F   (retail kernel 17559)
; Extracted from disasm/kernel_full.txt.gz

8006AEA0  mflr       r12
8006AEA4  bl         0x8010cbb8
8006AEA8  stwu       r1, -0xb0(r1)
8006AEAC  mr         r27, r5
8006AEB0  mr         r25, r3
8006AEB4  mr         r28, r4
8006AEB8  mr         r30, r6
8006AEBC  mr         r24, r8
8006AEC0  cmplwi     cr6, r27, 0
8006AEC4  beq        cr6, 0x8006aecc
8006AEC8  ori        r7, r7, 0x10
8006AECC  rlwinm.    r11, r7, 0, 0x13, 0x13
8006AED0  bne        0x8006aed8
8006AED4  ori        r7, r7, 0x2000
8006AED8  li         r26, 0
8006AEDC  stw        r7, 0x60(r1)
8006AEE0  clrlwi.    r11, r28, 0x1d
8006AEE4  stw        r27, 0x5c(r1)
8006AEE8  stw        r26, 0x58(r1)
8006AEEC  beq        0x8006aef4
8006AEF0  subfic     r11, r11, 8
8006AEF4  add        r11, r11, r28
8006AEF8  lis        r10, -0x7ffc
8006AEFC  addi       r31, r11, 0x50
8006AF00  addi       r3, r10, 0xb08
8006AF04  addi       r6, r1, 0x50
8006AF08  addi       r4, r1, 0x58
8006AF0C  mr         r5, r31
8006AF10  bl         0x8008b468   ; -> ObCreateObject
8006AF14  or.        r29, r3, r3
8006AF18  blt        0x8006b098
8006AF1C  mr         r5, r31
8006AF20  lwz        r3, 0x50(r1)
8006AF24  li         r4, 0
8006AF28  bl         0x8010d110
8006AF2C  lwz        r7, 0x50(r1)
8006AF30  li         r10, 3
8006AF34  addi       r11, r28, 0x50
8006AF38  li         r9, 1
8006AF3C  cmplwi     cr6, r30, 7
8006AF40  sth        r10, 0(r7)
8006AF44  lwz        r10, 0x50(r1)
8006AF48  sth        r11, 2(r10)
8006AF4C  lwz        r11, 0x50(r1)
8006AF50  stb        r30, 0x1c(r11)
8006AF54  lwz        r11, 0x50(r1)
8006AF58  addi       r10, r11, 0x38
8006AF5C  addi       r11, r10, 8
8006AF60  stb        r9, 0(r10)
8006AF64  stw        r9, 4(r10)
8006AF68  stw        r11, 0(r11)
8006AF6C  stw        r11, 4(r11)
8006AF70  beq        cr6, 0x8006b000
8006AF74  cmplwi     cr6, r30, 0x3a
8006AF78  beq        cr6, 0x8006b000
8006AF7C  cmplwi     cr6, r30, 0x3e
8006AF80  beq        cr6, 0x8006b000
8006AF84  cmplwi     cr6, r30, 0x2d
8006AF88  beq        cr6, 0x8006b000
8006AF8C  cmplwi     cr6, r30, 2
8006AF90  beq        cr6, 0x8006b000
8006AF94  cmplwi     cr6, r30, 0x3c
8006AF98  beq        cr6, 0x8006b000
8006AF9C  cmplwi     cr6, r30, 0x3d
8006AFA0  beq        cr6, 0x8006b000
8006AFA4  cmplwi     cr6, r30, 0x24
8006AFA8  beq        cr6, 0x8006b000
8006AFAC  cmplwi     cr6, r30, 0x40
8006AFB0  beq        cr6, 0x8006b000
8006AFB4  cmplwi     cr6, r30, 0x41
8006AFB8  beq        cr6, 0x8006b000
8006AFBC  cmplwi     cr6, r30, 0x42
8006AFC0  beq        cr6, 0x8006b000
8006AFC4  cmplwi     cr6, r30, 0x43
8006AFC8  beq        cr6, 0x8006b000
8006AFCC  cmplwi     cr6, r30, 0x44
8006AFD0  beq        cr6, 0x8006b000
8006AFD4  cmplwi     cr6, r30, 0x45
8006AFD8  beq        cr6, 0x8006b000
8006AFDC  cmplwi     cr6, r30, 0x46
8006AFE0  beq        cr6, 0x8006b000
8006AFE4  cmplwi     cr6, r30, 0x48
8006AFE8  beq        cr6, 0x8006b000
8006AFEC  cmplwi     cr6, r30, 0x49
8006AFF0  beq        cr6, 0x8006b000
8006AFF4  lwz        r11, 0x50(r1)
8006AFF8  stw        r11, 0xc(r11)
8006AFFC  b          0x8006b008
8006B000  lwz        r11, 0x50(r1)
8006B004  stw        r26, 0xc(r11)
8006B008  lwz        r10, 0x50(r1)
8006B00C  li         r11, 0x10
8006B010  cmplwi     cr6, r27, 0
8006B014  stw        r26, 0x24(r10)
8006B018  lwz        r10, 0x50(r1)
8006B01C  stw        r11, 0x14(r10)
8006B020  beq        cr6, 0x8006b034
8006B024  lwz        r11, 0x50(r1)
8006B028  lwz        r10, 0x14(r11)
8006B02C  ori        r10, r10, 8
8006B030  stw        r10, 0x14(r11)
8006B034  lwz        r11, 0x50(r1)
8006B038  cmplwi     cr6, r28, 0
8006B03C  beq        cr6, 0x8006b04c
8006B040  addi       r10, r11, 0x50
8006B044  stw        r10, 0x18(r11)
8006B048  b          0x8006b050
8006B04C  stw        r26, 0x18(r11)
8006B050  lwz        r11, 0x50(r1)
8006B054  stb        r9, 0x1e(r11)
8006B058  lwz        r11, 0x50(r1)
8006B05C  addi       r3, r11, 0x28
8006B060  bl         0x80073da8   ; -> KeInitializeDeviceQueue
8006B064  addi       r6, r1, 0x54
8006B068  li         r5, 1
8006B06C  lwz        r3, 0x50(r1)
8006B070  addi       r4, r1, 0x58
8006B074  bl         0x8008b618   ; -> ObInsertObject
8006B078  or.        r29, r3, r3
8006B07C  blt        0x8006b098
8006B080  lwz        r11, 0x50(r1)
8006B084  stw        r25, 8(r11)
8006B088  lwz        r3, 0x54(r1)
8006B08C  bl         0x80089eb0   ; -> NtClose
8006B090  lwz        r11, 0x50(r1)
8006B094  b          0x8006b09c
8006B098  mr         r11, r26
8006B09C  mr         r3, r29
8006B0A0  stw        r11, 0(r24)
8006B0A4  addi       r1, r1, 0xb0
8006B0A8  b          0x8010cc08
8006B0AC  .long      0x00000000
8006B0B0  mflr       r12
8006B0B4  bl         0x8010cbc8
8006B0B8  stwu       r1, -0xb0(r1)
8006B0BC  li         r11, 8
8006B0C0  mr         r29, r4
8006B0C4  mr         r28, r5
8006B0C8  mr         r31, r6
8006B0CC  li         r30, 0
8006B0D0  sth        r11, 0x50(r1)
8006B0D4  li         r11, 0x30
8006B0D8  cmplwi     cr6, r7, 0
8006B0DC  sth        r11, 0x52(r1)
8006B0E0  beq        cr6, 0x8006b0f0
8006B0E4  ld         r11, 0(r7)
8006B0E8  std        r11, 0x60(r1)
8006B0EC  b          0x8006b0f4
8006B0F0  std        r30, 0x60(r1)
8006B0F4  lis        r11, -0x7ffc
8006B0F8  sth        r8, 0x6c(r1)
8006B0FC  mr         r6, r3
8006B100  sth        r9, 0x6e(r1)
8006B104  addi       r4, r11, 0xb24
8006B108  lwz        r11, 0x104(r1)
8006B10C  addi       r5, r1, 0x50
8006B110  stw        r10, 0x74(r1)
8006B114  mr         r3, r28
8006B118  stw        r30, 0x5c(r1)
8006B11C  stw        r29, 0x78(r1)
8006B120  stw        r30, 0x54(r1)
8006B124  stw        r11, 0x68(r1)
8006B128  lwz        r11, 0x10c(r1)
8006B12C  stw        r11, 0x70(r1)
8006B130  bl         0x8008bb10   ; -> ObOpenObjectByName
8006B134  lwz        r11, 0x58(r1)
8006B138  lwz        r10, 0x54(r1)
8006B13C  stw        r11, 4(r31)
8006B140  stw        r10, 0(r31)
8006B144  addi       r1, r1, 0xb0
8006B148  b          0x8010cc18
8006B14C  .long      0x00000000
