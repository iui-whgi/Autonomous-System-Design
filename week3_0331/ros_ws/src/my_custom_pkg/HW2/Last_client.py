#!/usr/bin/env python3
import rospy
import actionlib
from my_custom_pkg.msg import CountingAction, CountingGoal

class CardTrickClient:
    def __init__(self):
        self.client = actionlib.SimpleActionClient('card_trick', CountingAction)
        self.client.wait_for_server()
        rospy.loginfo("Connected to Card Trick Server")
        
        # 중복 확인을 위한 리스트
        self.unique_numbers = []
        
    def send_goal(self, max_number):
        goal = CountingGoal()
        goal.max_number = max_number
        
        # 피드백 콜백 함수 등록
        self.client.send_goal(goal, feedback_cb=self.feedback_callback)
        
        # 결과 대기
        self.client.wait_for_result()
        return self.client.get_result()
        
    def feedback_callback(self, feedback):
        # 마지막으로 추가된 숫자 확인
        if feedback.current_numbers:
            latest_number = feedback.current_numbers[-1]
            
            # 중복 검사 - 중복되지 않은 경우에만 리스트에 추가
            if latest_number not in self.unique_numbers:
                self.unique_numbers.append(latest_number)
                rospy.loginfo(f"Received new unique number: {latest_number}")
                rospy.loginfo(f"Current unique numbers: {self.unique_numbers}")
            else:
                rospy.logwarn(f"Duplicate number received: {latest_number}, ignoring")

if __name__ == '__main__':
    rospy.init_node('card_trick_client')
    client = CardTrickClient()
    
    # 사용자 입력으로 최대 숫자 설정
    max_number = int(input("Enter the maximum number of cards (max 50): "))
    
    result = client.send_goal(max_number)
    
    rospy.loginfo(f"Final unique numbers: {client.unique_numbers}")
    rospy.loginfo(f"Server result message: {result.result_message}")
    rospy.loginfo(f"Total unique numbers received: {len(client.unique_numbers)}")