# Initialize Base Address and Registers
LI x2, 0               # Set x2 = 0 (Base Address in Memory)
LW x3, 4(x2)           # Load AES IP Base Address into x3

# Load Plain Text
LW x4, 8(x2)           # Load Plain Text Word 1
LW x5, 12(x2)          # Load Plain Text Word 2
LW x6, 16(x2)          # Load Plain Text Word 3
LW x7, 20(x2)          # Load Plain Text Word 4

# Load Key
LW x8, 24(x2)           # Load Key Word 1
LW x9, 28(x2)           # Load Key Word 2
LW x10, 32(x2)          # Load Key Word 3
LW x11, 34(x2)          # Load Key Word 4

# Store Key into AES IP
SW x8, 0(x3)           # Store KEY0 at 0x40000000
SW x9, 4(x3)           # Store KEY1 at 0x40000004
SW x10, 8(x3)          # Store KEY2 at 0x40000008
SW x11, 12(x3)         # Store KEY3 at 0x4000000C

# Store Plain Text into AES IP
SW x4, 16(x3)          # Store PLT0 at 0x40000010
SW x5, 20(x3)          # Store PLT1 at 0x40000014
SW x6, 24(x3)          # Store PLT2 at 0x40000018
SW x7, 28(x3)          # Store PLT3 at 0x4000001C

# Start AES Encryption
LI x12, 1              # Load 1 into x12
SW x12, 32(x3)         # Write to CTRL_ADDR (0x40000020) to start encryption
