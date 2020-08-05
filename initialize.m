function [ nest ] = initialize(NN,Lb,Ub)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:NN
for j = 1: length(Lb)
   nest(i,j) = Lb(j)+(Ub(j)-Lb(j))*rand(1);
end
end
end

