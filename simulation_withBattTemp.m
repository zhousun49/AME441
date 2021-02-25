clear;clc
close all
%Assume the acceleration from 0 to 100 km/h is 5 seconds
%Assume that the car is either accelerating or slowing down, never moving
%at constant speed
%Assume constant acceleration and deceleration
%3 parts: 1, First part, straight line
%         2, Second part, 5 turns
%         3, Third part, straight line
%Part 1: Staright line for 500 m
A_cross = 21.19*2.54*21.19*2.54/2*10^-4+21.19*2.54*16.9*2.54*10^-4;
Cd = 0.24;
%Drag coefficient
rho = 1.225;
%Cross section Area (m^2) of the car
d1 = 500;
a1 = 100*1000/3600/5; %Unit to m/s
t = 0;
syms t1;
eqn = d1 == 0.5*a1*t1^2;
t1 = eval(vpasolve(eqn));
t_first = t1(2);
%Time passed
deltat = 0.1;
v1 = zeros(round(t_first/deltat),1);
t_array1 = zeros(round(t_first/deltat),1);
for i = 2:round(t_first/deltat)
    v1(i) = v1(i-1) + a1*deltat;
    t = t + deltat;
    t_array1(i) = t;
end
m = 800*0.454;
%Assumed 600 pound car and 200 pound driver, this is in kg
Fm1 = m*a1;
Ff = 0.4*m*9.8;
%Assume that friction stays constant, 0.4
p1 = zeros(length(t_array1), 1);
for j = 1:length(p1)
    Fd1 = Cd*A_cross*rho*v1(j);
    %Fm is force of the car + man
    %Ff is force of friction
    %Fd is force of drag
    Ftot1 = Fm1+Ff+Fd1;
    %Total Force
    p1(j) = Ftot1*v1(j);
end
%Part 2: Five turns
%Here we make another assumption, that when the car is slowing down, there
%is no power generated from engine
%Assuming distance to slow down is 50 meters and the car slows down in 3
%seconds
d_slow = 50;
%time given to slow down
v_slow = 25;
%Assumed target velocity to reach
syms t2s;
a_slow = (v1(end)-v_slow)/t2s;
eqn1 = d_slow == 0.5*(-1)*a_slow*t2s^2 + v1(end)*t2s;
t2s = eval(vpasolve(eqn1));
a_slow = (v1(end)-v_slow)/t2s;
%After slowing down, then the car will speed up to enter another turn
d_acceleration = 50;
%Distance for acceleration after curve
syms t2a;
eqn2 = d_acceleration == 0.5*a1*t2a^2 + v_slow*t2a;
t2a = eval(vpasolve(eqn2));
t2a = t2a(2);
t_array2 = zeros(round(t2s/deltat+ t2a/deltat),1);
t_array2(1) = t_array1(end) + deltat;
v2 = zeros(round(t2s/deltat+ t2a/deltat),1);
v2(1) = v1(end);
v2(round(t2s/deltat)+1) = v_slow;
for i = 2:round(t2s/deltat+t2a/deltat)
    if i > 10
        v2(i) = v2(i-1) + a1*deltat;
    else
        v2(i) = v2(i-1) - a_slow*deltat;
    end
    t_array2(i) = t_array2(i-1)+deltat;
end
Fm2 = m*a1;
p2 = zeros(length(t_array2), 1);
for j = 1:length(p2)
    Fd2 = Cd*A_cross*rho*v2(j);
    %Fm is force of the car + man
    %Ff is force of friction
    %Fd is force of drag
    Ftot2 = Fm2+Ff+Fd2;
    %Total Force
    p2(j) = Ftot2*v2(j);
end
t_array_mid1 = zeros(4,100);
v_array_mid1 = zeros(4,100);
p_array_mid1 = zeros(4,100);
for j = 1:4
    syms t2s;
    if j == 1
        a_slow = (v2(end)-v_slow)/t2s;
        eqn1 = d_slow == 0.5*(-1)*a_slow*t2s^2 + v1(end)*t2s;    
        t2s = eval(vpasolve(eqn1));
        a_slow = (v2(end)-v_slow)/t2s;
    else
        one_row = v_array_mid1(j-1,:);
        for z = 1:length(one_row)
            if one_row(z+1) == 0
                v_temp = one_row(z);
                break;
            end 
        end 
        a_slow = (v_temp-v_slow)/t2s;
        eqn1 = d_slow == 0.5*(-1)*a_slow*t2s^2 + v_temp*t2s;
        t2s = eval(vpasolve(eqn1));
        a_slow = (v_temp-v_slow)/t2s;
    end 
    %After slowing down, then the car will speed up to enter another turn
    d_acceleration = 50;
    %Distance for acceleration after curve
    syms t2a;
    eqn2 = d_acceleration == 0.5*a1*t2a^2 + v_slow*t2a;
    t2a = eval(vpasolve(eqn2));
    t2a = t2a(2);
    t_array2_temp = zeros(round(t2s/deltat+ t2a/deltat),1);
    v2_temp = zeros(round(t2s/deltat+ t2a/deltat),1);
    if j == 1
        t_array2_temp(1) = t_array2(end) + deltat;
        v2_temp(1) = v2(end);
    else 
        t_array2_temp(1) = max(t_array_mid1(j-1,:)) + deltat;
        one_row = v_array_mid1(j-1,:);
        for z = 1:length(one_row)
            if one_row(z+1) == 0
                v_temp = one_row(z);
                break;
            end 
        end 
        v2_temp(1) = v_temp;
    end 
    v2_temp(round(t2s/deltat)+1) = v_slow;
    for i = 2:round(t2s/deltat+t2a/deltat)
        if i > 10
            v2_temp(i) = v2_temp(i-1) + a1*deltat;
        else
            v2_temp(i) = v2_temp(i-1) - a_slow*deltat;
        end
        t_array2_temp(i) = t_array2_temp(i-1)+deltat;
    end
    Fm2 = m*a1;
    p2_temp = zeros(length(t_array2_temp), 1);
    for k = 1:length(p2_temp)
        Fd2 = Cd*A_cross*rho*v2_temp(k);
        %Fm is force of the car + man
        %Ff is force of friction
        %Fd is force of drag
        Ftot2 = Fm2+Ff+Fd2;
        %Total Force
        p2_temp(k) = Ftot2*v2_temp(k);
    end
    for y = 1:length(p2_temp)
        t_array_mid1(j,y) = t_array2_temp(y);
        v_array_mid1(j,y) = v2_temp(y);
        p_array_mid1(j,y) = p2_temp(y);
    end 
end
t_array_mid1 = t_array_mid1.';
v_array_mid1 = v_array_mid1.';
p_array_mid1 = p_array_mid1.';
t_array_mid = nonzeros(t_array_mid1(:));
v_array_mid = nonzeros(v_array_mid1(:));
p_array_mid = nonzeros(p_array_mid1(:));
%Above cycle has run 5 times, and it reaches the last phase, therefore, use
%a1, the acceleration in the first part
%Part 3: Straight line 500m
%Assume the car come out of the turns and accelerate again
d3 = 500; %Distance to travel
syms t3
eqn3 = d3 == 0.5*a1*t3^2 + v_slow*t3;
t3 = eval(vpasolve(eqn3));
t_final = t3(2);
%Assumed time
t_array3 = zeros(round(t_final/deltat),1);
t_array3(1) = t_array_mid(end) + deltat;
v3 = zeros(round(t_final/deltat),1);
v3(1) = v_array_mid(end);
for i = 2:round(t_final/deltat)
    v3(i) = v3(i-1) + a1*deltat;
    t_array3(i) = t_array3(i-1) + deltat;
end
Fm3 = m*a1;
p3 = zeros(length(t_array3), 1);
for j = 1:length(p3)
    Fd3 = Cd*A_cross*rho*v3(j);
    %Fm is force of the car + man
    %Ff is force of friction
    %Fd is force of drag
    Ftot3 = Fm3+Ff+Fd3;
    %Total Force
    p3(j) = Ftot3*v3(j);
end
t_whole = cat(1,t_array1, t_array2, t_array_mid, t_array3);
v_whole = cat(1,v1, v2, v_array_mid, v3);
p_whole = cat(1,p1, p2, p_array_mid, p3);
%plots
figure()
plot(t_whole, v_whole)
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Velocity Vs Time Graph')
figure()
plot(t_whole, p_whole)
xlabel('Time (s)')
ylabel('Power (Watts)')
title('Power Vs Time Graph')

%% Temperature Model

% Properties of heat sink (Aluminum and copper)
Kcop = 385; %[W/m K]
Kalum = 205; %[W/m K]
K = Kalum;

% Temperature Assumptions
Tamb = 27; %[C]


% Dimensions of heat sink
sinkHeight = 0.5; %[m]
sinkWidth = 0.12388 * 5; %[m] 
sinkThick = 0.00635; %[m]
sinkArea = sinkHeight*sinkWidth;

% Dimenstions of Fin
finLength = sinkHeight;
finHeight = 0.0127; %[m]
finThick = 0.003175; %[m]
finBtwn = sinkThick; %[m]

% Number of fins/floors
finPerModule = 13;
numModule = 5;

% Surface area at floor of fins
SAfloor = finPerModule * numModule * finLength * finBtwn;

% Surface area of fin walls
SAwalls = finPerModule * numModule * 2 * finLength * finHeight;

% Surface area of fin tips
SAtips = finPerModule * numModule * finThick * finLength;

% Total fin area
SAfin = SAwalls + SAtips;

% Total SA
SAtot = SAfin + SAfloor;
% fprintf('SAtot = %d\n', SAtot);

% Air properties
density = 1.184;
specificHeat = 1007;
Kair = 0.02551;
kinVisc = 0.00001562;
prandtl = 0.7296;

%% Equations

% flow = 22;
% holderA = zeros(1,length(p_whole));
% holderB = zeros(1,length(p_whole));
% 
% for i = 1:length(p_whole)
%     power = p_whole(i);
%     syms tBattAlum tBattCopper;
%     eqnA = power == Kalum * sinkArea * (tBattAlum - Tamb) / sinkThick;
%     tBattAlum = solve(eqnA, tBattAlum);
%     eqnB = power == Kcop * sinkArea * (tBattCopper - Tamb) / sinkThick;
%     tBattCopper = solve(eqnB, tBattCopper);
%     holderA(i) = tBattAlum;
%     holderB(i) = tBattCopper;    
% end
% figure();
% 
% plot(holderA);
% hold on
% plot(holderB);
% hold off
%--------------------
holderA = zeros(1,length(p_whole));
% holderB = zeros(1,length(p_whole));
% holderC = zeros(1,length(p_whole));
tBatt = 30;
h = 81.3239;
cpBatt = 902;
mBatt = 25.2; % [kg]
len = length(p_whole);

% Change me for different metal comparisons!
K = Kcop;
% K = Kalum;
for i = 1:len
    holderA(i) = tBatt;
    powerGen = p_whole(i);
    % If the power is not positive slope, set to 0
    if(i > 1)
        if(p_whole(i-1) > p_whole(i))
            powerGen = 0;
        end
    end
    % syms Tsurf;
    % eqnA = h * SAtot * (tBatt - Tsurf) == Kalum * sinkArea * (Tsurf - Tamb) / sinkThick;
    % Tsurf = solve(eqnA, Tsurf);
    Tsurf = (K * sinkArea * Tamb + h * SAtot * sinkThick * tBatt) / (K * sinkArea + h * SAtot * sinkThick);
    powerdis = (K * sinkArea * (tBatt - Tsurf)) / sinkThick;
    powerdis2 = h * SAtot * (tBatt - Tsurf);
    powerRem = powerGen - powerdis;
%     delT = abs(tBatt - Tsurf);
    delT = tBatt - Tsurf;
    tBatt = tBatt + (powerRem * (1/len) / (mBatt * cpBatt));
end
figure();

plot(holderA);

% plot(holderB);
% hold off
% 
% figure();
% plot(holderC);


