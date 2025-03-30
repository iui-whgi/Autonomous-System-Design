#!/usr/bin/env python3
import rospy
from std_srvs.srv import SetBool

def simple_service_client():
    rospy.init_node('simple_service_client')
    rospy.wait_for_service('toggle_service')

    try:
        toggle_service = rospy.ServiceProxy('toggle_service', SetBool)
        response = toggle_service(True)
        rospy.loginfo("서비스 응답: %s", response.message)
    except rospy.ServiceException as e:
        rospy.logerr("서비스 호출 실패: %s", e)

if __name__ == '__main__':
    simple_service_client()
