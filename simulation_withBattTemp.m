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

% Surface Area just tips of tips
SAtiptip = 2 * finThick * finHeight * finPerModule * numModule;

% Total fin area
SAfin = SAwalls + SAtips + SAtiptip;

% Total SA
SAtot = SAfin + SAfloor;
% fprintf('SAtot = %d\n', SAtot);

% Air properties
density = 1.184;
specificHeat = 1007;
Kair = 0.02551;
kinVisc = 0.00001562; %[v]
prandtl = 0.7296;

% Sink Properties
den_sink = 8940; % [kg/m^3]
Kcop = 385; % [W/m K]

vel = 26.46; % [m/s]
Nu = 1840.476;
Re_t = 9479843;


%% Equations
sheet2 = xlsread('Motor Calculations.xlsx', 'Sheet2');
data = sheet2(3:207,2:14);
ohmic_loss = data(:,13);


%--------------------
holderA = zeros(1,length(ohmic_loss));
tBatt = 45.5;
h = 93.9011;
cpBatt = 902;
mBatt = 25.2; % [kg]
len = length(ohmic_loss);

% Change me for different metal comparisons!
K = Kcop;
% K = Kalum;
for i = 1:len
    holderA(i) = tBatt;
    powerGen = ohmic_loss(i);

    % syms Tsurf;
    % eqnA = h * SAtot * (tBatt - Tsurf) == Kalum * sinkArea * (Tsurf - Tamb) / sinkThick;
    % Tsurf = solve(eqnA, Tsurf);
    
    Tsurf = (K * sinkArea * Tamb + h * SAtot * sinkThick * tBatt) / (K * sinkArea + h * SAtot * sinkThick);
    powerdis = (K * sinkArea * (tBatt - Tsurf)) / sinkThick;
    powerdis2 = h * SAtot * (tBatt - Tsurf);
    powerRem = powerGen - powerdis2;
%     delT = abs(tBatt - Tsurf);
    delT = tBatt - Tsurf;
    tBatt = tBatt + (powerRem * (68/205) / (mBatt * cpBatt));
end
figure();

plot(holderA);
xlabel('Time (s)')
ylabel('Temperature (degree Celcius)')


