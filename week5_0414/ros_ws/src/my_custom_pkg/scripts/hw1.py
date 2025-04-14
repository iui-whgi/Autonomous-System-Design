#!/usr/bin/env python3
import rospy
import math
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion

class TurtleBot3PositionController:
    def __init__(self):
        # Initialize ROS node
        rospy.init_node('turtlebot3_position_controller')
        
        # Publishers and subscribers
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        self.odom_sub = rospy.Subscriber('/odom', Odometry, self.odom_callback)
        
        # Control rate (10 Hz)
        self.rate = rospy.Rate(10)
        
        # Initialize position and orientation variables
        self.x = 0.0
        self.y = 0.0
        self.theta = 0.0
        
        # Initial position (for calculating distance moved)
        self.initial_x = None
        self.initial_y = None
        
        # Target distance to move (in meters)
        self.target_distance = 1.0  # Default: 1m
        
        # Control parameters
        self.linear_speed = 0.2  # m/s
        self.angular_speed = 0.5  # rad/s
        
        # Wait for odometry data to start
        rospy.sleep(1)

    def odom_callback(self, msg):
        # Get current position
        self.x = msg.pose.pose.position.x
        self.y = msg.pose.pose.position.y
        
        # Get orientation
        orientation_q = msg.pose.pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        _, _, self.theta = euler_from_quaternion(orientation_list)
        
        # Store initial position on first callback
        if self.initial_x is None:
            self.initial_x = self.x
            self.initial_y = self.y

    def stop(self):
        # Create stop command
        cmd = Twist()
        cmd.linear.x = 0.0
        cmd.angular.z = 0.0
        
        # Send stop command multiple times to ensure the robot stops
        for _ in range(5):
            self.cmd_vel_pub.publish(cmd)
            self.rate.sleep()
        
        rospy.loginfo("Robot stopped")

    def rotate(self, angle):
        # Create rotation command
        cmd = Twist()
        cmd.linear.x = 0.0
        cmd.angular.z = self.angular_speed if angle > 0 else -self.angular_speed
        
        # Calculate time needed to rotate
        time_to_rotate = abs(angle) / abs(cmd.angular.z)
        
        # Start time
        start_time = rospy.Time.now().to_sec()
        
        # Rotate for calculated time
        while (rospy.Time.now().to_sec() - start_time) < time_to_rotate:
            self.cmd_vel_pub.publish(cmd)
            self.rate.sleep()
        
        # Stop after rotation
        self.stop()
        rospy.loginfo(f"Rotated {angle} radians")

    def move_straight(self, distance):
        # Reset initial position
        self.initial_x = self.x
        self.initial_y = self.y
        
        # Create movement command
        cmd = Twist()
        cmd.linear.x = self.linear_speed
        cmd.angular.z = 0.0
        
        # Move until target distance is reached
        while not rospy.is_shutdown():
            # Calculate distance moved
            distance_moved = math.sqrt((self.x - self.initial_x)**2 + (self.y - self.initial_y)**2)
            
            # Check if target distance reached
            if distance_moved >= distance:
                break
                
            # Publish command
            self.cmd_vel_pub.publish(cmd)
            self.rate.sleep()
        
        # Stop after reaching target
        self.stop()
        rospy.loginfo(f"Moved {distance} meters")

    def run(self):
        rospy.loginfo("TurtleBot3 Position Controller Started")
        
        try:
            # First adjust orientation (optional)
            # self.rotate(math.pi/2)  # 90 degrees
            
            # Then move straight
            self.move_straight(self.target_distance)
            
            rospy.loginfo("Movement completed")
            
        except rospy.ROSInterruptException:
            pass

if __name__ == '__main__':
    try:
        controller = TurtleBot3PositionController()
        controller.run()
    except rospy.ROSInterruptException:
        pass