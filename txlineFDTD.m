% Intro to FDTD
% Project 1
% Rafael Hernandez
% Main Script

function txlineFDTD(C,L,d,ncells,cfln,simtime,Rg,RL,load_case,CL,LL,G,R)

% This function computes the FDTD analysis
% of a uniform transmission line
% excited by a Thevenin source and terminated by a resistive load.
%---------------------------------------------------------------
% Input:
% C,L = per unit length capacitance & inductance (F/m, H/m)
% d = the length of the line (in m)
% ncells = the number of discrete cells defining the line
% cfnl = the CFL number
% simtime = the total simulation time (in s)
% Vg =reference to the function defining the voltage source Vg(t)
% Rg, RL = the source and load resistances, respectively,
% vpts, ipts = list of line voltage and current sample points for
% output
%---------------------------------------------------------------
%for now have values here

% compute the line parameters:
Zo = (L/C)^(1/2); 
vo = 1.0/sqrt(L*C);

% compute the discretization
dx = d / ncells;
dt = cfln * dx / vo; disp(dt);
nx = ncells + 1; 
nt = floor(simtime / dt);

% initialize the line voltages and currents to zero:
V = zeros(nx,1); 
I = zeros(nx-1,1);

% initialize load coefficients
load_setup;

% Draw plot at t = 0
figure(1)
hold on
grid on
plot(V);
ylim([-3, 3]);
xlabel('x(mm)');
ylabel('V');
title('time: 0.00ns');
hold off

%set up videowriter
v = VideoWriter('case_xx.avi');
v.FrameRate = 10;
open(v)

% output a file of V and I at t=0.
fileID = fopen('data00', 'w');
fprintf(fileID, '%fV\n       %fA\n', V, I);
fclose(fileID);



% Time-advance the line voltages and currents with
% in-line functions:
    for n = 1:nt
        disp(n);
        % update the line voltages:
        vupdate; % update interior node voltages
        vsupdate; % update source node voltage
        vlupdate; % update load node voltage
        
        % update the line currents:
        iupdate;
        
        % output the probe voltages and currents:
        output;
    end
    close(v); %close video file
end