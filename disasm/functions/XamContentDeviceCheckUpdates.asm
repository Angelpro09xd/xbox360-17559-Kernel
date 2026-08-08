; XamContentDeviceCheckUpdates  0x816EFCB8   (xam.xex, retail 17559)
; From dump/xam_17559.bin (base 0x81670000)

816EFCB8  mflr       r12
816EFCBC  bl         0x8172d3cc
816EFCC0  stwu       r1, -0x180(r1)
816EFCC4  mr         r31, r3
816EFCC8  mr         r30, r4
816EFCCC  mr         r29, r5
816EFCD0  li         r5, 0x108
816EFCD4  li         r4, 0
816EFCD8  addi       r3, r1, 0x50
816EFCDC  bl         0x81722a30
816EFCE0  stw        r30, 0x154(r1)
816EFCE4  li         r5, 0x104
816EFCE8  mr         r4, r31
816EFCEC  addi       r3, r1, 0x50
816EFCF0  bl         0x8172df20
816EFCF4  li         r11, 0
816EFCF8  lis        r4, 2
816EFCFC  stb        r11, 0x153(r1)
816EFD00  mr         r7, r29
816EFD04  li         r6, 0x108
816EFD08  addi       r5, r1, 0x50
816EFD0C  ori        r4, r4, 0x28
816EFD10  li         r3, 0xfe
816EFD14  bl         0x816a3128
816EFD18  cmpwi      r3, 0
816EFD1C  blt        0x816efd28
816EFD20  li         r3, 0
816EFD24  b          0x816efd40
816EFD28  rlwinm     r11, r3, 0, 3, 0xf
816EFD2C  lis        r10, 7
