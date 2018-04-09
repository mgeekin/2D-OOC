function[out]=jb(n,w)
%% jhonsons_bound_A =jb(no_of_timeslots,hamming_weight)
ans=1;
for i=1:w-1
    ans=floor(ans*(n-(w-i))/i);
end
ans=floor(ans/w);
out=ans;
end
%%
