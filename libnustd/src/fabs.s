.include "macro.inc"

/* assembler directives */
.set noat
.set noreorder
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

glabel fabs
/* 1FFA0 80044BA0 03E00008 */  jr         $ra
/* 1FFA4 80044BA4 46206005 */   abs.d     $f0, $f12
/* 1FFA8 80044BA8 00000000 */  nop
/* 1FFAC 80044BAC 00000000 */  nop
