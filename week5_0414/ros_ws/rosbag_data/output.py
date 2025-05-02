import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

# 현재 스크립트 위치 확인 및 파일 경로 설정
script_dir = os.path.dirname(os.path.abspath(__file__))
csv_path = os.path.join(script_dir, "hw3_4.csv")

# CSV 파일 이름에서 확장자를 제외한 베이스 이름 추출
base_name = os.path.splitext(os.path.basename(csv_path))[0]
png_path = os.path.join(script_dir, f"{base_name}.png")

# CSV 파일 불러오기 - 전체 경로 사용
print(f"Looking for CSV file at: {csv_path}")
df = pd.read_csv(csv_path)

# 시간 데이터 처리
# 파일에 %time 열이 있으므로 이를 초 단위로 변환
df["time_sec"] = df["%time"] * 1e-9  # 나노초를 초로 변환

# 목표값 (Desired Output)
goal_x = 1.0
goal_y = 1.0

# 시간 배열 생성
time_array = df["time_sec"].to_numpy()

# X, Y 좌표 추출 - 해당 열이 field.pose.pose.position.x, field.pose.pose.position.y인 것으로 보임
x_positions = df["field.pose.pose.position.x"].to_numpy()
y_positions = df["field.pose.pose.position.y"].to_numpy()

# 여러 그래프를 하나의 큰 figure에 합치기
plt.figure(figsize=(12, 12))

# X 좌표: 실제 vs 목표
plt.subplot(3, 1, 1)
plt.plot(time_array, x_positions, label="Actual x", color="blue")
plt.plot(time_array, np.full_like(time_array, goal_x), label="Desired x", linestyle="--", color="lightblue")
plt.xlabel("Time (sec)")
plt.ylabel("X Position")
plt.title("Desired vs Actual X Position Over Time")
plt.legend()
plt.grid(True)

# Y 좌표: 실제 vs 목표
plt.subplot(3, 1, 2)
plt.plot(time_array, y_positions, label="Actual y", color="green")
plt.plot(time_array, np.full_like(time_array, goal_y), label="Desired y", linestyle="--", color="lightgreen")
plt.xlabel("Time (sec)")
plt.ylabel("Y Position")
plt.title("Desired vs Actual Y Position Over Time")
plt.legend()
plt.grid(True)

# 2D 경로 플롯 추가 (X-Y 평면에서의 움직임)
plt.subplot(3, 1, 3)
plt.plot(x_positions, y_positions, 'r-', label='Actual Path')
plt.plot(goal_x, goal_y, 'bo', markersize=10, label='Goal Position')
plt.xlabel('X Position')
plt.ylabel('Y Position')
plt.title('2D Path in X-Y Plane')
plt.grid(True)
plt.axis('equal')  # 축 비율을 동일하게 설정
plt.legend()

# 전체 레이아웃 조정
plt.tight_layout()

# CSV 이름과 동일한 이름으로 PNG 파일 저장
print(f"Saving figure to: {png_path}")
plt.savefig(png_path, dpi=300, bbox_inches='tight')

# 그래프 표시
plt.show()