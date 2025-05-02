


vx = 0.5 * distance + 0.02 * self.integral_distance + 0.02 * d_distance  # Gazebo에 맞게 게인 조정


vx = 3 * distance + 0.1 * self.integral_distance + 0.1 * d_distance  # Gazebo에 맞게 게인 조정


vx = 6 * distance + 0.5 * self.integral_distance + 0.5 * d_distance  # Gazebo에 맞게 게인 조정


vx = 30 * distance + 0.1 * self.integral_distance + 0.1 * d_distance  # Gazebo에 맞게 게인 조정