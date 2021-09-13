% In-line function to update the source voltage V(1)
%---------------------------------------------------------------
% External Function:
% Vg = the source function
% n = the time-step
%---------------------------------------------------------------
% compute the open circuit source voltage:
Vs = Vgourd(n,dt);

if(Rg > 0)
% compute the multiplier coefficients (from (2.62)):
    b1 = C*dx*0.5/dt;
    b2 = 0.5/Rg;
    c1 = 1.0/(b1 + b2);
    c2 = b1 - b2;
    % update the line voltage at the source node
    V(1) = c1 * (c2 * V(1) - I(1) + Vs/Rg);
else
    V(1) = Vs; % if Rs = 0, then V(1) = Vs
end
