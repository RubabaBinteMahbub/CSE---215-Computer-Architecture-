## 16. Convert the following machine code sequence into MIPS assembly language and identify the instruction types

1. Machine Code: 00010001000010010000000000001010
   * Opcode: 000100 (4) -> beq
   * rs: 01000 (8) -> $t0
   * rt: 01001 (9) -> $t1
   * Offset: 10
   * Assembly: beq $t0, $t1, Label
   * Type: I-Type

2. Machine Code: 00100001000010000000000000000001
   * Opcode: 001000 (8) -> addi
   * rs: 01000 (8) -> $t0
   * rt: 01000 (8) -> $t0
   * Immediate: 1
   * Assembly: addi $t0, $t0, 1
   * Type: I-Type

3. Machine Code: 00001000000100000000000000000100
   * Opcode: 000010 (2) -> j
   * Target: 262148
   * Assembly: j Label
   * Type: J-Type
