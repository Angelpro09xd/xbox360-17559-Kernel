; XamAvatarInitialize  0x816755E8   (xam.xex, retail 17559)
; From dump/xam_17559.bin (base 0x81670000)

816755E8  mflr       r12
816755EC  stw        r12, -8(r1)
816755F0  std        r30, -0x18(r1)
816755F4  std        r31, -0x10(r1)
816755F8  stwu       r1, -0x90(r1)
816755FC  addi       r30, r1, 0x50
81675600  li         r11, 0
81675604  addi       r31, r1, 0x58
81675608  li         r10, 5
8167560C  addi       r9, r6, -4
81675610  std        r11, 0(r30)
81675614  std        r11, 8(r30)
81675618  std        r11, 0x10(r30)
8167561C  std        r11, 0x18(r30)
81675620  mtctr      r10
81675624  std        r11, 0x20(r30)
81675628  lwzu       r11, 4(r9)
8167562C  stwu       r11, 4(r31)
81675630  bdnz       0x81675628
81675634  lis        r11, 0x10
81675638  stw        r3, 0x50(r1)
8167563C  stw        r4, 0x54(r1)
81675640  li         r6, 1
81675644  stw        r5, 0x58(r1)
