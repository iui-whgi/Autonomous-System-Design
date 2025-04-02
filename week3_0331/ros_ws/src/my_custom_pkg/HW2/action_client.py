#!/usr/bin/env python3
import rospy
import actionlib
from my_custom_pkg.msg import CountingAction, CountingGoal

class CardTrickClient:
    def __init__(self):
        self.client = actionlib.SimpleActionClient('card_trick', CountingAction)
        self.client.wait_for_server()
        rospy.loginfo("Connected to Card Trick Server")
        
    def send_goal(self):
        # 전역 파라미터에서 max_number 값을 가져오기
        max_number = rospy.get_param('/card_trick/max_number', 5)
        rospy.loginfo(f"Using max_number parameter: {max_number}")
        
        # 빈 목표 전송
        goal = CountingGoal()
        
        # 피드백 콜백 함수 등록
        self.client.send_goal(goal, feedback_cb=self.feedback_callback)
        
        # 결과 대기
        self.client.wait_for_result()
        return self.client.get_result()
        
    def feedback_callback(self, feedback):
        # 서버로부터 받은 현재까지의 고유 숫자 목록 표시
        if feedback.current_numbers:
            numbers_list = list(feedback.current_numbers)
            rospy.loginfo(f"Current unique numbers: {numbers_list}")

if __name__ == '__main__':
    rospy.init_node('card_trick_client')
    
    client = CardTrickClient()
    result = client.send_goal()
    
    rospy.loginfo(f"Final unique numbers: {result.final_numbers}")
    rospy.loginfo(f"Server result message: {result.result_message}")
    rospy.loginfo(f"Total unique numbers: {len(result.final_numbers)}")