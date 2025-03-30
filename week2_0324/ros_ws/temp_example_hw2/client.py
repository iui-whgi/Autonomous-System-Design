#!/usr/bin/env python3
import rospy
from std_srvs.srv import SetBool

def client():
    rospy.init_node('fan_service_client')
    rospy.wait_for_service('set_fan_state')

    try:
        fan_state = rospy.ServiceProxy('set_fan_state', SetBool)
        resp = fan_state(True)  # 요청 내용은 의미 없음
        rospy.loginfo(f"팬 제어 결과: {resp.message}")
    except rospy.ServiceException as e:
        rospy.logerr(f"서비스 호출 실패: {e}")

if __name__ == '__main__':
    client()

