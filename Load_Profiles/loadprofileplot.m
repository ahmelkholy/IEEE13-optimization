clc, clear all
load('all_load_profile_hour_max.mat');
f=figure(1)
bar3(datahour_full(1:14,:))
xlabel('Hour')
ylabel('Load Profile ID')
zlabel('Loading % ')
exportgraphics(f,'Load_Profile.png','Resolution',2000)
