%input2
%case ii, short and open circuit

%Short Circuit, it would cancel out another approaching then V=0
C = 100e-12;
L = 250e-9;
d = 0.5;
dx = 0.01;
ncells = d/dx;
cfln = 1; 
simtime = 5e-9;
Rg = 50; %Source resistance
RL = 0; %Load resistance

CL = 0; % Capacitive Load
G = 0;
R = 0;
LL = 0;

load_case = 2;

txlineFDTD(C,L,d,ncells,cfln,simtime,Rg,RL,load_case,CL,LL,G,R)

%Open Circuit--------------------------------------------------
load_case = 3;
disp('press enter to continue to open circuit plot');
pause;
RL = 100000000;
txlineFDTD(C,L,d,ncells,cfln,simtime,Rg,RL,load_case,CL,LL,G,R)