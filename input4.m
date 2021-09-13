%input 4
%case iv, CFL = 0.99

C = 100e-12;
L = 250e-9;
d = 0.5;
dx = 0.01;
ncells = d/dx;
cfln = 0.99; 
simtime = 5e-9;

Rg = 50; %Source resistance
RL = 50; %Load resistance


CL = 0; % Capacitive Load
G = 0;
R = 0;
LL = 0;

load_case = 1;


txlineFDTD(C,L,d,ncells,cfln,simtime,Rg,RL,load_case,CL,LL,G,R)