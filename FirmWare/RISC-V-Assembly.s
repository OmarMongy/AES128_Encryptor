.global main

main:
    # Base Address of AES IP
    LUI t0, 0x40000       # Load upper immediate to t0 (Base address 0x40000000)

    # Initialize Key (4 words)
    ADDI t1, zero, 0x09   # Load lower part of KEY0
    SLLI t1, t1, 8
    ORI t1, t1, 0xcf
    SLLI t1, t1, 8
    ORI t1, t1, 0x4f
    SLLI t1, t1, 8
    ORI t1, t1, 0x3c
    SW t1, 0(t0)          # Store KEY0 at 0x40000000

    ADDI t1, zero, 0xab   # Load lower part of KEY1
    SLLI t1, t1, 8
    ORI t1, t1, 0xf7
    SLLI t1, t1, 8
    ORI t1, t1, 0x15
    SLLI t1, t1, 8
    ORI t1, t1, 0x88
    SW t1, 4(t0)          # Store KEY1 at 0x40000004

    ADDI t1, zero, 0x28   # Load lower part of KEY2
    SLLI t1, t1, 8
    ORI t1, t1, 0xae
    SLLI t1, t1, 8
    ORI t1, t1, 0xd2
    SLLI t1, t1, 8
    ORI t1, t1, 0xa6
    SW t1, 8(t0)          # Store KEY2 at 0x40000008

    ADDI t1, zero, 0x2b   # Load lower part of KEY3
    SLLI t1, t1, 8
    ORI t1, t1, 0x7e
    SLLI t1, t1, 8
    ORI t1, t1, 0x15
    SLLI t1, t1, 8
    ORI t1, t1, 0x16
    SW t1, 12(t0)         # Store KEY3 at 0x4000000C

    # Initialize Plaintext (4 words)
    ADDI t2, zero, 0xe0   # Load lower part of TEXT0
    SLLI t2, t2, 8
    ORI t2, t2, 0x37
    SLLI t2, t2, 8
    ORI t2, t2, 0x07
    SLLI t2, t2, 8
    ORI t2, t2, 0x34
    SW t2, 16(t0)         # Store TEXT0 at 0x40000010

    ADDI t2, zero, 0x31   # Load lower part of TEXT1
    SLLI t2, t2, 8
    ORI t2, t2, 0x31
    SLLI t2, t2, 8
    ORI t2, t2, 0x98
    SLLI t2, t2, 8
    ORI t2, t2, 0xa2
    SW t2, 20(t0)         # Store TEXT1 at 0x40000014

    ADDI t2, zero, 0x88   # Load lower part of TEXT2
    SLLI t2, t2, 8
    ORI t2, t2, 0x5a
    SLLI t2, t2, 8
    ORI t2, t2, 0x30
    SLLI t2, t2, 8
    ORI t2, t2, 0x8d
    SW t2, 24(t0)         # Store TEXT2 at 0x40000018

    ADDI t2, zero, 0x32   # Load lower part of TEXT3
    SLLI t2, t2, 8
    ORI t2, t2, 0x43
    SLLI t2, t2, 8
    ORI t2, t2, 0xf6
    SLLI t2, t2, 8
    ORI t2, t2, 0xa8
    SW t2, 28(t0)         # Store TEXT3 at 0x4000001C

    # Start AES Encryption
    ADDI t3, zero, 1      # Load 1 into t3
    SW t3, 32(t0)         # Write to CTRL_ADDR (0x40000020) to start encryption

    # Poll for Result
poll:
    LW t4, 32(t0)         # Read from CTRL_ADDR to check status
    ANDI t4, t4, 1        # Mask to check the least significant bit
    BEQ t4, zero, poll    # If still 0, keep polling

    # Read Encrypted Output (Ciphertext) from AES IP
    LW s0, 36(t0)         # Read CIPHER0 from 0x40000024
    LW s1, 40(t0)         # Read CIPHER1 from 0x40000028
    LW s2, 44(t0)         # Read CIPHER2 from 0x4000002C
    LW s3, 48(t0)         # Read CIPHER3 from 0x40000030

    # End program (loop forever)
