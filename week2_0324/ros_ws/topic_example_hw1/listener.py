#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from datetime import datetime

def callback(msg):
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    rospy.loginfo("Received at %s", msg.data)

def subscriber():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('chatter', String, callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        subscriber()
    except rospy.ROSInterruptException:
        pass

