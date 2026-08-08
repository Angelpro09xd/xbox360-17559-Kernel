; XamLaunchAvatarEditor  0x816E2ED0   (xam.xex, retail 17559)
; From dump/xam_17559.bin (base 0x81670000)

816E2ED0  mflr       r12
816E2ED4  bl         0x8172d3cc
816E2ED8  stwu       r1, -0x180(r1)
816E2EDC  mr         r30, r3
816E2EE0  mr         r29, r4
816E2EE4  mr         r31, r5
816E2EE8  li         r5, 0x10c
816E2EEC  li         r4, 0
816E2EF0  addi       r3, r1, 0x50
816E2EF4  bl         0x8172d4f0
816E2EF8  lis        r11, 0x4550
816E2EFC  stw        r30, 0x54(r1)
816E2F00  cmplwi     cr6, r31, 0
816E2F04  ori        r11, r11, 0x4958
816E2F08  stw        r29, 0x58(r1)
816E2F0C  stw        r11, 0x50(r1)
816E2F10  beq        cr6, 0x816e2f2c
816E2F14  li         r5, 0x80
816E2F18  mr         r4, r31
816E2F1C  addi       r3, r1, 0x5c
816E2F20  bl         0x8172dda8
816E2F24  li         r11, 0
816E2F28  sth        r11, 0x15a(r1)
816E2F2C  lis        r11, -0x7ea0
