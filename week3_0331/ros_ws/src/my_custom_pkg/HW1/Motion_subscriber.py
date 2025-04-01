#!/usr/bin/env python3

import rospy
from my_custom_pkg.msg import Motion  # 커스텀 메시지 임포트

# 현재 좌표값 (초기 좌표는 (0,0))
current_position = [0, 0]

def motion_callback(data):
    # 현재 좌표 업데이트
    current_position[0] += data.move_x
    current_position[1] += data.move_y
    
    # 결과 출력
    rospy.loginfo(f"Received: move_x={data.move_x}, move_y={data.move_y}")
    rospy.loginfo(f"Updated position: ({current_position[0]}, {current_position[1]})")

def motion_subscriber():
    rospy.init_node('motion_subscriber', anonymous=True)
    rospy.Subscriber('motion_info', Motion, motion_callback)
    
    # 초기 위치 출력
    rospy.loginfo(f"Starting at position: ({current_position[0]}, {current_position[1]})")
    
    rospy.spin()  # 콜백 함수가 계속 실행될 수 있도록 유지

if __name__ == '__main__':
    motion_subscriber()