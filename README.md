# kalman_tutorial

This tutorial is about the famous Kalman Filter, in the context of mobile robotics, as it is taught at the Technische Hochschule Ingolstadt. 

The Kalman Filter consists of two phases, besides initialization. The first one is the prediction: 

![image](https://user-images.githubusercontent.com/20952014/169228784-59daf02b-207a-4e9a-8e21-6efdd1a5a119.png)

Second, the update phase: 

![image](https://user-images.githubusercontent.com/20952014/169228921-2858797d-7c3d-4b7d-91b9-1e617e3cd5ee.png)



## GPS Localization

In the [first example](https://github.com/christianpfitzner/kalman_tutorial/blob/master/01_introduction/kalman_intro_template.m), you should apply the Kalman Filter for the purpose of localization based on raw GPS data. Think in this scenario of a robot driving outdoors in one direction. The GPS provides sensor data with a rate of 1 Hz. While the sensor does not drift over time, the raw sensor data contains a Gaussian distributed noise in the x and y direction. 

![image](https://user-images.githubusercontent.com/20952014/168821455-58be9bf2-4ed0-4cd5-bec5-cdb8c447bffa.png)![image](https://user-images.githubusercontent.com/20952014/169245080-9f85a27b-fe48-46e3-ad51-6df58c92ec13.png)

## Sensor Fusion

In the [second example](https://github.com/christianpfitzner/kalman_tutorial/blob/master/02_sensor_fusion/localization_new.m), you receive additional odometry data from the robot, as well as GPS. In this scenario, you should do sensor fusion based on the Kalman Filter. The equations stay the same as in the previous example for the core implementation of the Kalman Filter. Maybe it is a good idea to extend your measurment vector, so not only GPS data is included. Try to bring the fused trajectory close to the ground truth trajectory, similar as in the following figure. 

![image](https://user-images.githubusercontent.com/20952014/168822266-f478c936-4223-40f3-a605-981fdacba621.png)
