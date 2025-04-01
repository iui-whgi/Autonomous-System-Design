#!/usr/bin/env python3

import rospy
from my_custom_pkg.msg import Person  # 커스텀 메시지 임포트

def person_callback(data):
    rospy.loginfo(f"Received: Name={data.name}, Age={data.age}, Height={data.height}")

def person_subscriber():
    rospy.init_node('person_subscriber', anonymous=True)
    rospy.Subscriber('person_info', Person, person_callback)
    rospy.spin()  # 콜백 함수가 계속 실행될 수 있도록 유지

if __name__ == '__main__':
    person_subscriber()


