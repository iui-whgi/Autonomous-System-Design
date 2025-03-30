#!/usr/bin/env python3
import rospy
import random
from std_msgs.msg import String
from datetime import datetime

def publisher():
    rospy.init_node('changwoo', anonymous=True)  # 본인 이름 사용
    pub = rospy.Publisher('chatter', String, queue_size=10)
    rate = rospy.Rate(0.2)  # 5초에 한 번 (1초에 0.2번)

    while not rospy.is_shutdown():
        rand_num = random.randint(1, 100)  # 1~100 사이의 랜덤 숫자
        now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        msg = f"{now} - Random Number: {rand_num}"
        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        publisher()
    except rospy.ROSInterruptException:
        pass

