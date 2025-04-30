import pandas as pd
import os

# 현재 작업 디렉토리 확인
print("현재 작업 디렉토리:", os.getcwd())

# 현재 디렉토리의 파일 목록 확인
print("디렉토리 내 파일:", os.listdir('.'))

# 전체 경로 지정
script_dir = os.path.dirname(os.path.abspath(__file__))
input_file = os.path.join(script_dir, "hw3.csv")
output_file = os.path.join(script_dir, "hw3_extract.csv")

print(f"입력 파일 경로: {input_file}")

# CSV 파일 읽기
df = pd.read_csv(input_file)

# x, y 위치 열만 선택
position_df = df[['%time','field.pose.pose.position.x', 'field.pose.pose.position.y']]

# 새 CSV 파일로 저장
position_df.to_csv(output_file, index=False)

print(f"위치 데이터만 {output_file}에 저장되었습니다.")