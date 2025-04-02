#!/usr/bin/env python3
import rospy
import actionlib
from my_custom_pkg.msg import CountingAction, CountingGoal

class CardTrickClient:
    def __init__(self):
        self.client = actionlib.SimpleActionClient('card_trick', CountingAction)
        self.client.wait_for_server()
        rospy.loginfo("Connected to Card Trick Server")
        
    def send_goal(self, max_number):
        goal = CountingGoal()
        goal.max_number = max_number
        
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
    
    # 사용자 입력으로 최대 숫자 설정
    max_number = int(input("Enter the maximum number of cards (max 50): "))
    
    result = client.send_goal(max_number)
    
    rospy.loginfo(f"Final unique numbers: {result.final_numbers}")
    rospy.loginfo(f"Server result message: {result.result_message}")
    rospy.loginfo(f"Total unique numbers: {len(result.final_numbers)}")