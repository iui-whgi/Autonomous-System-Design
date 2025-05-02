#!/usr/bin/env python3
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import math
from time import time
from tf.transformations import euler_from_quaternion

# 목표 위치 설정
goal_x = 1  # Gazebo에서의 적절한 값으로 조정
goal_y = 1  # Gazebo에서의 적절한 값으로 조정

class GoToGoalController:
    def __init__(self):
        rospy.init_node('go_to_goal_controller', anonymous=True)
        self.x = 0.0
        self.y = 0.0
        self.theta = 0.0
        rospy.Subscriber('/odom', Odometry, self.odom_callback)
        self.pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        self.rate = rospy.Rate(10)

        # 시간 초기화
        self.prev_time = time()

        # distance PID
        self.integral_distance = 0.0
        self.prev_distance_error = 0.0

        # angle PID
        self.integral_angle = 0.0
        self.prev_angle_error = 0.0

    def odom_callback(self, msg):
        # Odometry 메시지에서 위치 추출
        self.x = msg.pose.pose.position.x
        self.y = msg.pose.pose.position.y
        
        # 쿼터니언을 오일러 각으로 변환
        orientation_q = msg.pose.pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        roll, pitch, self.theta = euler_from_quaternion(orientation_list)

    def run(self):
        vel = Twist()

        while not rospy.is_shutdown():
            # 시간 차이 계산
            current_time = time()
            dt = current_time - self.prev_time
            self.prev_time = current_time

            # 오차 벡터 계산
            error_x = goal_x - self.x
            error_y = goal_y - self.y
            distance = math.sqrt(error_x**2 + error_y**2)

            # 방향 오차 계산
            desired_theta = math.atan2(error_y, error_x)
            angle_diff = desired_theta - self.theta
            angle_diff = math.atan2(math.sin(angle_diff), math.cos(angle_diff))  # 정규화 [-π, π]

            # --- PID: distance ---
            self.integral_distance += distance * dt
            d_distance = (distance - self.prev_distance_error) / dt if dt > 0 else 0.0
            vx = 30 * distance + 0.1 * self.integral_distance + 0.1 * d_distance  # Gazebo에 맞게 게인 조정
            self.prev_distance_error = distance

            # --- PID: angle ---
            self.integral_angle += angle_diff * dt
            d_angle = (angle_diff - self.prev_angle_error) / dt if dt > 0 else 0.0
            wz = 1.0 * angle_diff + 0.05 * self.integral_angle + 0 * d_angle  # Gazebo에 맞게 게인 조정
            self.prev_angle_error = angle_diff

            # 임계값 기반 정지
            if distance < 0.05:  # Gazebo에 맞게 임계값 조정
                vx = 0.0
            if abs(angle_diff) < 0.05:  # Gazebo에 맞게 임계값 조정
                wz = 0.0

            # 속도 제한 (Gazebo에서는 더 낮은 값이 안전)
            vx = min(vx, 0.2)  # 최대 선속도 제한
            wz = max(min(wz, 0.5), -0.5)  # 최대 각속도 제한

            # 속도 명령 발행
            vel.linear.x = vx
            vel.angular.z = wz
            self.pub.publish(vel)

            # 디버깅 로그
            rospy.loginfo(f"[pose] x={self.x:.2f}, y={self.y:.2f}, θ={self.theta:.2f}")
            rospy.loginfo(f"[error] dist={distance:.3f}, angle_diff={angle_diff:.3f}")
            rospy.loginfo(f"[cmd  ] vx={vx:.3f}, wz={wz:.3f}")

            # 목표 도달 시 정지
            if distance < 0.05:  # Gazebo에 맞게 임계값 조정
                rospy.loginfo("✅ 목표에 도착했습니다!")
                self.pub.publish(Twist())  # 정지 명령
                break

            self.rate.sleep()

if __name__ == '__main__':
    try:
        GoToGoalController().run()
    except rospy.ROSInterruptException:
        pass