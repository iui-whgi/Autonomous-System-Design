kill -9 -1


killall -9 roscore
killall -9 rosmaster
killall -9 rosout
killall -9 python
killall -9 python3
killall -9 nodelet


rosrun turtlesim turtlesim_node
rosrun turtlesim turtle_teleop_key
rosbag record -O my_turtle_pose.bag /turtle1/pose


roslaunch turtlebot3_gazebo turtlebot3_world.launch

rosrun my_custom_pkg turtle_controller.py


rostopic echo /odom


rostopic echo -b my_turtle_velocity.bag -p /turtle1/cmd_vel > output.csv




가제보 초기화 

```
killall gzserver
killall gzclient
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```



rostopic echo -b your_file.bag -p /turtle1/pose | grep position

 rostopic echo /odom | awk '/position:/{flag=1;next}/orientation:/{flag=0}flag'







rosbag record -O turtlebot_movement.bag /odom
rostopic echo -b turtlebot_movement.bag -p /turtle1/odm > turtlebot_mov
ement4.csv
rostopic echo -b turtlebot_movement3.bag -p /odom > turtlebot_movement3.csv






turtlebot_movement2.csv에저장함



아래이런거 써서 만들기
 rqt_plot turtlebot_movement.bag




 field.pose.pose.position.x,field.pose.pose.position.y
 이두개 답이있따.