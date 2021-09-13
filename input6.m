% input 6
% case vi 
% Parallel RC case, Lossless

C = 100e-12;
L = 250e-9;
d = 0.5;
dx = 0.01;
ncells = d/dx;
cfln = 1; 
simtime = 20e-9;

Rg = 50; % Source resistance
RL = 150; % Load resistance

CL = 5e-12 % Capacitive Load
G = 0;
R = 0;
LL = 0;


load_case = 4; 
txlineFDTD(C,L,d,ncells,cfln,simtime,Rg,RL,load_case,CL,LL,G,R)