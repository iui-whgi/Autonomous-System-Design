#!/usr/bin/env python3
import rospy
from std_msgs.msg import Float32
from std_srvs.srv import SetBool, SetBoolResponse

current_temp = 25.0  # 초기 온도

def temp_callback(msg):
    global current_temp
    current_temp = msg.data
    rospy.loginfo(f"현재 온도 갱신됨: {current_temp:.2f} °C")

def handle_fan_service(req):
    state = "turn on" if current_temp >= 30 else "turn off"
    rospy.loginfo(f"서비스 요청 수신 → 현재 온도: {current_temp:.2f} → 팬 상태: {state}")
    return SetBoolResponse(success=True, message=state)

def server():
    rospy.init_node('fan_service_server')
    rospy.Subscriber('temperature', Float32, temp_callback)
    rospy.Service('set_fan_state', SetBool, handle_fan_service)
    rospy.loginfo("서버 시작: /set_fan_state")
    rospy.spin()

if __name__ == '__main__':
    try:
        server()
    except rospy.ROSInterruptException:
        pass

