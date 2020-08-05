function [ ff ] =  front_1(nest)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[N,M] = size(nest);
M = 2;%number of objecitve functions
V = 7;%number of variables
front = 1;

% There is nothing to this assignment, used only to manipulate easily in
% MATLAB.
F(front).f = [];
individual = [];
for i = 1 : N
    % Number of individuals that dominate this individual
    individual(i).n = 0;
    % Individuals which this individual dominate
    individual(i).p = [];
    for j = 1 : N
        dom_less = 0;
        dom_equal = 0;
        dom_more = 0;
        for k = 1 : M
            if (nest(i,V + k) > nest(j,V + k))
                dom_less = dom_less + 1;
            elseif (nest(i,V + k) == nest(j,V + k))
                dom_equal = dom_equal + 1;
            else
                dom_more = dom_more + 1;
            end
        end
        if dom_less == 0 & dom_equal ~= M
            individual(i).n = individual(i).n + 1;
        elseif dom_more == 0 & dom_equal ~= M
            individual(i).p = [individual(i).p j];
        end
    end   
    if individual(i).n == 0
        nest(i,M + V + 1) = 1;
        F(front).f = [F(front).f i];
    end
end
for i =1:length(F(front).f)
    ff(i,:) = nest(F(front).f( i),:);
end
% while ~isempty(F(front).f)
%    Q = [];
%    for i = 1 : length(F(front).f)
%        if ~isempty(individual(F(front).f(i)).p)
%         	for j = 1 : length(individual(F(front).f(i)).p)
%             	individual(individual(F(front).f(i)).p(j)).n = ...
%                 	individual(individual(F(front).f(i)).p(j)).n - 1;
%         	   	if individual(individual(F(front).f(i)).p(j)).n == 0
%                		x(individual(F(front).f(i)).p(j),M + V + 1) = ...
%                         front + 1;
%                     Q = [Q individual(F(front).f(i)).p(j)];
%                 end
%             end
%        end
%    end
%    front =  front + 1;
%    F(front).f = Q;
% end
% [temp,index_of_fronts] = sort(x(:,M + V + 1));
% for i = 1 : length(index_of_fronts)
%     sorted_based_on_front(i,:) = x(index_of_fronts(i),:);
% end
% end
% 
% 
