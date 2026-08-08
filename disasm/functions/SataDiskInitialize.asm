; SataDiskInitialize  0x8015DB18 - 0x8015E113   (retail kernel 17559)
; Extracted from disasm/kernel_full.txt.gz

8015DB18  mflr       r12
8015DB1C  bl         0x8010cba4
8015DB20  stwu       r1, -0x3a0(r1)
8015DB24  lis        r9, -0x7fe3
8015DB28  lis        r10, -0x7ff6
8015DB2C  addi       r7, r9, -0x4f00
8015DB30  lis        r9, -0x7fe3
8015DB34  lis        r11, -0x7ff6
8015DB38  addi       r6, r9, -0x4c00
8015DB3C  lis        r9, -0x7fe6
8015DB40  lis        r4, 0x7fea
8015DB44  addi       r31, r9, 0x60e0
8015DB48  addi       r9, r10, -0x2720
8015DB4C  addi       r8, r11, -0x27f0
8015DB50  li         r5, 0x20
8015DB54  ori        r4, r4, 0x1300
8015DB58  mr         r3, r31
8015DB5C  bl         0x8015e3e0
8015DB60  lis        r11, -0x7ffc
8015DB64  li         r10, 0x50
8015DB68  addi       r11, r11, 0x2db0
8015DB6C  li         r20, 0
8015DB70  addi       r4, r1, 0x68
8015DB74  addi       r3, r1, 0x58
8015DB78  stw        r10, 0x70(r1)
8015DB7C  stw        r11, 0x6c(r1)
8015DB80  stw        r20, 0x68(r1)
8015DB84  bl         0x8008a120   ; -> NtCreateDirectoryObject
8015DB88  or.        r4, r3, r3
8015DB8C  bge        0x8015db9c
8015DB90  lis        r3, -0x1ffd
8015DB94  ori        r3, r3, 0x9e5
8015DB98  bl         0x8009da98
8015DB9C  lwz        r3, 0x58(r1)
8015DBA0  bl         0x80089eb0   ; -> NtClose
8015DBA4  lis        r11, -0x7ffc
8015DBA8  li         r4, 1
8015DBAC  addi       r3, r11, 0x2ed4
8015DBB0  bl         0x8015d820
8015DBB4  lis        r11, -0x7ffc
8015DBB8  mr         r29, r3
8015DBBC  addi       r11, r11, 0x2ec8
8015DBC0  li         r4, 1
8015DBC4  mr         r3, r11
8015DBC8  bl         0x8015d820
8015DBCC  lis        r11, -0x7ffc
8015DBD0  mr         r19, r3
8015DBD4  mr         r30, r20
8015DBD8  addi       r28, r1, 0x88
8015DBDC  addi       r27, r11, 0x2db8
8015DBE0  mr         r5, r30
8015DBE4  mr         r4, r27
8015DBE8  addi       r3, r1, 0xa0
8015DBEC  bl         0x8015bbc0
8015DBF0  li         r4, 0
8015DBF4  addi       r3, r1, 0xa0
8015DBF8  bl         0x8015d820
8015DBFC  addi       r30, r30, 1
8015DC00  stw        r3, 0(r28)
8015DC04  addi       r28, r28, 4
8015DC08  cmplwi     cr6, r30, 2
8015DC0C  blt        cr6, 0x8015dbe0
8015DC10  lis        r11, -0x7ffc
8015DC14  li         r4, 1
8015DC18  addi       r3, r11, 0x2eb8
8015DC1C  bl         0x8015d820
8015DC20  lis        r11, -0x7ffc
8015DC24  mr         r30, r3
8015DC28  addi       r11, r11, 0x2ea8
8015DC2C  li         r4, 0
8015DC30  mr         r3, r11
8015DC34  bl         0x8015d820
8015DC38  lis        r11, -0x7ffc
8015DC3C  mr         r26, r3
8015DC40  addi       r11, r11, 0x2e9c
8015DC44  li         r4, 0
8015DC48  mr         r3, r11
8015DC4C  bl         0x8015d820
8015DC50  lis        r11, -0x7ffc
8015DC54  mr         r25, r3
8015DC58  addi       r11, r11, 0x2e88
8015DC5C  li         r4, 1
8015DC60  mr         r3, r11
8015DC64  bl         0x8015d820
8015DC68  lis        r11, -0x7ffc
8015DC6C  mr         r27, r3
8015DC70  addi       r11, r11, 0x2e70
8015DC74  li         r4, 1
8015DC78  mr         r3, r11
8015DC7C  bl         0x8015d820
8015DC80  lis        r11, -0x7ffc
8015DC84  mr         r24, r3
8015DC88  addi       r11, r11, 0x2e58
8015DC8C  li         r4, 1
8015DC90  mr         r3, r11
8015DC94  bl         0x8015d820
8015DC98  lis        r11, -0x7ffc
8015DC9C  mr         r23, r3
8015DCA0  addi       r11, r11, 0x2e44
8015DCA4  li         r4, 0
8015DCA8  mr         r3, r11
8015DCAC  bl         0x8015d820
8015DCB0  lis        r11, -0x7ffc
8015DCB4  mr         r22, r3
8015DCB8  addi       r11, r11, 0x2e30
8015DCBC  li         r4, 0
8015DCC0  mr         r3, r11
8015DCC4  bl         0x8015d820
8015DCC8  lis        r11, -0x7ffc
8015DCCC  mr         r21, r3
8015DCD0  addi       r4, r11, 0x2e10
8015DCD4  addi       r3, r1, 0x80
8015DCD8  bl         0x80086110   ; -> RtlInitAnsiString
8015DCDC  lis        r11, -0x7ffc
8015DCE0  addi       r3, r1, 0x78
8015DCE4  addi       r4, r11, 0x2df8
8015DCE8  bl         0x80086110   ; -> RtlInitAnsiString
8015DCEC  addi       r4, r1, 0x80
8015DCF0  addi       r3, r1, 0x78
8015DCF4  bl         0x8008aef0   ; -> ObCreateSymbolicLink
8015DCF8  addi       r7, r1, 0x60
8015DCFC  li         r6, 4
8015DD00  stw        r29, 0x6c(r31)
8015DD04  addi       r5, r1, 0x54
8015DD08  li         r4, 6
8015DD0C  li         r3, 2
8015DD10  bl         0x80065700   ; -> ExGetXConfigSetting
8015DD14  cmpwi      r3, 0
8015DD18  bge        0x8015dd20
8015DD1C  stw        r20, 0x54(r1)
8015DD20  lwz        r11, 0x54(r1)
8015DD24  clrlwi.    r11, r11, 0x1f
8015DD28  bne        0x8015e10c
8015DD2C  mr         r3, r31
8015DD30  bl         0x8015e340
8015DD34  cmplwi     r3, 0
8015DD38  beq        0x8015e10c
8015DD3C  bl         0x800750c0   ; -> KeRaiseIrqlToDpcLevel
8015DD40  li         r11, 1
8015DD44  mr         r28, r3
8015DD48  lbz        r3, 0xa1(r31)
8015DD4C  stb        r11, 0xc0(r31)
8015DD50  mr         r11, r20
8015DD54  stw        r11, 0xc4(r31)
8015DD58  addi       r11, r31, 0xc8
8015DD5C  stw        r11, 0xc8(r31)
8015DD60  addi       r11, r31, 0xc8
8015DD64  stw        r11, 0xcc(r31)
8015DD68  bl         0x800750d0   ; -> KfRaiseIrql
8015DD6C  addi       r3, r31, 0x98
8015DD70  bl         0x800701c0   ; -> KeAcquireSpinLockAtRaisedIrql
8015DD74  mr         r11, r13
8015DD78  lis        r10, -0x7ff6
8015DD7C  addi       r11, r11, 0x100
8015DD80  addi       r4, r10, -0x32a0
8015DD84  mr         r3, r31
8015DD88  stw        r11, 0xa4(r31)
8015DD8C  bl         0x8009e638
8015DD90  mr         r3, r28
8015DD94  bl         0x800750f4   ; -> KfLowerIrql
8015DD98  lis        r11, -0x11e2
8015DD9C  addi       r7, r1, 0x90
8015DDA0  ori        r11, r11, 0x5d00
8015DDA4  li         r6, 0
8015DDA8  li         r5, 0
8015DDAC  li         r4, 0
8015DDB0  addi       r3, r31, 0xc0
8015DDB4  std        r11, 0x90(r1)
8015DDB8  bl         0x80073120   ; -> KeWaitForSingleObject
8015DDBC  cmpwi      r3, 0
8015DDC0  bge        0x8015ddd0
8015DDC4  lis        r3, 1
8015DDC8  ori        r3, r3, 0x2143
8015DDCC  bl         0x800bdd40   ; -> VdDisplayFatalError
8015DDD0  lis        r11, 0x7fea
8015DDD4  stb        r20, 0x130a(r11)
8015DDD8  eieio      
8015DDDC  li         r4, 0x42
8015DDE0  mr         r3, r31
8015DDE4  bl         0x8015e2b8
8015DDE8  cmpwi      r3, 0
8015DDEC  bge        0x8015ddfc
8015DDF0  lis        r3, 1
8015DDF4  ori        r3, r3, 0x2144
8015DDF8  bl         0x800bdd40   ; -> VdDisplayFatalError
8015DDFC  addi       r5, r1, 0xe0
8015DE00  li         r4, 0xec
8015DE04  mr         r3, r31
8015DE08  bl         0x8015e218
8015DE0C  cmpwi      r3, 0
8015DE10  bge        0x8015de20
8015DE14  lis        r3, 1
8015DE18  ori        r3, r3, 0x2146
8015DE1C  bl         0x800bdd40   ; -> VdDisplayFatalError
8015DE20  lbz        r11, 0x116(r1)
8015DE24  cmplwi     cr6, r11, 0x54
8015DE28  bne        cr6, 0x8015de44
8015DE2C  lbz        r11, 0x117(r1)
8015DE30  cmplwi     cr6, r11, 0x48
8015DE34  bne        cr6, 0x8015de44
8015DE38  li         r4, 0
8015DE3C  mr         r3, r31
8015DE40  bl         0x8009d9b0
8015DE44  addi       r11, r1, 0x186
8015DE48  addi       r10, r1, 0x18c
8015DE4C  lis        r31, 0x1000
8015DE50  lhbrx      r11, 0, r11
8015DE54  sth        r11, 0x186(r1)
8015DE58  rlwinm.    r9, r11, 0, 0x15, 0x15
8015DE5C  lhbrx      r11, 0, r10
8015DE60  sth        r11, 0x18c(r1)
8015DE64  beq        0x8015de90
8015DE68  rlwinm.    r11, r11, 0, 0x15, 0x15
8015DE6C  beq        0x8015de90
8015DE70  lwz        r11, 0x1ac(r1)
8015DE74  cmplwi     cr6, r11, 0
8015DE78  bne        cr6, 0x8015de88
8015DE7C  addi       r11, r1, 0x1a8
8015DE80  lwbrx      r11, 0, r11
8015DE84  b          0x8015deac
8015DE88  li         r11, -1
8015DE8C  b          0x8015deac
8015DE90  addi       r11, r1, 0x158
8015DE94  lwbrx      r11, 0, r11
8015DE98  cmplw      cr6, r11, r31
8015DE9C  stw        r11, 0x50(r1)
8015DEA0  blt        cr6, 0x8015deb0
8015DEA4  lis        r11, 0xfff
8015DEA8  ori        r11, r11, 0xffff
8015DEAC  stw        r11, 0x50(r1)
8015DEB0  lis        r10, -0x7fe6
8015DEB4  addi       r5, r1, 0x50
8015DEB8  addi       r4, r1, 0xe0
8015DEBC  mr         r3, r29
8015DEC0  stw        r11, 0x61ec(r10)
8015DEC4  rldicl     r11, r11, 9, 0x17
8015DEC8  lwz        r10, 0x18(r29)
8015DECC  rldicr     r11, r11, 0, 0x36
8015DED0  std        r20, 0(r10)
8015DED4  std        r11, 8(r10)
8015DED8  lwz        r11, 0x14(r29)
8015DEDC  rlwinm     r11, r11, 0, 0x1c, 0x1a
8015DEE0  stw        r11, 0x14(r29)
8015DEE4  bl         0x8015d9d8   ; -> SataDiskAuthenticateDevice
8015DEE8  cmplwi     r3, 0
8015DEEC  bne        0x8015df28
8015DEF0  lis        r11, -0x71fc
8015DEF4  lhz        r10, -0x79f6(r11)
8015DEF8  rlwinm.    r10, r10, 0, 0x1d, 0x1d
8015DEFC  beq        0x8015df0c
8015DF00  lhz        r11, -0x79f8(r11)
8015DF04  rlwinm.    r11, r11, 0, 0x1d, 0x1d
8015DF08  bne        0x8015df28
8015DF0C  addi       r3, r1, 0x5c
8015DF10  bl         0x80108e40   ; -> XeKeysGetStatus
8015DF14  lwz        r11, 0x5c(r1)
8015DF18  rlwinm.    r10, r11, 0, 0x1c, 0x1c
8015DF1C  bne        0x8015df28
8015DF20  rlwinm.    r11, r11, 0, 0xd, 0xd
8015DF24  beq        0x8015e10c
8015DF28  lwz        r7, 0x50(r1)
8015DF2C  li         r11, 0x400
8015DF30  lwz        r10, 0x18(r19)
8015DF34  addi       r8, r1, 0x88
8015DF38  rldicr     r6, r7, 9, 0x3f
8015DF3C  li         r9, 2
8015DF40  std        r20, 0(r10)
8015DF44  std        r6, 8(r10)
8015DF48  lwz        r10, 0x14(r19)
8015DF4C  rlwinm     r10, r10, 0, 0x1c, 0x1a
8015DF50  stw        r10, 0x14(r19)
8015DF54  lwz        r10, 0x18(r27)
8015DF58  std        r20, 0(r10)
8015DF5C  std        r20, 8(r10)
8015DF60  lwz        r10, 0x14(r27)
8015DF64  rlwinm     r10, r10, 0, 0x1c, 0x1a
8015DF68  stw        r10, 0x14(r27)
8015DF6C  lwz        r10, 0(r8)
8015DF70  li         r6, 0
8015DF74  li         r5, 0
8015DF78  oris       r4, r6, 0x8000
8015DF7C  rldimi     r5, r11, 9, 0x17
8015DF80  addic.     r9, r9, -1
8015DF84  lwz        r6, 0x18(r10)
8015DF88  addi       r8, r8, 4
8015DF8C  addis      r11, r11, 0x40
8015DF90  std        r5, 0(r6)
8015DF94  std        r4, 8(r6)
8015DF98  lwz        r6, 0x14(r10)
8015DF9C  rlwinm     r6, r6, 0, 0x1c, 0x1a
8015DFA0  stw        r6, 0x14(r10)
8015DFA4  bne        0x8015df6c
8015DFA8  li         r9, 0
8015DFAC  lwz        r10, 0x18(r30)
8015DFB0  lis        r8, 0x20e3
8015DFB4  rldimi     r9, r11, 9, 0x17
8015DFB8  addis      r11, r11, 0x10
8015DFBC  li         r6, 0
8015DFC0  addi       r11, r11, 0x7180
8015DFC4  std        r8, 8(r10)
8015DFC8  li         r8, 0
8015DFCC  std        r9, 0(r10)
8015DFD0  rldimi     r6, r11, 9, 0x17
8015DFD4  lwz        r10, 0x14(r30)
8015DFD8  addis      r11, r11, 8
8015DFDC  li         r4, 0
8015DFE0  rlwinm     r10, r10, 0, 0x1c, 0x1a
8015DFE4  subf       r9, r11, r7
8015DFE8  rldimi     r8, r11, 9, 0x17
8015DFEC  addi       r3, r1, 0x2e0
8015DFF0  stw        r10, 0x14(r30)
8015DFF4  li         r10, 0
8015DFF8  lwz        r11, 0x18(r26)
8015DFFC  rldimi     r10, r9, 9, 0x17
8015E000  std        r6, 0(r11)
8015E004  std        r31, 8(r11)
8015E008  lwz        r11, 0x14(r26)
8015E00C  rlwinm     r11, r11, 0, 0x1c, 0x1a
8015E010  stw        r11, 0x14(r26)
8015E014  lwz        r11, 0x18(r25)
8015E018  std        r8, 0(r11)
8015E01C  std        r10, 8(r11)
8015E020  lwz        r11, 0x14(r25)
8015E024  rlwinm     r11, r11, 0, 0x1c, 0x1a
8015E028  stw        r11, 0x14(r25)
8015E02C  bl         0x800b90c8   ; -> DumpGetRawDumpInfo
8015E030  cmplwi     r3, 0
8015E034  bne        0x8015e0d4
8015E038  lwz        r9, 0x18(r30)
8015E03C  lis        r10, 0x600
8015E040  lwz        r11, 0x18(r24)
8015E044  lis        r8, 0x200
8015E048  lis        r7, 0xce3
8015E04C  lis        r6, 0x800
8015E050  ld         r9, 0(r9)
8015E054  std        r8, 8(r11)
8015E058  add        r9, r9, r10
8015E05C  std        r9, 0(r11)
8015E060  lwz        r11, 0x14(r24)
8015E064  rlwinm     r11, r11, 0, 0x1c, 0x1a
8015E068  stw        r11, 0x14(r24)
8015E06C  lwz        r9, 0x18(r30)
8015E070  lwz        r11, 0x18(r23)
8015E074  ld         r9, 0(r9)
8015E078  std        r10, 8(r11)
8015E07C  std        r9, 0(r11)
8015E080  lwz        r11, 0x14(r23)
8015E084  rlwinm     r11, r11, 0, 0x1c, 0x1a
8015E088  stw        r11, 0x14(r23)
8015E08C  lwz        r10, 0x18(r30)
8015E090  lwz        r11, 0x18(r22)
8015E094  ld         r10, 0(r10)
8015E098  std        r7, 8(r11)
8015E09C  addis      r10, r10, 0xc00
8015E0A0  std        r10, 0(r11)
8015E0A4  lwz        r11, 0x14(r22)
8015E0A8  rlwinm     r11, r11, 0, 0x1c, 0x1a
8015E0AC  stw        r11, 0x14(r22)
8015E0B0  lwz        r10, 0x18(r30)
8015E0B4  lwz        r11, 0x18(r21)
8015E0B8  ld         r10, 0(r10)
8015E0BC  std        r6, 8(r11)
8015E0C0  addis      r10, r10, 0x18e3
8015E0C4  std        r10, 0(r11)
8015E0C8  lwz        r11, 0x14(r21)
8015E0CC  rlwinm     r11, r11, 0, 0x1c, 0x1a
8015E0D0  stw        r11, 0x14(r21)
8015E0D4  lis        r11, -0x7fe9
8015E0D8  li         r4, 1
8015E0DC  addi       r3, r11, 0xb90
8015E0E0  bl         0x80067a58   ; -> HalRegisterPowerDownNotification
8015E0E4  lis        r11, -0x7fe9
8015E0E8  li         r10, 0x20
8015E0EC  addi       r11, r11, 0
8015E0F0  mfmsr      r7
8015E0F4  mtmsrd     r13, 1
8015E0F8  lwarx      r9, 0, r11
8015E0FC  or         r8, r10, r9
8015E100  stwcx.     r8, 0, r11
8015E104  mtmsrd     r7, 1
8015E108  bne        0x8015e0f0
8015E10C  addi       r1, r1, 0x3a0
8015E110  b          0x8010cbf4
