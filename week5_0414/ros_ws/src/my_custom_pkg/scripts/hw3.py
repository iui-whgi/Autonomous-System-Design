#!/usr/bin/env python3
import rospy
import math
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion

class TurtleBot3PIDController:
    def __init__(self):
        # 노드 초기화
        rospy.init_node('turtlebot3_pid_controller')
        
        # 퍼블리셔와 서브스크라이버 설정
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        self.odom_sub = rospy.Subscriber('/odom', Odometry, self.odom_callback)
        
        # 제어 주기 설정 (10Hz)
        self.rate = rospy.Rate(10)
        self.dt = 0.1  # 제어 주기 (초)
        
        # 현재 위치와 방향 변수 초기화
        self.x = 0.0
        self.y = 0.0
        self.theta = 0.0
        
        # 목표 좌표 설정 (여기서 원하는 좌표로 변경 가능)
        self.goal_x = 1.0  # 목표 x 좌표
        self.goal_y = 0  # 목표 y 좌표
        
        # 제어 파라미터
        self.max_linear_speed = 0.2   # 최대 선속도 (m/s)
        self.max_angular_speed = 0.5  # 최대 각속도 (rad/s)
        self.distance_threshold = 0.1  # 목표 도달 기준 거리 (m)
        self.angle_threshold = 0.1   # 방향 정렬 기준 각도 (rad)
        
        # PID 제어기 파라미터 - 선속도
        self.linear_kp = 0.5
        self.linear_ki = 0.02
        self.linear_kd = 0.1
        
        # PID 제어기 파라미터 - 각속도
        self.angular_kp = 1.0
        self.angular_ki = 0.01
        self.angular_kd = 0.1
        
        # PID 오차 누적 및 이전 오차 값
        self.linear_error_sum = 0.0
        self.angular_error_sum = 0.0
        self.prev_linear_error = 0.0
        self.prev_angular_error = 0.0
        
        # 오도메트리 데이터를 받기 위한 대기
        rospy.sleep(1)

    def odom_callback(self, msg):
        # 현재 위치 업데이트
        self.x = msg.pose.pose.position.x
        self.y = msg.pose.pose.position.y
        
        # 현재 방향(각도) 계산
        orientation_q = msg.pose.pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        _, _, self.theta = euler_from_quaternion(orientation_list)

    def get_distance_to_goal(self):
        # 현재 위치와 목표 위치 사이의 거리 계산
        return math.sqrt((self.goal_x - self.x)**2 + (self.goal_y - self.y)**2)

    def get_angle_to_goal(self):
        # 목표 방향 계산 (현재 위치에서 목표까지의 각도)
        angle_to_goal = math.atan2(self.goal_y - self.y, self.goal_x - self.x)
        
        # 각도 보정 (-π ~ π 범위로)
        angle_difference = angle_to_goal - self.theta
        if angle_difference > math.pi:
            angle_difference -= 2 * math.pi
        elif angle_difference < -math.pi:
            angle_difference += 2 * math.pi
            
        return angle_difference

    def stop(self):
        # 정지 명령 생성
        cmd = Twist()
        cmd.linear.x = 0.0
        cmd.angular.z = 0.0
        
        # 로봇이 확실히 정지하도록 여러 번 명령 전송
        for _ in range(5):
            self.cmd_vel_pub.publish(cmd)
            self.rate.sleep()
        
        # PID 제어기 초기화
        self.linear_error_sum = 0.0
        self.angular_error_sum = 0.0
        self.prev_linear_error = 0.0
        self.prev_angular_error = 0.0
        
        rospy.loginfo("로봇이 정지했습니다")

    def calculate_linear_pid(self, error):
        # P 항 계산
        p_term = self.linear_kp * error
        
        # I 항 계산 (누적 오차)
        self.linear_error_sum += error * self.dt
        # Anti-windup: 누적 오차 제한
        self.linear_error_sum = max(min(self.linear_error_sum, 1.0), -1.0)
        i_term = self.linear_ki * self.linear_error_sum
        
        # D 항 계산 (오차의 변화율)
        d_term = self.linear_kd * (error - self.prev_linear_error) / self.dt
        self.prev_linear_error = error
        
        # PID 출력 계산
        output = p_term + i_term + d_term
        
        # 출력 제한
        output = max(min(output, self.max_linear_speed), 0.0)
        
        return output

    def calculate_angular_pid(self, error):
        # P 항 계산
        p_term = self.angular_kp * error
        
        # I 항 계산 (누적 오차)
        self.angular_error_sum += error * self.dt
        # Anti-windup: 누적 오차 제한
        self.angular_error_sum = max(min(self.angular_error_sum, 1.0), -1.0)
        i_term = self.angular_ki * self.angular_error_sum
        
        # D 항 계산 (오차의 변화율)
        d_term = self.angular_kd * (error - self.prev_angular_error) / self.dt
        self.prev_angular_error = error
        
        # PID 출력 계산
        output = p_term + i_term + d_term
        
        # 출력 제한
        output = max(min(output, self.max_angular_speed), -self.max_angular_speed)
        
        return output

    def move_to_goal(self):
        rospy.loginfo(f"목표 좌표 ({self.goal_x}, {self.goal_y})로 이동을 시작합니다")
        
        cmd = Twist()
        
        while not rospy.is_shutdown():
            # 목표까지의 거리 계산
            distance = self.get_distance_to_goal()
            
            # 목표 도달 확인
            if distance < self.distance_threshold:
                rospy.loginfo(f"목표 좌표에 도달했습니다. 현재 위치: ({self.x:.2f}, {self.y:.2f})")
                self.stop()
                break
                
            # 목표 방향으로의 각도 차이 계산
            angle_to_goal = self.get_angle_to_goal()
            
            # 각도 차이가 크면 먼저 회전
            if abs(angle_to_goal) > self.angle_threshold:
                cmd.linear.x = 0.0
                # 각속도에 PID 제어 적용
                cmd.angular.z = self.calculate_angular_pid(angle_to_goal)
                rospy.loginfo(f"방향 조정 중: 각도 차이 = {math.degrees(angle_to_goal):.2f}도, 각속도 = {cmd.angular.z:.2f}")
            else:
                # 선속도에 PID 제어 적용
                cmd.linear.x = self.calculate_linear_pid(distance)
                # 각속도에 PID 제어 적용 (작은 각도 차이는 이동 중에 보정)
                cmd.angular.z = self.calculate_angular_pid(angle_to_goal)
                rospy.loginfo(f"목표를 향해 이동 중: 거리 = {distance:.2f}m, 선속도 = {cmd.linear.x:.2f}, 각속도 = {cmd.angular.z:.2f}")
            
            # 명령 전송
            self.cmd_vel_pub.publish(cmd)
            self.rate.sleep()

    def run(self):
        rospy.loginfo("TurtleBot3 PID 제어기가 시작되었습니다")
        
        try:
            # 목표 좌표로 이동
            self.move_to_goal()
            
        except rospy.ROSInterruptException:
            pass
        finally:
            # 프로그램 종료 시 로봇 정지
            self.stop()

if __name__ == '__main__':
    try:
        controller = TurtleBot3PIDController()
        controller.run()
    except rospy.ROSInterruptException:
        pass