clear all;
close all; 

% number of values in the measurement vector
vals    = 100;

% noise in sensor data for gps
sigma = 5.0;

% description of system 
dT = 1.0;
A = [1    0    dT   0;
	0    1    0     dT;
	0    0    1     0;
	0    0    0     1];

% ground truth state
x = [0 0 1 1]';

% Messwerte generieren
data = generate_noisy_data(A, x, vals, sigma);
plot(data(:,1),data(:,2), 'x');

% SchÃ¤tzung des Anfangszustands
x = [0 0 1 1]';

% Nur die Position ist messbar, nicht die Geschwindigkeit
H = [1 0 0 0; 0 1 0 0];

% measurement noise 
R = [sigma 0; 
    0 sigma];

% system noise
q = 0.001;
Q = [0 0 0 0;
     0 0 0 0; 
     0 0 0 0; 
     0 0 0 0];

% covariance matrix
P = [1 0 0 0;
     0 1 0 0; 
     0 0 1 0; 
     0 0 0 1];


     
% TASK 1: Impement the Kalman Filter in the upcomming loop
for i=1:vals 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %        ADD YOUR CODE HERE          %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
end;



# TASK 2: Plot the result of the Kalman filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


# TASK 3: Plot the estimated values for the velocity over time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


# TASK 4: Plot values on the main diagonal in the covariance matrix over time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

