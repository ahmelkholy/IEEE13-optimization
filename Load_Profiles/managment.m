clc; clear all;close all
switch 'maxforminute'
%% this script is to load all load profiles in the folder and then retime it to hourly
% then make the maxmum of the loads is 1.4
case 'gathering'
    
    load('list_of_laod_profile.mat')
    datamin_full=[1:1:1440]';
    for i=1:length(list_of_all_load_profile)
        readeddate=readtable(string(list_of_all_load_profile(i)));
        dataminutes=timetable(minutes(1:1:1440)',readeddate.mult);
        datahour=retime(dataminutes,'hourly','mean');
        datahour_full(i,:)=datahour.Var1;
        datamin_full=[datamin_full dataminutes.Var1];
    end
    datamin_full(:,1)=[];
case 'maxforall'
%% putting max for the load profile in hour
    [m,n] = size(datahour_full);
    for m_n=1:m
        for n_n=1:n
            if datahour_full(m_n,n_n)>1.4
                datahour_full(m_n,n_n)=1.4;
            end
        end
    end
    for m_n=1:m
        plot(datahour_full(m_n,:));
        hold on 
    end
%% putting max for the load profile in minutes
case  'maxforminute'
    % load('C:\Users\ahm_e\Documents\MATLAB\UPC\RATUPC\Load_Profiles\all_load_profile_minutes_nomax.mat')
    % [m,n] = size(datamin_full);
    % % bus 634  load profile no 1 and 2 and 3
    % % bus 675  load profile no 5 and 6 and 7
    % %%%%%%%%%%% modifying the load profile at bus 634
    % clear m
    % m=[1 2 3];
    % for m_n=m
    %     for n_n=1:n
    %         if datamin_full(m_n,n_n)>4.21
    %             datamin_full(m_n,n_n)=4.21;
    %         end
    %     end
    % end
    % f1=figure(1);
    % for m_n=m
    %     plot(datamin_full(m_n,:));
    %     hold on 
    % end
    % %%%%%%%%%%% modifying the load profile at bus 675
    % clear m
    % m=[5 6 7];
    % for m_n=m
    %     for n_n=1:n
    %         if datamin_full(m_n,n_n)>2.75
    %             datamin_full(m_n,n_n)=2.75;
    %         end
    %     end
    % end
    % f2=figure(2);
    % for m_n=m
    %     plot(datamin_full(m_n,:));
    %     hold on 
    % end
%%% creating 
    load('Load_Profiles\all_load_profile_minutes_max.mat');
    p=datamin_full;
    % datamin_full=[1:1:1440]';
    for i=1:length(p(:,1))
        % readeddate=readtable(string(list_of_all_load_profile(i)));
        dataminutes=timetable(minutes(1:1:1440)',p(i,:)');
        datahour=retime(dataminutes,'hourly','mean');
        datahour_full(i,:)=datahour.Var1;
    end
end