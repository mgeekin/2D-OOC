function[]=save2dtoxls(name)
        load(name)
        jump=12+n;
%             xlswrite(name,'serial no',1,['A' num2str(1)])
            xlswrite(name,'1d dop',1,['A' num2str(3)])
            xlswrite(name,'1d code',1,['A' num2str(4)])
            xlswrite(name,'2d dop code',1,['A' num2str(6)])
            xlswrite(name,'2d code',1,['A' num2str(8)])
        for i=1:noofdops
            xlswrite(name,['serial no ' num2str(i)],1,['A' num2str(jump*i)])
            xlswrite(name,dop(i,:),1,['A' num2str(jump*i+3)])
            xlswrite(name,bin1d(i,:),1,['A' num2str(jump*i+4)])
            xlswrite(name,code(i,:),1,['A' num2str(jump*i+6)])
            xlswrite(name,bin2d{i,1},1,['A' num2str(jump*i+8)])
        end
        xlswrite(name,'serial no',1,['A' num2str(1)])
end