% In-line function to update the load voltage V(nx)

%---------------------------------------------------------------
% Input:
% RL = the load resistance (should be >= 0).
%---------------------------------------------------------------

% If the load resistance is 0, V(nx) = 0:
% if(RL == 0)
%     V(nx) = 0.;

if load_case == 1
    % update the line voltage at the load:
    V(nx) = c1 * (c2 * V(nx) + I(nx-1));
elseif load_case == 2
    V(nx) = 0.;
elseif load_case == 3
    V(nx) = cv11 * V(nx) + cv12 * I(nx-1);
elseif load_case == 4
        V(nx) = cv11 * V(nx) + cv12 * I(nx-1);
elseif load_case > 4
    Y(1) = I(nx-1);
    S = Pinv*(Q*S + Y);
    V(nx) = S(1);
end