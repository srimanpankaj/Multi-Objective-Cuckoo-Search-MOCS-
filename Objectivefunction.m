function [ f ] = Objectivefunction(nest)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n=length(nest(:,1));
v = length(nest(1,:));
x = nest;

for i = 1:n
    for j = 1:v
    f(i,j) = nest(i,j);
    end
% % Objective function one%% Objective function one
%         f(i,v+1) = 1 - exp(-4*x(i,1))*(sin(6*pi*x(i,1)))^6;
%         sum = 0;
%         for k = 2 : 6
%             sum = sum + x(i,k)/4;
%         end
%         %% Intermediate function
%         g_x = 1 + 9*(sum)^(0.25);
%         %% Objective function two
%         f(i,v+2) = g_x*(1 - ((f(i,v+1))/(g_x))^2);
         f(i,v+1) = Penality(nest(i,:))+(-138)+0.1800*nest(i,1)+0.1087*nest(i,2)+0.1644*nest(i,3)+0.0595*nest(i,4)+0.0652*nest(i,5);
      
 %% Objective function two
         f(i,v+2) = -1*( 0.913*nest(i,1)+0.004*nest(i,2)+0.067*nest(i,3)+0.005*(nest(i,4)+nest(i,5))+0.01*nest(i,6)+0.001*nest(i,7)-Penality(nest(i,:)) );
%% Objective function 3
         f(i,v+3) = -1*(8*nest(i,1)+0.75*nest(i,2)+3.5*nest(i,3)+0.85*nest(i,4)+3.5*nest(i,5)-Penality(nest(i,:)));
end
end

function Z = Penality(U)
Pen = 10^10;
x1=  max(U(1)+U(2)+U(3)-600,0);
x2 = max(U(7)-210,0);
x3 = max(150-U(7),0);
x4 = max(380-U(1)+U(2)+U(3),0);
x5 = max(U(4)-900,0);
x6 = max(750- U(4),0);
x7 = max(U(5)- 0.55*(U(4)+U(5)),0);
x8 = max(0.48*(U(4)+U(5))-U(5),0);
Z =-Pen*(x1+x2+x3+x4+x5+x6+x7+x8);
end


