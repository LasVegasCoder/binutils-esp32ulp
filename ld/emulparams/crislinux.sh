# This is an approximation of what we want for a real linux system (with MMU and ELF).
MACHINE=
SCRIPT_NAME=elf
OUTPUT_FORMAT="elf32-cris"
ARCH=cris
TEMPLATE_NAME=elf32
ENTRY=__start
# Needed?  Perhaps should be page-size alignment.
ALIGNMENT=32
GENERATE_SHLIB_SCRIPT=yes

# Is this high enough and low enough?
TEXT_START_ADDR=0x80000

MAXPAGESIZE=8192

# FIXME: GOT, PLT...

TEXT_START_SYMBOLS='PROVIDE (__Stext = .);
__start = DEFINED(__start) ? __start : 
  DEFINED(_start) ? _start : 
    DEFINED(start) ? start :
      DEFINED(.startup) ? .startup + 2 : 2;
'

# Smuggle an "OTHER_TEXT_END_SYMBOLS" here.
OTHER_READONLY_SECTIONS='PROVIDE (__Etext = .);'
DATA_START_SYMBOLS='PROVIDE (__Sdata = .);'

# Smuggle an "OTHER_DATA_END_SYMBOLS" here.
OTHER_GOT_SECTIONS='PROVIDE (__Edata = .);'
OTHER_BSS_SYMBOLS='PROVIDE (__Sbss = .);'
OTHER_BSS_END_SYMBOLS='PROVIDE (__Ebss = .);'

# Smuggle an "OTHER_ALL_END_SYMBOLS" here.
# Also add the other symbols provided for rsim/xsim and elinux.
OTHER_RELOCATING_SECTIONS='
PROVIDE (__Eall = .);
PROVIDE(__Endmem = 0x10000000); 
PROVIDE(__Stacksize = 0);
'
