clear all;
close all; 

% Anzahl Messwerte
vals    = 100;

% Streuung der Messwerte
sigma = 5.0;

% ZustandsÃ¼bergangsmodel
dT = 1.0;
A = [1    0    dT   0;
	0    1    0     dT;
	0    0    1     0;
	0    0    0     1];

% Realer Zustand
x = [0 0 1 1]';

% Messwerte generieren
data = generate_noisy_data(A, x, vals, sigma);
plot(data(:,1),data(:,2), 'x');

% SchÃ¤tzung des Anfangszustands
x = [0 0 1 1]';

% Nur die Position ist messbar, nicht die Geschwindigkeit
H = [1 0 0 0; 0 1 0 0];

% Messrauschen
R = [sigma 0; 
    0 sigma];

% Systemrauschen
q = 0.001;
Q = [0 0 0 0;
     0 0 0 0; 
     0 0 0 0; 
     0 0 0 0];

% Kovarianz
P = [1 0 0 0;
     0 1 0 0; 
     0 0 1 0; 
     0 0 0 1];

P_data_for_plot = zeros(vals, 4);
K_data_for_plot = zeros(vals, 2); 
     
% Implementieren Sie hier den Kalmanfilter
for i=1:vals 
	x_prio = A * x;
	y = H * x_prio;
	P = A * P * A' + Q;
	K = P * H' * inv(H*P*H' +R)
	x = x_prio + K * (data(i,:)' - y);
	P = (eye(4) - K * H) * P;
  size(K)
  
  K_data_for_plot(i,1) = K(1,1);
  K_data_for_plot(i,2) = K(3,1);  
  
  
  P_data_for_plot(i,1) = P(1,1); 
  P_data_for_plot(i,2) = P(2,2); 
  P_data_for_plot(i,3) = P(3,3); 
  P_data_for_plot(i,4) = P(4,4); 
  
	data_kalman(i,:) = x;
end;

hold on;
figure(1); 
plot(data_kalman(:,1),data_kalman(:,2), 'r');
hold off; 

figure(2); 
plot(data_kalman(:,3)); 
hold on; 
plot(data_kalman(:,4));
hold off;

figure(3); 
plot(P_data_for_plot(:,1)); 
hold on; 
plot(P_data_for_plot(:,2)); 
plot(P_data_for_plot(:,3)); 
plot(P_data_for_plot(:,4)); 
hold off; 

figure(4);
hold on; 
plot(K_data_for_plot(:,1));  
plot(K_data_for_plot(:,2));  