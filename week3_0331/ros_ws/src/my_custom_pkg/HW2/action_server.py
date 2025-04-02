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
        
        # 서버에서 중복 체크를 위한 리스트
        unique_numbers = []
        
        # 요청된 개수만큼 랜덤 숫자 생성
        for i in range(max_number):
            # 1~5 사이의 랜덤 숫자 생성
            random_number = random.randint(1, 50)
            
            # 서버에서 중복 검사 처리
            if random_number not in unique_numbers:
                # 중복이 아닌 경우만 unique_numbers에 추가
                unique_numbers.append(random_number)
                rospy.loginfo(f"Generated unique number: {random_number}")
                rospy.loginfo(f"Current unique numbers: {unique_numbers}")
            else:
                rospy.logwarn(f"Duplicate number generated: {random_number}, not adding to list")
            
            # 피드백은 매번 현재까지의 고유한 숫자 목록을 포함
            feedback.current_numbers = unique_numbers.copy()
            
            # 피드백 전송
            self.server.publish_feedback(feedback)
            rospy.sleep(1)  # 1초 대기
        
        # 결과 설정
        result.final_numbers = unique_numbers
        result.result_message = f"Generated {max_number} random numbers, with {len(unique_numbers)} unique numbers"
        
        self.server.set_succeeded(result)
        rospy.loginfo("Goal completed")

if __name__ == '__main__':
    rospy.init_node('card_trick_server')
    server = CardTrickServer()
    rospy.spin()