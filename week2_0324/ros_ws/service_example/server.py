#!/usr/bin/env python3
import rospy
from std_srvs.srv import SetBool, SetBoolResponse

def handle_service_request(req):
    rospy.loginfo("서비스 요청 받음: %s", req.data)
    response = SetBoolResponse()
    response.success = True
    response.message = "서비스 요청이 정상적으로 처리되었습니다."
    return response

def simple_service_server():
    rospy.init_node('simple_service_server')
    rospy.Service('toggle_service', SetBool, handle_service_request)
    rospy.loginfo("서비스 서버 시작: /toggle_service")
    rospy.spin()

if __name__ == '__main__':
    simple_service_server()
