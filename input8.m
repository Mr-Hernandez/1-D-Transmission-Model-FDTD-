% input 8
% case viii 
% Series R-L Load, Lossless and Lossy

C = 100e-12;
L = 250e-9;
d = 0.5;
dx = 0.01;
ncells = d/dx;
cfln = 1; 
simtime = 20e-9;

Rg = 50; % Source resistance
RL = 10; % Load resistance

CL = 0; % Capacitive Load
G = 0;
R = 0; % Line losses ohms/meter
LL = 10e-9;

load_case = 5; 
txlineFDTD(C,L,d,ncells,cfln,simtime,Rg,RL,load_case,CL,LL,G,R)

disp('Press Enter to see part 2 of case iii (lossy response)');
pause;
R = 50e-3;
G = 25e-3;
txlineFDTD(C,L,d,ncells,cfln,simtime,Rg,RL,load_case,CL,LL,G,R)
