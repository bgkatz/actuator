function [ power_in, power_diss, energy, temp_est ] = get_motor_performance( time, torque, speed )
%Returns estimated input power, actuator dissipation, and actuator
%temperature for a torque and speed trajectory%
load('lookup.mat');

time_even = linspace(min(time), max(time), length(time));
torque_even = interp1(time, torque, time_even);
speed_even = interp1(time, speed, time_even);

dt = time_even(2) - time_even(1);
Rth = 1.23;
Cth = 32;
Tamb = 25;

power_in = interp2(s_grid, t_grid, pe_grid, speed, torque);
power_diss = interp2(s_grid, t_grid, loss_grid, speed, torque);
energy = cumtrapz(time, power_in);

p_diss_even = interp1(time, power_diss, time_even);
temp_est_even = filter(dt/Cth,[1, dt/(Rth*Cth)-1], p_diss_even)+ Tamb;
temp_est = interp1(time_even, temp_est_even, time);


end

