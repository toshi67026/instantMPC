%% set nominal values
R = 2.0; % Ohms
L = 0.5; % Henrys
Km = 0.015; % torque constant
Kb = 0.015; % emf constant
Kf = 0.2; % Nms
J = 0.02; % kg.m^2

n = 2;
m = 1;
N = 30; % horizon
stop_time = 10; % [s]
sampling_time = 0.1; % [s]

A_c = [-R / L -Kb / L; Km / J -Kf / J];
B_c = [1 / L; 0];
C = eye(n);
D = zeros(n, m);

% 連続システムとしてから離散化
sysc = ss(A_c, B_c, C, D);
sysd = c2d(sysc, sampling_time, 'zoh');
A = sysd.A;
B = sysd.B;

x0 = ones(2, 1);

% 目標値
i_r = 200/3;
omega_r = 5;
r = [i_r; omega_r];
r_z = [zeros(m * N, 1); kron(ones(N, 1), r)]; % zに揃える

alpha = 10;
beta = 10;
Extract_x = [zeros(n * N, N), eye(n * N)];
H = [kron(eye(N), B), kron(eye(N), -eye(n)) + [zeros(n, n * N); kron(eye(N - 1), A), zeros(n * (N - 1), n)]];
V = [A.', zeros(n, n * (N - 1))].';
K = 1 + 2 * alpha * beta;
E = [eye(m), zeros(m, (m + n) * N - m)];

% 目的関数における入力の重みを小さくしないと定常偏差が残ってしまう
F = blkdiag(0.01 * eye(N), 1000 * eye(n * N));
