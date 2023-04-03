#!/usr/bin/env bash

mkdir build

COMPILER_PATH=gcc-2.7.2/ gcc-2.7.2/gcc -c -G0 -mgp32 -mfp32 -nostdinc -I main/include -I common/include  -O2 -mips3 -g3 -Wa,-I,common/include main/src/1050.c   -o build/1050.o && mips-linux-gnu-objcopy -N main/src/1050.c build/1050.o
COMPILER_PATH=gcc-2.7.2/ gcc-2.7.2/gcc -c -G0 -mgp32 -mfp32 -nostdinc -I main/include -I common/include  -O2 -mips3 -g3 -Wa,-I,common/include main/src/19D0.c   -o build/19D0.o && mips-linux-gnu-objcopy -N main/src/19D0.c build/19D0.o
COMPILER_PATH=gcc-2.7.2/ gcc-2.7.2/gcc -c -G0 -mgp32 -mfp32 -nostdinc -I main/include -I common/include  -O2 -mips3 -g3 -Wa,-I,common/include main/src/1AF0.c   -o build/1AF0.o && mips-linux-gnu-objcopy -N main/src/1AF0.c build/1AF0.o
COMPILER_PATH=gcc-2.7.2/ gcc-2.7.2/gcc -c -G0 -mgp32 -mfp32 -nostdinc -I main/include -I common/include  -O2 -mips3 -g3 -Wa,-I,common/include main/src/4030.c   -o build/4030.o && mips-linux-gnu-objcopy -N main/src/4030.c build/4030.o
COMPILER_PATH=gcc-2.7.2/ gcc-2.7.2/gcc -c -G0 -mgp32 -mfp32 -nostdinc -I main/include -I common/include  -O2 -mips3 -g3 -Wa,-I,common/include main/src/4400.c   -o build/4400.o && mips-linux-gnu-objcopy -N main/src/4400.c build/4400.o
COMPILER_PATH=gcc-2.7.2/ gcc-2.7.2/gcc -c -G0 -mgp32 -mfp32 -nostdinc -I main/include -I common/include  -O2 -mips3 -g3 -Wa,-I,common/include main/src/5140.c   -o build/5140.o && mips-linux-gnu-objcopy -N main/src/5140.c build/5140.o
COMPILER_PATH=gcc-2.7.2/ gcc-2.7.2/gcc -c -G0 -mgp32 -mfp32 -nostdinc -I main/include -I common/include  -O2 -mips3 -g3 -Wa,-I,common/include main/src/5330.c   -o build/5330.o && mips-linux-gnu-objcopy -N main/src/5330.c build/5330.o

mips-linux-gnu-as  -EB -march=vr4300 -mtune=vr4300 -Icommon/include data/main.data.s -o build/main.data.o
mips-linux-gnu-as  -EB -march=vr4300 -mtune=vr4300 -Icommon/include data/2D6B0.data.s -o build/2D6B0.data.o


mips-linux-gnu-ld --unresolved-symbols=ignore-all -Map $mapfile --no-check-sections  build/1AF0.o build/19D0.o build/1050.o build/4030.o build/4400.o build/5140.o build/5330.o build/main.data.o build/2D6B0.data.o -o out.elf
