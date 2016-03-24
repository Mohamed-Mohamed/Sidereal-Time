function [ J0, T0, theta_G0, theta_G, theta, thetaINhours ] = SiderealTime( date, UT, Landa )
%% Coded by
% Mohamed Mohamed El-Sayed Atyya
% mohamed.atyya94@eng-st.cu.edu.eg
%% INPUTS:
% date                   :  [year month day]
% UT                      :  localtime [hours min sec]
% Landa                 :  eastlongitude [degree min sec]
%% OUTPUTS:
% J0                    :  Julian day number at 0 h UT
% T0                    :  Julian time 
% theta_G0         :  Greenwich sidereal time @ 0 h  UT in degree
% theta_G           :  the Greenwich sidereal time @ any other UT in degree
% theta               :  the local sidereal time of a site in degree
% thetaINhours :  the local sidereal time of a site in hours
% ---------------------------------------------------------------------------------------------------------------------------------------------------------
J0=367*date(1)-floor(7/4*(date(1)+floor((date(2)+9)/12)))+floor(275/9*date(2))+date(3)+1721013.5;
T0=(J0-2451545)/36525;
UTinHours=UT(1)+UT(2)/60+UT(3)/3600;
theta_G0=100.4606184+36000.77004*T0+0.000387933*T0^2-2.583e-8*T0^3;
while theta_G0 >= 360
    theta_G0=theta_G0-360;
end
theta_G=theta_G0+360.98564724*UTinHours/24;
Landa1=Landa(1)+Landa(2)/60+Landa(3)/3600;
theta=theta_G+Landa1;
while theta >= 360
    theta=theta-360;
end
thetaINhours=theta/15;
end