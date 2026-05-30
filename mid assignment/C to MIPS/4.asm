// Base addresses: A=$s1, B=$s2, C=$s3, D=$s4
A[2] = B[1] + C[3];
D[4] = A[2] - B[B[3]];

# mapping: base_A=$s1, base_B=$s2, base_C=$s3, base_D=$s4

# --- Statement 1: A[2] = B[1] + C[3] ---
lw   $t0, 4($s2)     # $t0 = B[1]  (offset = 1 * 4 = 4)
lw   $t1, 12($s3)    # $t1 = C[3]  (offset = 3 * 4 = 12)
add  $t2, $t0, $t1   # $t2 = B[1] + C[3]
sw   $t2, 8($s1)     # A[2] = $t2  (offset = 2 * 4 = 8)

# --- Statement 2: D[4] = A[2] - B[B[3]] ---
# Step A: Get index from B[3]
lw   $t3, 12($s2)    # $t3 = B[3]  (value of B[3] will act as an index)

# Step B: Calculate offset for B[B[3]] -> index * 4
sll  $t4, $t3, 2     # $t4 = B[3] * 4
add  $t5, $s2, $t4   # $t5 = base_B + offset
lw   $t6, 0($t5)     # $t6 = B[B[3]]

# Step C: Perform subtraction and store
# We already have A[2] in $t2 from previous statement
sub  $t7, $t2, $t6   # $t7 = A[2] - B[B[3]]
sw   $t7, 16($s4)    # D[4] = $t7  (offset = 4 * 4 = 16)
