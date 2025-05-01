#!/usr/bin/env python3
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import math
import tf.transformations

# 목표 위치 설정
goal_x = 1.0
goal_y = 1.0

class GazeboGoToGoalController:
    def __init__(self):
        rospy.init_node('gazebo_go_to_goal_controller', anonymous=True)
        
        # 현재 위치와 방향 저장 변수
        self.x = 0.0
        self.y = 0.0
        self.theta = 0.0
        
        # Odometry 구독 (로봇의 위치와 방향 정보 얻기)
        rospy.Subscriber('/odom', Odometry, self.odom_callback)
        
        # 로봇 제어를 위한 Publisher
        self.pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        
        # 제어 주기 설정 (10Hz)
        self.rate = rospy.Rate(10)
        
        # 초기화 완료 메시지
        rospy.loginfo("Gazebo Go-To-Goal Controller initialized")
        
        # 제어 파라미터 (필요시 조정)
        self.linear_speed = 0.3  # 선속도 (m/s) - 더 느리게 조정
        self.angular_p_gain = 1.5  # 각속도 P 제어 게인
        
        # 목표 도달 정밀도 설정
        self.distance_threshold = 0.05  # 5cm 이내 도달 기준

    def odom_callback(self, msg):
        # Odometry 메시지에서 위치 정보 추출
        self.x = msg.pose.pose.position.x
        self.y = msg.pose.pose.position.y
        
        # 쿼터니언에서 오일러 각으로 변환하여 theta(yaw) 추출
        orientation_q = msg.pose.pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        _, _, self.theta = tf.transformations.euler_from_quaternion(orientation_list)

    def run(self):
        # 초기 대기 시간 (Odometry 메시지를 받기 위한 시간)
        rospy.sleep(1.0)
        
        vel = Twist()
        
        while not rospy.is_shutdown():
            # 오차 벡터 계산
            error_x = goal_x - self.x
            error_y = goal_y - self.y
            distance = math.sqrt(error_x**2 + error_y**2)
            
            # 목표 방향 계산 (atan2 사용)
            desired_theta = math.atan2(error_y, error_x)
            angle_diff = desired_theta - self.theta
            
            # 각도 정규화 (-pi ~ pi)
            angle_diff = math.atan2(math.sin(angle_diff), math.cos(angle_diff))
            
            # 로봇 제어 - 목표 거리 임계값보다 크면 계속 전진
            if distance > self.distance_threshold:
                # 각도 오차가 크면 먼저 회전
                if abs(angle_diff) > 0.3:
                    vel.linear.x = 0.0
                    vel.angular.z = self.angular_p_gain * angle_diff
                else:
                    # 적당한 각도 범위 내에 있으면 전진하면서 방향 조정
                    vel.linear.x = self.linear_speed
                    vel.angular.z = self.angular_p_gain * angle_diff
            else:
                # 목표에 도달하면 정지
                vel.linear.x = 0.0
                vel.angular.z = 0.0
            
            # 디버깅 로그
            rospy.loginfo(f"[pose] x={self.x:.2f}, y={self.y:.2f}, θ={self.theta:.2f} | dist={distance:.2f}, angle_err={angle_diff:.2f}")
            
            # 목표 도달 시 루프 종료
            if distance < self.distance_threshold:
                rospy.loginfo("✅ 목표에 도착했습니다!")
                self.pub.publish(Twist())  # 정지 명령
                break
            
            # 속도 명령 발행
            self.pub.publish(vel)
            self.rate.sleep()

if __name__ == '__main__':
    try:
        GazeboGoToGoalController().run()
    except rospy.ROSInterruptException:
        pass