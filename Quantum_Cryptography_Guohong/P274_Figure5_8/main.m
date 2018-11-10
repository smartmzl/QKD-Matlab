% Zelin Meng 2018 @ SWU
% mengzelin@email.swu.edu.cn
% Basic GLLP simulation

% Probability of Alice and Bob choosing the same basis.
global q; q = 0.5;
global e_0; e_0 = 0.5;
% System light path error rate.
global e_det; e_det = 0.015;
% Dark count rate of the detector of Bob.
global p_d; p_d = 0.000002;
% Detection rate of the detector of Bob.
global Eta_D; Eta_D = 0.15;
% Efficiency of Bob.
global Eta_Bob; Eta_Bob = 0.4;
% Alpha is loss index of fibre.
global Alpha; Alpha = 0.0002;

set(gca,'yscale','log');

% Print plot.
% x is the distance of communication.
% Rate(x, Miu);
% Miu is the mean photon number of light source.
x = (0 : 0.0001 : 100);
y_01 = Rate(x, 0.1, 10^(-7));
y_005 = Rate(x, 0.05, 10^(-7));
y_001 = Rate(x, 0.01, 10^(-7));
y_0005 = Rate(x, 0.005, 10^(-7));
y_0001 = Rate(x, 0.001, 10^(-7));
hold on
%xlabel('Distance (Km)'), ylabel('Bit rate (Bit/Pulse)')
plot(x, y_01);
plot(x, y_005);
plot(x, y_001);
plot(x, y_0005);
plot(x, y_0001);
legend('Miu = 0.1','Miu = 0.05','Miu = 0.01','Miu = 0.005','Miu = 0.001');