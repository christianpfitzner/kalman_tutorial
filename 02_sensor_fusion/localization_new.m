clear all;
close all; 

% get data from a previously recorded file
load -ascii poses.txt;

samples = size(poses,1)-1;

odom   =  [poses(2:samples+1,1), poses(2:samples+1,2)];
gps    =  [poses(2:samples+1,3), poses(2:samples+1,4)];
ground =  [poses(2:samples+1,5), poses(2:samples+1,6)];
vel    =  [gradient(odom(:,1)), gradient(odom(:,2))]

dT = 0.999;
A = [1    0    dT   0;
	   0    1    0     dT;
	   0    0    1     0;
	   0    0    0     1];
	 
B = [1 0 0 0;
	   0 1 0 0;
	   0 0 0 0;
	   0 0 0 0];
	      
     
H = [1 0 0 0;
	   0 1 0 0;
     0 0 1 0; 
     0 0 0 1]; 
     
     
# init state with known values
x = [poses(1,1) poses(1,2), 0 0]';

# initial covariance matrix
P = [0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0];

% system noise
qx = 1e-6;
qy = 1e-6;
         
Q = [ 0   0   0   0;
      0   0   0   0;
      0   0   qx  0;
      0   0   0  qy]; 
          
% measurement noise
r = 2;





for k=1:samples,
  # TASK 1: Implement the Kalman Filter in this foor loop
  #         Think how you can fuse the data from the GPS and the Odometry. 
  #         Maybe you can calculate the velocity of and add this to your model
  #         and measurement vector
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %        ADD YOUR CODE HERE          %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
end


# TASK 2: Plot the result of the Kalman filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


# TASK 3: Plot the estimated values for the velocity over time
#         comparing the raw velocity from odometry, to the Kalman Filters output. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


# TASK 4: Plot values on the main diagonal in the covariance matrix over time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        ADD YOUR CODE HERE          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


