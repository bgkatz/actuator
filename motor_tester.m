clear all;

%example torque and speed profiles
time = linspace(0, 20, 1000);
torque = 1.5*sin(5*time);
speed = 10*sin(time);

[p_in, p_diss, energy, t_est] = get_motor_performance(time, torque, speed);


figure;plot(p_in); title('Input Power');
figure;plot(p_diss); title('Power Dissipation');
figure;plot(t_est);  title('Estimated Temperature');
figure;plot(energy);