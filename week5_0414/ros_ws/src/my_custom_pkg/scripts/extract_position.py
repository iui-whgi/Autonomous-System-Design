#!/usr/bin/env python3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

def plot_robot_path():
    print("로봇 경로 시각화 스크립트 실행")
    
    # 현재 작업 디렉토리 확인
    print("현재 작업 디렉토리:", os.getcwd())
    print("디렉토리 내 파일:", os.listdir('.'))
    
    # 입력 파일 경로 지정
    script_dir = os.path.dirname(os.path.abspath(__file__))
    input_file = os.path.join(script_dir, "hw1.csv")
    
    print(f"입력 파일 경로: {input_file}")
    
    # CSV 파일 읽기
    df = pd.read_csv(input_file)
    
    # x, y 위치 열만 선택
    position_df = df[['%time', 'field.pose.pose.position.x', 'field.pose.pose.position.y']]
    print("위치 데이터 추출 완료")
    
    # 시각화를 위한 데이터 준비
    print("위치 데이터 컬럼:", position_df.columns.tolist())
    
    # 컬럼 이름 추출
    time_col = position_df.columns[0]  # '%time' 
    x_col = position_df.columns[1]     # 'field.pose.pose.position.x'
    y_col = position_df.columns[2]     # 'field.pose.pose.position.y'
    
    # 시간 데이터를 초 단위로 변환
    time_ns = position_df[time_col].values
    time_sec = time_ns / 1e9
    time_sec = time_sec - time_sec[0]  # 첫 시간을 0으로 설정
    
    # x와 y 좌표 추출
    x = position_df[x_col].values
    y = position_df[y_col].values
    
    # ===== 첫 번째 그래프: 2D 경로 =====
    plt.figure(figsize=(10, 8))
    
    # 로봇 경로 그리기
    plt.plot(x, y, 'b-', linewidth=2)
    
    # 시작점 표시
    plt.plot(x[0], y[0], 'go', markersize=8, label='Start')
    
    # 종료점 표시
    plt.plot(x[-1], y[-1], 'ro', markersize=8, label='End')
    
    # 진행 방향을 보여주는 화살표 추가
    num_arrows = 20
    arrow_indices = np.linspace(0, len(x)-1, num_arrows, dtype=int)
    for i in arrow_indices:
        if i < len(x) - 1:  # 범위 초과 방지
            plt.arrow(x[i], y[i], 
                     (x[i+1] - x[i])/2, (y[i+1] - y[i])/2,
                     head_width=0.05, head_length=0.1, fc='black', ec='black')
    
    plt.xlabel('X Position (meters)')
    plt.ylabel('Y Position (meters)')
    plt.title('Robot Movement Path')
    plt.grid(True)
    plt.axis('equal')  # x와 y 축 비율 동일하게
    plt.legend()
    
    # 저장 및 표시
    path_plot_path = os.path.join(script_dir, "hw1_path.png")
    plt.savefig(path_plot_path)
    plt.show()
    
    print(f"경로 그래프가 {path_plot_path}에 저장되었습니다.")
    
    # ===== 두 번째 그래프: 시간에 따른 색상 변화가 있는 경로 =====
    plt.figure(figsize=(10, 8))
    
    # 시간에 따른 색상 그라데이션으로 경로 그리기
    points = plt.scatter(x, y, c=time_sec, cmap='viridis', s=5)
    plt.colorbar(points, label='Time (seconds)')
    
    # 시작점 표시
    plt.plot(x[0], y[0], 'go', markersize=8, label='Start')
    
    # 종료점 표시
    plt.plot(x[-1], y[-1], 'ro', markersize=8, label='End')
    
    plt.xlabel('X Position (meters)')
    plt.ylabel('Y Position (meters)')
    plt.title('Robot Movement Path with Time Progression')
    plt.grid(True)
    plt.axis('equal')  # x와 y 축 비율 동일하게
    plt.legend()#!/usr/bin/env python3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

def plot_robot_path():
    print("로봇 경로 시각화 스크립트 실행")
    
    # 현재 작업 디렉토리 확인
    print("현재 작업 디렉토리:", os.getcwd())
    print("디렉토리 내 파일:", os.listdir('.'))
    
    # 입력 파일 경로 지정
    script_dir = os.path.dirname(os.path.abspath(__file__))
    input_file = os.path.join(script_dir, "hw1.csv")
    
    print(f"입력 파일 경로: {input_file}")
    
    # CSV 파일 읽기
    df = pd.read_csv(input_file)
    
    # x, y 위치 열만 선택
    position_df = df[['%time', 'field.pose.pose.position.x', 'field.pose.pose.position.y']]
    print("위치 데이터 추출 완료")
    
    # 시각화를 위한 데이터 준비
    print("위치 데이터 컬럼:", position_df.columns.tolist())
    
    # 컬럼 이름 추출
    time_col = position_df.columns[0]  # '%time'
    x_col = position_df.columns[1]     # 'field.pose.pose.position.x'
    y_col = position_df.columns[2]     # 'field.pose.pose.position.y'
    
    # 시간 데이터를 초 단위로 변환
    time_ns = position_df[time_col].values
    time_sec = time_ns / 1e9
    time_sec = time_sec - time_sec[0]  # 첫 시간을 0으로 설정
    
    # x와 y 좌표 추출
    x = position_df[x_col].values
    y = position_df[y_col].values
    
    # ===== 시간에 따른 색상 변화가 있는 경로 그래프 =====
    plt.figure(figsize=(10, 8))
    
    # 시간에 따른 색상 그라데이션으로 경로 그리기
    points = plt.scatter(x, y, c=time_sec, cmap='viridis', s=5)
    plt.colorbar(points, label='Time (seconds)')
    
    # 시작점 표시
    plt.plot(x[0], y[0], 'go', markersize=8, label='Start')
    
    # 종료점 표시
    plt.plot(x[-1], y[-1], 'ro', markersize=8, label='End')
    
    plt.xlabel('X Position (meters)')
    plt.ylabel('Y Position (meters)')
    plt.title('Robot Movement Path with Time Progression')
    plt.grid(True)
    plt.axis('equal')  # x와 y 축 비율 동일하게
    plt.legend()
    
    # 저장 및 표시
    time_plot_path = os.path.join(script_dir, "hw1_path_time.png")
    plt.savefig(time_plot_path)
    plt.show()
    
    print(f"시간에 따른 경로 그래프가 {time_plot_path}에 저장되었습니다.")
    print("경로 시각화 완료")

if __name__ == "__main__":
    try:
        plot_robot_path()
    except Exception as e:
        print(f"오류 발생: {e}")
    
    # 저장 및 표시
    time_plot_path = os.path.join(script_dir, "hw1_path_time.png")
    plt.savefig(time_plot_path)
    plt.show()
    
    print(f"시간에 따른 경로 그래프가 {time_plot_path}에 저장되었습니다.")
    
    print("경로 시각화 완료")

if __name__ == "__main__":
    try:
        plot_robot_path()
    except Exception as e:
        print(f"오류 발생: {e}")