function[out]=disp2dcode(code)
[r,c]=size(code);
for i =1:r
    x=['['];
    for j=1:c/2
       x=cat(2,x,[num2str(code(i,2*j-1)) '''' num2str(code(i,2*j))]);
       if j<c/2
           x=cat(2,x,',');
       else
           x=cat(2,x,']');
       end
    end
    out{i}=x;
end