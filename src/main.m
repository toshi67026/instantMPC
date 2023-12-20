clc
close all

%% model paraemter
run('params')

%% 
mdl = "main_model";
% open_system(mdl)
simOut = sim(mdl);

figure
hold on
plot(simOut.tout, simOut.x.Data(:, 1), 'LineWidth', 3)
yline(r(1), '-.', 'LineWidth', 3)
legend({'$x$', '$i_r$'}, 'Interpreter', 'latex')
xlabel('Time [s]', 'Interpreter', 'latex')
ylabel('$i$ [A]', 'Interpreter', 'latex')
grid on
box on
set(gca, 'FontSize', 24)

figure
hold on
plot(simOut.tout, simOut.x.Data(:, 2), 'LineWidth', 3)
yline(r(2), '-.', 'LineWidth', 3)
legend({'$\omega$', '$\omega_r$'}, 'Interpreter', 'latex')
xlabel('Time [s]', 'Interpreter', 'latex')
ylabel('$\omega$ [rad/s]', 'Interpreter', 'latex')
grid on
box on
set(gca, 'FontSize', 24)

figure
hold on
plot(simOut.tout, simOut.opt_value.Data, 'LineWidth', 3)
xlabel('Time [s]', 'Interpreter', 'latex')
ylabel('optimal value', 'Interpreter', 'latex')
grid on
box on
set(gca, 'FontSize', 24)

figure
hold on
plot(simOut.tout, simOut.u.Data, 'LineWidth', 3)
xlabel('Time [s]', 'Interpreter', 'latex')
ylabel('$u$', 'Interpreter', 'latex')
grid on
box on
set(gca, 'FontSize', 24)
