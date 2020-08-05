function new_nest=empty_set(nest,Lb,Ub,pa)
% A fraction of worse nests are discovered with a probability pa
n=size(nest,1);
% Discovered or not -- a status vector
K=rand(size(nest))>pa;

%% New solution by biased/selective random walks
stepsize=rand*(nest(randperm(n),:)-nest(randperm(n),:));
new_nest=nest+stepsize.*K;
for j=1:size(new_nest,1)
    s=new_nest(j,:);
  new_nest(j,:)=simplebounds(s,Lb,Ub);  
end
end
function new_nest = simplebounds(s,lb,ub)
for j = 1:length(lb)
    if (s(j)<lb(j))
       s(j) = lb(j);
    end
    if (s(j)>ub(j))
       s(j) = ub(j);
    end
end
    new_nest = s;
end
