% In-line function to compute the update of the line current
% interior to the homogeneous line
%---------------------------------------------------------------


if load_case >= 4
    for k=1:nx-1
        I(k) = ci1*I(k) - ci2*((V(k+1) - V(k))/dx);
    end

else %covers cases i - v
    % compute the multiplier coefficient:
    ci = dt/(L * dx);

    % recursively update the line voltage at all interior nodes
    % via (2.14):
    for k=1:nx-1
        I(k) = I(k) - ci * (V(k+1) - V(k)); %(2.14)
    end
end
% for k=1:nx-1
%     I(k) = (V(k+1) + V(k))/2 *(G*dx*0.5+1/RL)+(C*dx*0.5+CL)*(V(k+1)-V(k))/dt;
% end