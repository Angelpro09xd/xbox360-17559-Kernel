; SataDiskAuthenticateDevice  0x8015D9D8 - 0x8015DB17   (retail kernel 17559)
; Extracted from disasm/kernel_full.txt.gz

8015D9D8  li         r3, 1
8015D9DC  blr        
8015D9E0  stwu       r1, -0x2a0(r1)
8015D9E4  li         r11, 0x2000
8015D9E8  mr         r30, r3
8015D9EC  mr         r31, r4
8015D9F0  mr         r29, r5
8015D9F4  addi       r7, r1, 0x50
8015D9F8  li         r6, 0x200
8015D9FC  std        r11, 0x50(r1)
8015DA00  addi       r5, r1, 0x80
8015DA04  mr         r4, r30
8015DA08  li         r3, 2
8015DA0C  bl         0x8006b928   ; -> IoSynchronousFsdRequest
8015DA10  cmpwi      r3, 0
8015DA14  bge        0x8015da24
8015DA18  lis        r3, 1
8015DA1C  ori        r3, r3, 0x2145
8015DA20  bl         0x800bdd40   ; -> VdDisplayFatalError
8015DA24  li         r5, 0x200
8015DA28  addi       r4, r1, 0x80
8015DA2C  li         r3, 0x1001
8015DA30  bl         0x80108e78   ; -> XeKeysSetKey
8015DA34  li         r5, 0x14
8015DA38  addi       r4, r1, 0x80
8015DA3C  addi       r3, r31, 0x14
8015DA40  bl         0x8015d910
8015DA44  cmplwi     r3, 0
8015DA48  beq        0x8015db08
8015DA4C  li         r5, 8
8015DA50  addi       r4, r1, 0x94
8015DA54  addi       r3, r31, 0x2e
8015DA58  bl         0x8015d910
8015DA5C  cmplwi     r3, 0
8015DA60  beq        0x8015db08
8015DA64  li         r5, 0x28
8015DA68  addi       r4, r1, 0x9c
8015DA6C  addi       r3, r31, 0x36
8015DA70  bl         0x8015d910
8015DA74  cmplwi     r3, 0
8015DA78  beq        0x8015db08
8015DA7C  addi       r11, r1, 0xd8
8015DA80  lwbrx      r31, 0, r11
8015DA84  lis        r11, -0x7fe6
8015DA88  lwz        r11, 0x61ec(r11)
8015DA8C  cmplw      cr6, r31, r11
8015DA90  bgt        cr6, 0x8015db08
8015DA94  cmplwi     cr6, r31, 0x15c
8015DA98  beq        cr6, 0x8015db08
8015DA9C  li         r10, 0x14
8015DAA0  addi       r9, r1, 0x60
8015DAA4  li         r8, 0
8015DAA8  li         r7, 0
8015DAAC  li         r6, 0
8015DAB0  li         r5, 0
8015DAB4  li         r4, 0x5c
8015DAB8  addi       r3, r1, 0x80
8015DABC  bl         0x80114d78   ; -> XeCryptSha
8015DAC0  addi       r5, r1, 0xdc
8015DAC4  addi       r4, r1, 0x60
8015DAC8  li         r3, 2
8015DACC  bl         0x80109c90   ; -> XeKeysVerifyRSASignature
8015DAD0  cmpwi      r3, 0
8015DAD4  beq        0x8015db08
8015DAD8  lis        r11, -0x7fe6
8015DADC  addi       r4, r1, 0xc4
8015DAE0  addi       r3, r11, 0x60c0
8015DAE4  li         r5, 0x14
8015DAE8  bl         0x8010cc40
8015DAEC  mr         r3, r30
8015DAF0  bl         0x8015d950
8015DAF4  cmpwi      r3, 0
8015DAF8  blt        0x8015db08
8015DAFC  li         r3, 1
8015DB00  stw        r31, 0(r29)
8015DB04  b          0x8015db0c
8015DB08  li         r3, 0
8015DB0C  addi       r1, r1, 0x2a0
8015DB10  b          0x8010cc1c
8015DB14  .long      0x00000000
