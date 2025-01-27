
file.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <.text>:
   0:	00000113          	li	sp,0
   4:	00412183          	lw	gp,4(sp)
   8:	00812203          	lw	tp,8(sp)
   c:	00c12283          	lw	t0,12(sp)
  10:	01012303          	lw	t1,16(sp)
  14:	01412383          	lw	t2,20(sp)
  18:	01812403          	lw	s0,24(sp)
  1c:	01c12483          	lw	s1,28(sp)
  20:	02012503          	lw	a0,32(sp)
  24:	02212583          	lw	a1,34(sp)
  28:	0081a023          	sw	s0,0(gp)
  2c:	0091a223          	sw	s1,4(gp)
  30:	00a1a423          	sw	a0,8(gp)
  34:	00b1a623          	sw	a1,12(gp)
  38:	0041a823          	sw	tp,16(gp)
  3c:	0051aa23          	sw	t0,20(gp)
  40:	0061ac23          	sw	t1,24(gp)
  44:	0071ae23          	sw	t2,28(gp)
  48:	00100613          	li	a2,1
  4c:	02c1a023          	sw	a2,32(gp)

Disassembly of section .heap:

0000000000010000 <_sheap>:
	...

Disassembly of section .stack:

0000000000010200 <_estack>:
	...
