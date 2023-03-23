%%%%%%%%% post calculation
clear all;clc,close all
go tikz
load('final_results.mat')
%% the used load profile 
    p=datahour_full;
    used_lf=p([1:14],:);
    f1=figure(1);
    bar3(used_lf)
    xlabel('Hours')
    ylabel('Load Profile')
    zlabel('loading %')
    % title('Load Profile')
    % exportgraphics(f1,'Load_Profile.png','Resolution',3000)

%% Efficiency of the TL
    f2=figure(2);
    plot(eff)  
    box off
    title('the Efficiency of the TL')
    xlabel('Hour')
    ylabel('\mu %')
    legend('Base Case','SVC','UPC','UPC-GA')
    % matlab2tikz('figurehandle',f2,'filename','f2.tex','standalone', true,'showInfo', false, 'strict', true);

%% the overall objective function
    f5=figure(5);
    G=[G_0;G_1;G_2;G_3];
    plot(G')  
    box off
    title('the overall objective function')
    xlabel('Hour')
    ylabel('$K_{Un}$','Interpreter','latex')
    legend('Base Case','SVC','UPC','UPC-GA')
    matlab2tikz('figurehandle',f5,'filename','f5.tex','standalone', true,'showInfo', false, 'strict', true);

%% the sum of the unbalancing coefficient
    f6=figure(6);
    k=[k0;k1;k2;k3];
    plot(k')  
    box off
    title('the unbalancing ratio')
    xlabel('Hour')
    ylabel('$K_{Un}$','Interpreter','latex')
    legend('Base Case','SVC','UPC','UPC-GA')
    matlab2tikz('figurehandle',f6,'filename','f6.tex','standalone', true,'showInfo', false, 'strict', true);
%% the unbalancing_Ratio for the base case
    % f7=figure(7);
    % bar3(K_uN_0(:,1:13))
    % title('Unbalancing Ratio Base Case')
    % xlabel('Bus ID')
    % xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23])
    % xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'})
    % ylabel('Hour')
    % zlabel('$K_{Un}$','Interpreter','latex')
    % f8=figure(8);
    % bar3(K_uN_1(:,1:13))
    % title('Unbalancing Ratio SVC')
    % xlabel('Bus ID')
    % xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23])
    % xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'})
    % ylabel('Hour')
    % zlabel('$K_{Un}$','Interpreter','latex')
    % f9=figure(9);
    % bar3(K_uN_2(:,1:13))
    % title('Unbalancing Ratio UPC')
    % xlabel('Bus ID')
    % xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23])
    % xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'})
    % ylabel('Hour')
    % zlabel('$K_{Un}$','Interpreter','latex')
    % f10=figure(10);
    % bar3(K_uN_3(:,1:13))
    % title('Unbalancing Ratio UPC-GA')
    % xlabel('Bus ID')
    % xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23])
    % xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675','1','2','3','4','5','6','7','8','9','10'})
    % ylabel('Hour')
    % zlabel('$K_{Un}$','Interpreter','latex')

    f15=figure(15);
    sgtitle('Unbalancing Ratio')
    subplot(2,2,1)
    boxplot(K_uN_0(:,1:13))
    box off
    ylabel('$k_{Un}$', 'Interpreter','latex')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,2)
    boxplot(K_uN_1(:,1:13))
    box off
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,3)
    boxplot(K_uN_2(:,1:13))
    box off
    ylabel('$k_{Un}$', 'Interpreter','latex')
    xlabel('Hour')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,4)
    boxplot(K_uN_3(:,1:13))
    box off
    xlabel('Hour')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    matlab2tikz('figurehandle',f15,'filename','f15.tex','standalone', true,'showInfo', false, 'strict', true);


    % nn=1;
    % for n=1:13
    %    k_t(:,nn)=K_uN_0(n,1:13)'; 
    %    k_t(:,nn+1)=K_uN_1(n,1:13)'; 
    %    k_t(:,nn+2)=K_uN_2(n,1:13)'; 
    %    k_t(:,nn+3)=K_uN_3(n,1:13)';
    %    k_t(:,nn+4)=-0.08*ones(13,1); 
    %    nn=nn+5;
    % end
    % f16=figure(16);
    % title('Unbalancing Ratio')
    % boxplot(k_t)
    % box off
    % xticklabels({'650-1','650-2','650-3','650-4','','632-1','632-2','632-3','632-4','','633-1','633-2','633-3','633-4',''...
    %             ,'634-1','634-2','634-3','634-4','','645-1','645-2','645-3','645-4','','646-1','646-2','646-3','646-4',''...
    %             ,'646-1','646-2','646-3','646-4','','671-1','671-2','671-3','671-4','','680-1','680-2','680-3','680-4',''...
    %             ,'684-1','684-2','684-3','684-4','','611-1','611-2','611-3','611-4','','652-1','652-2','652-3','652-4',''...
    %             ,'692-1','692-2','692-3','692-4','','675-1','675-2','675-3','675-4'})
    % grid on
    
%% the power losses
    f11=figure(11);
    plot(p_loss_cases,'DisplayName','p_loss_cases')
    box off
    title('the Power Losses')
    xlabel('Hour')
    ylabel('Power KW')
    legend('Base Case','SVC','UPC','UPC-GA')
    matlab2tikz('figurehandle',f11,'filename','f11.tex','standalone', true,'showInfo', false, 'strict', true);
    % figure(12)
    % bar(1:24,[p_loss_total_0;p_loss_total_1;p_loss_total_2;p_loss_total_3])
%% the voltage of the phase a at every case
    f12=figure(12);
    sgtitle('the Voltage of phase A')
    subplot(2,2,1)
    boxplot(v_a_0)
    box off
    ylabel('Voltage Deviation p.u.')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,2)
    boxplot(v_a_1)
    box off
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,3)
    boxplot(v_a_2)
    box off
    ylabel('Voltage Deviation p.u.')
    xlabel('Bus Id')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,4)
    boxplot(v_a_2)
    box off
    xlabel('Bus Id')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    matlab2tikz('figurehandle',f12,'filename','f12.tex','standalone', true,'showInfo', false, 'strict', true);

    f13=figure(13);
    sgtitle('the Voltage of phase B')
    subplot(2,2,1)
    boxplot(v_b_0)
    box off
    ylabel('Voltage Deviation p.u.')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,2)
    boxplot(v_b_1)
    box off
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,3)
    boxplot(v_b_2)
    box off
    ylabel('Voltage Deviation p.u.')
    xlabel('Bus Id')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,4)
    boxplot(v_b_2)
    box off
    xlabel('Bus Id')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    matlab2tikz('figurehandle',f13,'filename','f13.tex','standalone', true,'showInfo', false, 'strict', true);

    f14=figure(14);
    sgtitle('the Voltage of phase C')
    subplot(2,2,1)
    boxplot(v_c_0)
    box off
    ylabel('Voltage Deviation p.u.')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,2)
    boxplot(v_c_1)
    box off
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,3)
    boxplot(v_c_2)
    box off
    ylabel('Voltage Deviation p.u.')
    xlabel('Bus Id')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    subplot(2,2,4)
    boxplot(v_c_2)
    box off
    xlabel('Bus Id')
    xticklabels({'650','632','633','634','645','646','671','680','684','611','652','692','675'})
    matlab2tikz('figurehandle',f14,'filename','f14.tex','standalone', true,'showInfo', false, 'strict', true);

    % nn=1;
    % for n=1:13
    %    v_at(:,nn)=v_a_0(:,n); 
    %    v_at(:,nn+1)=v_a_1(:,n); 
    %    v_at(:,nn+2)=v_a_2(:,n); 
    %    v_at(:,nn+3)=v_a_3(:,n);
    %    v_at(:,nn+4)=-0.08*ones(24,1); 
    %    nn=nn+5;
    % end
    % f17=figure(17);
    % boxplot(v_at)
    % box off
    % xticklabels({'650-1','650-2','650-3','650-4','','632-1','632-2','632-3','632-4','','633-1','633-2','633-3','633-4',''...
    %             ,'634-1','634-2','634-3','634-4','','645-1','645-2','645-3','645-4','','646-1','646-2','646-3','646-4',''...
    %             ,'646-1','646-2','646-3','646-4','','671-1','671-2','671-3','671-4','','680-1','680-2','680-3','680-4',''...
    %             ,'684-1','684-2','684-3','684-4','','611-1','611-2','611-3','611-4','','652-1','652-2','652-3','652-4',''...
    %             ,'692-1','692-2','692-3','692-4','','675-1','675-2','675-3','675-4'})
    % grid on
    %     nn=1;
    % for n=1:13
    %    v_bt(:,nn)=v_b_0(:,n); 
    %    v_bt(:,nn+1)=v_b_1(:,n); 
    %    v_bt(:,nn+2)=v_b_2(:,n); 
    %    v_bt(:,nn+3)=v_b_3(:,n);
    %    v_bt(:,nn+4)=-0.08*ones(24,1); 
    %    nn=nn+5;
    % end
    % f18=figure(18);
    % boxplot(v_bt)
    % box off
    % xticklabels({'650-1','650-2','650-3','650-4','','632-1','632-2','632-3','632-4','','633-1','633-2','633-3','633-4',''...
    %             ,'634-1','634-2','634-3','634-4','','645-1','645-2','645-3','645-4','','646-1','646-2','646-3','646-4',''...
    %             ,'646-1','646-2','646-3','646-4','','671-1','671-2','671-3','671-4','','680-1','680-2','680-3','680-4',''...
    %             ,'684-1','684-2','684-3','684-4','','611-1','611-2','611-3','611-4','','652-1','652-2','652-3','652-4',''...
    %             ,'692-1','692-2','692-3','692-4','','675-1','675-2','675-3','675-4'})
    % grid on
    %     nn=1;
    % for n=1:13
    %    v_ct(:,nn)=v_c_0(:,n); 
    %    v_ct(:,nn+1)=v_c_1(:,n); 
    %    v_ct(:,nn+2)=v_c_2(:,n); 
    %    v_ct(:,nn+3)=v_c_3(:,n);
    %    v_ct(:,nn+4)=-0.08*ones(24,1); 
    %    nn=nn+5;
    % end
    % f19=figure(19);
    % boxplot(v_ct)
    % box off
    % xticklabels({'650-1','650-2','650-3','650-4','','632-1','632-2','632-3','632-4','','633-1','633-2','633-3','633-4',''...
    %             ,'634-1','634-2','634-3','634-4','','645-1','645-2','645-3','645-4','','646-1','646-2','646-3','646-4',''...
    %             ,'646-1','646-2','646-3','646-4','','671-1','671-2','671-3','671-4','','680-1','680-2','680-3','680-4',''...
    %             ,'684-1','684-2','684-3','684-4','','611-1','611-2','611-3','611-4','','652-1','652-2','652-3','652-4',''...
    %             ,'692-1','692-2','692-3','692-4','','675-1','675-2','675-3','675-4'})
    % grid on
%%%%%%% calculate the 

