clear all;
close all; 

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


     
vel_init_x = odom(2,1) - odom(1,1)
vel_init_y = odom(2,2) - odom(1,2)
x = [poses(1,1) poses(1,2), vel_init_x vel_init_y]';

P = [0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0];

%Systemrauschen
qx = 1e-6;
qy = 1e-6;

qx = 0.001; 
qy = 0.001; 
         
Q = [ 0   0   0   0;
      0   0   0   0;
      0   0   qx  0;
      0   0   0  qy]; 
          
%Messrauschen
r = 2;
R = [r 0 0 0 ; 
     0 r 0 0 
     0 0 0.01 0 
     0 0 0 0.01];

u = [0; 0; 0; 0];
odom_alt = poses(1,1:2);


vel_previous = [0 0]; 


for k=1:samples,
  
	% GPS Messwerte und geschwindigkeit1
	z = [gps(k,1); gps(k,2); vel(k,1); vel(k,2)];
	
	% Berechnen Sie hier den Steuervektor aus Odometriedaten
	dx       = poses(k, 1:2) - odom_alt;
	odom_alt = poses(k,1:2);
  u        = [dx(1); dx(2); 0; 0];
			        	
	% Schätzwert berechnen
	x_prio =  A*x(:,k); # + B*u;
	
	% Unsicherheit der Schätzung berechnen
	P_prio = A * P * A' + Q;
		
	% "beobachtbaren" Schätzwert ermitteln
	y_e = H*x_prio;

	% Kalman-Verstärkung berechnen
	K = P_prio * H' * inv(H * P_prio * H' + R);

	% Zustand aktualisieren
	x(:,k+1) = x_prio + K * (z - y_e);
	P = (eye(4) - K * H) * P_prio;
  
end


figure(2)
plot(poses(:, 1))
hold on; 
plot(poses(:, 2))



figure(3)
plot(vel(:,1));
hold on; 
plot(vel(:,2)); 



figure(1)



#plot(x(1,:),x(2,:), 'r');
grid on; 
axis equal; 
hold on;
plot(ground(:,1),ground(:,2), 'g');
plot(odom(:,1),odom(:,2), 'b--');
plot(gps(:,1),gps(:,2), 'x');
legend('est', 'ground truth','odom', 'gps')

hold off