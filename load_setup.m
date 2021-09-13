%load setup
%---------------------------------------------------------------------

% 1: Resistive (Lossless)-------------------------------------
if load_case == 1
    % compute the multiplier coefficients (from (2.59)):
    % The cases won't involve losses, use eq from load_case 3
    % if losses need to be accounted for.
    b1 = C*dx*0.5/dt;
    b2 = 0.5/RL;
    c1 = 1.0/(b1 + b2);
    c2 = b1 - b2;
%load_case 2 uses vlupdate to set v(nx) to 0. No setup needed

% 3: Resistive (Lossy)----------------------------------------
elseif load_case == 3
    cv12 = 1.0/(C*dx*0.5/dt-0.25*G*dx);
    cv11 = (C*dx*0.5/dt-0.25*G*dx) * cv12;

% 4: Parallel R-C (Lossy)--------------------------------------
elseif load_case == 4
    % vlupdate coefficients (notes 4-39)
    cv12 = 1.0/ ((C*dx+2.*CL)*0.5/dt + 0.5*(G*dx*0.5+1./RL));
    cv11 = ((C*dx+2.*CL)*0.5/dt - 0.5*(G*dx*0.5+1/RL)) * cv12;
    
    % (v)and(i)update coefficients for Parrallel RC
    cs2 = 1 / (C/dt+G*0.5);  %vupdate
    cs1 = (C/dt-G*0.5)*cs2;  %vupdate
    ci2 = 1/(L/dt+R*0.5);    %iupdate
    ci1 = (L/dt-R*0.5)*ci2;  %iupdate

% 5: Series R-L (Lossy)
elseif load_case == 5
    Q = [(C*dx*0.5/dt+G*dx*0.25), 0.5; 0.5, -(LL/dt+RL*0.5)];
    P = [(C*dx*0.5/dt-G*dx*0.25),-0.5; -0.5, -(LL/dt-RL*0.5)];
    Pinv = inv(P);
    S = [0.0; 0.0];
    Y = [0.0; 0.0];
    
    cs2 = 1 / (C/dt+G*0.5);
    cs1 = (C/dt-G*0.5)*cs2;
    ci2 = 1/(L/dt+R*0.5); 
    ci1 = (L/dt-R*0.5)*ci2;
    
% elseif load_case == 6
    
end

%case 1 - Resistive
%case 2 - Short
%case 3 - Open
%case 4 - Parrallel RC
%case 5 - Series RL
%case 6 - ???