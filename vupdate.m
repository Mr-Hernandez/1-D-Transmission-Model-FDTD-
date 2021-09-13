%In-line function to compute the update of the line voltage 
%interiro to the homogeneous line

if load_case >= 4 %Parallel RC Lossy
    for k=2:nx-1
        V(k) = cs1 * V(k) - cs2*((I(k) - I(k-1))/dx); %(notes 4.26)
    end
else %covers case i, ii, iii, iv, and v. 
    %compute multiplier coefficient (can be moved out to to level)
    
    cv = dt/(C*dx);
    
    %recursively update the line voltage at all interior nodes
    %via (2.13)

    for k=2:nx-1
        V(k) = V(k) - cv *(I(k) - I(k-1)); %(2.13)j
    end
end

