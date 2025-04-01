#!/usr/bin/env python3

import rospy
from my_custom_pkg.msg import Person  # 커스텀 메시지 임포트

def person_publisher():
    rospy.init_node('person_publisher', anonymous=True)
    pub = rospy.Publisher('person_info', Person, queue_size=10)
    rate = rospy.Rate(1)  # 1 Hz (1초에 한 번씩 메시지 전송)

    while not rospy.is_shutdown():
        # 메시지 객체 생성
        person_msg = Person()
        person_msg.name = "doogi"
        person_msg.age = 4
        person_msg.height = 50

        # 메시지 퍼블리싱
        rospy.loginfo(f"Publishing: Name={person_msg.name}, Age={person_msg.age}, Height={person_msg.height}")
        pub.publish(person_msg)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        person_publisher()
    except rospy.ROSInterruptException:
        pass

