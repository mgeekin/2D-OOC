function[dop,dopno]=finddop(n,w)
dop=[];
g1=[];
i=1;
dopno=0;
col=1;
[dop dopno g1]=recursivefunction(n,w,dop,g1,i,dopno,col);

   
%test for second condition if last llement is equal to any other element in
%dop
in=dop;
dop=[];
[r,w]=size(in);
n=sum(in(1,:));
num=0;
out=[];
for i=1:r
    a=[];
    c=0;
    for j=2:w
        if in(i,w)==in(i,j)
            c=c+1;
            break
        end
    end
    if c>0
        test2=[];
        test2=nw2doptest((in(i,:)));
        if test2==1
            num=num+1;
            remove(1,num)=i;
        end
    end
end
for j=1:num
    in(remove(1,num-j+1),:)=[];
end
dop=in;
[dopno,c]=size(dop);
end
%%


function[out]=nw2doptest(code)
n=sum(code);
w=length(code);
no=1;
num=1;

if code(1,1)==code(1,w)
    out=1;
    if sum(code==code(1,w))==w
        out=0;
        return
    end
    return
end
for i=1:w-1
    if code(1,i)==code(1,w)
        no=no+1;
        shift(1,num)=i;
        num=num+1;
    end
end
test=zeros(no,w);
num=1;
for j=1:no
    if j==1
        test(num,:)=code;
        num=num+1;
    end
    if j >1
        x3=[];
        x3=(circshift(code',-shift(1,j-1))');
        x4=code-x3;
        x5=x4*x4';
        if x5~=0
            test(num,:)=x3;
            num=num+1;
        end
    end
end
col=1;
repeat=1;
[r,c]=size(test);
while r>1
    [r,c]=size(test);
    if r>1
        test=sortrows(test,col);
        num=1;
        for i=1:r
            if test(1,col)==test(i,col)
                test2(num,:)=test(i,:);
                num=num+1;
            end
        end
        test=[];
        test=test2;
        test2=[];
        col=col+1;
    end
    if r==1
        repeat=2;
        break
    end
end
x=test-code;
x2=sum(x*x');
if x2==0
    out=0;
end
if x2~=0
    out=1;
end
end
%%


function[dop dopno g1]=recursivefunction(n,w,dop,g1,i,dopno,col)
r1=1;
if col==1
    r2=floor((n-w+1)/2);
end
if col>1&&col~=w
    r2=n-(sum(g1)+(w-col));
end
if col==w
    r2=1;
end
for i=r1:r2
    if col<w
        g1(1,col)=i;
        col=col;
        if n-(sum(g1)+(w-col))>0
            [dop dopno g1]=recursivefunction(n,w,dop,g1,i,dopno,col+1);
        end
    end
    if col==w
        dopw=n-sum(g1);
        if dopw>=g1(1,1)
            c0=0;
            for x=2:length(g1)
                if dopw<g1(1,x)
                    c0=c0+1;
                    break
                end
            end
            if c0==0
                g1(1,col)=n-sum(g1);
                dopno=dopno+1;
                dop(dopno,:)=g1(1,:);
                g1=g1';
                g1=g1(1:col-1,:)';
            end
        end
        if n-sum(g1)<=0
            break
        end
    end
    if i==r2
        if col>1
            col=col-1;
            g1=g1';
            g1=g1(1:col-1,:)';
        end
    end
end
end
%%


