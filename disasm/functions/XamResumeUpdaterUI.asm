; XamResumeUpdaterUI  0x816C6E40   (xam.xex, retail 17559)
; From dump/xam_17559.bin (base 0x81670000)

816C6E40  mflr       r12
816C6E44  stw        r12, -8(r1)
816C6E48  std        r31, -0x10(r1)
816C6E4C  stwu       r1, -0x70(r1)
816C6E50  addi       r11, r1, 0x58
816C6E54  lis        r10, 0x400
816C6E58  li         r31, 0
816C6E5C  ori        r10, r10, 4
816C6E60  lis        r9, -0x7e94
816C6E64  std        r31, 0(r11)
816C6E68  stw        r10, 0x58(r1)
816C6E6C  addi       r6, r1, 0x50
816C6E70  addi       r5, r1, 0x58
816C6E74  li         r4, 0
816C6E78  addi       r3, r9, 0x6d80
816C6E7C  bl         0x816ba440
816C6E80  cmpwi      r3, 0
816C6E84  blt        0x816c6e94
816C6E88  lwz        r3, 0x50(r1)
816C6E8C  bl         0x816b7b80
816C6E90  b          0x816c6ea0
816C6E94  li         r3, 1
816C6E98  bl         0x816cf8c0
816C6E9C  li         r31, 0x65b
