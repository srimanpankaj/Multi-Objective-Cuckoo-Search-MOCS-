function [CD,leader_nest] =  Leader(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(x);
count = 1;
CD=zeros(m,2);
for i = 1:m
   if x(i,(n-1)) == 1
   CD(count,:) = x(i,8:9);
   count = count+1;
   end
end
NOF  =2;
crowd_number = zeros(size(CD));
for ii = 1:NOF;
 step_size = (max(CD(:,ii))-min(CD(:,ii)))/100;
 
 for jj = size(CD,1);
     lb = CD(jj,ii)-step_size;
     ub = CD(jj,ii)+step_size;
     for kk = size(CD,1)
         if CD(kk,ii)>=lb&&CD(kk,ii)<ub
             crowd_number(jj,ii)=crowd_number(jj,ii)+1;
         end
     end
 end
end
    [a,index1] = min(crowd_number(:,1));
[b,index2] = min(crowd_number(:,2));
if b<=a
    leader_nest = x(index2,1:7);
else
    leader_nest = x(index1,1:7);
end 
end

