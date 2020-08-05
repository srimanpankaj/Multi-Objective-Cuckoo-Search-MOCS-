function [ new_nest ] = new_cuckoo(nest,leadernest,lb,ub)
%% Levy FLight based new generation
    beta=3/2;
    sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
    [n,m] = size(nest);
    
    new_nest = zeros(n,length(lb));
    for i =1:n
        s = nest(i,1:length(lb));
    %% Levy flights by Mantegna's algorithm
    u=randn(size(s))*sigma;
    v=randn(size(s));
    step=u./abs(v).^(1/beta);
    stepsize=0.01*step.*(s-leadernest);
    s=s+stepsize.*randn(size(s));
    
    for j = 1:length(lb)
    if s(j)<lb(j)
       s(j) = lb(j);
    end
    if s(j)>ub(j)
       s(j) = ub(j);
    end
    new_nest(i,1:length(lb)) = s;
    end
    
    end
    
    end

