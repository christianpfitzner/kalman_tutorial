# kalman_tutorial


## GPS Localization
![image](https://user-images.githubusercontent.com/20952014/168821455-58be9bf2-4ed0-4cd5-bec5-cdb8c447bffa.png)

In the first example, you should apply the Kalman Filter for the purpose of localization based on raw GPS data. Think in this scenario of a robot driving outdoors in one direction. The GPS provides sensor data with a rate of 1 Hz. While the sensor does not drift over time, the raw sensor data contains a Gaussian distributed noise in the x and y direction. 


## Sensor Fusion

In the second example, you receive additional odometry data from the robot, as well as GPS. In this scenario, you should do sensor fusion based on the Kalman Filter. The equations stay the same as in the previous example for the core implementation of the Kalman Filter. Maybe it is a good idea to extend your measurment vector, so not only GPS data is included. Try to bring the fused trajectory close to the ground truth trajectory, similar as in the following figure. 

![image](https://user-images.githubusercontent.com/20952014/168822266-f478c936-4223-40f3-a605-981fdacba621.png)
