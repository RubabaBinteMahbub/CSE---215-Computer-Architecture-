int i, sum = 0; // Let i=$s0, sum=$s1
for(i = 0; i < 5; i++)
{
    sum = sum + (i * 2);
    i++; // Note: This makes 'i' increment twice per iteration!
}


# mapping: i=$s0, sum=$s1

li $s1, 0            # sum = 0
li $s0, 0            # i = 0

LOOP1:
    slti $t0, $s0, 5     # if i < 5, $t0 = 1; else $t0 = 0
    beq  $t0, $zero, END1 # if $t0 == 0, exit loop

    # sum = sum + (i * 2)
    sll  $t1, $s0, 1     # $t1 = i * 2 (using shift left logical)
    add  $s1, $s1, $t1   # sum = sum + $t1

    addi $s0, $s0, 1     # i++ (inside body)
    addi $s0, $s0, 1     # i++ (loop update expression)
    j LOOP1

END1:
