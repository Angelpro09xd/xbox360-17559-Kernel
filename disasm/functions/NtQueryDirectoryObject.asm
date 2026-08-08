; NtQueryDirectoryObject  0x8008A1B0 - 0x8008A2EF   (retail kernel 17559)
; Extracted from disasm/kernel_full.txt.gz

8008A1B0  mflr       r12
8008A1B4  bl         0x8010cbb0
8008A1B8  stwu       r1, -0xb0(r1)
8008A1BC  mr         r28, r5
8008A1C0  mr         r30, r4
8008A1C4  mr         r31, r6
8008A1C8  mr         r23, r7
8008A1CC  mr         r22, r8
8008A1D0  cmplwi     cr6, r28, 0xc
8008A1D4  bge        cr6, 0x8008a1e4
8008A1D8  lis        r3, -0x4000
8008A1DC  ori        r3, r3, 0xd
8008A1E0  b          0x8008a2e8
8008A1E4  lis        r11, -0x7ffc
8008A1E8  addi       r5, r1, 0x50
8008A1EC  addi       r4, r11, 0x2660
8008A1F0  bl         0x8008ba50   ; -> ObReferenceObjectByHandle
8008A1F4  cmpwi      r3, 0
8008A1F8  blt        0x8008a2e8
8008A1FC  lis        r24, -0x8000
8008A200  clrlwi.    r11, r31, 0x18
8008A204  ori        r24, r24, 0x1a
8008A208  li         r25, 0
8008A20C  li         r27, 0
8008A210  bne        0x8008a218
8008A214  lwz        r27, 0(r23)
8008A218  lis        r11, -0x7fe6
8008A21C  li         r31, 0
8008A220  addi       r29, r11, 0x5e94
8008A224  mr         r3, r29
8008A228  bl         0x80070138   ; -> KfAcquireSpinLock
8008A22C  lwz        r10, 0x50(r1)
8008A230  mr         r26, r3
8008A234  li         r9, 0
8008A238  lwz        r11, 0(r10)
8008A23C  b          0x8008a250
8008A240  cmplw      cr6, r31, r27
8008A244  beq        cr6, 0x8008a26c
8008A248  lwz        r11, 0(r11)
8008A24C  addi       r31, r31, 1
8008A250  cmplwi     r11, 0
8008A254  bne        0x8008a240
8008A258  addi       r9, r9, 1
8008A25C  addi       r10, r10, 4
8008A260  cmplwi     cr6, r9, 0xd
8008A264  blt        cr6, 0x8008a238
8008A268  b          0x8008a2c4
8008A26C  lhz        r5, 8(r11)
8008A270  addi       r25, r5, 0xc
8008A274  cmplw      cr6, r25, r28
8008A278  bgt        cr6, 0x8008a284
8008A27C  li         r24, 0
8008A280  b          0x8008a290
8008A284  lis        r24, -0x4000
8008A288  addi       r5, r28, -0xc
8008A28C  ori        r24, r24, 0x23
8008A290  lwz        r10, 0x18(r11)
8008A294  addi       r3, r30, 0xc
8008A298  lwz        r10, 0x18(r10)
8008A29C  stw        r3, 4(r30)
8008A2A0  stw        r10, 8(r30)
8008A2A4  lhz        r10, 8(r11)
8008A2A8  sth        r10, 0(r30)
8008A2AC  lhz        r10, 8(r11)
8008A2B0  sth        r10, 2(r30)
8008A2B4  lwz        r4, 0xc(r11)
8008A2B8  bl         0x8010cc40
8008A2BC  addi       r11, r27, 1
8008A2C0  stw        r11, 0(r23)
8008A2C4  mr         r4, r26
8008A2C8  mr         r3, r29
8008A2CC  bl         0x8007018c   ; -> KfReleaseSpinLock
8008A2D0  lwz        r3, 0x50(r1)
8008A2D4  bl         0x8008b928   ; -> ObDereferenceObject
8008A2D8  cmplwi     cr6, r22, 0
8008A2DC  beq        cr6, 0x8008a2e4
8008A2E0  stw        r25, 0(r22)
8008A2E4  mr         r3, r24
8008A2E8  addi       r1, r1, 0xb0
8008A2EC  b          0x8010cc00
