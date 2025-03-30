#!/usr/bin/env python3
import rospy
import random
from std_msgs.msg import Float32
from datetime import datetime

def publisher():
    rospy.init_node('temp_publisher', anonymous=True)
    pub = rospy.Publisher('temperature', Float32, queue_size=10)
    rate = rospy.Rate(0.2)  # 5초 간격

    while not rospy.is_shutdown():
        temp = random.uniform(10.0, 40.0)
        now = datetime.now().strftime("%H:%M:%S")
        rospy.loginfo(f"[{now}] Publishing temperature: {temp:.2f} °C")
        pub.publish(temp)
        rate.sleep()

if __name__ == '__main__':
    try:
        publisher()
    except rospy.ROSInterruptException:
        pass

