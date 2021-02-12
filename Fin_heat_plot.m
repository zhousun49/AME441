close all;
%Question: What are the dimentions of the battery pack?
battery_height = 0.8;
battery_length = 0.6;%!!!Assumed parameters
At = battery_height*battery_length;
%Total Area of battery cross section (m^2)
%Question: Are we using five battery packs?
N = 13;
%Number of fins
efficiency = 1;
h = linspace(10,500);
%Convective heat transfer coefficient of Air(W/m^2*K)
%Range from 10-500
length = 0.05;
width = battery_length;
thickness = 0.05;
%width is width of one fin (m)
%length is length of one fin (m)
%thickness is thickness of one fin (m)
P = 2*(width+thickness);
%Perimeter of the cross-section area m
k = 5;
%Just a constant
Af = width*thickness;
%Fin cross section Area (m^2)
Ab = At - Af;
%Cross Section Area that fins did not cover(m^2)
L = 0.05;
%Length of the fin (m)
thetab = 60-27;
%Temperature difference (K)
%Assumed from 150 Celsius to 50 Celsius
m = sqrt(h*P/(k*Af));
M = sqrt(h*P*k*Af*thetab);
qf = zeros(100,1);
qtot = zeros(100,1);
for i = 1:100
%     qf(i) = M(i)*(sinh(m(i)*L)+(h(i)/(m(i)*k))*cosh(m(i)*L))/(cosh(m(i)*L)+(h(i)/(m(i)*k))*sinh(m(i)*L));
    qtot(i) = N*efficiency*h(i)*Af*thetab + h(i)*Ab*thetab;
end 
plot(h, qtot)
xlabel('Forced air convective coefficient (W/m^2)')
ylabel('Total amount of heat transferred (W)')
title('h Vs q')
