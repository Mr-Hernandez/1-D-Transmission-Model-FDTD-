function Vsauce =  Vgourd(n, dt) %Trapezoid signal function

% nx = n;
t_rise = 200e-12;
t_fall = 200e-12;
t_peak = 500e-12;
% t_total = t_rise + t_fall + t_peak;


% for n = 1:nx-1
    t = (n-0.5)*dt; %the time, nth step times changes in time
    
    if t < 0
        Vsauce = 0;
    elseif t >= 0 && t<= t_rise
        Vsauce = 2*(t / t_rise);
    elseif t >= t_rise && t <= t_rise + t_peak
        Vsauce = 2;
    elseif t >= t_rise + t_peak && t <= t_rise + t_peak + t_fall
        Vsauce = 2*(t_rise + t_peak + t_fall - t) / t_fall;
    else 
        Vsauce = 0;
    end
% figure(2)
% hold on
% disp(Vsauce);
% plot(t, Vsauce, 'pg')
% axis ([0 5e-9 0 3])
% pause(0.2);
% hold off
