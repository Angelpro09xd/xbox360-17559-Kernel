; SataDiskCreateDevice  0x8015D820 - 0x8015D90F   (retail kernel 17559)
; Extracted from disasm/kernel_full.txt.gz

8015D820  mflr       r12
8015D824  bl         0x8010cbc8
8015D828  stwu       r1, -0xd0(r1)
8015D82C  lis        r11, -0x7ffc
8015D830  mr         r28, r4
8015D834  addi       r4, r11, 0x2db0
8015D838  addi       r11, r1, 0x60
8015D83C  mr         r29, r3
8015D840  addi       r3, r1, 0x58
8015D844  stw        r11, 0x5c(r1)
8015D848  li         r11, 0
8015D84C  sth        r11, 0x58(r1)
8015D850  li         r11, 0x40
8015D854  sth        r11, 0x5a(r1)
8015D858  bl         0x80086190   ; -> RtlCopyString
8015D85C  mr         r11, r29
8015D860  mr         r10, r11
8015D864  lbz        r9, 0(r11)
8015D868  addi       r11, r11, 1
8015D86C  cmplwi     cr6, r9, 0
8015D870  bne        cr6, 0x8015d864
8015D874  subf       r11, r10, r11
8015D878  lhz        r31, 0x58(r1)
8015D87C  addi       r10, r1, 0x60
8015D880  addi       r11, r11, -1
8015D884  li         r9, 0x5c
8015D888  slwi       r30, r11, 0
8015D88C  addi       r11, r1, 0x61
8015D890  mr         r4, r29
8015D894  add        r3, r31, r11
8015D898  mr         r5, r30
8015D89C  stbx       r9, r31, r10
8015D8A0  bl         0x8010cc40
8015D8A4  add        r11, r31, r30
8015D8A8  lis        r10, -0x7ffc
8015D8AC  addi       r11, r11, 1
8015D8B0  addi       r3, r10, 0x2dc0
8015D8B4  addi       r8, r1, 0x50
8015D8B8  li         r7, 0
8015D8BC  li         r6, 7
8015D8C0  addi       r5, r1, 0x58
8015D8C4  sth        r11, 0x58(r1)
8015D8C8  li         r4, 0x10
8015D8CC  bl         0x8006aea0   ; -> IoCreateDevice
8015D8D0  or.        r4, r3, r3
8015D8D4  bge        0x8015d8e4
8015D8D8  lis        r3, -0x1ffd
8015D8DC  ori        r3, r3, 0x6ea
8015D8E0  bl         0x8009da98
8015D8E4  lwz        r3, 0x50(r1)
8015D8E8  li         r11, 1
8015D8EC  li         r10, 0x200
8015D8F0  stw        r11, 0x24(r3)
8015D8F4  lwz        r11, 0x14(r3)
8015D8F8  stw        r10, 0x20(r3)
8015D8FC  or         r11, r28, r11
8015D900  ori        r11, r11, 4
8015D904  stw        r11, 0x14(r3)
8015D908  addi       r1, r1, 0xd0
8015D90C  b          0x8010cc18
