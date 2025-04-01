#!/usr/bin/env python3

import rospy
import random
from my_custom_pkg.msg import Motion  # 커스텀 메시지 임포트

def motion_publisher():
    rospy.init_node('motion_publisher', anonymous=True)
    pub = rospy.Publisher('motion_info', Motion, queue_size=10)
    rate = rospy.Rate(1)  # 1 Hz (1초에 한 번씩 메시지 전송)

    while not rospy.is_shutdown():
        # 메시지 객체 생성
        motion_msg = Motion()
        # 랜덤하게 -5~5 사이의 값 생성
        motion_msg.move_x = random.randint(-5, 5)
        motion_msg.move_y = random.randint(-5, 5)

        # 메시지 퍼블리싱
        rospy.loginfo(f"Publishing: move_x={motion_msg.move_x}, move_y={motion_msg.move_y}")
        pub.publish(motion_msg)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        motion_publisher()
    except rospy.ROSInterruptException:
        pass