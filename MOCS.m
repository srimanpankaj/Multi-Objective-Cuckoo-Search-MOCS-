clear
tic
%% Multi Objective Cuckoo Search
NI = 1000; %Number of iterations
NN = 350; %Number of nests
NV = 7; % Number of variables
NOF =3;
pa = 0.3;
Lb=[ 91.8 	0       0 	     720.9 	 544.5   0      113.9 ];
Ub=[584.4 	311.1 	220.1 	1259.5 	1091.9   35.4   271.7 ];
% Lb=[0 0 0 0 0 0];
% Ub=[1 1 1 1 1 1];

%% Initialization of the nests
nest = initialize(NN,Lb,Ub);
%% Generate Objective function values
nest = Objectivefunction(nest);
%% Rank them based non non-dominated sort
nest = non_domination_sort_mod(nest,1);
%% Crouding number based leader nest calculation
[front_1,leadernest] = Leader(nest);

%% Iterations start
for i = 1:NI
    % getting new values of nests
       new_nest = new_cuckoo(nest,leadernest,Lb,Ub);
     % updated nest considering possibility of fining the nest
    new_nest=empty_nests(new_nest,Lb,Ub,pa);
    % Generate obj function vaues
    new_nest = Objectivefunction(new_nest);
    %non doinated sort
    new_nest = [nest(:,1:(NV+NOF));new_nest];
    new_nest = non_domination_sort_mod(new_nest,1);
    %crouding distance based leader calculation
    [front_1,leadernest] = Leader(new_nest);
    new_nest = new_nest(1:NN,:);
    nest = new_nest;
    new_nest = [];
 
    figure(1);
    plot3(nest(:,NV + 1),nest(:,NV + 2),nest(:,NV+3),'*');
        title('MixDesignOptimization using MOCS');
        xlabel('Compressive strength');
        ylabel('Carbon Emmisions');
        zlabel('Cost');
        grid on;
        pause(0.01);
    i
end
 toc
% plot(nest(:,NV + 1),nest(:,NV + 2),'*');
%         title('MOP using MOCS');
%         xlabel('f(x_1)');
%         ylabel('f(x_2)');
        


 