function  ret = binary2decimal (a)
    ret = a * 2.^[length(a)-1:-1:0]';
