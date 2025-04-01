#!/usr/bin/env python3
import rospy
import actionlib
import random
from my_custom_pkg.msg import CountingAction, CountingFeedback, CountingResult

class CardTrickServer:
    def __init__(self):
        self.server = actionlib.SimpleActionServer('card_trick', CountingAction, self.execute, False)
        self.server.start()
        rospy.loginfo("Card Trick Server started")
        
    def execute(self, goal):
        feedback = CountingFeedback()
        result = CountingResult()
        
        # 최대 숫자 검증 (요구사항에 따라 50 이하여야 함)
        max_number = min(goal.max_number, 50)
        
        feedback.current_numbers = []
        
        # 요청된 개수만큼 랜덤 숫자 생성
        for i in range(max_number):
            # 1~10 사이의 랜덤 숫자성
            random_number = random.randint(1, 5)
            
            # 서버에서 중복 검사를 하지 않고 클라이언트로 모든 숫자를 전송
            # 클라이언트에서 중복 처리 하도록 변경
            feedback.current_numbers.append(random_number)
            
            # 피드백 전송
            self.server.publish_feedback(feedback)
            rospy.sleep(1)  # 1초 대기
        
        # 결과 설정
        result.final_numbers = feedback.current_numbers
        result.result_message = f"Successfully generated {max_number} random numbers"
        
        self.server.set_succeeded(result)
        rospy.loginfo("Goal completed")

if __name__ == '__main__':
    rospy.init_node('card_trick_server')
    server = CardTrickServer()
    rospy.spin()