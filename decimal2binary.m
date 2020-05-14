function ret = decimal2binary(a)

ret = [];
while a ~= 0
    remainder = mod(a,2);
    a = floor(a/2);
    ret = [remainder ret];
end
