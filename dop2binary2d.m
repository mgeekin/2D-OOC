function[bin2d]=dop2binary2d(dopby2dcode,l,n);
[r,c]=size(dopby2dcode);
bin=dop2binary(dopby2dcode);
for i=1:r
    bin2d{i,1}=reshape(bin(i,:),n,l);
end
end