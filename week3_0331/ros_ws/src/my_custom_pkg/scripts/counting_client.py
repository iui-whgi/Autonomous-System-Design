#!/usr/bin/env python3

import rospy
import actionlib
from my_custom_pkg.msg import CountingAction, CountingGoal

def feedback_cb(feedback):
    rospy.loginfo(f"Current Count: {feedback.current_number}")

def main():
    rospy.init_node('counting_client')
    client = actionlib.SimpleActionClient('counting', CountingAction)
    client.wait_for_server()

    goal = CountingGoal()
    goal.max_number = 5

    client.send_goal(goal, feedback_cb=feedback_cb)
    client.wait_for_result()
    result = client.get_result()
    rospy.loginfo(f"Result: {result.result_message}")

if __name__ == '__main__':
    main()


