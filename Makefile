

TARGET       := wideboy
VERBOSE      ?= 0

ifeq ($(VERBOSE),0)
V := @
endif


### Output ###

BUILD_DIR := build
ROM       := $(BUILD_DIR)/$(TARGET).z64
ELF       := $(BUILD_DIR)/$(TARGET).elf
LD_SCRIPT := $(TARGET).ld
LD_MAP    := $(BUILD_DIR)/$(TARGET).map


### Tools ###

PYTHON     := python3
N64CKSUM   := $(PYTHON) tools/n64cksum.py

CROSS    := mips-linux-gnu-
AS       := $(CROSS)as
LD       := $(CROSS)ld
OBJCOPY  := $(CROSS)objcopy
STRIP    := $(CROSS)strip

CC_PATH  := tools/gcc_2.7.2/
CC       := $(CC_PATH)/gcc
CC_HOST  := gcc

PRINT := printf '
 ENDCOLOR := \033[0m
 WHITE     := \033[0m
 ENDWHITE  := $(ENDCOLOR)
 GREEN     := \033[0;32m
 ENDGREEN  := $(ENDCOLOR)
 BLUE      := \033[0;34m
 ENDBLUE   := $(ENDCOLOR)
 YELLOW    := \033[0;33m
 ENDYELLOW := $(ENDCOLOR)
 PURPLE    := \033[0;35m
 ENDPURPLE := $(ENDCOLOR)
ENDLINE := \n'

### Compiler Options ###

ASFLAGS        := -G 0 -I common/include -mips3 -mabi=32
CFLAGS         := -O1 -G0 -mips3 -mgp32 -mfp32 -Wa,--vr4300mul-off -D_LANGUAGE_C
CFLAGS         += -Wa,-I,common/include # Add include path for macros
CPPFLAGS       := -I common/include
LDFLAGS        := -T undefined_funcs_auto.txt -T undefined_syms_auto.txt -T $(LD_SCRIPT) -Map $(LD_MAP) --no-check-sections
CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unused-parameter -Wno-sign-compare -Wno-unused-variable -Wno-pointer-to-int-cast -Wno-int-to-pointer-cast -m32
CFLAGS_CHECK   := -fsyntax-only -fsigned-char -nostdinc -fno-builtin -D CC_CHECK -D _LANGUAGE_C -std=gnu90 $(CHECK_WARNINGS)

### Sources ###

# Object files
OBJECTS := $(shell grep -E '$(BUILD_DIR).+\.o' $(LD_SCRIPT) -o)
DEPENDS := $(OBJECTS:=.d)

### Targets ###

all: $(ROM)

-include $(DEPENDS)

$(BUILD_DIR)/assets/numbers.png.o: IMAGE_MODE := i4
$(BUILD_DIR)/assets/buttons.png.o: IMAGE_MODE := i4
$(BUILD_DIR)/assets/frame.png.o: IMAGE_MODE := ci8

# main
$(BUILD_DIR)/main/%.c.o: CPPFLAGS := -I main/include -I libnusys/include -I libultra/include $(CPPFLAGS)

# libnusys
$(BUILD_DIR)/libnusys/%.c.o: CPPFLAGS := -I libnusys/include -I libultra/include $(CPPFLAGS)

# libnustd
$(BUILD_DIR)/libnustd/%.c.o: CPPFLAGS := -I libnustd/include $(CPPFLAGS)

# libultra
$(BUILD_DIR)/libultra/%.c.o: CPPFLAGS := -I libultra/include $(CPPFLAGS)

# libkmc
$(BUILD_DIR)/libkmc/%.c.o: CPPFLAGS := -I libkmc/include $(CPPFLAGS)

# Compile .c files with kmc gcc (use strip to fix objects so that they can be linked with modern gnu ld)
$(BUILD_DIR)/%.c.o: %.c
	@$(PRINT)$(GREEN)Compiling C file: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	@$(CC_HOST) $(CFLAGS_CHECK) $(CPPFLAGS) -MMD -MP -MT $@ -MF $@.d $<
	$(V)export COMPILER_PATH=$(CC_PATH) && $(CC) $(OPTFLAGS) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
	@$(STRIP) $@ -N dummy-symbol-name

# Assemble .s files with modern gnu as
$(BUILD_DIR)/%.s.o: %.s
	@$(PRINT)$(GREEN)Assembling asm file: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	$(V)$(AS) $(ASFLAGS) -o $@ $<

# Create .o files from .bin files.
$(BUILD_DIR)/%.bin.o: %.bin
	@$(PRINT)$(GREEN)objcopying binary file: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	$(V)$(LD) -r -b binary -o $@ $<

# convert png to object
$(BUILD_DIR)/%.png.o: %.png
	@$(PRINT)$(GREEN)converting image: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	$(PYTHON) tools/image/build.py $(IMAGE_MODE) $< $@.bin
	$(V)$(LD) -r -b binary -o $@ $@.bin

# convert png to palette object
$(BUILD_DIR)/%.pal.o: %.png
	@$(PRINT)$(GREEN)converting image: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	$(PYTHON) tools/image/build.py palette $< $@.bin
	$(V)$(LD) -r -b binary -o $@ $@.bin

# Link the .o files into the .elf
$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS)
	@$(PRINT)$(GREEN)Linking elf file: $(ENDGREEN)$(BLUE)$@$(ENDBLUE)$(ENDLINE)
	$(V)$(LD) $(LDFLAGS) -o $@

# Convert the .elf to the final rom
$(ROM): $(BUILD_DIR)/$(TARGET).elf
	@$(PRINT)$(GREEN)Creating z64: $(ENDGREEN)$(BLUE)$@$(ENDBLUE)$(ENDLINE)
	$(V)$(OBJCOPY) --gap-fill 0xFF --pad-to 0x400000 $< $@ -O binary
	$(V)$(N64CKSUM) $@


### Make Settings ###

.PHONY: all

# Remove built-in implicit rules to improve performance
MAKEFLAGS += --no-builtin-rules

# Print target for debugging
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
