clc;clear all;close all
%{
this file to perform optimization for IEEE13 bus system  
%}
go dpflow; %% define dpflow
%load the system data
ieee33data = distCase_test13nodes;
% get the lower and upper limits
lb=repmat(0,[1 2]);
ub=[0.4 0.8430];  
%Constrain all n_svc variables to be integers
%% defining the objective function
objfun = @(x)objective_IEEE13(x,ieee33data);
%%seed to gruntee exact results every time 
%seed =47;% this seed rang from 0:100
%rng(seed);
%% ga options
% Set nondefault solver options
options = optimoptions('ga','CrossoverFraction',0.7,'PopulationSize',500,'EliteCount',5,...
    'MaxGenerations',50,'MaxStallGenerations',25,'PlotFcn',...
    {'gaplotdistance','gaplotstopping','gaplotbestf','gaplotbestindiv',...
    'gaplotexpectation','gaplotrange'});
% Solve


[solution,objectiveValue] = ga(objfun,numel(lb),[],[],[],[],lb,ub,[],[],options);


%%%%% base case
ieee33data = distCase_test13nodes;

Result=dpflow(ieee33data);
%% the power losses
[p_loss,q_loss]=loss_p_q(Result.branchInfo);
total_active_losses=sum(sum(p_loss(:,(3:5))));   %% G1
total_reactive_losses=sum(sum(q_loss(:,(3:5))));  
%% the voltage profile
v_p=Result.busInfo(:,2:4)-1; %%G2 voltage profile in three phases
%% the unbalancing_Ratio
for id_bus=1:length(Result.busInfo(:,1)) %% G3
        K_uN(id_bus)=unbalancing_Ratio(Result,id_bus);
end
%%%% the final objective function
G1=(total_active_losses)/(1); %%
G2=abs(sum(sum(v_p)))/1; 
G3=median(K_uN)/1;  %% unbalancing_Ratio
G=G1+G2+G3;

figure(3)
plot(K_uN)
hold on
names={'600','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'};
set(gca,'xtick',[1:23],'xticklabel',names)




%%%%% balanced case
ieee33data_0 = distCase_test13nodes;
%% at the bus 634
% the active power for the first bus 
ieee33data_0.yload(1,2)=0.4/3; 
ieee33data_0.yload(1,3)=0.4/3; 
ieee33data_0.yload(1,4)=0.4/3; 
% qtotal=0.29;

% the reactive power for the first bus 
ieee33data_0.yload(1,5)=0; 
ieee33data_0.yload(1,6)=0; 
ieee33data_0.yload(1,7)=0; 


%% at the bus 675
% the active power for the second bus 
ieee33data_0.yload(4,2)=0.843/3; 
ieee33data_0.yload(4,3)=0.843/3; 
ieee33data_0.yload(4,4)=0.843/3;
%qtotal=0.151;
% the reactive power for the second bus 
ieee33data_0.yload(4,5)=0; 
ieee33data_0.yload(4,6)=0; 
ieee33data_0.yload(4,7)=0; 
%% removing the capacitor bank
ieee33data_0.yload(4,17)=0; 
ieee33data_0.yload(4,18)=0; 
ieee33data_0.yload(4,19)=0; 

%% run dpflow
Result_0=dpflow(ieee33data_0);
%% the power losses
[p_loss_0,q_loss_0]=loss_p_q(Result_0.branchInfo);
total_active_losses_0=sum(sum(p_loss_0(:,(3:5))));   %% G1
total_reactive_losses_0=sum(sum(q_loss_0(:,(3:5))));  
%% the voltage profile
v_p_0=Result_0.busInfo(:,2:4)-1; %%G2 voltage profile in three phases
%% the unbalancing_Ratio
for id_bus=1:length(Result_0.busInfo(:,1)) %% G3
        K_uN_0(id_bus)=unbalancing_Ratio(Result_0,id_bus);
end
%%%% the final objective function
G1_0 =(total_active_losses_0)/(1); %%
G2_0=abs(sum(sum(v_p_0)))/1; 
G3_0=median(K_uN_0)/1;  %% unbalancing_Ratio
G_0=G1_0+G2_0+G3_0;
figure(3)
hold on
plot(K_uN_0)
hold on
names={'600','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'};
set(gca,'xtick',[1:23],'xticklabel',names)




%%%%% GA optimized results
ieee33data_1 = distCase_test13nodes;
%% at the bus 634
% the active power for the first bus 
ieee33data_1.yload(1,2)=solution(1); 
ieee33data_1.yload(1,3)=(0.4-solution(1))/2; 
ieee33data_1.yload(1,4)=ieee33data_1.yload(1,3); 
% qtotal=0.29;

% the reactive power for the first bus 
ieee33data_1.yload(1,5)=0; 
ieee33data_1.yload(1,6)=0; 
ieee33data_1.yload(1,7)=0; 

%% at the bus 692
% % the active power for the second bus 
% ieee33data_1.dload(3,10)=solution(4); 
% ieee33data_1.dload(3,11)=solution(5); 
% ieee33data_1.dload(3,12)=solution(6); 
% %qtotal=0.4620;
% % the reactive power for the second bus 
% ieee33data_1.dload(3,13)=0; 
% ieee33data_1.dload(3,14)=0;  
% ieee33data_1.dload(3,15)=0;

%% at the bus 675
% the active power for the second bus 
ieee33data_1.yload(4,2)=solution(2); 
ieee33data_1.yload(4,3)=(0.843-solution(2))/2; 
ieee33data_1.yload(4,4)=ieee33data_1.yload(4,3);
%qtotal=0.151;
% the reactive power for the second bus 
ieee33data_1.yload(4,5)=0; 
ieee33data_1.yload(4,6)=0; 
ieee33data_1.yload(4,7)=0; 

%% removing the capacitor bank
ieee33data_1.yload(4,17)=0; 
ieee33data_1.yload(4,18)=0; 
ieee33data_1.yload(4,19)=0; 

%% run dpflow
Result_1=dpflow(ieee33data_1);
%% the power losses
[p_loss_1,q_loss_1]=loss_p_q(Result_1.branchInfo);
total_active_losses_1=sum(sum(p_loss_1(:,(3:5))));   %% G1
total_reactive_losses_1=sum(sum(q_loss_1(:,(3:5))));  
%% the voltage profile
v_p_1=Result_1.busInfo(:,2:4)-1; %%G2 voltage profile in three phases
%% the unbalancing_Ratio
for id_bus=1:length(Result_1.busInfo(:,1)) %% G3
        K_uN_1(id_bus)=unbalancing_Ratio(Result_1,id_bus);
end
%%%% the final objective function
G1_1=(total_active_losses_1)/(1); %%
G2_1=abs(sum(sum(v_p_1)))/1; 
G3_1=median(K_uN_1)/1;  %% unbalancing_Ratio
G_1=G1_1+G2_1+G3_1;
figure(3)
hold on
plot(K_uN_1)
hold on
names={'600','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'};
set(gca,'xtick',[1:23],'xticklabel',names)




%%%%% svc case
ieee33data_2 = distCase_test13nodes;


% the reactive power for the first bus 
ieee33data_2.yload(1,5)=0; 
ieee33data_2.yload(1,6)=0; 
ieee33data_2.yload(1,7)=0; 


%qtotal=0.151;
% the reactive power for the second bus 
ieee33data_2.yload(4,5)=0; 
ieee33data_2.yload(4,6)=0; 
ieee33data_2.yload(4,7)=0; 
%% removing the capacitor bank
ieee33data_2.yload(4,17)=0; 
ieee33data_2.yload(4,18)=0; 
ieee33data_2.yload(4,19)=0; 


Result_2=dpflow(ieee33data_2);
%% the power losses
[p_loss_2,q_loss_2]=loss_p_q(Result_2.branchInfo);
total_active_losses_2=sum(sum(p_loss_2(:,(3:5))));   %% G1
total_reactive_losses_2=sum(sum(q_loss_2(:,(3:5))));  
%% the voltage profile
v_p_2=Result_2.busInfo(:,2:4)-1; %%G2 voltage profile in three phases
%% the unbalancing_Ratio
for id_bus=1:length(Result_2.busInfo(:,1)) %% G3
        K_uN_2(id_bus)=unbalancing_Ratio(Result_2,id_bus);
end
%%%% the final objective function
G1_2=(total_active_losses_2)/(1); %%
G2_2=abs(sum(sum(v_p_2)))/1; 
G3_2=median(K_uN_2)/1;  %% unbalancing_Ratio
G_2=G1_2+G2_2+G3_2;

figure(3)
plot(K_uN_2)
hold on
names={'600','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'};
set(gca,'xtick',[1:23],'xticklabel',names)


legend('base case','UPC balanced case','UPC GA case','SVC')

%% enhancements  
powerlossesenhancment=[G1 G1_0 G1_1 G1_2]
unbalcningratioedian= [G3 G3_0 G3_1 G3_2]


