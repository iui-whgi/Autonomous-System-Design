#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def param_publisher():
    rospy.init_node('param_publisher', anonymous=False)

    # 파라미터 읽기 (기본값도 설정 가능)
    robot_name = rospy.get_param('~robot_name', 'TurtleBot')
    speed = rospy.get_param('~speed', 1.0)

    pub = rospy.Publisher('robot_status', String, queue_size=10)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        msg = f"[{robot_name}] is moving at speed {speed} m/s"
        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        param_publisher()
    except rospy.ROSInterruptException:
        pass


