function[code]=oned2twod(dop,l,n)
[r,w]=size(dop);
for i=1:r
    dop2=cumsum(dop(i,:));
    a1=[];
    b1=[];
    code1=[];
    a1=zeros(1,w);
    b1=zeros(1,w);
    for j=1:w
        if j<w
            [a1(1,j),b1(1,j)]=one2twof1(dop2(1,j),n);
            if j>1
                [a0,b0]=one2twof1(dop2(1,j-1),n);
                [a00,b00]=one2twof1(dop2(1,j),n);
                a1(1,j)=a00-a0;
                b1(1,j)=b00-b0;
            end
        else
            a1(1,j)=l-sum(a1);
            b1(1,j)=n-sum(b1);
        end

        a1(1,j)=mod(a1(1,j),l);
        b1(1,j)=mod(b1(1,j),n);
        code1=cat(2,cat(2,code1,a1(1,j)),b1(1,j));
    end
    a(i,:)=a1;
    b(i,:)=b1;
    code(i,:)=code1;
end
end


function[a,b]=one2twof1(x,n)
                a=floor(x/n);
                b=mod(x,n);
end