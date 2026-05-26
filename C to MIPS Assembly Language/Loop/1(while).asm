while (a[i] == k){
    i += 1;
}
a এর বেস অ্যাড্রেস $s6
i আছে $s3 তে
k আছে $s5 এ

Loop: 
sll  $t1, $s3, 2    # $t1 = i * 4 (অফসেট হিসাব করা হলো)
add  $t1, $t1, $s6  # $t1 = save + (i * 4) (save[i] এর আসল মেমোরি অ্যাড্রেস)
lw   $t0, 0($t1)    # $t0 = save[i] (মেমোরি থেকে ডাটাটি $t0 রেজিস্টারে আনা হলো)
bne  $t0, $s5, Exit # if (save[i] != k) go to Exit (মিথ্যা হলে লুপ শেষ)
addi $s3, $s3, 1    # i = i + 1 (অথবা i++)
j Loop              # Jump back to Loop (লুপের শুরুতে ফিরে যাও)
Exit:
