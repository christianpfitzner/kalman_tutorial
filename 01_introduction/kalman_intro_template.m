clear all;
close all; 

% number of values generated
vals    = 100;

% gps measurement noise
sigma = 5.0;

% ZustandsÃ¼bergangsmodel
dT = 1.0;
A = [1    0    dT   0;
	0    1    0     dT;
	0    0    1     0;
	0    0    0     1];

% grund truth pose for the init
x = [0 0 1 1]';

% Messwerte generieren
data = generate_noisy_data(A, x, vals, sigma);
plot(data(:,1),data(:,2), 'x');

% Estimation of starting condition
x = [0 0 1 1]';

% Only the position can be measured via gps
H = [1 0 0 0; 0 1 0 0];

% measurment noise
R = [sigma 0; 
    0 sigma];

% system noise
q = 0.001;
Q = [0 0 0 0;
     0 0 0 0; 
     0 0 0 0; 
     0 0 0 0];

% covariance
P = [1 0 0 0;
     0 1 0 0; 
     0 0 1 0; 
     0 0 0 1];

     
% loop over all values
for i=1:vals 
    # TASK 1: 
    # Implement the Kalman Filter and visualize
    # your result in a plot together with the 
    # raw sensor data. 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %        ADD YOUR CODE HERE          %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    

end;

figure(1); 
plot(data(:,1),data(:,2), 'x');
axis equal; 
xlim([-10, 120]);
ylim([-10, 120]); 
grid on; 
hold off; 


# TASK 2: 
# Plot the estimated velocity values of the robot 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


# TASK 3: 
# Plot the values on the main diagonal of the covariance matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
