clc
clear all   
diary off
cont=0;
while cont==0
    l=input(' enter temporal length L= ');
    n=input(' enter spectral length N = ');
    w=input(' enter hamming weight W = ');
    jbound=jb(n*l,w);
    temp=sprintf('\n \n \n \n no of codes approx. by jhonsons bound is %d',jbound);
    disp(temp)
    cont=input('press 1 to continue with these values \n else press 0 to input L,N,W again \n');
    clc
end

[dop,noofdops]=finddop(l*n,w);
bin1d=dop2binary(dop);
[code]=oned2twod(dop,l,n);
dispcode=disp2dcode(code);
% dopby2dcode=twod2oned(code,l,n);
bin2d=dop2binary2d(dop,l,n);







%% save results
name=['l' num2str(l) 'n' num2str(n) 'w' num2str(w)];
%save in mat file
save(name);


% save in txt file
if exist(cat(2,name,'.txt'),'file')==2
    delete(cat(2,name,'.txt'));
end
diary(cat(2,name,'.txt'))
for i=1:noofdops
    serial_no=['serial no ' num2str(i)];
    disp(serial_no)
    one_dimentional_dop_code=dop(i,:)
    one_dimentional_binary_code=bin1d(i,:)
    two_dimentional_dop_code=dispcode{i}
    two_dimentional_binary_code=bin2d{i,1}
end
no_of_codes_formed=noofdops
diary off

option=0;% change it to 1 to save reslts to xls file
option=input('press 1 to save results in excel file \n it will take long time \n else press 0 \n');
%save in xls file
if option==1
    save2dtoxls(name)
end