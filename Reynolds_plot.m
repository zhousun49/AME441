close all;
rho = 1.177;
vis = 1.568*10^(-5);
%Air property at 27 degrees Celsuis
L = 0.5;
%Characteristic length, subject to change
v = linspace(0,30);
laminor = repmat(2300,100,1);
turbulent = repmat(4600,100,1);
Re = rho*v*L/vis;
max_air_v = 0.3*340;
plot(v, Re)
legend("Reynold's number")
xlabel('Flow velocity (m/s)')
ylabel("Reynold's Number")
title("Reynold's Number Vs Velocity")