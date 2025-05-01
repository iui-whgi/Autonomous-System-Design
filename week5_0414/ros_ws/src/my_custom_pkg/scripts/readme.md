


 # Empty world 0430 

 ```
 killall gzserver
 killall gzclient
 roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch

 ```

```
rosbag record -O turtlebot_movement.bag /odom
rostopic echo -b turtlebot_movement.bag -p /turtle1/odm > turtlebot_movement4.csv
rostopic echo -b turtlebot_movement3.bag -p /odom > turtlebot_movement3.csv

```

```
rosbag record -O turtlesim_movement.bag /turtle1/pose /turtle1/cmd_vel
```