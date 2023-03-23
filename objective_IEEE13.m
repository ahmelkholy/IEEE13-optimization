function G = objective_IEEE13(x,distCase)
%% Objective function for choosing the optimal solution to allocation of SVC
%% device is installed on 
%% adapt the in put $X$ to the distCase

%% at the bus 634
% the active power for the first bus 
total_load_1=distCase.yload(1,2)+distCase.yload(1,3)+distCase.yload(1,4);
distCase.yload(1,2)=x(1); 
distCase.yload(1,3)=(total_load_1-x(1))/2; 
distCase.yload(1,4)=distCase.yload(1,3); 
% qtotal=0.29;

% the reactive power for the first bus 
distCase.yload(1,5)=0; 
distCase.yload(1,6)=0; 
distCase.yload(1,7)=0; 

% %% at the bus 692
% % % the active power for the second bus 
% distCase.dload(3,10)=x(4); 
% distCase.dload(3,11)=x(5); 
% distCase.dload(3,12)=x(6); 
% %qtotal=0.4620;
% % the reactive power for the second bus 
% distCase.dload(3,13)=0; 
% distCase.dload(3,14)=0;  
% distCase.dload(3,15)=0;

%% at the bus 675
% the active power for the second bus 
total_load_2=distCase.yload(4,2)+distCase.yload(4,3)+distCase.yload(4,4);
distCase.yload(4,2)=x(2); 
distCase.yload(4,3)=(total_load_2-x(2))/2; 
distCase.yload(4,4)=distCase.yload(4,3);
%qtotal=0.151;
% the reactive power for the second bus 
distCase.yload(4,5)=0;
distCase.yload(4,6)=0;
distCase.yload(4,7)=0;
%%% removing the capacitor bank
% ieee33data_0.yload(4,17)=0; 
% ieee33data_0.yload(4,18)=0; 
% ieee33data_0.yload(4,19)=0; 
%% run dpflow
Result=dpflow(distCase);
%% the power losses
[p_loss,q_loss]=loss_p_q(Result.branchInfo);
total_active_losses=sum(sum(p_loss(:,(3:5))));   %% G1
total_reactive_losses=sum(sum(q_loss(:,(3:5))));  
%% the voltage profile
v_p_1=Result.busInfo(:,2:4)-1; %%G2 voltage profile in three phases
%% the unbalancing_Ratio
for id_bus=1:length(Result.busInfo(:,1)) %% G3
        K_uN(id_bus)=unbalancing_Ratio(Result,id_bus);
end
%%%% the final objective function
G1=(total_active_losses)/105; %% losses 
% G2=abs(sum(sum(v_p_1)))/1; 
G3=abs(median(K_uN))/1;  %% unbalancing_Ratio
G=G1+G3;