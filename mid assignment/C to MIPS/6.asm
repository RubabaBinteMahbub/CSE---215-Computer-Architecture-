if (A != B)
{
    C = A + B;
    D = C - A;
}
else
{
    C = 0;
    D = 1;
}

# mapping: A=$s0, B=$s1, C=$s2, D=$s3

    # If A == B, then jump to ELSE block (inverting the condition for branching)
    beq  $s0, $s1, ELSE     # if A == B, jump to ELSE

    # IF Body:
    add  $s2, $s0, $s1      # C = A + B
    sub  $s3, $s2, $s0      # D = C - A
    j    EXIT               # Jump to end

ELSE:
    # ELSE Body:
    li   $s2, 0             # C = 0
    li   $s3, 1             # D = 1

EXIT:
